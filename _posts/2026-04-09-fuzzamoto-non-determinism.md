---
title: "Fuzzamoto: Non-Determinism"
permalink: /blog/2026/04/09/fuzzamoto-non-determinism/
layout: post
author: niklas
name: "brink"
alt: "Fuzzamoto: Non-Determinism"
category: "technical"
description: Part 2 of our series on Fuzzamoto explores the challenges of non-determinism in fuzzing. This post covers common sources of non-determinism in software, why it matters for fuzzing effectiveness, and practical approaches to achieving deterministic test execution using snapshot fuzzing with Nyx.
---

*This is part 2 in a series on [Fuzzamoto][fuzzamoto gh], a fuzz testing tool
for Bitcoin full nodes. In [part 1][part 1], we covered the motivation behind
Fuzzamoto and gave an overview of its design and architecture. In this post,
we'll dive deep into one of the most critical challenges for effective
fuzzing: achieving deterministic test execution.*

Every software engineer will, at some point in their career, run into a bug (or
other observed behavior) that doesn't reproduce. That one bug in CI that you
just cannot reproduce locally, or that fuzz crash that you re-run through
the harness and it surprisingly does not crash again. Why does this happen? Most
likely, because your software is non-deterministic. As many engineers know, 
this can be very annoying and time-consuming.

For fuzzing specifically, non-determinism is not only annoying (in the case of
non-reproducible findings), but it also actively degrades the efficiency of your
fuzzing and may even prevent you from finding bugs entirely. Really? Yes, really.
[This UBSan issue][ubsan issue] was only found by oss-fuzz after [we
improved][determinism pr] the determinism of the fuzzing harness.

## Sources of Non-Determinism

Before looking at how to avoid or reduce non-determinism, let's look at some
real world examples of non-deterministic code and where the non-determinism
originates.

```cpp
auto now{GetTime<std::chrono::seconds>()};
EvictExtraOutboundPeers(now);
if (now > m_stale_tip_check_time) {
    ...
}
```

The code above is not deterministic because each time we run the application or
test that executes this code, the time (returned by `GetTime`) might be
different, leading to different code paths being executed. What about this next
example?

```cpp
const auto delta = 10min + FastRandomContext().randrange<std::chrono::milliseconds>(5min);
scheduler.scheduleFromNow([&] { ReattemptInitialBroadcast(scheduler); }, delta);
```

Scheduling some task at 10 minutes plus a random offset in the future is not
going to be deterministic, but there's actually more here. The operating system's
thread scheduler relies on e.g. time and hardware interrupts, so the exact point
at which `ReattemptInitialBroadcast` will run is not deterministic either. And
who knows, maybe there's a one-in-a-billion chance that some other task runs
first, and only then does a bug manifest.

Ok, maybe time and thread scheduling is too on the nose, but what about this?

```cpp
struct IteratorComparator
{
    template<typename I>
    bool operator()(const I& a, const I& b) const
    {
        return &(*a) < &(*b);
    }
};
...
std::sort(iters.begin(), iters.end(), IteratorComparator());
```

Have a close look at the comparison in the comparator! Comparing pointers is
also non-deterministic for various reasons (e.g., ASLR, order of previous
allocations, …) and may lead to non-deterministic ordering of `iters` in this
example.

All of the above non-determinism sources actually have one common source, which
is the hardware the code is executed on. Time may be sourced from the hardware's
timestamp counter with e.g. the `rdtsc` instruction, randomness may be sourced
with e.g. the `rdrand` or `rdseed` instructions and scheduling may be influenced
by hardware interrupts.

There are obviously a ton more sources of non-determinism, but fundamentally they
(almost) all arise from interactions with the real world, i.e. the hardware.
Networking, disk operations and various CPU caches (to name a few) are all
non-deterministic.

