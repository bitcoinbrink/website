---
title: "Brink's 2025 Engineering Impact Report"
permalink: /blog/2026/03/26/engineering-impact-report-2025/
layout: post
author: brink
name: "brink"
alt: Brink's 2025 Engineering Impact Report
category: "News"
description: A detailed look at the contributions Brink's eight funded engineers made to Bitcoin in 2025.
---

Since 2020, Brink has funded open source Bitcoin developers with a
singular focus to strengthen Bitcoin's foundational infrastructure through
high-quality code review, testing, and development. Today we are publishing our
[2025 Engineering Impact Report][report], a detailed look at the contributions
our eight funded engineers made to Bitcoin in 2025.

We provide some highlights below, with the [full report available
here][report].

<a href="/assets/files/brink-engineering-report-2025.pdf" target="_blank"><img
src="/assets/images/brink-engineering-report-2025.png" alt="Brink's 2025 Engineering Impact Report Preview Page" style="max-height:100%" /></a>

## Themes

Several themes emerged across our engineers' work in 2025:

**Code Review.** Every change to Bitcoin Core must be carefully reviewed by
multiple qualified developers before it can be merged. Review is the project's
primary defense against bugs, vulnerabilities, and unintended behavior reaching
the software that tens of thousands of nodes rely on. An overlooked flaw in
consensus code could cause a chain split. A missed vulnerability in networking
code could allow an attacker to crash nodes or steal funds from connected
Lightning wallets. In 2025, Brink engineers collectively left over 6,000 review
comments on other developers' pull requests. Several of our engineers are among
the most active reviewers in the entire project. Every one of those comments
represents a line of defense between a code change and the Bitcoin network.

**Testing and Bug Fixes.** Brink engineers found and fixed security
vulnerabilities in 2025, both in Bitcoin Core and in other Bitcoin software.
Engineers independently discovered denial-of-service vulnerabilities, used fuzz
testing to catch bugs on pull requests before they could be merged, and
maintained infrastructure that continuously tests Bitcoin implementations around
the clock. When bugs are found before they reach users, the network stays safe
and node operators never have to worry. When vulnerabilities are found in
production code, they are responsibly disclosed and fixed before they can be
exploited. This is the kind of work that, when done well, is invisible to
everyone except potential attackers.

**Fuzzamoto.** One of our engineers built and released Fuzzamoto, a novel
framework for testing Bitcoin full nodes by running an actual node inside a
virtual machine and sending it random sequences of network messages. Traditional
fuzz testing tests isolated functions, while Fuzzamoto tests the software the
way a real attacker would interact with it by using the network. Any bug it
finds is a real bug reachable by a remote adversary. Fuzzamoto has already
discovered serious bugs that no existing test would have caught, and the
Quarkslab auditors (see below) called it "likely the most valuable path to
pursue in order to trigger deeper and more complex bugs." For node operators and
users, this means that Bitcoin Core is being tested against attack scenarios
that were previously out of reach.

**The First Independent Security Audit of Bitcoin Core.** Brink sponsored and
coordinated the first-ever third-party security audit of Bitcoin Core, conducted
by Quarkslab over four months. Three security engineers reviewed Bitcoin Core's
most critical components: the peer-to-peer networking layer, mempool, chain
management, and consensus logic. The audit found no critical, high, or
medium-severity issues, and produced improvements to Bitcoin Core's testing
infrastructure. For the Bitcoin community, this audit serves as an important
signpost that the code review and testing culture that Bitcoin Core developers
have built over the years is working and independent experts have helped confirm
it.

**Release Management.** A Brink engineer led the release process for every
Bitcoin Core release in 2025 including seven releases across five maintained
branches. He also merged 56% of all pull requests to the project. Release
management is unglamorous but critical as it is the process by which carefully
reviewed code actually reaches the tens of thousands of nodes running on the
Bitcoin network. Maintaining multiple older release branches ensures that users
who haven't yet upgraded to the latest major version can still receive critical
security/bug fixes through backported patches.

