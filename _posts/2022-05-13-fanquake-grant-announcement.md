---
title: "Welcoming Michael Ford"
permalink: /blog/2022/05/13/michael-ford/
layout: post
author: brink
name: "brink"
alt: Brink announces Michael Ford's (fanquake) grant
category: "News"
description: Brink announces Michael Ford's (fanquake) grant.
---

Brink is proud to announce a developer grant for Michael Ford
([fanquake][fanquake github]). He will be joining the Brink office in London to
continue his work as a maintainer.

## About Michael

Michael writes of his Bitcoin experience and goals:

<img src="/assets/images/michael-ford.jpg" alt="Picture of Michael Ford" style="float:left;border:1px solid
darkgray;margin-right:25px;width:150px;" />

I first contributed to Bitcoin Core in 2012. Since then, I’ve contributed
initially part time, and then full time capacity to the project; primarily
working on the build system. I became a Core maintainer in 2019. In the past
I’ve worked on the transition of our release system from Gitian to Guix, ported
our release time security checks to use LIEF, and contributed to the final
stages of removing BIP 70, and then OpenSSL.

I plan to continue working full time on Bitcoin Core, primarily focussing on the
build system, security and reducing the number of dependencies used in the
codebase. I have a number of in-progress projects, including migrating our macOS
toolchain to use a [fully LLVM-based toolchain][llvm bitcoin], adding support to our build
system for producing [static binaries using musl libc][musl libc] and improving support for
us to begin [using LTO][ltO].

Additionally I plan on collaborating with Carl Dong as he continues his work on
the [libbitcoin kernel project][libbitcoin project], and the Guix-based system
we use to [reproducibly][reproducible builds] create releases.

I also plan on working with Cory Fields, to develop [LLVM-based][llvm] tooling that will
help the project more safely refactor and modularise its code base, as well as
automate away somewhat trivial concerns that can sometimes consume too much
developer time (linters, formatters, etc).

I've had various organizations sponsor my work on Bitcoin Core, and for the last
3 years, that has been BitMEX. Moving to Brink is the next step in my Bitcoin
development journey, and I’m looking forward to building out, and working with,
an office full of Bitcoin Core developers in London!

[@fanquake][fanquake twitter]

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. If you
or your organization is interested in supporting open source Bitcoin
development, feel free to email us, [donate@brink.dev][donate].

Developers interested in either the grant or fellowship [programs][programs] can
apply now for the next funding round.

[fanquake github]: https://github.com/fanquake
[llvm bitcoin]: https://github.com/bitcoin/bitcoin/pull/21778
[musl libc]: https://github.com/bitcoin/bitcoin/pull/23203
[ltO]: https://github.com/bitcoin/bitcoin/pull/23611
[libbitcoin project]: https://github.com/bitcoin/bitcoin/issues/24303
[reproducible builds]: https://reproducible-builds.org/
[llvm]: https://llvm.org/
[fanquake twitter]: https://twitter.com/fanquake
[donate]: mailto:donate@brink.dev
[programs]: /programs
