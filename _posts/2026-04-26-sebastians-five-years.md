---
title: "Celebrating Sebastian's Five Years at Brink"
permalink: /blog/2026/04/26/sebastians-five-years/
layout: post
author: brink
name: "brink"
image: /assets/images/sebastian-falbesoner.jpg
alt: "Sebastian Falbesoner celebrates five years at Brink"
category: "News"
description: This month, we're celebrating five years of Sebastian Falbesoner (theStack) working on Bitcoin Core and libsecp256k1 at Brink.
---
<div class="header-images">
  <img src="/assets/images/sebastian-falbesoner.jpg" alt="Sebastian Falbesoner celebrates five years at Brink">
</div>

This month, we're celebrating five years of Sebastian Falbesoner
([GitHub][sebastian github], [X][sebastian x]) working on Bitcoin Core and
libsecp256k1 at Brink. Sebastian's progress followed an arc similar to other
contributors by starting with often unglamorous test work, steadily widening his
scope, and eventually stepping up to steward impactful privacy proposals. We are
glad to have supported that journey, and optimistic about where it's heading.

## Part-Time Testing

Sebastian [joined Brink][sebastian grant blog] in July 2021 as part of our
second round of developer grants. At the time he was contributing in his spare
time around a full-time software engineering job, and the grant gave him a
dedicated slice of each week to focus purely on Bitcoin Core.

From the beginning, his contributions were grounded in the parts of the project
that tend to attract fewer headlines but provide the project's foundation:
code review, testing, and the functional test framework. His early
work [added missing checks for consensus reject reasons][bc 22711], [improved
RPC error coverage][bc 18466], cleaned up outdated terminology (such as
[converting tests from the pre-segwit concept of "block size" to "block
weight"][bc 22378]), and [expanded the use of MiniWallet][bc 21867] so that more
tests could run without the Bitcoin Core wallet compiled. He also helped
Hennadii's efforts by [chipping away at the codebase's overuse of recursive
mutexes][bc issue 19303], either replacing them with non-recursive ones or
removing them entirely where possible.

## BIP324

In 2022 and 2023, Sebastian became increasingly involved in the review of
BIP324, the [version 2 P2P transport protocol][v2 transport] that added
encryption to Bitcoin's peer-to-peer layer. It was the first project where he
really leaned into the cryptographic side of Bitcoin, reviewing everything from
the ElligatorSwift key exchange primitives to the network-layer integration.
Reviewers noticed that he had a habit of re-implementing pieces of the protocol
independently to cross-check the Bitcoin Core implementation, which is
particularly valuable for cryptographic code.

On top of his review work, Sebastian built [bip324-proxy][bip324 proxy], a
[proof-of-concept][optech bip324 proxy] that makes it easier for light clients
to use v2 encrypted transport without implementing the protocol themselves.

## Libsecp256k1

Sebastian describes libsecp256k1 as "one of the most fascinating projects in the
Bitcoin ecosystem due to its low-level, math-like and highly optimized
character, as well as its importance for both nodes and wallets".

Since his initial libsecp256k1 work with BIP324, he has contributed by adding
exhaustive test coverage for the ElligatorSwift module, reviewing the MuSig2
module that shipped in v0.6.0, and reviving an old pull request to ensure
sensitive memory (like private key material) is properly cleared without being
optimized out by the compiler. While working on that fix, he also identified
and fixed a place in Bitcoin Core where private key data could be leaked during
xprv parsing.

In 2024 he co-authored [BIP374][bip374] (DLEQ proofs for secp256k1), writing the
reference implementation and test vectors and helping refine the specification.
By the end of the year, Jonas Nick described him as "a key contributor to the
project" whose reviews "carry significant weight."

## Going Full-Time

In April 2025, after years of contributing part-time, Sebastian [left his day
job][full time announcement] to work on Bitcoin full-time. The shift was visible
in his output.

### Silent Payments

The most significant project of Sebastian's full-time year has been [silent
payments][silent payments]. [BIP352][bip352] defines a reusable-address scheme
that lets a recipient publish a single address while each payment lands at a
distinct, unlinkable on-chain output. This is a meaningful privacy improvement for
anyone who needs to accept payments publicly or without interactivity.

> *"Thinking back, my early work in Bitcoin Core focused to a large degree on
> improving test coverage and extending the functional test framework. Over the
> years, I became more and more drawn into work on privacy-related protocols
> that make use of elliptic-curve cryptography, such as peer-to-peer encryption
> (BIP-324), MuSig2 (BIP-327), FROST (BIP-445), and Silent Payments (BIP-352)."*

