---
title: "Celebrating Michael’s First Brink Epoch"
permalink: /blog/2026/11/23/michaels-brink-epoch/
layout: post
author: brink
name: "brink"
image: /assets/images/michael-ford.jpg
alt: Celebrating Michael’s First Brink Epoch
category: "News"
description: We're celebrating four years of Michael Ford (fanquake) maintaining, releasing, and hardening Bitcoin Core at Brink.
---
<div class="header-images">
  <img src="/assets/images/michael-ford.jpg" alt="Michael Ford celebrates 4 years as a Brinkie">
</div>

This year, we're celebrating four years of Brink support for Michael Ford
([GitHub][fanquake github], [X][fanquake x]), known to most as fanquake.
Michael is one of the project's longest-serving maintainers. He merges pull
requests, cuts releases, keeps the build system and release toolchain working,
and has spent years cutting down the amount of third-party code Bitcoin Core
depends on.

## Febuary

Michael's [first merged pull request][bc 910] to Bitcoin Core was a spelling
fix in <del>Febuary</del> February 2012. Over the following years he
contributed part-time and then full-time, mostly on the build system. He also
became known for triaging the project's issue tracker: labelling and closing
issues, and pointing pull requests at the right reviewers.

That triage work led to his nomination as a maintainer. At the June 2019
CoreDev meeting, the existing maintainers [discussed adding him][coredev 2019],
noting that "one of the things that was helpful was when fanquake started
triage." Days later his key was [added to the trusted keys][bc 16162] and he
was [announced as a new maintainer][optech 50]. In that pull request he wrote,
"I'll gain merge access and will continue with all triage/repo management work.
I'll be focusing primarily on build system development."

Before joining Brink, Michael had already [removed BIP70 support][bc 17165],
helped [remove OpenSSL][bc 17265], and made Bitcoin Core's use of Boost
[header-only][bc 24301]. He also [removed Gitian from the release
process][bc 22418] once Guix builds had replaced it. Guix makes it easier for
anyone to reproduce and verify release binaries.

## Joining Brink

Michael [joined Brink][michael grant] in April 2022, after three years of
sponsorship from BitMEX, and became the second employee to move into the
London office. His grant announcement named three areas of focus: the build
system, security, and reducing the number of dependencies in the codebase. It
also listed projects he already had in progress, including an LLD-based macOS
toolchain, static binaries, and continued work on reproducible Guix
builds. Four years later, most of that list has shipped and the rest is close.

## Merging and Releasing

