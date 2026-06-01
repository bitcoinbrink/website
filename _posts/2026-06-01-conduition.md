---
title: "Welcoming conduition"
permalink: /blog/2026/06/01/conduition/
layout: post
author: brink
name: "brink"
category: "News"
description: "Conduition has joined Brink to work on hash-based signature schemes and quantum-resistant Bitcoin protocols."
---

Brink is proud to announce support for [conduition][conduition github], a
cryptographic engineer with expertise in post-quantum cryptographic research and
implementation, working on the foundations that a quantum-resistant Bitcoin
might need. This is Brink's first grant for post-quantum, part of our focus on
potential threats that could affect Bitcoin's long-term security.

His work will focus on three areas: driving the [SHRINCS][shrincs] protocol
toward a draft BIP, exploring commit/reveal protocols, and advancing research
and education around isogeny-based cryptography in Bitcoin.

## About conduition

Conduition writes of his experience and goals:

I'm deeply honored to receive Brink's first-ever grant to focus on post-quantum
research.

This is a field I have pursued in my free time since 2024 when I published a
[survey of hash-based signature schemes][hbs survey]. In 2025, after months of
prototyping and benchmarking I built SLHVK: [the world's fastest CPU
implementation of SLH-DSA (SPHINCS)][slhvk]. More recently, I proposed
[hypertree pruning][hypertree] - a trick that allows today's low-power hardware
wallets to generate SLH-DSA keypairs over 500x faster.

This generous grant from Brink will help me follow through with the arc of my
previous research, as I work alongside the Blockstream team and other independent
brilliant individuals to design, draft, and (hopefully) implement the first truly
well-researched hash-based signature upgrade proposal for Bitcoin, built on the
foundations of BIP-360 and [the SHRINCS scheme][shrincs].

I also hope to use this funding to formalize commit/reveal rescue protocols, which
may someday be needed to authenticate inactive UTXOs in the presence of a quantum
computer. Today these are folklore techniques buried in the mailing list archives,
in need of careful assessment and security proofs.

Finally, I would like to expand [my prior research on isogeny cryptography][isogenies],
which I believe has the promise to act as a suitable long-term replacement for
Bitcoin's classical elliptic curve cryptography. This will take the shape of
long-form educational content accessible to Bitcoin developers, deep technical
exploration of the trade-off space, experimental benchmarks, and hopefully
collaboration with mainstream isogeny researchers.

I'd like to earnestly thank Brink for supporting this important work. Because of
this grant, I can tighten my focus on these three key topics and still maintain
transparency in my research. I will continue publishing articles about my
discoveries and software projects on [my blog][conduition blog]. All relevant code
will be published on [my github][conduition github] under
[The Unlicense][unlicense] without restriction or copyright, as always.

[@conduition_io][conduition twitter]

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. If you
or your organization is interested in supporting open source Bitcoin
development, feel free to email us, [donate@brink.dev][donate].

Developers interested in the grant [program][programs] can apply now.

[conduition github]: https://github.com/conduition
[conduition twitter]: https://x.com/conduition_io
[conduition blog]: https://conduition.io
[hbs survey]: https://conduition.io/cryptography/quantum-hbs/
[slhvk]: https://github.com/conduition/slhvk
[hypertree]: https://conduition.io/cryptography/hypertree-pruning/
[shrincs]: https://delvingbitcoin.org/t/shrincs-324-byte-stateful-post-quantum-signatures-with-static-backups/2158
[isogenies]: https://conduition.io/cryptography/isogenies-intro/
[unlicense]: https://unlicense.org/
[donate]: mailto:donate@brink.dev
[programs]: /programs
