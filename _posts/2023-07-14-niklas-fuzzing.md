---
title: "Niklas Gögge on Fuzz Testing"
permalink: /blog/2023/07/14/fuzzing/
layout: post
author: brink
name: "brink"
alt: Niklas Gögge on Fuzz Testing
category: "technical"
description: Niklas Gögge on Fuzz Testing.
---

Brink is excited to announce continued support for [Niklas Gögge][niklas github] in his
open source Bitcoin Core development work. Niklas' contributions towards
testing, and in particular fuzz testing, is important to secure Bitcoin Core and
uncover critical bugs.

In a security-focused project like Bitcoin Core, testing is critical. [Bitcoin
Core unit tests][] are written in C++ using the Boost libraries to quickly test
components of the codebase in isolation (see the [bech32 unit tests][] for
example). [Bitcoin Core functional tests][] are written in python to test
features of the software, involving multiple components working together (see
the [P2P ping functional tests][]).

A more cutting-edge type of testing is fuzz testing where software repeatedly calls
into portions of the codebase using inputs generated automatically by a fuzzing engine
instead of manually by the test writer. When done
continuously, fuzzing can be
used to expand test coverage and uncover bugs.
For example, fuzzing can generate a series of specially-crafted P2P messages that
leads to a crash, memory leak, or inconsistent internal state. As Bitcoin Core
nodes are constantly exposed to anonymous peers on the network, a crash bug in
the P2P message processing code could be catastrophic.

As a form of automated software testing, fuzzing can scale (to some extent) with
the amount of computation allocated to it and often finds
edge cases that were missed during manual code review. Bitcoin
Core participates in [OSS-Fuzz][], Google's continuous fuzzing program, in
addition to contributors running fuzzing infrastructure and contributing new
inputs back to the growing body of [fuzzing corpora][].

Fuzz testing initiatives in Bitcoin Core have found several important bugs over the years,
with [Fuzz Trophies][] noting some of them.

Niklas has been working on [Bitcoin Core's
fuzz testing][] initiatives including increasing the number of fuzz-testable
[targets][fuzz targets] (~200 currently) and refactoring 
[P2P net processing][fuzzing net processing] to be more fuzzer-friendly.

Niklas recently gave a presentation about fuzz testing in Bitcoin
Core. The outline of the presentation is:

- Fuzzing
  - What is it? Why do it?
  - Coverage guided fuzzers
  - Bug Oracles (Sanitizers, Differential Fuzzing, etc.)
  - Best practices for targets
- Bitcoin Core
  - Fuzzing Infrastructure
  - How/what to contribute

A PDF copy of Niklas' slides is available for [download][niklas fuzzing pdf] and
a recording of the presentation provided below.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/fIcQLtFQaWs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. If you
or your organization is interested in supporting open source Bitcoin
development, feel free to email us, [donate@brink.dev][donate].

Developers interested in the grant [program][programs] can apply now.

[Bitcoin Core unit tests]: https://github.com/bitcoin/bitcoin/blob/master/src/test/README.md
[bech32 unit tests]: https://github.com/bitcoin/bitcoin/blob/master/src/test/bech32_tests.cpp
[Bitcoin Core functional tests]: https://github.com/bitcoin/bitcoin/tree/master/test/functional#functional-tests
[P2P ping functional tests]: https://github.com/bitcoin/bitcoin/blob/master/test/functional/p2p_ping.py
[OSS-Fuzz]: https://google.github.io/oss-fuzz/
[fuzzing corpora]: https://github.com/bitcoin-core/qa-assets
[Fuzz Trophies]: https://github.com/bitcoin-core/bitcoin-devwiki/wiki/Fuzz-Trophies
[niklas github]: https://github.com/dergoegge
[Bitcoin Core's fuzz testing]: https://github.com/bitcoin/bitcoin/blob/master/doc/fuzzing.md
[fuzz targets]: https://github.com/bitcoin/bitcoin/tree/master/src/test/fuzz
[fuzzing net processing]: https://github.com/bitcoin/bitcoin/issues/27502
[niklas fuzzing pdf]: /assets/files/2023-07-05-niklas-fuzzing-slides.pdf
[donate]: mailto:donate@brink.dev
[programs]: /programs
