---
title: "An Independent Security Audit of Bitcoin Core"
permalink: /blog/2025/11/19/bitcoin-core-security-audit/
layout: post
author: brink
name: "brink"
alt: An Independent Security Audit of Bitcoin Core
category: "technical"
description: As part of Brink's mission to ensure the safety and robustness of the open-source Bitcoin Core software, we sponsored an independent security audit of the Bitcoin Core codebase.
---

At Brink, our mission is to ensure that Bitcoin continues to be the world’s most
secure, reliable, and resilient monetary network. As part of this mission and to
ensure the safety and robustness of the open-source Bitcoin Core software that
powers the network, **Brink sponsored an independent security audit of
the Bitcoin Core codebase**.

The assessment was conducted by [Quarkslab][], a respected software security
firm, and was coordinated with the help of the [Open Source Technology
Improvement Fund (OSTIF)][ostif]. Funding was provided by Brink through the
generous support of our donors, with technical collaboration from Brink
engineer, Niklas Gögge, and Chaincode Labs engineer, Antoine Poinsot.

This work represents the first public, third-party audit of Bitcoin Core.

The full report is publicly available here: [Quarkslab Bitcoin Core Technical
Security Audit Report][ostif report]

## Why Brink funded this work

Bitcoin Core is the reference implementation that powers the Bitcoin network and
helps secure trillions of dollars in value. The more independent,
security-minded reviewers who bring their unique perspectives, the better.

The project has a strong security track record, but it has never undergone an
external security assessment. Brink helped initiate this engagement to provide
an additional layer of assurance for developers, node operators, holders, and
businesses who rely on Bitcoin Core every day.

To be clear, the goal wasn’t to earn Bitcoin Core a stamp of approval or a
certification badge. The goal was to actively search for vulnerabilities,
improve testing methodologies, and identify practical ways to strengthen the
codebase.

## What the audit involved

Over a four-month period (May - September 2025), Quarkslab conducted a 100 man
day technical review of Bitcoin Core. Their focus was on the most
security-critical components of the software, including the peer-to-peer
networking layer, mempool, chain management, and consensus logic.

Before they began to review, two Quarkslab engineers spent a week in Brink’s
London office to speak directly with developers and familiarize themselves with
Bitcoin Core’s architecture, development practices, and codebase.

The audit combined:

- **Manual code review** of complex areas like thread handling and transaction
  validation
- **Static and dynamic analysis**, using tools integrated into Bitcoin’s CI
  workflows
- **Advanced fuzz testing**, building on the fuzzing infrastructure maintained
  by Bitcoin Core contributors

Three Quarkslab security engineers contributed to the audit over its duration.

Quarkslab provided feedback on newer testing approaches within Bitcoin Core,
such as structured and differential fuzzing, and ongoing initiatives like
[fuzzamoto][fuzzamoto gh] and [bitcoinfuzz][bitcoinfuzz gh], to support future
improvements in testing coverage and reliability.

## What the auditors found

The auditors at Quarkslab reported **no critical, high, or medium-severity
issues**. They identified **two low-severity findings** and **thirteen
informational recommendations**, none of which were classified as security
vulnerabilities under [Bitcoin Core’s criteria][bc advisories].

The engagement also produced improvements to Bitcoin Core’s testing
infrastructure, including:

- New fuzzing harnesses for block connection and chain reorganization,
  exercising previously untested code paths
- A virtual filesystem utility to speed up and enhance fuzzing
- Enhanced fuzzing corpus
- New utilities for regression testing
- Targeted suggestions to improve thread-safety annotations and code readability

Some of these contributions are being prepared for upstream review and
integration into the main Bitcoin Core repository.

## Looking ahead

The results confirm what long-time contributors and users already know: Bitcoin
Core is a mature, conservatively engineered, and exceptionally well-tested
codebase. Independent review only strengthens that confidence. This security
assessment is a checkpoint in the mission to further secure Bitcoin, not a
destination.

Thank you to Quarkslab, the OSTIF, Niklas, and Antoine for their work on this
project. Engaging third party security firms may again be valuable in
the future, particularly for reviewing new or targeted components proposed for Bitcoin
Core.

Brink exists to ensure Bitcoin’s open-source infrastructure remains strong for
decades to come. Funding independent reviews like this is just one way we help
ensure Bitcoin doesn't break and continues to serve the world as a secure,
reliable monetary network.

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. If you
or your organization is interested in [supporting open source Bitcoin
development][donate page], feel free to email us, [donate@brink.dev][donate].

Developers interested in the grant [program][programs] can apply now.

[QuarksLab]: https://www.quarkslab.com/
[ostif]: https://ostif.org/
[ostif report]: https://ostif.org/wp-content/uploads/2025/11/25-05-2133-REP-bitcoincore-security-assessment-V1.3.pdf
[fuzzamoto gh]: https://github.com/dergoegge/fuzzamoto
[bitcoinfuzz gh]: https://github.com/bitcoinfuzz/bitcoinfuzz
[bc advisories]: https://bitcoincore.org/en/security-advisories/
[donate page]: /donate
[donate]: mailto:donate@brink.dev
[programs]: /programs
