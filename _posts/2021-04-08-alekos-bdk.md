---
title: "Alekos Filini on Bitcoin Dev Kit"
permalink: /blog/2021/04/08/bitcoin-dev-kit/
layout: post
author: alekos
category: "technical"
description: "Alekos Filini explains the design philosophy behind the Bitcoin Dev Kit."
---

<img src="/assets/images/2021-04-08-bitcoin-development-kit.svg" />

_Alekos’s grant is generously supported by [Kraken][kraken website]._

While a very high level understanding of Bitcoin can be enough to grasp how
value is moved across the network, taking this knowledge and using it to build a
real, user-ready product can prove to be very hard, due to the technical details
and high security standards that need to be met, and also in part because of all
the little quirks the Bitcoin protocol has.

After spending some time working on a few different Bitcoin projects, I
started to find myself unsatisfied with what most of the libraries available
offered: they would generally suffer from either a lack of generalization,
meaning that they would only support a very limited set of operations, or they
would trade some of the convenience for a more powerful API, making them
especially tricky to use in practice without a deep understanding of the
protocol.

In my opinion, this is one of the reason why we don't see a lot of variety in
Bitcoin end products and wallets available to the public today: the vast
majority of them only support single-signature schemes, or at most simple
multi-signatures. More complex scripts that involve, for instance, timelocks are
very rarely seen in the wild in the context of on-chain wallets.

The advent of [output descriptors][output descriptors] promises to remove once
and for all the trade-off between usability and power: descriptors can be used
to express with a very concise syntax even the most complex Bitcoin spending
conditions. With the right tools, a developer can build a product that relies on
arbitrary spending policies without having to ever touch raw Bitcoin scripts or
transactions.

Even better, software built using descriptors can be easily adapted to make use of new
protocol features, like the upcoming Taproot soft fork. Descriptors also allow
prototyping and shipping new features much more quickly because most of the
complexity is handled internally by the library. Developers that adopt this
technology can ultimately spend more time working on their product and tailoring
it to their users’ needs, rather than having to learn all the low level details
of the Bitcoin protocol and having to keep up with them.

With these ideas in mind, I started working on the project that would later become [Bitcoin
Dev Kit][bdk website] a little over a year ago, and I have been leading its
development ever since, thanks to initial funding from Bitfinex. Over time three
more people have joined me working full-time on the project, with most of their
funding coming from Square Crypto, along with a larger and growing community of
people contributing with code, documentation, feature requests, and feedback.

The Bitcoin Dev Kit (or BDK for short) project is building a set of
open source libraries that can be used to develop descriptor-based Bitcoin
products. Its core components are written in Rust, a language that prioritizes
memory-safety while at the same time being low-level enough that it can be
easily compiled and run on embedded hardware. BDK is also very well integrated
with the larger [Rust Bitcoin][rust-bitcoin] ecosystem and all the major
libraries can easily interoperate with each other.

BDK aims to be very modular and provides a few ready-to-use default modules out
of the box: one can use the provided [branch-and-bound coin selection][bnb-cs],
or swap it with a custom coin selection algorithm without having to fork and
modify the library. The same applies to the internal database and the blockchain
backend: the library provides the implementation for different databases and
backend clients based on Electrum and Neutrino. Those are bundled with the
library, but they can be replaced (or removed entirely to make air-gapped
ephemeral wallets) to better suit the developers’ needs.

This allows BDK to be potentially used in many different kinds of products that
need to interact with the Bitcoin network: it can be the watch-only wallet of a
vending machine running on a low-power board, the high security corporate
Bitcoin vault that runs on multiple air-gapped geographically-distributed
computers, or everything else in between.

We are focusing our efforts on building a healthy community of people that
contribute to and use BDK by providing examples, documentation, and everything
else they might need to get started. We strongly believe this is one of the key
    points that can make the library survive the test of time.

The main Rust library is currently undergoing its beta phase, but there’s still
a lot of work left to do: on top of maintaining and improving the library
itself, we are working on releasing bindings for a few other programming
languages like C, Python, Java/Kotlin and Swift to allow the library to be used
more conveniently in mobile and desktop environments.

We are also starting a collaboration with the developers behind the [Lightning
Dev Kit][ldk website] (LDK) to ensure that the two libraries can work together
seamlessly, allowing developers to build on-chain and off-chain wallets easily.

Finally, we are following the development and activation of Taproot and we plan
to support it in our library as well.

If you’d like to learn more you can check out our [website][bdk website] or
[join our Discord server][bdk discord] to get in touch with us.

[kraken website]: https://www.kraken.com/
[bdk website]: https://bitcoindevkit.org
[bdk discord]: https://discord.gg/d7NkDKm
[ldk website]: https://lightningdevkit.org/
[output descriptors]: https://bitcoinops.org/en/topics/output-script-descriptors/
[rust-bitcoin]: https://github.com/rust-bitcoin/rust-bitcoin
[bnb-cs]: https://murch.one/wp-content/uploads/2016/11/erhardt2016coinselection.pdf
