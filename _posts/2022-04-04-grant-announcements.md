---
title: "Announcing Brink's Latest Round of Developer Grants"
permalink: /blog/2022/04/04/grantees/
layout: post
author: brink
name: "brink"
alt: Brink announces latest round of developer grants
category: "News"
description: Brink announces the latest round of developer grants.
---

Brink is proud to announce the recipients of its latest round of open source developer grants.
After an open grant application process, the [Brink board of directors][brink
board] has selected four developers who have demonstrated continued commitment to
open source Bitcoin development.

Each of the four grant recipients describes their Bitcoin experience and goals below:

## "0xB10C"

<img src="/assets/images/0xb10c.png" alt="Picture of 0xb10c" style="float:left;border:1px solid
darkgray;margin-right:25px;width:150px;" />

I am a Bitcoin developer curious about what is happening on the Bitcoin
network. Over the past years, I've built tools to visualize and observe the
Bitcoin mempool, mining pool transaction selection, and other
protocol level statistics.

After completing the Chaincode Labs Summer Residency seminars in 2019, I worked
as a freelance developer for ShiftCrypto and CoinMetrics. At CoinMetrics, I
helped bootstrap [Farum][farum], a real-time network and attack monitoring suite for
Bitcoin. My work includes patching Bitcoin Core to expose a real-time interface
for changes to the node's mempool and chain view, along with software to monitor
the mining jobs of hundreds of Stratum servers to detect, for example, network
splits early.

I decided to focus entirely on open source projects in early 2021 and accepted
a one-year grant offer from Coinbase. During this year, I built
[miningpool-observer][miningpool-observer], mentored two [Summer of Bitcoin][sob] mentees, introduced
tracepoints for [Userspace, Statically Defined Tracing to Bitcoin Core][usdt], started
working on making regular reorgs on the Signet test network a reality, and
published an open-content blog for Bitcoin developers called
[bitcoin-dev.blog][bitcoin dev blog].

With support from Brink in 2022, I plan to continue work on tracepoints in
Bitcoin Core, including interface tests, review, and the addition of further
tracepoints. Another goal is to launch a Signet with regular reorgs and a tool
to explore reorgs visually. After observing flooding attacks on the Bitcoin P2P network in
the summer of 2021, I set out to build a P2P network monitoring and anomaly
detection tool in 2022. The goal is to feed the observations into Bitcoin and
Bitcoin Core development, improving the P2P network robustness. I also plan to
write up further Mempool Observations and start a similar series of blog posts
for P2P network observations.

[@0xB10C][0xB10C twitter]

## Vincenzo Palazzo

<img src="/assets/images/vincenzo-palazzo.jpg" alt="Picture of Vincenzo Palazzo" style="float:left;border:1px solid
darkgray;margin-right:25px;width:150px;" />

I am an open source software developer and in my free time a Master’s
Student at the University of Pisa in Italy. I became interested in Bitcoin in
2019 due to my bachelor’s degree. In the year after discovering Bitcoin, I
became involved in different projects related to the Lightning Network protocol.

I have been working on the Core Lightning (previously known as C-Lightning) implementation as an active
contributor for the last nine months. I am the maintainer of
[lnprototest][github lnprotest], a Lightning BOLT Protocol Test Framework,
and maintainer of [rust-clightning-rpc][github rust cl rpc], an interface from
rust to the C-Lightning daemon through RPC.

With my Brink grant, I will focus on improving and supporting the C-Lightning
implementation with new features as well as review pull requests. I also plan
to contribute to review of the Lightning specification.

[@palazzovincenzo][vincenzo twitter]

## Niklas Gögge

<img src="/assets/images/niklas-goegge.jpg" alt="Picture of Niklas Gögge" style="float:left;border:1px solid
darkgray;margin-right:25px;width:150px;" />

I first got interested in Bitcoin in 2017, but it wasn’t until late 2018 when I
read Mastering Bitcoin that I got fully obsessed with the technical side of Bitcoin.

With the start of the pandemic I had a lot of time on my hands and
started contributing to Bitcoin. I found [multiple talks][tadge talks] of Tadge Dryja talking
about Utreexo which prompted me to hop on IRC and ask where I can help out. The
[Utreexo][utreexo website] project introduces a hash based dynamic accumulator for Bitcoin’s UTXO
set. A dynamic accumulator is a compact representation of a set to which
elements can be added, removed, and proven. Utreexo aims to make it easier to run
full nodes by trading off the storage requirements of the UTXO set for a
bandwidth increase.

