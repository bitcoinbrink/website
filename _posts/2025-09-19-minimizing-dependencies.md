---
title: "The importance of minimizing dependencies in Bitcoin Core"
permalink: /blog/2025/09/19/minimizing-dependencies/
layout: post
author: brink
name: "brink"
alt: The importance of minimizing dependencies in Bitcoin Core
category: "technical"
description: Relying on external code is a risk. We look at the work in Bitcoin Core to minimize these kind of dependencies.
---

The security of Bitcoin Core's codebase is rightfully emphasized in discussions
of the Bitcoin network's resiliency. But Bitcoin Core's code is not the only
code executed when running Bitcoin Core. Over the years, Bitcoin Core has also
relied on external, third-party code and libraries. Some of these dependencies
have been the [source][upnp1] of historical [vulnerabilities][upnp2], and all of them carry
potential risks. Engineers have deliberately and carefully worked to reduce
dependencies, replacing them with safer, purpose-built code or eliminating them
entirely.

## Risk of Dependencies

While using pre-existing libraries can speed up development and productivity, in
Bitcoin Core, securitiy is instead prioritized. Relying on dependencies can
create security risks in several ways:

- **Security vulnerabilities**: External libraries can contain bugs that expose
  Bitcoin Core to crashes, remote code execution, or other exploits.
- **Consensus fragility**: Subtle differences between library versions or
  platforms can lead to consensus splits. Satoshi’s early use of OpenSSL
  signature parsing nearly caused just such a problem.
- **Supply-chain risk**: If an dependency ships a malicious version,
  whether by coercion, compromise, or mistake, Bitcoin Core could be exposed to
  a backdoor.
- **Build reproducibility**: Reproducible builds, critical for verifiability,
  are harder to achieve when relying on third-party projects.
- **Maintenance burden**: Developers must track changes in the dependencies, apply security
  patches, and ensure cross-platform compatibility.

Every dependency adds to the attack surface. Reducing them increases resilience.

## Removing Dependencies

Over time Bitcoin Core has steadily removed unnecessary and risky dependencies,
deleting them entirely, or replacing them with Bitcoin-specific, minimal
implementations. Here are the most significant removals:

- **OpenSSL (replaced with libsecp256k1)**
  - OpenSSL was used for ECDSA, RNG, and X.509 parsing. Its complexity and
    vulnerabilities (e.g. Heartbleed) were dangerous.
  - Replaced by [libsecp256k1][], a purpose-built library, developed by Bitcoin
    Core contributors.
  - [Bitcoin Core #6954][bc 6954] (v0.12.0).

- **Protobuf / BIP70 Payment Protocol**
  - Bitcoin Core once supported BIP70, which required Protobuf and OpenSSL’s
    X.509 certificate handling.
  - This added attack surface and complexity for a feature rarely used.
  - Fully removed in [Bitcoin Core #17165][bc 17165] (v0.20.0).

- **Berkeley DB (BDB)**
  - Originally the wallet backend.
  - Known for brittle lock limits.
  - [Replaced][bc 28710] by SQLite for descriptor wallets  (removed in v30.0).

- **miniupnpc and libnatpmp**
  - Used for automatic NAT traversal and port forwarding.
  - Both libraries had recurring security issues and were unreliable in
    practice.
  - miniUPnP removed in [Bitcoin Core #31130][bc 31130] (v29.0).
  - libnatpmp removed in [Bitcoin Core #30043][bc 30043] (v29.0), replaced with
    a minimal in-house NAT implementation.

- **Boost**
  - Early versions of Core depended on large portions of Boost ([filesystem][bc 20744],
    signals, threads).
  - Over the years, these were replaced with C++ standard library equivalents.
  - Today, Boost is [header-only][bc 24301] and minimal, with plans to remove it entirely.

- **Gitian (replaced with Guix)**
  - Gitian was previously used for deterministic builds.
  - Replaced by [Guix][] in v22.0, which provides cleaner, reproducible,
    cross-platform builds with pinned toolchains.
  - [Bitcoin Core #21145][bc 21145] summarizes all of the code changes related to the
    transition.

- **macOS related Dependencies**
  - The build [migration][bc 21778] from cctools-port, libtapi, and ld64 to llvm
    binutils and lld
  - Removing [libdmg-hfsplus][bc 24031], migrating to [shipping a zip][bc 28432]
    which replaced xorriso with zip, [removing native_biplist][bc 20333], using a
    [static tiff][bc 23909] which dropped the need for  librsvg, font-tuffy,
    tiffutil and others.

## What is next?

The Bitcoin network is only as strong as its software. A rigorous culture of
code review combined with technical tools like [fuzz testing][] can make Bitcoin
Core's code even more secure. But minimizing the external dependencies required
by Bitcoin Core also helps ensure Bitcoin’s robustness and security.

This process continues today with developers continuing to evaluate the
remaining dependencies (like libevent, boost), pruning unneeded code, and
strengthening reproducibility. Each removal lowers risk and makes Bitcoin Core
easier to maintain for decades to come.

Fewer dependencies, fewer risks, stronger Bitcoin.

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. If you
or your organization is interested in supporting open source Bitcoin
development, feel free to email us, [donate@brink.dev][donate].

Developers interested in the grant [program][programs] can apply now.

[upnp1]: https://bitcoincore.org/en/2024/07/31/disclose-upnp-oom/
[upnp2]: https://bitcoincore.org/en/2024/07/03/disclose_upnp_rce/
[libsecp256k1]: https://github.com/bitcoin-core/secp256k1
[bc 6954]: https://github.com/bitcoin/bitcoin/pull/6954
[bc 17165]: https://github.com/bitcoin/bitcoin/pull/17165
[bc 28710]: https://github.com/bitcoin/bitcoin/pull/28710
[bc 31130]: https://github.com/bitcoin/bitcoin/pull/31130
[bc 30043]: https://github.com/bitcoin/bitcoin/pull/30043
[bc 20744]: https://github.com/bitcoin/bitcoin/pull/20744
[bc 24301]: https://github.com/bitcoin/bitcoin/pull/24301
[Guix]: https://guix.gnu.org/
[bc 21145]: https://github.com/bitcoin/bitcoin/issues/21145
[bc 21778]: https://github.com/bitcoin/bitcoin/pull/21778
[bc 24031]: https://github.com/bitcoin/bitcoin/pull/24031
[bc 28432]: https://github.com/bitcoin/bitcoin/pull/28432
[bc 20333]: https://github.com/bitcoin/bitcoin/pull/20333
[bc 23909]: https://github.com/bitcoin/bitcoin/pull/23909
[fuzz testing]: /blog/2023/07/14/fuzzing/
[donate]: mailto:donate@brink.dev
[programs]: /programs