Much of a maintainer's day goes to reviewing reviews, judging whether a change
has had enough scrutiny, ordering merges so they don't conflict, and sometimes
saying no. Michael described the job in [Brink's 2023 report][2023 report]:

> *"This involves having a birds eye view of the entire project day-to-day.
> Keeping tabs of what has been reviewed, and by who, what is ready for merge
> (and what it may conflict with), and what the merge order of changes should
> be."*

Since April 2022, Michael has:

- merged roughly 2,600 pull requests as a maintainer, about half of everything
  merged into Bitcoin Core in that period (56% in 2025 alone)
- authored over 780 pull requests of his own
- tagged over 20 Bitcoin Core releases and dozens of release candidates and
  handled the backports that keep older release branches patched
- left more than 1,500 review comments in each of 2023 and 2025
- authored most of the updates to the project's vendored subtrees
  (libsecp256k1, LevelDB, minisketch, crc32c)

That same report noted that colleagues had praised his "encyclopedic knowledge
of everything that's happening in the project". He is often the first to
comment on a new pull request, usually to point it at the right reviewers, a
related PR, or an earlier discussion its author missed.

## Removing Dependencies

Every external library Bitcoin Core relies on is code the project has to audit
and keep patched. As we covered in [The importance of minimizing
dependencies][minimizing deps], many contributors have worked on removing that
code over the years, and Michael has been at it longer than most. During his
time at Brink he:

- [removed Boost library detection][bc 25465] from the build
- [removed the experimental syscall sandbox][bc 27896]
- [removed libbitcoinconsensus][bc 29648], which libbitcoinkernel had
  superseded
- [dropped the `-upnp` option][bc 32500] after the miniupnpc library was removed
- landed the [final removal of libevent][bc 34411] in 2026, once other
  contributors had replaced the HTTP server and the other code that used it
  ([Optech coverage][optech libevent])

As Matthew Zipkin [said][optech podcast 411], "Fanquake was very excited about
removing the dependency. And for the last six months, I think he had a
follow-up ready." When it merged, Michael [noted][fanquake libevent] that "a
minimal bitcoind, now only has a single, header only, external dependency;
which is Boost MultiIndex. Work is ongoing to replace this too."

## Toolchains and Hardening

Bitcoin Core releases are built reproducibly, so anyone can rebuild them and
check that the binaries on bitcoincore.org match the reviewed source code.
Keeping that true on Linux, macOS, and Windows, across several CPU
architectures, means maintaining the compilers, linkers, and SDKs the build
uses. Michael has done much of that work, and [summed up][fanquake always] the
goal in 2025: "Always open source. Always reproducible. Always bootstrappable.
Never auto-updating."

The [LLD-based macOS toolchain][bc 21778], opened in 2021 and merged in 2024,
dropped the project's reliance on Apple's semi-open source tools and on a set
of poorly maintained upstream ports. It was also, as he [wrote at the
time][fanquake lld], the last step in making it "possible to reproducibly build
Bitcoin Core binaries for all 8 of our release platforms, across three
architectures: x86_64, AArch64 and RISC-V." He also moved the Guix release
builds through GCC 12, 13, and 14, and each upgrade meant tracking down
determinism issues so that independent builders would still get identical
binaries.

On hardening, he [enabled toolchain hardening by default][bc 25484] in Guix
builds, adopted [`_FORTIFY_SOURCE=3`][bc 27027], and added stack protection for
Windows, branch protection on ARM64, and Intel CET support. When Hennadii led
Bitcoin Core's [migration from Autotools to CMake][optech cmake], Michael moved
the depends packages over to CMake, [removed the old MSVC build
system][bc 30731], and did much of the cleanup afterwards.

## Static Binaries

Michael has been working toward fully static `bitcoind` binaries for most of
his time at Brink. A static binary carries everything it needs to run, so one
release file works on old and new Linux distributions, musl-based systems, and
minimal containers, whatever system libraries they have installed.

He started with a [musl libc proof of concept][bc 23203] in 2021 and opened the
[`-static-pie` pull request][bc 25573] in July 2022. Since then he has merged
the groundwork in pieces: statically linking libgcc, [splitting the Guix
builds][bc 35537] into separate `bitcoind` and GUI builds, and splitting the
Linux toolchain. In April 2026 he [posted test binaries][fanquake static] and
asked for testing "on various systems or obscure platforms", writing that
"Fully-static, reproducible, release binaries for Bitcoin Core, have been a
long-time goal of mine". A [new round][optech static] followed in August, and
he talked through the work on the [Optech podcast][optech podcast 418] and in a
[Brink engineering call][eng call].

## Security

Michael has been one of the contacts in Bitcoin Core's [security
policy][security md] since 2021 and helps triage incoming vulnerability
reports, which he described as "multiple emails a day" at times.

Two of the vulnerabilities in Bitcoin Core's 2024 historical disclosures credit
his reports. He found and disclosed a [memory exhaustion crash in the BIP70
payment protocol code][bip70 disclosure] (CVE-2024-52918), which he fixed by
removing BIP70 entirely. The other was an [infinite loop in the miniupnpc
library][upnp disclosure], found and reported upstream by Ronald Huveneers.
Michael reported how it could be used to crash Bitcoin Core (CVE-2024-52917)
and updated the dependency to pull in the fix. Miniupnpc has since been removed
altogether.

## Looking Ahead

