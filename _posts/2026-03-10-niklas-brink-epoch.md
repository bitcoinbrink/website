---
title: "Celebrating Niklas’s First Brink Epoch"
permalink: /blog/2026/03/10/niklas-brink-epoch/
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
security-focused work on Bitcoin Core at Brink. From his earliest days working
on Utreexo, to hardening Bitcoin Core's P2P code through fuzzing, to becoming
the architect of an entirely new approach to full-system Bitcoin security
testing, Niklas has persistently (and quietly) made Bitcoin harder to break by
breaking it himself, and we are grateful for it.

## **Finding the Bugs Before Attackers Do**

Niklas [joined Brink][niklas grant] as a grantee in early 2022, coming from
Technische Universität Berlin with a background in computer science and a good
intuition of where Bitcoin Core was most vulnerable: its peer-to-peer networking
layer. His focus was to make Bitcoin Core's P2P layer more robust through
review, testing, and fuzzing. What followed was four years of security work that
has demonstrably improved the resilience of Bitcoin's reference implementation
among other projects in the Bitcoin ecosystem.

In 2021, he discovered and responsibly disclosed [two denial-of-service
vulnerabilities in LND][lnd-dos], finding that an attacker could crash nodes by
exhausting their memory with premature channel updates, and separately censor
channel updates from propagating across the network. These and other bugs were
[responsibly disclosed][responsible disclosures optech].

## **Building the Testing Infrastructure**

In addition to individuals manually finding bugs, mature projects find bugs
systematically, hopefully before they reach end users. This is another
initiative Niklas tackled.

When Niklas started contributing, Bitcoin Core already had a body of unit-level
fuzz tests, but significant testing gaps remained in the P2P code. Niklas set to
work expanding the number of fuzz-testable targets and refactoring P2P net
processing to be more fuzzer-friendly. By 2023, [he helped grow Bitcoin Core's
fuzz targets to approximately 200][fuzzing blog].

But Niklas also ran into (a common) friction when trying to improve testing in a
conservative project. Refactoring code to make it more testable requires
significant reviewer time, a notoriously bottlenecked resource in open source
and Bitcoin development. It is a bit of a chicken-and-egg problem in that
additional tests would help de-risk refactoring, but adding tests requires
refactoring. And all of it requires review time. Rather than push forever
against that, Niklas began to approach the problem differently...

## **Fuzzamoto**

The result of that thinking is [Fuzzamoto][fuzzamoto blog]. Started in early
2025, Fuzzamoto is a fuzz testing framework for Bitcoin full nodes that takes a
different approach from Bitcoin's historical in-process fuzz harnesses.

Bitcoin Core already had functional tests capable of creating and running live
Bitcoin Core instances and then running tests through the node's existing
interfaces like RPC, P2P, IPC. These tests already achieved broad code coverage
and caught real bugs. But they only test specific individual known scenarios,
not the broader space of possible inputs and sequences. What if we could take
the same approach as the functional tests, but replace the individual hard-coded
scenarios with a tool that can throw a huge volume of (quasi) random inputs at
Bitcoin Core?

Mining for bugs.

That's what Fuzzamoto does. It runs Bitcoin nodes inside a specialized virtual
machine that can take a snapshot of all its state, run a test, and rapidly reset
to it after each fuzzing iteration. This means you can set up a desired node
state once (say, mine a few blocks and then broadcast a couple transactions),
take a snapshot, then execute tests from that snapshot state. This can result in
thousands of test iterations per second against a running Bitcoin node without
any refactoring in Bitcoin Core.

Best of all, Fuzzamoto requires no changes to the Bitcoin Core code. It can work
against the actual production binaries. This sidesteps the review-burden problem
entirely and means it can be applied continuously to any new release or even
individual pull requests in the future. The tool is also
Bitcoin-implementation-agnostic meaning it can test Bitcoin Core, btcd, or other
implementations simultaneously for differential testing, finding bugs that only
manifest as differences in behavior between implementations, especially
important for consensus.

Early results validated the approach as Fuzzamoto found a bug in Bitcoin Core's
block index data structure. When a bug is found, Fuzzamoto's test cases can be
directly converted back into Bitcoin Core functional tests, making it easy for
maintainers to easily reproduce and triage issues using familiar tools and preventing
future bugs.

Quarkslab's independent security auditors, who conducted the first-ever
public third-party audit of Bitcoin Core in 2025 described Fuzzamoto as *"likely
the most valuable path to pursue in order to trigger deeper and more complex
bugs*" in Bitcoin Core.

"*My approach to Bitcoin Core development has changed over the years. In my
opinion, 'the most important problem' to work on does not exist, but there is a
rather short list of very important things that should be prioritised. That is
why I went from prototyping a large changes or features to focusing solely on
security work. 

I realised this is an important area where I can make
meaningful contributions. We like to say 'tick tock, next block' and leave out
the fine print: 'except when the whole network goes down, or the chain splits, or
the supply inflates…' 

Software doesn’t mature through time like fine
wine, it becomes robust because people continuously test and improve it.*"

## **Responsible Disclosure and Other Security Initiatives**

One consistency in his first four years of Bitcoin work is a commitment to
responsible security disclosure. 

Niklas became one of the key contributors to
Bitcoin Core's updated [vulnerability disclosure process][disclosure policy],
helping lead the publication of security advisories for bugs fixed in older
versions of Bitcoin Core. He has hosted multiple episodes of our [Brink
podcast][brink podcast] walking through these historical disclosures.

His own disclosed findings include [CVE-2024-35202][cve-2024-35202], a crash bug
 in Bitcoin Core that allowed an attacker to crash
nodes on the Bitcoin network basically at will. Had an attacker discovered the
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
a resource to for two fuzz testing interns. [two Bitcoin Core fuzz testing interns][fuzz interns].

"*“Work to replace yourself” I saw this quote in a book and I think it’s a good
philosophy to work by. I always try to automate what I would otherwise do
manually, and spend time mentoring new contributors through the Brink fellowship
or internships.*"

## **Looking Ahead**

Niklas's work on Fuzzamoto continues, 
security posture and running around the clock to probe the codebase for bugs.
Plans include making its usage more user friendly for other developers to
increase adoption, simplifying test creation, and working toward
deterministic execution.

Niklas is also exploring other testing software, including enterprise
testing software, to evaluate their applicability to Bitcoin Core and other
Bitcoin projects. Brink is proud to support not just Niklas himself, but also the software,
team, and compute resources that can support his security work into the future.

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