The only source of non-determinism that I can think of (specifically in the
context of fuzzing), that I wouldn't categorize as being caused by the hardware,
is global state. In my experience this is a very common source of
non-determinism, especially in classic in-process fuzz tests:

```cpp
PeerManager* g_peer_manager = nullptr;

extern "C" int LLVMFuzzerInitialize(int* argc, char*** argv) {
    g_peer_manager = new PeerManager();
    return 0;
}

extern "C" int LLVMFuzzerTestOneInput(const uint8_t* data, size_t size) {
    g_peer_manager->ProcessMessage(data, size);
    return 0;
}
```

The above is an abbreviated version of a fuzz test [that exists in Bitcoin
Core][process message fuzz] today. The problem here is that `g_peer_manager` is
a global variable and as such accumulates state each time the fuzz harness is
executed (i.e. processing some message might change peer manager state). As a result,
executions will be non-deterministic. Each execution
depends on the sequence of executions before it. In-process fuzzing engines
(e.g. libFuzzer) are designed under the assumption that the harness is a pure
function, and the above clearly violates that assumption.

## Workarounds

Now that we have an overview of non-determinism sources, we can get into how we
can reduce non-determinism for our testing purposes.

Full determinism (i.e. outcome and all intermediate machine states are
replayable every time), is hard to achieve in a general and practical way. Full
emulation is slow. Deterministic hypervisors are hard to build. For
Fuzzamoto I've decided to take the practical path of only dealing with some of
the more obvious and easy to deal with non-determinism sources. The three main
sources of non-determinism I have battled with so far are time, RNG, and state.

### Time & RNG

For dealing with time and RNG, my first approach was to `LD_PRELOAD` libraries
such as [`libfaktime`][libfaketime] and [`libfakerand`][libfakerand]. These are
libraries that stub out certain libc functions related to time or randomness in
favor of user-controlled deterministic ones. Unfortunately, Bitcoin Core uses
certain libc functions that aren't implemented by them and also uses inline
assembly to make use of certain CPU instructions:

```cpp
#elif !defined(_MSC_VER) && (defined(__x86_64__) || defined(__amd64__))
    uint64_t r1 = 0, r2 = 0;
    __asm__ volatile ("rdtsc" : "=a"(r1), "=d"(r2));
    return (r2 << 32) | r1;
#else
```

We could just patch this out and the libraries could be extended to support the
missing libc functions, and that may be an avenue to explore, but for now I've
opted for simpler workarounds.

For now, I've applied a one-line patch to reduce non-determinism caused by
Bitcoin Core's internal RNG. The patch makes the RNG use a fixed seed for each
instantiation of a randomness context.

For dealing with time, we can use Bitcoin Core's mocktime functionality, which
allows us to use a RPC to set the time the node observes. Using the mocktime RPC
causes time to freeze (at the time specified by the RPC invocation) for the
node, which can be good to control the time at which e.g. p2p messages are
processed. However, it does not realistically simulate time passing.

Obviously, these workarounds are not a general solution as they are specific to
Bitcoin Core. For fuzzing alternative full node implementations, such as btcd
(written in Go), we need more custom patches. Libc stubbing also does not work
for e.g. programs written in Go, as they do not depend on libc. Ideally, there
would be some way to let the execution environment control what time
applications observe, no matter what language they are implemented in.

### Tackling State

In Fuzzamoto's testing model we're not dealing with the classic in-process fuzz
tests as mentioned above. Instead we have a whole guest VM with application
daemons under test and we need to be able to start each fuzz execution from the
same state. We could stop the VM, wipe all its data and restart it each time but
that is obviously going to be really slow.

As mentioned in Part 1, for dealing with state Fuzzamoto relies on [Nyx][] as
its execution backend, which allows us to snapshot the desired starting state
and quickly reset to it whenever we need.