Michael's near-term priority is getting static release binaries merged and
shipped. After that, he plans to keep [researching an LLVM-only release
toolchain][core x llvm] and to continue working on the remaining dependencies
such as Boost.

As Michael [put it][fanquake best shot] earlier this year, "A trustless,
decentralised protocol for internet cash should exist, and Bitcoin remains our
best shot at making it happen."

Thank you, Michael, for four years at Brink keeping Bitcoin Core shipping. We
look forward to the next epoch.

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. Find
out more about our [grants][] and [fellowship][] programs, and how to [support
us][].

[fanquake github]: https://github.com/fanquake
[fanquake x]: https://x.com/fanquake
[bc 910]: https://github.com/bitcoin/bitcoin/pull/910
[coredev 2019]: https://btctranscripts.com/bitcoin-core-dev-tech/2019-06/2019-06-06-maintainers/
[bc 16162]: https://github.com/bitcoin/bitcoin/pull/16162
[optech 50]: https://bitcoinops.org/en/newsletters/2019/06/12/#consensus-cleanup-soft-fork
[bc 17165]: https://github.com/bitcoin/bitcoin/pull/17165
[bc 17265]: https://github.com/bitcoin/bitcoin/pull/17265
[bc 22418]: https://github.com/bitcoin/bitcoin/pull/22418
[michael grant]: /blog/2022/05/13/michael-ford/
[2023 report]: /assets/files/brink-annual-report-2023.pdf
[minimizing deps]: /blog/2025/09/19/minimizing-dependencies/
[bc 24301]: https://github.com/bitcoin/bitcoin/pull/24301
[bc 25465]: https://github.com/bitcoin/bitcoin/pull/25465
[bc 27896]: https://github.com/bitcoin/bitcoin/pull/27896
[bc 29648]: https://github.com/bitcoin/bitcoin/pull/29648
[bc 32500]: https://github.com/bitcoin/bitcoin/pull/32500
[bc 34411]: https://github.com/bitcoin/bitcoin/pull/34411
[optech libevent]: https://bitcoinops.org/en/newsletters/2026/06/26/
[optech podcast 411]: https://bitcoinops.org/en/podcast/2026/06/30/#bitcoin-core-35182
[bc 21778]: https://github.com/bitcoin/bitcoin/pull/21778
[bc 25484]: https://github.com/bitcoin/bitcoin/pull/25484
[bc 27027]: https://github.com/bitcoin/bitcoin/pull/27027
[optech cmake]: https://bitcoinops.org/en/newsletters/2024/08/16/
[bc 30731]: https://github.com/bitcoin/bitcoin/pull/30731
[bc 23203]: https://github.com/bitcoin/bitcoin/pull/23203
[bc 25573]: https://github.com/bitcoin/bitcoin/pull/25573
[bc 35537]: https://github.com/bitcoin/bitcoin/pull/35537
[optech static]: https://bitcoinops.org/en/newsletters/2026/08/14/#static-bitcoin-core-binaries-available-for-testing
[optech podcast 418]: https://bitcoinops.org/en/podcast/2026/08/18/
[eng call]: /blog/2026/09/15/eng-call-fanquake-static-builds/
[core x llvm]: https://github.com/fanquake/core_x_llvm
[fanquake best shot]: https://x.com/fanquake/status/2007876585102192749
[fanquake static]: https://x.com/fanquake/status/2041872322726924504
[fanquake libevent]: https://x.com/fanquake/status/2069841641842544900
[fanquake always]: https://x.com/fanquake/status/1960753237856055642
[fanquake lld]: https://x.com/fanquake/status/1795470015753294217
[security md]: https://github.com/bitcoin/bitcoin/blob/master/SECURITY.md
[bip70 disclosure]: https://bitcoincore.org/en/2024/07/03/disclose-bip70-crash/
[upnp disclosure]: https://bitcoincore.org/en/2024/07/31/disclose-upnp-oom/
[grants]: /programs#grants
[fellowship]: /programs#fellowship
[support us]: /donate
