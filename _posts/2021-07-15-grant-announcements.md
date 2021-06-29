---
title: "Announcing Brink's Second Round of Developer Grants"
permalink: /blog/2021/07/15/grantees/
layout: post
author: brink
name: "brink"
alt: Brink announces second round of developer grants
category: "News"
description: Brink announces the second round of developer grants for Bitcoin Core PR review and test coverage.
---

<img src="/assets/images/larry-seb-grants.png" alt="Larry Ruane and Sebastian Falbesoner">

Brink is proud to announce the recipients of its second round of open source developer grants.
After an open grant application process, the [Brink board of directors][brink
board] has selected two developers who have demonstrated continued commitment to
open source Bitcoin protocol development. The grant recipients are:

## Larry Ruane

Larry writes of his Bitcoin experience and goals:

I discovered the Bitcoin Core project through my full-time position at the
[Electric Coin Company][ecc], creators of
[Zcash][zcash], a code fork of Bitcoin Core. Upon discovering a small
bug in Zcash in 2019, I found that the bug also existed in Bitcoin Core; the fix
became my first [PR][bitcoin core 16577]. I
immediately fell in love with the development community, and since then have
been contributing review and a few small PRs on my own time, while continuing
full-time with ECC. I was accepted to the 2020 Chaincode Residency program in
New York, which was canceled, but I did participate in the Chaincode study
group. My goal is to gradually move to working on Bitcoin Core full-time.

It's well-known that Bitcoin Core is in crucial need of PR review, and this grant
will allow me to spend one day of each week (20%) reviewing and testing PRs,
while continuing 80% with ECC. I especially plan to take advantage of the weekly
[Bitcoin Core Review Club][pr review club]. I'll work with community members to find which PRs
would be most important and productive for me to help review. I may contribute
some small PRs that arise from review. I have long-time experience with data
storage system backend software, and the mindset there is one of absolute
correctness -- if data are ever corrupted or lost, there goes the system's
reputation. So I'll be focusing on correctness, thread-safety, code organization
and maintainability, test coverage, logging (for problem analysis), and related
areas. I'm a big fan of the [Unix
philosophy][unix philosophy]'s emphasis on
simplicity. (Tony Hoare said, "There are two ways to write code: so simple there
are obviously no bugs in it, or so complex that there are no obvious bugs in
it.")

I'm very grateful to have been welcomed and mentored by many people in the
Bitcoin Core developer community, and I'd like to especially thank John Newbery,
Amiti Uttarwar, Adam Jonas, Gloria Zhao, and Dhruv Mehta.

[@LarryRuane][larry twitter]

## Sebastian Falbesoner

Sebastian writes of his Bitcoin experience and goals:

Increasingly fascinated by the concept of a sound,
digital form of money since reading about Bitcoin in 2014, I figured the best
way to help the ecosystem, as a software engineer, would be by directly improving the reference
implementation.

With some guidance from [Jimmy Song's introductory
post][jimmy song blog],
much reading of the docs, and diving deeply into the code, I opened my first
pull request ([#16753][bitcoin core 16753]), which
fixed a `TODO` concerning script parsing in the wallet code.

Many of my following PRs were focused on increasing test coverage in various areas
(e.g. mempool acceptance policy, rejection causes of soft-forks like
`OP_CSV` and `OP_CLTV` etc.), in addition to improving the performance of tests.
I found that testing and code-reviewing PRs are very rewarding activities that
open lots of learning opportunities and lead to new ideas on what to work
on next. I also started participating in the [PR review
club][pr review club], which is an excellent learning resource that
I can warmly recommend to all interested in contributing.

Apart from fixing an [inaccuracy in the BIP37 implementation][bitcoin core 18483],
one of the most interesting topics I worked on last year was reverting a
historic covert fix for a remote crash bug
([CVE-2013-5700][cve-2013-5700]). As a personal
highlight, the later PR also got covered in a [PR review club
meeting][pr review 18806]. This year I have also been working
on making the ZMQ functional tests more robust and extending the test framework's MiniWallet.

After more than 100 merged PRs, I am very excited about the future work that
Brink's support enables me to do; apart from ongoing thorough code review and
testing, I plan to continue improving test coverage and extending the test
framework, as well as improving the codebase, with a focus on the networking/P2P
and wallet areas. Another plan is to deepen my understanding about the
soon-to-be-activated Taproot/Schnorr soft-fork. In May 2020 I also started
contributing to c-lightning, where I had the honor of naming [release v0.9.0][c-lightning 0.9.0].

[@theStack][sebastian github]

___

Both Larry and Sebastian will receive 6 month, part-time grants in order to
secure their time to work on Bitcoin Core.

If you or your organization is interested in supporting open source Bitcoin
development, feel free to email us, [donate@brink.dev][donate].

Developers interested in either the grant or fellowship [programs][programs] can
apply now for the next funding round.

[brink board]: /#board
[larry twitter]: https://twitter.com/larryruane
[sebastian github]: https://github.com/theStack
[donate]: mailto:donate@brink.dev
[programs]: /programs
[ecc]: https://electriccoin.co/
[zcash]: https://z.cash/
[bitcoin core 16577]: https://github.com/bitcoin/bitcoin/pull/16577
[pr review club]: https://bitcoincore.reviews
[unix philosophy]: https://en.wikipedia.org/wiki/Unix_philosophy
[jimmy song blog]: https://bitcointechtalk.com/a-gentle-introduction-to-bitcoin-core-development-fdc95eaee6b8
[bitcoin core 16753]: https://github.com/bitcoin/bitcoin/pull/16753
[bitcoin core 18483]: https://github.com/bitcoin/bitcoin/issues/18483
[cve-2013-5700]: https://nvd.nist.gov/vuln/detail/CVE-2013-5700
[pr review 18806]: https://bitcoincore.reviews/18806
[c-lightning 0.9.0]: https://github.com/ElementsProject/lightning/releases/tag/v0.9.0
