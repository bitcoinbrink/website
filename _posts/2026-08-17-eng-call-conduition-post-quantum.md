---
title: "Conduition on mapping Bitcoin's post-quantum landscape"
permalink: /blog/2026/08/17/eng-call-conduition-post-quantum/
layout: post
author: brink
name: "brink"
alt: Conduition on mapping Bitcoin's post-quantum landscape
category: "technical"
description: Conduition maps the post-quantum Bitcoin landscape, showing how output types, canaries, rescue protocols, and signature schemes fit together.
---

Brink grantee [conduition][conduition] presented a map of the post-quantum
Bitcoin landscape to Brink engineers, focusing on how the various proposals
interact with each other.

In his presentation, he discussed:

- Trade-offs between post-quantum output types like [P2MR (BIP360)][bip360],
  P2TR v2, and P2TR hash
- Quantum canaries and tripwires as on-chain oracles for Q-day
- Freezing, ignoring, or rate-limiting Satoshi-era coins with proposals
  like Hourglass
- Rescue protocols using commit/reveal or zero-knowledge proofs
- Hash-based ([SHRINCS][shrincs]), lattice-based, and isogeny-based signature
  schemes
- Elliptic curve optimizations like cross-input signature aggregation (CISA)
  and public key recovery
- Q&A with the audience

<a href="/assets/files/2026-08-17-eng-pq-bitcoin-projects-map.pdf" target="_blank"><img
src="/assets/images/2026-08-pq-bitcoin-projects-map.png" alt="Map of
post-quantum Bitcoin projects" style="max-height:100%" /></a>

<iframe width="560" height="315" src="https://www.youtube.com/embed/oJBTK65fNdw?si=fmCCHV7bjXqBAQtk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

_This discussion was recorded on August 14, 2026._

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. If you
or your organization is interested in supporting open source Bitcoin
development, feel free to email us, [donate@brink.dev][donate].

Developers interested in the grant [program][programs] can apply now.

[conduition]: https://conduition.io
[bip360]: https://github.com/bitcoin/bips/blob/master/bip-0360.mediawiki
[shrincs]: https://delvingbitcoin.org/t/shrincs-324-byte-stateful-post-quantum-signatures-with-static-backups/2158
[donate]: mailto:donate@brink.dev
[programs]: /programs