When the original author of the libsecp256k1 silent payments pull request
stepped back in late 2025, Sebastian took over just as a ["worst-case scanning
attack"][optech sp scanning] was discovered that could stall a scanning node for
several minutes on pathological transactions. Sebastian spent the following
months working with other reviewers to benchmark alternative scanning approaches
and open pull requests for two candidate designs.

Jonas Nick (libsecp256k1 maintainer) described the impact:

> *"theStack's impact on libsecp256k1 has been significant... He has recently
> taken over the Silent Payments pull request. This is a high-priority project
> for both libsecp256k1 and Bitcoin Core. His maintenance of that PR has been
> effective in driving it forward... He works effectively with very little
> direction. When he encounters design questions, he proactively writes code or
> benchmarks to help resolve them."*

### MuSig2 in the Wallet

Sebastian was one of the primary reviewers of the pull requests that brought
MuSig2 multisignature spending via schnorr signatures into the Core wallet. His
familiarity with the underlying libsecp256k1 musig2 module allowed him to verify
that the signing workflow was implemented correctly and that the wallet avoided
nonce reuse which could leak secret keys and lead to loss of funds. His review
was thorough enough that it surfaced improvements which were folded back into
BIP373 itself.

### SwiftSync

After hearing Ruben Somsen present the SwiftSync proposal, Sebastian built the
[first proof-of-concept implementation][optech swiftsync], which demonstrated
roughly a 5x speedup of initial block download. This work could take the time
for a new node operator to sync from days to hours.

### Secp256k1lab

Sebastian also co-created [secp256k1lab][secp256k1lab], a Python library
extracted from work on the ChillDKG reference implementation. Secp256k1lab is
intended as a shared playground for prototyping cryptographic BIPs and it's
already been adopted as a dependency by the FROST signing and DKG BIP
repositories. It's a small but useful piece of infrastructure for the people
working on Bitcoin's cryptographic proposals.

For good measure, he also ran a [historical benchmarking study][ecdsa benchmark]
comparing ECDSA signature verification performance in libsecp256k1 against
OpenSSL over the last decade since the switch, [discussed on the Bitcoin Optech
podcast][optech ecdsa benchmark].

## Looking Ahead

Sebastian's top priority is getting silent payments merged into libsecp256k1 and
then activating the DLEQ module that sits on top of it. Beyond that, he plans
to dig into [BIP54][bip54] (the [Consensus Cleanup][bip54.org]), with
particular focus on reviewing the timewarp attack fix and the legacy signature
operations limit in Bitcoin Inquisition. He'll also continue his work on FROST
threshold signatures and help with the ongoing effort to remove libevent as a
Bitcoin Core dependency.

In his own words, reflecting on the past five years:

> *"I am looking forward to continuing to support current and upcoming privacy
> proposals, with a strong focus on code review in general, and occasional
> unexpected side journeys, such as implementing the first SwiftSync PoC. Thanks
> to Brink for supporting me throughout this exciting journey."*

Thank you, Sebastian, for five years of careful, quiet, and increasingly
consequential work.

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. Find
out more about our [grants][] and [fellowship][] programs, and how to [support
us][].

[sebastian github]: https://github.com/theStack
[sebastian x]: https://x.com/thestack
[sebastian grant blog]: /blog/2021/07/15/grantees/
[bc 22711]: https://github.com/bitcoin/bitcoin/pull/22711
[bc 18466]: https://github.com/bitcoin/bitcoin/pull/18466
[bc 22378]: https://github.com/bitcoin/bitcoin/pull/22378
[bc 21867]: https://github.com/bitcoin/bitcoin/pull/21867
[bc issue 19303]: https://github.com/bitcoin/bitcoin/issues/19303
[v2 transport]: https://bitcoinops.org/en/topics/v2-p2p-transport/
[bip324 proxy]: https://github.com/theStack/bip324-proxy
[optech bip324 proxy]: https://bitcoinops.org/en/podcast/2024/03/21/#bip324-proxy-for-light-clients-transcript
[bip374]: https://github.com/bitcoin/bips/pull/1689
[full time announcement]: https://x.com/bitcoinbrink/status/1909238416232874192
[silent payments]: https://bitcoinops.org/en/topics/silent-payments/
[bip352]: https://github.com/bitcoin/bips/blob/master/bip-0352.mediawiki
[optech sp scanning]: https://bitcoinops.org/en/podcast/2026/02/17/#proposal-to-limit-the-number-of-per-group-silent-payment-recipients-transcript
[secp256k1lab]: https://github.com/secp256k1lab/secp256k1lab
[optech swiftsync]: https://bitcoinops.org/en/podcast/2025/04/15/#swiftsync-speedup-for-initial-block-download-transcript
[ecdsa benchmark]: https://delvingbitcoin.org/t/comparing-the-performance-of-ecdsa-signature-validation-in-openssl-vs-libsecp256k1-over-the-last-decade/2087
[optech ecdsa benchmark]: https://bitcoinops.org/en/podcast/2025/11/11/
[bip54]: https://github.com/bitcoin/bips/blob/master/bip-0054.mediawiki
[bip54.org]: https://bip54.org
[grants]: /programs#grants
[fellowship]: /programs#fellowship
[support us]: /donate
