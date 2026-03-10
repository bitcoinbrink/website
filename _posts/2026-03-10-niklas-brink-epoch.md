---
title: "Celebrating Niklas’s First Brink Epoch"
permalink: /blog/2026/03/11/niklas-brink-epoch/
layout: post
author: brink
name: "brink"
image: /assets/images/niklas-goegge.jpg
alt: Celebrating Niklas’s First Brink Epoch
category: "News"
description: This month, we're proud to celebrate Niklas Gögge's four years of dedicated, security-focused work on Bitcoin Core at Brink.
---
<div class="header-images">
  <img src="/assets/images/niklas-goegge.jpg" alt="Niklas Gögge celebrates 4 years as a Brinkie">
</div>

This month, we're proud to celebrate a significant milestone for Brink engineer
Niklas Gögge ([GitHub][niklas github], [X][niklas x]): four years of dedicated,
security-focused work on Bitcoin Core at Brink. Whether Niklas was working
on Utreexo, hardening Bitcoin Core's P2P code through fuzzing, or developing
an entirely new approach to full-system Bitcoin security
testing, Niklas has persistently (and quietly) made Bitcoin harder to break by
breaking it himself. We’re grateful to have him doing it.  

## **Finding the Bugs Before Attackers Do**

Niklas [began his journey with Brink][niklas grant] as a grantee in early 2022, after studying computer science at
Technische Universität Berlin. He arrived with a strong
intuition of where Bitcoin Core was most vulnerable: its peer-to-peer networking
layer.

His focus was to make Bitcoin Core's P2P layer more robust through
review, testing, and fuzzing. What followed were four years of security work that
demonstrably improved the resilience of Bitcoin's reference implementation
and influenced other projects in the Bitcoin ecosystem.

Even before joining Brink, Niklas was already discovering vulnerabilities. In 2021, he discovered and subsequently responsibly disclosed [two denial-of-service
vulnerabilities in LND][lnd-dos], finding that an attacker could crash nodes by
exhausting their memory with premature channel updates, and separately censor
channel updates from propagating across the network. These and other bugs were
[responsibly disclosed][responsible disclosures optech] through appropriate channels.

## **Building the Testing Infrastructure**

In mature software projects, bugs are not only discovered manually by developers, but they are also found
systematically through automated testing, ideally before they reach end users. Improving this testing infrastructure was another
initiative Niklas tackled.

When Niklas started contributing, Bitcoin Core already had a body of unit-level
fuzz tests. However, significant testing gaps remained in the P2P networking code. Niklas worked to
expand the number of fuzz-testable targets and refactored parts of the P2P network
processing to be more compatible with fuzz tezting. By 2023, [he had helped grow Bitcoin Core's
fuzz targets to approximately 200][fuzzing blog].

But Niklas also encountered a common challenge when trying to improve testing in a
conservative project. Refactoring code to make it easier to test requires
significant reviewer time, a notoriously scarce resource in open source
and Bitcoin development. This creates a chicken-and-egg problem:
additional tests would help make refactoring safer, but adding tests often requires
refactoring the code first. And all of it requires review time. Rather than pushing indefinitely
against that bottleneck, Niklas began approaching the problem differently.

## **Fuzzamoto**

The result of that thinking is [Fuzzamoto][fuzzamoto blog].

Started in early
2025, Fuzzamoto is a fuzz testing framework for Bitcoin full nodes that takes a
different approach from Bitcoin's historical in-process fuzz harnesses.

Bitcoin Core already had functional tests capable of creating and running live
Bitcoin Core instances and then running tests through the node's existing
interfaces such as RPC, P2P, and IPC. These tests already achieved broad code coverage
and caught real bugs. However, they only tested specific, known scenarios rather than exploring
the broader space of possible inputs and sequences. What if we took
the same approach as the functional tests, but replaced the individual hard-coded
scenarios with a tool capable of throwing a massive volume of quasi-random inputs at
Bitcoin Core?

Mining for bugs.

That's what Fuzzamoto does. It runs Bitcoin nodes inside a specialized virtual
machine that can take a snapshot of the entire system, run a test, and rapidly reset
to to the snapshotted state after each fuzzing iteration. This means any desired initial test
state can be set up once (say, mine a few blocks and then broadcast a couple transactions),
take a snapshot, then execute tests from that snapshot state. The result is
thousands of test iterations per second against a live Bitcoin node.

Perhaps most importantly, Fuzzamoto requires no changes to the Bitcoin Core code. It tests
against the actual production binaries. This sidesteps the review-bottleneck problem
entirely and makes it possible to continuously test new releases or even
individual pull requests in the future.

The tool is also
Bitcoin-implementation-agnostic, meaning it can test Bitcoin Core, btcd, or other
implementations simultaneously. This enables _differential testing_, finding bugs that appear
as differences in behavior between implementations, which is especially
important for consensus.

Early results validated the approach when Fuzzamoto found a bug in Bitcoin Core's
block index data structure. When a bug is found, Fuzzamoto's test cases can be
converted directly back into Bitcoin Core functional tests, making it easy for
maintainers to easily reproduce and triage issues using familiar tools and preventing
future bugs.

