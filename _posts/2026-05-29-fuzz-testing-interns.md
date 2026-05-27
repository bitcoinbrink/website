---
title: "Fuzz Testing Research Interns: Dongjia Zhang and Stratos"
permalink: /blog/2026/05/29/fuzz-testing-research-interns/
layout: post
author: brink
name: "brink"
alt: "Fuzz Testing Research Interns: Dongjia Zhang and Stratos"
category: "News"
description: "A summary of Dongjia Zhang and Stratos' fuzz testing research internships."
---

Earlier this year, Brink awarded grants to [Dongjia Zhang][dongjia github] and
[Stratos][stratos github] to support their work on fuzz testing research for
Bitcoin Core. Under the guidance of experienced contributor [Niklas
Gögge][niklas github], each conducted independent research and experimentation
on [Fuzzamoto][fuzzamoto blog], a snapshot fuzzing tool to test complex and
previously difficult-to-test parts of Bitcoin full nodes.

## Dongjia Zhang

Dongjia is a Ph.D. researcher specializing in software security and fuzzing, and
is the maintainer of [LibAFL][libafl], a popular fuzzing framework written in
Rust. His extensive background in fuzzing research made him well suited to
contribute to several of Fuzzamoto's engineering and testing challenges.

During his research internship, Dongjia had over 40 pull
requests merged. His work included:

- Extending Fuzzamoto's intermediate representation (IR) to support additional
  Bitcoin P2P protocols, including compact filter messages ([BIP158][bip158])
  and bloom filter messages ([BIP37][bip37]).
- Scaling coverage measurement to utilize multiple cores, drastically reducing
  the time required for coverage analysis.
- Developing a hypervisor feedback mechanism in Fuzzamoto to deliver messages
  from the underlying hypervisor, giving fuzzers better guidance.
- Prototyping bug benchmarks to help evaluate Fuzzamoto's effectiveness at
  identifying real bugs.
- Adding new oracles to detect additional categories of logic bugs.
- Improving CI pipelines and applying lints to support long-term code
  maintenance.
- Contributing improvements to LibAFL, the underlying fuzzing library that
  Fuzzamoto depends on.

Dongjia reflected on his experience at Brink:

> *"My internship at Brink was a perfect opportunity for me to apply my
> expertise in fuzzing to a real-world scenario. I focused on improving
> fuzzamoto, which utilizes state-of-the-art snapshot fuzzing technique to fuzz
> complex and previously un-fuzzable parts of Bitcoin clients. Contributing to
> the security of bitcoind, which impacts a lot of people, is fulfilling, but
> more importantly, my experience at Brink was very enjoyable."*

## Stratos

Stratos is a vulnerability researcher and approached Bitcoin
Core security from a systems and protocol security perspective:

> *"Coming from a technical background, I feel that someone like me is far more
> likely to be convinced of the revolutionary tsunami that is Bitcoin, because
> source code does not lie."*

During his research internship, Stratos contributed to Fuzzamoto by:

- Extending Fuzzamoto's IR to support additional Bitcoin Core protocol
  primitives, including addrv2 relay and initial taproot support.
- Creating initial benchmarking work for Fuzzamoto, taking the first concrete
  steps toward measuring fuzzing effectiveness.
- Adding libbitcoin support, expanding Fuzzamoto's target reach beyond Bitcoin
  Core, with that work ongoing.

Stratos also described what the experience showed him about Bitcoin development:

> *"Although technical curiosity initially drew me to this internship, what
> impressed me most (and what left me very optimistic about the future) was the
> amount of energy and resources being devoted behind the scenes to Bitcoin’s
> present and future. That experience gave me a deep appreciation and respect
> for the open-source community."*

He expressed appreciation for Niklas Gögge’s technical guidance throughout the project:

> *"Niklas was an incredible help throughout that period, always available to
> answer any question I had. It was obvious that he cared deeply about every
> detail of fuzzamoto, from how a feature should be implemented incrementally to
> where and how it should be integrated."*

## Thank You

Both engineers made meaningful contributions to Fuzzamoto. Their work
extended protocol support, improved benchmarking infrastructure, scaled coverage
analysis, and broadened target coverage for the testing platform.

We thank Dongjia and Stratos for their contributions and wish them well in their
continued work in security research and Bitcoin development.

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. Find
out more about our [grants][] and [fellowship][] programs, and how to [support
us][].

[dongjia github]: https://github.com/tokatoka
[stratos github]: https://github.com/str8outtaheap
[niklas github]: https://github.com/dergoegge
[fuzzamoto blog]: /blog/2026/01/07/fuzzamoto-introduction/
[libafl]: https://github.com/AFLplusplus/LibAFL
[bip158]: https://github.com/bitcoin/bips/blob/master/bip-0158.mediawiki
[bip37]: https://github.com/bitcoin/bips/blob/master/bip-0037.mediawiki
[grants]: /programs#grants
[fellowship]: /programs#fellowship
[support us]: /donate
