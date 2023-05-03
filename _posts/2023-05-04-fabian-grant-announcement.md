---
title: "Welcoming Fabian Jahr"
permalink: /blog/2023/05/04/fabian-jahr/
layout: post
author: brink
name: "brink"
alt: Brink announces Fabian Jahr's grant
category: "News"
description: Brink announces Fabian Jahr's grant.
---

Brink is proud to announce a developer grant for [Fabian Jahr][fabian
github]. He has joined Brink as a remote grantee to
continue his work as a Bitcoin Core developer.

## About Fabian

Fabian writes of his Bitcoin experience and goals:

<img src="/assets/images/fabian-jahr.jpg" alt="Picture of Fabian Jahr" style="float:left;border:1px solid
darkgray;margin-right:25px;width:150px;" />

I first contributed to Bitcoin Core in 2019 while participating in the Chaincode
Summer Residency. In the preceding year, I was primarily fascinated by the
new possibilities enabled by the Lightning Network and was actively involved in
some small open-source projects, with a focus on the application
layer. Collaborating directly with Bitcoin Core contributors at Chaincode showed
me that I could make valuable contributions on the base layer as well. My most
significant project to date has been the coinstatsindex, an index in Bitcoin
Core that tracks the overall coin supply, a hash of the UTXO set, and other
crucial metrics.

I have been enthusiastic about the possibilities that BIP340 [Schnorr signatures][topic schnorr]
enable for Bitcoin ever since I learned about them. While recently much attention has
been directed towards covenants and related proposals, Schnorr-related
innovations can also have a significant impact in making protocols more efficient.
I plan to support and extend existing research by implementing [batch validation][]
as part of block validation in Bitcoin Core and outlining different paths
through which [Cross Input Signature Aggregation] (CISA) could be integrated at the
protocol level and the positive impacts this could have on layer 2 systems as
well.

I will continue contributing to Bitcoin Core not only through code but also, and
more importantly, through reviews. Slow reviews and a shortage of reviewers are
the most significant [challenge][retro review] in Bitcoin Core development. Particularly complex
projects necessitate days or even weeks of focused effort to provide competent
reviews of concepts and code. This level of dedication is often only achievable
for grant recipients, so I consider it my duty to allocate a substantial portion
of my time to reviewing, with a primary emphasis on complex projects.

The [ASMap][] feature in Bitcoin Core has already made significant progress, but I
also plan to support its adoption by finalizing the process of distributing
ASMap mappings with Bitcoin Core releases. This will enable the feature to be used as a
default for peer bucketing in Bitcoin Core in the future.

I will also continue to organize and host the monthly [Bitcoin Socratic Seminar][socratic]
in Berlin.

A grant from OkCoin allowed me to work full-time on Bitcoin Core during the
first half of 2020; otherwise, my contributions were limited to part-time
efforts during nights and weekends. I am thrilled to return to working on
Bitcoin full-time, collaborate more closely with others at Brink, and be a much
more productive contributor as a result.

[@fjahr][fabian twitter]

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. If you
or your organization is interested in supporting open source Bitcoin
development, feel free to email us, [donate@brink.dev][donate].

Developers interested in the grant [program][programs] can apply now.

[fabian github]: https://github.com/fjahr
[topic schnorr]: https://bitcoinops.org/en/topics/schnorr-signatures/
[batch validation]: https://suredbits.com/schnorr-applications-batch-verification/
[Cross Input Signature Aggregation]: https://bitcoin.stackexchange.com/questions/106241/what-is-cross-input-signature-aggregation-and-how-would-it-work
[retro review]: https://adamjonas.com/bitcoin/coredev/retro/coredev-2022-retro/#checking-in-on-review
[ASMap]: https://bitcoincore.reviews/16702
[socratic]: https://bitdevs.berlin/
[fabian twitter]: https://twitter.com/fjahr
[donate]: mailto:donate@brink.dev
[programs]: /programs
