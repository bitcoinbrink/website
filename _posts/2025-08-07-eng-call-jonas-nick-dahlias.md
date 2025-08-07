---
title: "Russell O'Connor on formal verification and libsecp256k1"
permalink: /blog/2025/08/07/eng-call-russell-oconnor-formal-verification/
layout: post
author: brink
name: "brink"
alt: Russell O'Connor on formal verification and libsecp256k1
category: "technical"
description: Russell O'Connor outlines the formal verification of code, using his work on libsecp256k1 as a guide.
---

[Russell O'Connor][russell] joined Brink engineers to explain his work on formal
verification of software, the process of mathematically proving that a program
satisfies its specification.

In this discussion we covered:

- An overview of formal verification of software
- A walkthrough using a [multiplication function][umul128] in libsecp256k1
- Coq, [Rocq][], Clightgen
- [SafeGCD][] (formal verification [paper][safegcd paper])
- Q&A with audience

<iframe width="560" height="315" src="https://www.youtube.com/embed/D2w1uX85rW8?si=MbxmHpx2mI5Mc50e" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

_This discussion was recorded on August 6, 2025._

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. If you
or your organization is interested in supporting open source Bitcoin
development, feel free to email us, [donate@brink.dev][donate].

Developers interested in the grant [program][programs] can apply now.

[russell]: https://github.com/roconnor-blockstream
[umul128]: https://github.com/bitcoin-core/secp256k1/blob/74b8068c5d9411a9a96261bc898cc9e9f1f20dfb/src/int128_struct_impl.h#L32
[Rocq]: https://rocq-prover.org/
[SafeGCD]: https://github.com/bitcoin-core/secp256k1/blob/master/doc/safegcd_implementation.md
[safegcd paper]: https://www.arxiv.org/abs/2507.17956
[donate]: mailto:donate@brink.dev
[programs]: /programs