In 2021 I worked at Mozilla as a part time student worker on the Firefox
security infrastructure team. In my spare time, while working at Mozilla and
finishing up my bachelors degree, I ported the Utreexo accumulator library to
C++ ([libutreexo][libutreexo github]) and worked on a prototype Utreexo implementation for Bitcoin
Core. I participated in the [PR review club][pr review club] and opened some of my own PRs
([#22340][bitcoin 22340], [#21603][bitcoin 21603]).

The grant from Brink gives me the opportunity to work full time on Bitcoin Core
without distractions. I will continue my work on the C++ implementation of
Utreexo and propose a proof-of-concept PR that people can test and review. In
addition to working on Utreexo I plan on making more security focused
contributions to Bitcoin Core and review PRs.

[@dergoegge][niklas twitter]

## Bruno Garcia

<img src="/assets/images/bruno-garcia.jpg" alt="Picture of Bruno Garcia" style="float:left;border:1px solid
darkgray;margin-right:25px;width:150px;" />

I discovered Bitcoin in 2015 and fell in love with the concept of digital money
and how this could improve and collaborate for freedom. Years later, I started
studying the Bitcoin protocol more, reading books like Programming Bitcoin,
Mastering Bitcoin, and other materials from the internet.

In 2021, I attended the Chaincode [Bitcoin Protocol Development
Seminar][chaincode learning] where I learned more about the
Bitcoin protocol and started contributing to Bitcoin Core. Since I have a DevSec
and QA background, my journey started by reviewing and reading the [functional
tests][bitcoin functional tests]. This is how I discovered an
inconsistency in the taproot test and got my first PR merged ([#21081][bitcoin 21081]).

Since then, I have continued contributing to Bitcoin Core by testing and
reviewing PRs, improving the
test coverage, and recently P2P and wallet work. I also wrote a coin selection
library in Typescript that implements the same strategies as Bitcoin Core. In
addition to this development and review, I mentor some students from one of the best
universities in Latin America on their Bitcoin studies, providing materials and regular
meetings to discuss and learn more about it.

I am very excited for this new chapter and very grateful to Brink for this grant
which allows me to dedicate part of my time to Bitcoin Core. Most of my time I
intend to spend reviewing and testing PRs. Besides that, I will work to improve test
coverage by covering more features and scenarios on functional tests and
exploring more kinds of testing, e.g. adding more scenarios to stress tests,
writing mutation tests, and other ones. Also, improving some P2P and wallet
work, focusing on safety and performance.

[@brrrunog][bruno twitter]

___

If you or your organization is interested in supporting open source Bitcoin
development, feel free to email us, [donate@brink.dev][donate].

Developers interested in either the grant or fellowship [programs][programs] can
apply now for the next funding round.

[brink board]: /#board
[farum]: https://coinmetrics.io/farum/
[miningpool-observer]: https://miningpool.observer/
[sob]: https://www.summerofbitcoin.org/
[usdt]: https://b10c.me/blog/008-bitcoin-core-usdt-support/
[bitcoin dev blog]: https://bitcoin-dev.blog/
[0xB10C twitter]: https://twitter.com/0xB10C
[github lnprotest]: https://github.com/rustyrussell/lnprototest
[github rust cl rpc]: https://github.com/laanwj/rust-clightning-rpc
[vincenzo twitter]: https://twitter.com/PalazzoVincenzo
[tadge talks]: https://www.youtube.com/watch?v=edRun-6ubCc
[utreexo website]: https://dci.mit.edu/utreexo
[libutreexo github]: https://github.com/mit-dci/libutreexo
[pr review club]: https://bitcoincore.reviews/
[bitcoin 22340]: https://github.com/bitcoin/bitcoin/pull/22340
[bitcoin 21603]: https://github.com/bitcoin/bitcoin/pull/21603
[niklas twitter]: https://twitter.com/dergoegge
[chaincode learning]: https://learning.chaincode.com/
[bitcoin functional tests]: https://github.com/bitcoin/bitcoin/blob/master/test/functional/README.md
[bitcoin 21081]: https://github.com/bitcoin/bitcoin/pull/21081
[bruno twitter]: https://twitter.com/brrrunog
[donate]: mailto:donate@brink.dev
[programs]: /programs
