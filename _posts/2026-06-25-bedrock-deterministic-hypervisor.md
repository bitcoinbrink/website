---
title: "Introducing Bedrock: A Deterministic Hypervisor"
permalink: /blog/2026/06/25/bedrock-deterministic-hypervisor/
layout: post
author: niklas
name: "brink"
alt: "Introducing Bedrock: A Deterministic Hypervisor"
category: "technical"
description: "Bedrock: A general solution to achieving full determinism in software testing by building a deterministic hypervisor to emulate time and trigger virtual machines to exit at precise instruction counts."
---

<style>
    sup:target::before {
        display: inline;
    }

    .post-container .post-content img {
        max-height: 300px;
    }
</style>

In the second part of the [Fuzzamoto blog series][non-determinism post], I
highlighted the struggle of non-determinism in testing/fuzzing, sources of
non-determinism, and some crafty workarounds for reducing non-determinism in
Fuzzamoto.

In this blog post, I'll go over a general solution to achieving full determinism
in software testing: building a deterministic hypervisor. In particular, I'll
dig into the challenge of emulating time, and how to trigger virtual machines to
exit at precise instruction counts, by (ab)using the CPU's performance
monitoring unit.

I am not the first person to attempt building something like this,
[Antithesis][antithesis] has built a deterministic hypervisor and an entire
autonomous testing platform around it. As far as my own experience goes, they
have built one of the most advanced and usable fuzzing/property-based testing
systems that exists today. Their entire system is proprietary and closed source,
so when I read their blog post "[*So you think you want to write a deterministic
hypervisor?*][antithesis hypervisor]," I immediately thought, "Yes, I think I
do."

There was just one problem, I had no idea what a hypervisor even is or how they
work, besides an abstract notion of "a thing that manages virtual machines." So
to get started, I opened up claude code and started prompting. Unfortunately, it
is not quite as easy as "Claude, build me a deterministic hypervisor, make no
mistakes", but 8+ months later, Claude and I have managed to produce something
that seems to work: [bedrock][bedrock].

So what actually is a hypervisor? A hypervisor is the software that runs a
virtual machine: it uses hardware virtualization support (e.g. Intel® VT-x) to
execute the guest's code directly on the physical CPU at native speed, while
retaining the ability to intercept anything the guest does. The mechanism is the
VM exit, the CPU runs guest instructions until the guest touches something the
hypervisor has asked to intercept, at which point control flows back to the
hypervisor, which handles the event and resumes the guest. In simplified terms,
you can think of it as one big loop, which runs a VM, and upon exit consults a
giant switch statement for how to handle the particular exit, after which the
next loop iteration starts and the VM is resumed.

Claude started out by telling me that we can just use stock KVM (the hypervisor
that ships with the linux kernel), configure it to exit whenever the guest
attempts to do something non-deterministic (e.g. execute the `rdtsc` instruction),
and emulate the action instead. This idea is conceptually correct, but as we
will see, it is not tenable. The insight behind why a deterministic hypervisor
is a generic solution to software determinism, is that all non-determinism comes
from the underlying hardware, and the hypervisor can act as a determinism
boundary between the software we want to test and the hardware beneath it.

![Bedrock acting as a determinism boundary between guest VMs and the
hardware](/assets/images/2026-06-bedrock-determinism-boundary.png "Bedrock as a determinism boundary")

Anyone who knows what they are doing (not me), would immediately have known that
stock KVM will not be able to do this, as it does not have the required
configurability, and wasn't at all designed with this use case in mind. You
could take the KVM source code and modify it to support deterministic execution
(this is what Antithesis did, not with KVM but with [bhyve][bhyve]), but not use
it out of the box.

Today, I realise that choosing an existing hypervisor and modifying it to become
deterministic would have been the smarter route (I probably spent a month or
more just getting a linux kernel to boot), but - and I can't remember why - I
chose to build mine from scratch. The first 2-3 iterations of this were written
in C as a linux kernel module, but eventually - after many host kernel panics
caused by memory unsafety issues, a lack of tests, and forgetting to re-enable
kernel preemption in some exit paths - I chose to rewrite my kernel module in
Rust. You can of course write tests for kernel modules written in C, but with
Rust I was able to use traits to create abstractions over kernel or hardware
features, and write standard cargo unit tests for hypervisor logic that run in
userspace.