**Build System.** Bitcoin Core runs on every major platform and produces
deterministically reproducible binaries, meaning anyone can compile the release
and verify they get the exact same result, which minimizes trust in any
individual developer. Brink engineers led the ongoing work to modernize and
maintain the build toolchain, including shipping the first releases built with
CMake, completing the migration to Qt 6, improving Windows support, and working
to reduce Bitcoin Core's dependency on external libraries. Each external
dependency is a potential attack surface and removing them makes Bitcoin more
secure. This means that Bitcoin Core continues to be available and trustworthy
on the hardware and operating system users choose to run.

**Libsecp256k1.** The libsecp256k1 library provides the cryptographic operations
that secure every Bitcoin transaction including signatures, key generation, and
related functions. Multiple Brink engineers contributed to this library in 2025,
including taking over stewardship of the silent payments implementation,
co-creating a shared Python library (secp256k1lab) for prototyping cryptographic
proposals (already adopted by the FROST threshold signature and ChillDKG key
generation BIPs), and elevating the library's CMake build system to official
status. A libsecp256k1 maintainer described one Brink engineer as "a key
contributor to the project" whose reviews "carry significant weight."
Strengthening libsecp256k1 strengthens the cryptographic foundation that every
Bitcoiner depends on.

**Bitcoin Kernel.** The Bitcoin Kernel (previously known as libbitcoinkernel)
project is extracting Bitcoin Core's consensus validation logic, the code that
actually enforces Bitcoin's rules, into a standalone library with a public API.
This will make it possible for other Bitcoin software to use the exact same
consensus code as Bitcoin Core, reducing the risk of accidental chain splits
between different implementations. It also opens the door to a range of new
tools including alternative node implementations, Electrum-style index builders,
silent payment scanners, block analysis utilities, and script validation
accelerators can all be built on top of the kernel library without needing to
embed all of Bitcoin Core. Brink engineers became more central to this effort in
2025, contributing review, shaping the C API design, building Python bindings,
and hosting workshops to grow the developer community around the project.

**Building on Bitcoin's Existing Capabilities.** Brink engineers worked on
multiple projects that extended the benefits of the schnorr/taproot upgrade to
real users. MuSig2 wallet support, which multiple Brink engineers helped review
into Bitcoin Core, enables more efficient and private multisignature
transactions, allowing groups of signers to produce a single compact signature
that looks identical to an ordinary payment on the blockchain. Silent payments,
a privacy-enhancing reusable address format being implemented in libsecp256k1 by
a Brink engineer, will allow recipients to publish a single address that
generates unique on-chain outputs for each payment, with no visible link between
them. SwiftSync, prototyped by a Brink engineer, demonstrated a 5x speedup of
initial block download, potentially reducing the time for a new user to sync a
full node from days to hours. Work on FROST threshold signatures will allow for
flexible multisignature schemes that go beyond what MuSig2 offers, enabling
setups like 3-of-5 key arrangements. CISA could enable multiple signatures
within a single Bitcoin transaction to be aggregated, reducing transaction sizes
and fees. And the secp256k1lab library is streamlining how new cryptographic
proposals are developed and reviewed, reducing friction for anyone building on
Bitcoin's cryptographic primitives. All of this work makes Bitcoin more useful,
more private, and more accessible for everyday users.

## Engineer Highlights

### Marco De Leon

Marco completed his transition from Brink fellow to full-time grantee,
establishing himself as a capable contributor across multiple areas of the
codebase. He drove the txid type safety project to completion across six pull
requests, successfully removed Bitcoin Core's legacy checkpoints, left nearly
250 review comments, and contributed to fuzz testing infrastructure and P2P code
review.

### Sebastian Falbesoner

Sebastian upgraded to full-time work in 2025 and had a prolific year across both
Bitcoin Core and libsecp256k1. He took over stewardship of the silent payments
implementation in libsecp256k1, left over 570 combined review comments across
both repositories, co-created the secp256k1lab Python library for cryptographic
BIP prototyping, implemented the first proof-of-concept for SwiftSync (achieving
a 5x speedup of initial block download), reviewed MuSig2 wallet support through
to its merge, and contributed to the FROST threshold signature BIP.

