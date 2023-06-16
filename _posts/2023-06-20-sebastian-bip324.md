---
title: "Sebastian Falbesoner on BIP324"
permalink: /blog/2023/06/20/bip324/
layout: post
author: brink
name: "brink"
alt: Sebastian Falbesoner on BIP324
category: "News"
description: Sebastian Falbesoner on BIP324.
---

Brink is proud to renew a year long grant for [Sebastian Falbesoner (theStack)][sebastian
github]. Sebastian is known for his thoughtful review on the Bitcoin Core
repository. As part of his grant renewal application, he emphasized the
importance of [BIP324 Version 2 P2P transport][optech bip324] and
why he plans to spend his review time on the project:

One of Bitcoin's key properties is _censorship-resistance_. While this generic
term is very often used in the context of transaction history immutability
(secured by proof of work), another vital aspect of it is the "freedom to transact", i.e.
being able to run the necessary infrastructure and broadcast/relay transactions
and blocks via the P2P layer in the first place. As all Bitcoin P2P messages currently go
over the wire unencrypted, it is trivial for ISPs to detect, censor or even
tamper with packets. This hurts privacy and enables censorship and many other
attacks which require the attacker to control the connections of the victims.
[BIP324][]
tries to counter these deficiencies by adding opportunistic encryption between
Bitcoin nodes,
making it significantly harder for adversaries to conduct these attacks.

Great care has been taken by the BIP authors to craft a protocol which reveals
as little information as possible to outside observers from the start of a
connection. Using a relatively new elliptic curve point encoding scheme called
[ElligatorSwift][] (see Chapter 6
"SwiftEC for Point Representation: ElligatorSwift"), the public keys sent
between peers to initiate a new connection are completely indistinguishable from
a uniformily distributed bitstream. For further obfuscation, an additional chunk
of arbitrary-sized random bytes (called "garbage") is sent at initiation right
after the ECDH key exchange on each side, to prevent an attacker deducing a
possible connection initiation by just looking at the sizes of exchanged
packets. So our goal is to even hide the fact that we are running a Bitcoin
node at all.

I find this approach very fascinating and to my knowledge, there is no other
protocol out there that goes that far, following the "everything is
pseudorandom from the start" idea. If we imagine a world where this v2 encrypted
transport
protocol is used predominantly and more and more users run bitcoind on arbitrary
ports (i.e. any other than the default 8333), censorship of any Bitcoin
participant on the network level will be significantly harder, as adversaries
have to actively connect to potential victim nodes to detect Bitcoin nodes.
So-called "deep packet inspection" by firewalls to identify P2P connections --
which is right now trivial due to the fixed sequence of [magic bytes][] for each
message -- would not be possible anymore. Furthermore, man-in-the-middle attacks can
now be observed between two peers by comparing their shared session-ids
out of band.

I'm convinced that BIP324 is one of the most important proposals to work on to
make Bitcoin future-proof with regard to censorship-resistance on the P2P layer.
Supported by Brink's part-time grant for another year, I'll put my energy on
thorough code review and testing of the [remaining BIP324 PRs][github bip324], with the
dedicated goal of putting it over the finish line. I will continuously run a publicly
reachable BIP324-compatible node as soon as a working PR is available. Since much of my previous work
was dedicated to increasing test coverage and improving the test framework, I also
plan to spend a significant amount of time to make our P2P tests ready for the new
v2 transport protocol.

For anyone who wants to connect to my BIP324 node (let's have fun and compare
session-ids!) or help testing in any other way or have general questions, feel
free to reach out to me via IRC or [Twitter][twitter theStack] (theStack).

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. If you
or your organization is interested in supporting open source Bitcoin
development, feel free to email us, [donate@brink.dev][donate].

Developers interested in the grant [program][programs] can apply now.

[sebastian github]: https://github.com/theStack
[optech bip324]: https://bitcoinops.org/en/topics/v2-p2p-transport/
[BIP324]: https://github.com/bitcoin/bips/blob/master/bip-0324.mediawiki
[ElligatorSwift]: https://eprint.iacr.org/2022/759.pdf#page=25
[magic bytes]: https://developer.bitcoin.org/reference/p2p_networking.html#:~:text=char%5B4%5D-,Magic%20bytes,-indicating%20the%20originating
[github bip324]: https://github.com/orgs/bitcoin/projects/1?pane=issue&itemId=28055735
[twitter theStack]: https://twitter.com/theStack
[donate]: mailto:donate@brink.dev
[programs]: /programs
