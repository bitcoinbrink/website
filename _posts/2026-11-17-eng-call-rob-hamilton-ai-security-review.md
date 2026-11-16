---
title: "Rob Hamilton on AI-assisted security review"
permalink: /blog/2026/11/17/eng-call-rob-hamilton-ai-security-review/
layout: post
author: brink
name: "brink"
alt: Rob Hamilton on AI-assisted security review
category: "technical"
description: Rob Hamilton discusses using LLMs to find vulnerabilities in Bitcoin Core and other open source software.
---

[Rob Hamilton][rob], co-founder and CEO of AnchorWatch, joined
Brink engineers to share lessons from Red Team's work using LLMs to scan
more than 650 codebases, including Bitcoin Core, for vulnerabilities.

In his presentation, he discussed:

- An overview of Red Team's work and how Bitcoin Core held up
- Giving models context from BIPs, BOLTs, and research papers
- Threat models and severity taxonomies for triaging AI-generated bug reports
- When to use open-weight vs frontier models
- Adversarial review and end-to-end reproduction
- Techniques from Bitcoin Core contributor [Lőrinc][l0rinc]
- Data retention, self-hosted models, and trusted execution environments
- Bitcoin consensus rules in [Lean][lean] proofs
- Decompiling binaries with [Ghidra][ghidra]
- Q&A with the audience

<iframe width="560" height="315" src="https://www.youtube.com/embed/Us7bqyF2G6A?si=xytX9d1_R1SvMS1M" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

_This discussion was recorded on November 13, 2026._

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. If you
or your organization is interested in supporting open source Bitcoin
development, feel free to email us, [donate@brink.dev][donate].

Developers interested in the grant [program][programs] can apply now.

[rob]: https://x.com/Rob1Ham
[l0rinc]: https://x.com/L0RINC
[lean]: https://lean-lang.org
[ghidra]: https://github.com/NationalSecurityAgency/ghidra
[donate]: mailto:donate@brink.dev
[programs]: /programs