Nyx itself is built on QEMU and uses KVM to run natively on the host CPU.
Performance wise, the biggest challenge with creating whole VM snapshots is the
VM's memory itself. A naive implementation would simply copy all of the memory
but that would be gruesomely slow as we might be dealing with gigabytes of
memory. Nyx manages to make this performant by using a copy-on-write mechanism,
which only allocates new memory pages when the guest attempts to modify memory
in the root snapshot. Resetting a VM then just boils down to resetting the
modified pages (as opposed to resetting all pages). The CoW mechanism is also
really useful for scaling the fuzzing across many cores, as the full memory for
the guest is allocated once while each "child" VM only allocates modified
memory.

At a high-level, fuzzing with nyx involves a target (code under test), an agent
inside the Nyx VM, and a fuzzer outside the VM. The agent (a Nyx concept)
facilitates communication between the test inside the VM and the fuzzer on the
outside. For this, Nyx provides a `vmcall` interface, which lets the test reach
out to the fuzzer for the following methods (among others): "take a snapshot of
the VM", "reset the VM to the snapshot state", "give me the next fuzz input",
"the last input triggered a bug".

!["Nyx agent interface"](/assets/images/2026-04-fuzzamoto-nyx-agent.png "Nyx
agent interface")

I took inspiration from [Mozilla's Nyx agent][mozilla nyx] interface design, to
design a [custom agent for Fuzzamoto][fuzzamoto agent]. My agent provides the
following interface to the tests:

```rust
unsafe extern "C" {
    pub fn nyx_init() -> usize;
    pub fn nyx_get_fuzz_input(data: *const c_uchar, max_size: usize) -> usize;
    pub fn nyx_skip();
    pub fn nyx_release();
    pub fn nyx_fail(message: *const c_char);
    pub fn nyx_println(message: *const c_char, size: usize);
}
```

`nyx_get_fuzz_input` takes the snapshot, requests the fuzz input and marks the
point to which the VM will reset to if `nyx_skip`, `nyx_release` or `nyx_fail`
is called. This API can then be used by the test harnesses to control execution,
VM state, and report bugs.

Putting it all together, the rough high-level of architecture for Fuzzamoto
looks like this:

!["Fuzzamoto architecture with
Nyx"](/assets/images/2026-04-fuzzamoto-full-architecture.png "Fuzzamoto
architecture with Nyx")

## Conclusion

While achieving perfect determinism remains an elusive goal, this approach of
combining Nyx's snapshot capabilities with targeted patches for time and
randomness provides enough determinism to make this fuzzing practical and
effective. While not without limitations, the ability to snapshot and restore
complete VM state solves the most fundamental challenge of eliminating state
accumulation across test executions without requiring invasive code changes.

The next post in this Fuzzamoto series will cover the custom LibAFL based
fuzzing engine that targets the p2p message processing logic of full nodes.

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. If you
or your organization is interested in supporting open source Bitcoin
development, feel free to email us, [donate@brink.dev][donate].

Developers interested in the grant [program][programs] can apply now.

[fuzzamoto gh]: https://github.com/dergoegge/fuzzamoto
[part 1]: /blog/2026/01/07/fuzzamoto-introduction/
[ubsan issue]: https://issues.oss-fuzz.com/issues/42531370
[determinism pr]: https://github.com/bitcoin/bitcoin/pull/29064
[process message fuzz]: https://github.com/bitcoin/bitcoin/blob/e68517208b4cc02fa4e9e6a8de0fc43b536a3b02/src/test/fuzz/process_message.cpp
[libfaketime]: https://github.com/wolfcw/libfaketime
[libfakerand]: https://git.distrust.co/public/libfakerand
[Nyx]: https://nyx-fuzz.com/
[mozilla nyx]: https://github.com/MozillaSecurity/snapshot-fuzzing
[fuzzamoto agent]: https://github.com/dergoegge/fuzzamoto/tree/f875eff26539c63655c3f4be9602a63169188c5f/fuzzamoto-nyx-sys
[donate]: mailto:donate@brink.dev
[programs]: /programs