Quarkslab's independent security auditors, who conducted the first-ever
public third-party audit of Bitcoin Core in 2025 described Fuzzamoto as *"likely
the most valuable path to pursue in order to trigger deeper and more complex
bugs*" in Bitcoin Core.

Niklas reflects on his evolving approach to Bitcoin Core development:

"*My approach to Bitcoin Core development has changed over the years. In my
opinion, 'the most important problem' to work on does not exist, but there is a
rather short list of very important things that should be prioritised. That is
why I went from prototyping large changes or features to focusing solely on
security work.*

*I realised this is an important area where I can make
meaningful contributions. We like to say 'tick tock, next block' and leave out
the fine print: 'except when the whole network goes down, or the chain splits, or
the supply inflates…'*

*Software doesn’t mature through time like fine
wine, it becomes robust because people continuously test and improve it.*"

## **Responsible Disclosure and Other Security Initiatives**

A consistent theme in Niklas's first four years of Bitcoin work has been a strong commitment to
responsible security disclosure.

Niklas became one of the key contributors to
Bitcoin Core's updated [vulnerability disclosure process][disclosure policy],
helping lead the publication of security advisories for bugs fixed in older
versions of Bitcoin Core. He has hosted multiple episodes of our [Brink
podcast][brink podcast] walking through these historical disclosures.

His own disclosed findings include [CVE-2024-35202][cve-2024-35202], a crash bug
 in Bitcoin Core that allowed an attacker to crash
nodes on the Bitcoin network essentially at will. Had an attacker discovered this
bug before Niklas, the potential damage and consequences to Bitcoin could have been severe.

When Brink helped initiate the [first public third-party audit of Bitcoin
Core][security audit blog], commissioning Quarkslab via the Open Source Technology
Improvement Fund (OSTIF) to conduct a security assessment focused on the P2P
networking layer, Niklas served as Brink's primary technical liaison.

## **Mentorship**

Beyond his own contributions, Niklas has increasingly taken on a mentorship role within
Brink.

He now serves on Brink's grant committee, bringing his technical
expertise and security focus to the evaluation of funding applications.

He also
mentored [Brink fellow Marco De Leon][marco fellow blog], who worked directly on
Bitcoin Core fuzz testing under Niklas's guidance. The collaboration produced [tangible
results][marco results blog], and ultimately led to Marco transitioning to full-time work as a
Bitcoin Core developer.

Niklas also continued mentoring new contributors, acting as
a resource for [two Bitcoin Core fuzz testing interns][fuzz interns].

Niklas summed up his mentorship philosophy with the idea of "working to replace yourself". As he puts it, "I saw this quote in a book and I think it’s a good
philosophy to work by. I always try to automate what I would otherwise do
manually, and spend time mentoring new contributors through the Brink fellowship
or internships."

## **Looking Ahead**

Niklas's work on Fuzzamoto continues,
running around the clock to probe Bitcoin Core codebase for bugs and strengthen Bitcoin's security posture.
Future plans include making the software more user friendly to
increase adoption, simplifying test creation, and working toward
deterministic execution.

Niklas is also exploring other testing software, including enterprise
testing software, to evaluate their applicability to Bitcoin Core and other
Bitcoin projects. Brink is proud to support not just Niklas himself, but also the software,
team, and compute resources that augment this work.

"*For the past four years, Brink has given me the opportunity to work full time
on Bitcoin in the London office, and I look forward to the next four!*"

We look forward to everything Niklas will bring to Bitcoin in the next epoch.

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. Find
out more about our [grants][] and [fellowship][] programs, and how to [support
us][].

[niklas github]: https://github.com/dergoegge
[niklas x]: https://x.com/dergoegge/
[niklas grant]: /blog/2022/04/04/grantees/#niklas-g%C3%B6gge
[lnd-dos]: /blog/2023/12/22/dos-bugs-lnd/
[responsible disclosures optech]: https://bitcoinops.org/en/topics/responsible-disclosures/
[fuzzing blog]: /blog/2023/07/14/fuzzing/
[fuzzamoto blog]: /blog/2026/01/07/fuzzamoto-introduction/
[disclosure policy]: https://bitcoinops.org/en/newsletters/2024/06/07/#upcoming-disclosure-of-vulnerabilities-affecting-old-versions-of-bitcoin-core
[brink podcast]: /podcast
[cve-2024-35202]: https://bitcoinops.org/en/newsletters/2024/10/11/#cve-2024-35202-remote-crash-vulnerability
[security audit blog]: /blog/2025/11/19/bitcoin-core-security-audit/
[marco fellow blog]: /blog/2024/08/01/marco/
[marco results blog]: /blog/2025/07/31/marco-fuzzing-fellowship/
[fuzz interns]: https://x.com/bitschmidty/status/1971530899050086722
[grants]: /programs#grants
[fellowship]: /programs#fellowship
[support us]: /donate