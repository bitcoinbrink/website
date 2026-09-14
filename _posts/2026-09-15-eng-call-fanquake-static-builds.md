---
title: "Michael Ford on static builds for Bitcoin Core"
permalink: /blog/2026/09/15/eng-call-fanquake-static-builds/
layout: post
author: brink
name: "brink"
alt: Michael Ford on static builds for Bitcoin Core
category: "technical"
description: Michael Ford presents the state of fully static bitcoind release binaries, the Guix changes that enable them, and research into an LLVM-only toolchain.
---

Brink engineer [Michael Ford (fanquake)][fanquake] presented an update on his
multi-year effort to ship fully [static `bitcoind` binaries][static pie pr],
along with an overview of an experimental LLVM-only release toolchain.

In his presentation, he discussed:

- Static versus dynamic linking and trade-offs
- The previous [musl libc approach][musl pr]
- [Splitting the Guix builds][guix split pr] into separate `bitcoind` and GUI
  containers
- Running the same binary on older glibc systems, musl-based distributions,
  and scratch Docker containers
- Dead code elimination and merging duplicate code
- Open questions on release strategy and CI coverage
- An experimental LLVM-only toolchain
- Why fully static macOS and Windows binaries are out of scope
- Q&A with the audience

<iframe width="560" height="315" src="https://www.youtube.com/embed/dVvJULyESec" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

_This discussion was recorded on September 11, 2026._

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. If you
or your organization is interested in supporting open source Bitcoin
development, feel free to email us, [donate@brink.dev][donate].

Developers interested in the grant [program][programs] can apply now.

[fanquake]: https://github.com/fanquake
[static pie pr]: https://github.com/bitcoin/bitcoin/pull/25573
[musl pr]: https://github.com/bitcoin/bitcoin/pull/23203
[guix split pr]: https://github.com/bitcoin/bitcoin/pull/35537
[donate]: mailto:donate@brink.dev
[programs]: /programs