### Michael Ford

Michael continued his role as one of Bitcoin Core's most senior maintainers,
merging 56% of all changes to the project, helping to cut seven new releases,
and leaving over 1,600 review comments. He led the release process for versions
28.1 through 30.0 and continued driving the effort to modernize Bitcoin Core's
build toolchain and reduce dependencies, directly supporting deterministic
builds and the project's long-term security.

### Niklas Gögge

Niklas built and released Fuzzamoto, a novel framework for fuzz testing Bitcoin
full nodes through their external interfaces, which has already discovered
serious bugs that existing tests would not have caught. He open-sourced the
continuous fuzzing infrastructure, assisted Quarkslab in conducting the
first-ever independent security audit of Bitcoin Core, mentored two interns on
security-focused projects, and continued his work on the Bitcoin Core security
group processing advisories and triaging vulnerability reports.

### Fabian Jahr

Fabian continued championing the embedded ASMap project, which improves Bitcoin
Core's resistance to network-level attacks by ensuring nodes connect to a
diverse set of internet providers, moving it toward likely inclusion in a future
release. He advanced cross-input signature aggregation (CISA) research
significantly, implementing a full aggregation signature scheme in libsecp256k1.
He contributed reviews across Bitcoin Core, libsecp256k1, and the ASMap
toolchain, and was recognized as a subject matter expert for several areas of
the codebase.

### Eugene Siegel

Eugene joined Brink as a grantee in April 2025 having already made an impact by
independently discovering and helping fix a disk-filling vulnerability in
Bitcoin Core's logging system. His log rate-limiting fix, shipped in Bitcoin
Core v30.0, prevents a class of denial-of-service attack that could have allowed
an attacker to fill a node's disk by sending invalid blocks. He also contributed
fuzz testing harnesses and scenario work for Fuzzamoto.

### Hennadii Stepanov

Hennadii left over 1,800 review comments and continued his wide-ranging work on
Bitcoin Core's build system, platform support, GUI maintenance, and
translations. He completed the migration to Qt 6 (shipped in Bitcoin Core
v30.0), re-introduced native Windows CI testing for cross-compiled binaries,
elevated libsecp256k1's CMake build system from experimental to official status,
and maintained the bitcoin-core-nightly CI repository that catches portability
regressions across BSD, illumos, and Windows platforms.

### Stéphan Vuylsteke

Stéphan left over 700 review comments and became a central contributor to the
Bitcoin Kernel project, the effort to extract Bitcoin Core's consensus logic
into a standalone, reusable library. He built and maintained the Python bindings
(py-bitcoinkernel), reviewed and shaped the C API design, contributed to
validation logic and codebase maintainability improvements, and continued
hosting London BitDevs and contributing to Bitcoin Optech.

## Outlook

The security and reliability that Bitcoin users depend on every day is the
product of careful, deliberate, daily work. Reading other people's code line by
line, writing tests for edge cases, contributing to the underlying build system
and cryptographic libraries, and quietly fixing vulnerabilities before anyone
knows they exist. Brink engineers do this work because they believe Bitcoin
matters, and because they know that open source software only stays strong when
talented people are given the support and freedom to maintain it.

Brink exists to provide that support. We are grateful to our engineers for their
dedication and to our sponsors for making this work possible. The [full
report][report] contains substantially more detail on each engineer's
contributions, and we encourage anyone interested in the state of Bitcoin Core
development and Brink engineers' contributions to it read it. We have also
provided a [comprehensive collection][pr summaries] of all Bitcoin Core pull
requests that Brink engineers have authored or provided review on in 2025.

Mike Schmidt<br />
Executive Director

[report]: /assets/files/brink-engineering-report-2025.pdf
[pr summaries]: https://github.com/bitcoinbrink/website/tree/master/assets/files/2026-03-26-engineering-impact-report-2025/