The userspace tests turned out to be less useful than I originally thought, as
most of the really annoying bugs actually came from misusing hardware features
or the kernel API (exactly the thing the unit tests weren't exercising). To
address this, I created Claude skills that gave the LLM access to the 5000 pages
of the Intel® Software Developer Manual (SDM), as well as the source code of the
exact linux kernel version the module was depending on. These skills were a
major improvement to the LLMs capability in producing correct code the first
time, debugging bugs that popped up, and exploring required hardware features.
The SDM skill was also especially great for my own understanding, as it improved
the accuracy of Claude's explanations a lot.

Since bedrock is not aiming to be general purpose hypervisor, a lot of
simplifications can be made, including but not limited to: only supporting a
specific set of modern Intel® x86 CPUs with Intel® VT-x, VMs managed by the
hypervisor only ever having one CPU, only supporting a specific set of Linux
kernel versions for the guest and host, and not making security a concern.

## Emulating Time

I would like to now deep dive into one of the obvious things that a
deterministic hypervisor will have to do: emulate time. The guest can not be
allowed to observe the actual hardware timestamp counter (TSC), or its execution
would depend on the non-deterministic nature of the real TSC. The hypervisor's
job is to force the VM to exit whenever it tries to read the real TSC, and return
an emulated value instead. This requires trapping instructions such as `rdtsc` and
certain model-specific register (MSR) reads, as well as finding some
deterministic metric that can act as a proxy for the time the guest spent
executing.

Claude's first naive suggestion was to count the number of VM exits, and report
this exit count as the emulated tsc back to the guest. VM exit count is
obviously not a great proxy for time, as the time passed between exits can wildly
differ. What most deterministic hypervisors do is count the number of
instructions executed by the guest, and use the recorded instruction count
divided by the hosts clock frequency as the emulated tsc. This is not perfect
either, as not all instructions take the same amount of time to execute, but
works well enough.

The emulated tsc is also used to decide when to inject timer interrupts. This is
where things get tricky, because halting the guest at a specific emulated tsc
value (i.e. at a specific instruction count N) to inject an interrupt at the
right time is not a documented use case for Intel® CPUs. A naive "solution" here
is to just not do precise interrupt delivery, and only inject interrupts at the
natural deterministic exit boundaries. I measured how inaccurate this approach
is, and the worst observed timer injection delay was ~0.2 seconds in virtual
time.

![Distribution of timer injection delay without precise interrupt
delivery](/assets/images/2026-06-bedrock-timer-injection-delay.png "Timer injection delay")

Even though this seemed to work - and I didn't observe any unexpected behavior
from the guest due to the imprecision - the timer interrupts are what drives the
linux kernel task scheduler, and probably assumed to work reliably by most
software. In addition to this, we'll also need to use precise interrupt delivery
to inject other events (e.g. executing bash commands) into the guest. In the
context of testing, this imprecision could also lead to missed bugs. So we need
some mechanism for triggering VM exits at precise instruction counts.

The performance monitoring unit (PMU) supports various performance monitoring
counters (PMCs) that are normally used (as the name suggests) for software
benchmarking purposes. There are PMCs that can be programmed to countdown
instructions, and trigger a performance monitoring interrupt (PMI) when the
counter reaches zero. This is achieved by setting the counter to its maximum
value minus the desired instruction count N, as the counter will count up by one
for each executed instruction, and trigger the PMI sometime after it overflows.

While we can intercept PMIs with the hypervisor, these interrupts are delivered
asynchronously through the advanced programmable interrupt controller (APIC)
while the guest continues executing. Antithesis also mentions this in their blog
post "*PMC supports a threshold notification system, where you set up the counter
as a "countdown" and get an interrupt when the value reaches zero. However, since
this interrupt is delivered through the APIC, dozens of instructions will be
processed before the CPU is actually notified of the threshold event. Moreover,
this interrupt delivery overhead is quite varied when measured in CPU cycles,
meaning that you really don't know how long ago an interrupt was triggered from
the time you receive it*". I measured this PMI delay, as can be seen in the plot
below.

![Distribution of PMI delay measured in instructions past the target](/assets/images/2026-06-bedrock-pmi-delay.png "PMI delay")

In this dataset, with rather few samples (~34k PMI exits), I observed a maximum
skid (instructions executed past the target) of 301 instructions. From my
experiments, this is actually sufficient to create a precise exiting primitive by
applying a skid margin to the exact instruction count we are interested in, and
absorbing the skid with monitor trap flag (MTF) based single stepping.

![Programming the PMC to overflow at N minus a skid margin, then single stepping
the remaining window up to N](/assets/images/2026-06-bedrock-skid-margin-single-step.png
"Skid margin with MTF single stepping")

That is, we program the INST_RETIRED.ANY PMC to overflow at instruction N minus
our skid margin M, and then we single step the rest of the margin window up to N.
In my testing this did seem to work, and looked to be deterministic, but,
especially under nested virtualisation (which can be useful for testing), the
performance overhead of this much single stepping really wasn't satisfactory.
The Antithesis blog post and the SDM also contain hints that made me think I can
do better.

In particular, the precise event based sampling (PEBS) feature caught Claude's
and my attention, as it promises precise instruction counting, especially in its
precise distribution mode (PDist). In my testing, using PEBS reduced the observed
skid from hundreds of instructions to dozens. My understanding is that the
INST_RETIRED.ANY PMC method above actually has two different delays baked into
the observed skid distribution, the APIC delay as well as a prior delay between
the counter overflowing and the actual PMI being triggered. But with PEBS in
combination with PDist, we only suffer the PMI delay, so the observed skid
distribution contracted, as seen in the following plot.

![Skid distribution using PEBS with PDist, contracted to tens of
instructions](/assets/images/2026-06-bedrock-pebs-pdist-skid.png "PEBS + PDist skid distribution")

This was getting closer to the optimal target of zero skid, and while this
already kind of seemed good enough, I was curious if this could be pushed even
further.

When a PEBS+PDist counter overflows the CPU writes a PEBS record to a memory
location you set up beforehand, precisely after the instruction that triggered
the overflow. The record contains some CPU register values right after the time
of the counter overflow, and can be programmed to contain other data as well.
However we are not interested in the record contents, but rather just the fact
that something is being written to memory very close to the precise time we care
about. Can we set up the PEBS buffer location in a way that triggers a VM exit?
Perhaps an extended page table (EPT) violation? EPT violations are VM exits - not
interrupts - and therefore do not get delivered through the APIC, so if this is
possible, we would avoid the APIC PMI delay. Turns out, on CPUs with the Ice
Lake-SP (or newer) microarchitecture, this is a supported feature called
EPT-friendly PEBS, which lets us set the PEBS buffer location to a guest-linear
address and more importantly reliably trigger an EPT violation on the PEBS buffer
write. Using this we get the following skid distribution on a Sapphire Rapids
CPU.

![Skid distribution using EPT-friendly PEBS, mostly zero
skid](/assets/images/2026-06-bedrock-ept-pebs-skid.png "EPT-friendly PEBS skid distribution")

Boom, (mostly) zero skid![^icelake] But where does the 9% of observed one
instruction skid come from? From what Claude told me, using PEBS+PDist requires a minimum counter
reload value of 256 instructions, meaning if two precise exits are closer than
256 instructions apart, we can't use PDist and the default PEBS behavior of
writing the record at N+1 instruction applies. Given this sometimes +1 skid
behavior (which also happens non-deterministically in the case of e.g. external
interrupts), we still have to rely on MTF single stepping, but at least only a
few instructions, as opposed to dozens or hundreds!

Is this the mechanism that Antithesis alludes to in their blog post? I don't
think so, or at least not directly as they use machines running the Skylake
microarchitecture for their product, which should not support EPT-friendly PEBS.
However, it could be possible that they found a way to get the same behavior
through some undocumented feature. They note: "*We were pushing various features
of the CPU just a bit past what they were really designed for, which meant
carefully probing their real, undocumented functionality every step of the
way*". Maybe they found some completely different mechanism, or just accept a
higher single stepping overhead (I doubt it), but it is up to them to reveal
their secrets.

## Conclusion

Up until about a year ago, when someone mentioned Antithesis to me at a local
meetup, I thought that full determinism in software testing was an elusive goal.
Learning about their product and building bedrock has completely changed that
perspective. What started as an intimidating, abstract concept became a tangible
project through hours of iterative prompting and deep-dives into the Intel® SDM
alongside Claude. This project has been a welcome reminder that even the most
complex systems can be demystified with the right tools and enough persistence.

This post focused on emulating the clock and in particular how to achieve precise
VM exits. The hypervisor already supports many other cool features
(copy-on-write VM forking, a deterministic I/O channel between guest and
hypervisor, …), and I might write more posts about this in the future. If you are
curious about some specific aspect please let us know.

There is also still a ton to be implemented and tinkered with. If this post
piqued your interest, feel free to ping me about contributing, or just checkout
the [repo][bedrock] and go from there.

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. If you
or your organization is interested in supporting open source Bitcoin
development, feel free to email us, [donate@brink.dev][donate].

Developers interested in the grant [program][programs] can apply now.

[^icelake]: On an Ice Lake-SP CPU the observed skid distribution was a few
    instructions larger. My hypothesis is that this is due to the used PMC only
    having cycle granularity on Ice Lake-SP, as opposed to instruction
    granularity on Sapphire Rapids.

[non-determinism post]: /blog/2026/04/09/fuzzamoto-non-determinism/
[antithesis]: https://antithesis.com/
[antithesis hypervisor]: https://antithesis.com/blog/deterministic_hypervisor/
[bedrock]: https://github.com/dergoegge/bedrock
[bhyve]: https://bhyve.org/
[donate]: mailto:donate@brink.dev
[programs]: /programs
