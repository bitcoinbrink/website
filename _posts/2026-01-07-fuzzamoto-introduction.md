---
title: "Fuzzamoto: Introduction"
permalink: /blog/2026/01/07/fuzzamoto-introduction/
layout: post
author: niklas
name: "brink"
alt: "Fuzzamoto: Introduction"
category: "technical"
description: Part 1 of our series on Fuzzamoto, a fuzz testing tool for Bitcoin full nodes. This post provides an introduction of Fuzzamoto including its motivation, a design overview, and the first bug found. 
---

About a year ago, I started working on
[Fuzzamoto][fuzzamoto gh], a fuzz testing tool for
Bitcoin full nodes. In this series of blog posts, I will share my experiences,
insights and open challenges encountered during its development. This first part
will cover the motivation behind creating Fuzzamoto and give an overview of its
design and architecture. In later parts, I will dive deeper into determinism,
testcase generation and mutation, bugs found, fuzzing feedback beyond coverage
and lots more.

## Motivation

As of today, Bitcoin Core is the most widely deployed implementation of the
Bitcoin protocol on the network and as such it carries the burden of bugs
potentially having catastrophic impact. As a result, Bitcoin Core has a very
conservative development culture, which is necessary and a strength to some
extent (certainly a big reason why there aren't many serious bugs) but also
leads to frustration, burn out, and slow progress on important projects.

Even if you just aim to improve the testing, by refactoring existing code to be
more testable and adding tests, you will likely face significant resistance. The
project's resources are limited and complex refactoring PRs are simply not as
attractive to reviewers as a 20% speedup in initial syncing time, P2P protocol
features or trivial changes that require less time and effort to review. To make
things worse, if you have to refactor code to add more tests, there is a risk of
introducing bugs during the refactor itself. This creates a chicken-and-egg
problem, because tests would de-risk the refactoring, but adding tests requires
refactoring.

These refactors typically decouple components, carve out code into their own
modules, or add interfaces to make mocking possible, which are often necessary
to allow for efficient in-process/persistent-mode fuzzing. For example, fuzzing
is slow and scales poorly if the component under test depends on disk I/O, so
you want to be able to mock it out.

At this stage major improvements to testing in Bitcoin Core (ones that turn up
serious existing bugs or prevent them going forward) are still very much
possible. For example, P2P code relating to valid blocks, transactions or
compact blocks is not fuzzed, same for chain reorganizations and other similar
more involved code paths. Being able to test these efficiently with classical
in-process harnesses requires changes to critical code (consensus, P2P, …), code
that is not under test to the extent that it should be.

I can say from personal experience that trying to get buy-in for these refactors
is painful and I have lost interest in maintaining PRs, for months or years,
whose benefits are seemingly often outweighed by the higher churn rate of
features and trivial changes.

Faced with this situation, it became clear that Bitcoin Core would benefit from
tests that avoid adding undue burden to the conservative review process and do
not require any changes to Bitcoin Core itself, to accelerate the closing of
remaining testing gaps and de-risk future changes. The ultimate vision for this
is an external testing suite that gets as close as possible to taking production
binaries as input and producing bugs as output.

Bitcoin Core’s functional tests were the closest thing to this idea as they
spawn entire full nodes and test them through their external interfaces (RPCs,
P2P, IPC, etc.). No refactoring is needed to write functional tests, at most new
RPCs have to be added to be able to inspect some state. While these tests
achieve great code coverage and find a lot of bugs, they are not property based
tests and don’t automatically explore edge cases. For example, a single line
patch to the functional tests would have found
[CVE-2024-35202][]
but it was actually found through refactoring and writing new fuzz tests (tests
and refactoring that, by the way, were never merged into Bitcoin Core). If the
functional tests were property based tests, then perhaps they could have found
the issue.

After realising this, I asked myself: what if we had “functional fuzz tests”?
Same testing concept as the functional tests but instead of hard coded testing
scenarios with expected outcomes we use fuzzing to test properties at the system
level. This is the idea behind Fuzzamoto: full-system fuzz driven simulations.

## Design

At a high-level, fuzzing with Fuzzamoto involves the target full node daemons
(e.g. bitcoind, btcd, …), a testing harness that controls test execution given a
fuzz input, and a fuzzing engine that produces inputs for the harness to
execute.

!["Fuzzamoto architecture"](/assets/images/2026-01-fuzzamoto-architecture.png "Fuzzamoto architecture")

### Snapshot Fuzzing

One obvious challenge that needs to be addressed is that a naive implementation
of this would result in state accumulation in the target nodes across fuzzing
executions, which would lead to non-determinism. I will get more into
determinism and its challenges in one of the next parts of this blog series, but
the tldr is: for fuzzing to be efficient we want testcase execution to be
deterministic, i.e. given the same input, the behavior of the test should be the
same. \
 \
Fuzzamoto uses full-system snapshot fuzzing to address this state challenge.
This works by running the target nodes and testing harness in a special virtual
machine that has the ability to take a snapshot of all its state (memory, CPU
state, devices, …) and quickly reset itself to that state. Currently, Fuzzamoto
uses [Nyx][] as the VM backend but in theory any backend
with similar capabilities would work.

This allows us to avoid repeating expensive state setup and teardown each
iteration. We can simply set up the desired state in the beginning, then take
the snapshot and fuzz from there, resetting the VM back to the initial state
quickly at the end of each execution. For fuzzing Bitcoin full nodes
specifically, this allows us for example to premine a chain that provides mature
coinbases available for spending in the test right away.

We will get into the technical details on how Nyx works, is used and how
coverage guidance works in this model in a future part of this blog series.

### Scenarios

The fuzzing harnesses in Fuzzamoto are dubbed “scenarios” and are responsible
for snapshot state setup, controlling fuzz input execution and reporting results
back to the fuzzer. Each scenario needs to implement two functions:

* Scenario creation and snapshot state setup, i.e. spawning target full node
  processes and bringing them into the desired state for the fuzzing campaign.
* Testcase execution, i.e. executing a testcase in the context of the previously
  created state.

Specific scenarios exist for testing the http server, wallet migration, the RPC
interface or specific peer-to-peer protocol flows like compact block relay.
These all take raw bytes as input and use [Arbitrary][]
to parse the bytes into a structured testing input, which then gets executed
against the target. Since the input is a generic byte array we can use
[AFL++][] for fuzzing these scenarios,
as it provides support for snapshot fuzzing with Nyx.

As I was working on independent scenarios for testing various P2P protocol flows
(transaction relay, compact block relay, chain reorganizations, …), it occurred
to me that it would actually be beneficial to have overlap between them. For
example, for testing compact blocks or chain reorganizations it is not far
fetched to assume that also submitting transactions of different shapes and
types to the node under test (just like a transaction relay scenario would)
could potentially trigger bugs. This line of thought led to developing a very
broad scenario for targeting the entire P2P surface of nodes, all at once.
Purpose built for fuzzing this scenario, Fuzzamoto includes a custom
[LibAFL][] based fuzzing engine, which we
will get into in more detail in a later part of this series.

## Early Success: RPC Block Index Bug

One of the first scenarios I wrote, targeted the RPCs of Bitcoin Core and in
particular aimed at combining (un)related sequences of RPCs in interesting ways.
The scenario calls RPCs in fuzzer chosen order and will either parse parts of
the fuzz input into RPC inputs or choose from a pool of previously returned
values by other RPCs. For example, if the test calls `generatetoaddress` it
might later on pass the returned block hashes to other RPCs as input or consume
a hash from the fuzz input.

This scenario was able to find a bug in the block index data structure which
only manifests through use of the `invalidateblock` and `reconsiderblock` RPCs
(only used for testing).

```bash
bitcoind: validation.cpp:5392: void ChainstateManager::CheckBlockIndex(): Assertion '(pindex->nStatus & BLOCK_FAILED_MASK) == 0' failed.
```

While this bug is not particularly interesting from a security perspective
(triggered through test-only RPCs), it highlights the strengths of the
full-system approach: it was immediately clear that this is a bug and not a
false positive (i.e the daemon crashed, which should never happen) and the use
of snapshot fuzzing enabled efficient state resets that would otherwise only be
possible with refactoring.

The same bug was also found by other
[contributors][checkblockindex crash]
who refactored and wrote a fuzz test for the block index code. The
[PR][bitcoin core #31533] to add this work to the
repository was open for a whole year before it was merged!

Since Fuzzamoto tests run at the same level as the functional tests, we can
convert any Fuzzamoto testcase into a Bitcoin Core functional test (this will
work as long as the bug is deterministically reproducible). For example, the
following functional test reproduces the block index bug:

```python
from test_framework.test_framework import BitcoinTestFramework

class CheckBlockIndexBug(BitcoinTestFramework):
    def set_test_params(self):
        self.setup_clean_chain = True
        self.num_nodes = 1

    def run_test(self):
        self.generatetoaddress(self.nodes[0], 1, "2N9hLwkSqr1cPQAPxbrGVUjxyjD11G2e1he");
        hashes = self.generatetoaddress(self.nodes[0], 1, "2N9hLwkSqr1cPQAPxbrGVUjxyjD11G2e1he");
        self.generatetoaddress(self.nodes[0], 1, "2N2CmnxjBbPTHrawgG2FkTuBLcJtEzA86sF");

        res = self.nodes[0].gettxoutsetinfo()
        self.generatetoaddress(self.nodes[0], 3, "2N9hLwkSqr1cPQAPxbrGVUjxyjD11G2e1he");
        self.log.info(self.nodes[0].invalidateblock(res["bestblock"]))
        self.generatetoaddress(self.nodes[0], 3, "2N9hLwkSqr1cPQAPxbrGVUjxyjD11G2e1he");
        self.nodes[0].reconsiderblock(hashes[0])
        self.nodes[0].invalidateblock(hashes[0])
        self.log.info(self.nodes[0].reconsiderblock(res["bestblock"]))

if __name__ == '__main__':
    CheckBlockIndexBug(__file__).main()

```

This way the developers triaging the bug, do not have to deal with setting up
Fuzzamoto and can debug the issue using the tools they are familiar with.

For a complete list of issues found and published so far, have a look at the
trophy section in the project’s
[readme][fuzzing trophies].

The next post in this Fuzzamoto series will cover considerations around non-determinism.

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. If you
or your organization is interested in supporting open source Bitcoin
development, feel free to email us, [donate@brink.dev][donate].

Developers interested in the grant [program][programs] can apply now.

[fuzzamoto gh]: https://github.com/dergoegge/fuzzamoto
[CVE-2024-35202]: https://bitcoincore.org/en/2024/10/08/disclose-blocktxn-crash/
[Nyx]: https://nyx-fuzz.com/
[Arbitrary]: https://docs.rs/arbitrary
[AFL++]: https://github.com/AFLplusplus/AFLplusplus
[LibAFL]: https://github.com/AFLplusplus/LibAFL
[donate]: mailto:donate@brink.dev
[checkblockindex crash]: https://github.com/bitcoin/bitcoin/issues/32173#issuecomment-2767030982
[bitcoin core #31533]: https://github.com/bitcoin/bitcoin/pull/31533
[fuzzing trophies]: https://github.com/dergoegge/fuzzamoto#trophies
[programs]: /programs
