# Niklas Gögge

![](img/niklas-goegge.jpg)

Niklas began contributing to the Utreexo proposal before graduating in
March 2022 and joining Brink full time.  Since then, he's focused on
quality assurance: reviewing, writing tests, and refactoring
failure-prone code.  In 2023, he left over 500 comments on pull requests
and, in early 2024, he disclosed multiple vulnerabilities in the btcd
full node and the LND Lightning node, all of which he had previously
discovered through testing, responsibly disclosed, and kept private
until fixes were widely deployed, keeping users safe and minimizing
disruption.

On behalf of our sponsors, Brink is pleased to be able to continue
funding Niklas for all of 2024.

## Review

> In a lot of instances, some review is completely automatable.
> Specifically, the PRs for which no new harness needs to be written can
> be fuzzed automatically. I created a tool that can automatically build
> a given branch, fuzz a given harness, minimize the corpus, run the
> corpus through all sanitizers, and finally create a coverage report. I
> am using this for PR review and continuous fuzzing of the master
> branch. I am notified about any crashes on a private GitHub
> repository.  At the moment, this infrastructure is limited to two
> machines (one beefy one for fuzzing and one small one for hosting the
> coverage reports), which Brink is paying for. This has freed up a
> lot of my time to focus on other non-automatable work.

Reviews from Niklas covered almost all areas of Bitcoin Core.  Many of
his reviews were test-based: he examined the pull request to see if the
proposed code change came with sufficient testing and whether the tests
were being run.  If new tests were needed, Niklas often contributed
them.  Reviewers frequently thanked Niklas publicly and several
developers we spoke to privately indicated that positive reviews from
Niklas were a strong signal that a pull request was high quality and had
a good approach, encouraging other developers to contribute reviews and
accelerating the progress of those pull requests towards getting merged.

In at least four pull requests ([#28948][], [#28685][], [#28578][], and
[#29242][]), Niklas used tests to find bugs before they were merged.  In
particular, #28685 is a fix for what could have become a serious bug
that was caught by fellow Brink engineer Fabian Jahr (with diagnosis of
the underlying issue by fellow Brink engineer Sebastian Falbesoner).
After discovery of the bug, Niklas wrote a fuzz testing harness that
found two additional serious bugs and allowed them to be fixed at the
same time.

Press:

- Bitcoin UTXO set summary hash replacement - **Bitcoin Optech Newsletter #274** [¶](https://bitcoinops.org/en/newsletters/2023/10/25/#bitcoin-utxo-set-summary-hash-replacement)
- Bitcoin Core #28685 fixes a bug in the calculation of the hash of a UTXO set - **Bitcoin Optech Newsletter #275** [¶](https://bitcoinops.org/en/newsletters/2023/11/01/#bitcoin-core-28685)

## Fuzz testing net processing

> In my opinion, improving our testing is the most important and
> impactful thing to work on. It would reduce our review bottleneck, it
> would make our code easier to change, and it would cause less
> frustration among developers.

Niklas has successfully used fuzz testing to discover multiple bugs that
could have led to the loss of bitcoins if an attacker had discovered
them first.  Most Bitcoin Core developers are supportive of increased
fuzz testing, however only about 67% of Bitcoin Core's net processing
code is currently covered by fuzz tests.  Niklas worked tirelessly
during 2023 to try to improve that percentage, including maintaining
multiple pull requests through multiple annoying rebases.

Fuzz testing takes code that was designed in the head of a programmer
who probably expected an ideal situation and exposes it to variety of
semi-randomly-generated input to see what happens.  In a poorly designed
program, exposing it to unexpected input can lead to crashes,
memory leaks, wrong states, disclosure of private state, and many other
problems.  In mission-critical software like Bitcoin Core, any of those
problems can quickly become a major vulnerability: a crash of a full
node can allow theft of funds from a related Lightning Network wallet; a
memory leak can escalate to a crash; wrong states can lead to accepting
invalid transactions; and disclosure of private state can lead to theft.

Before fuzz testing was used with Bitcoin Core, developers were already
on the cutting edge of using defensive programming techniques to avoid
the worst problems, but [many problems][topic cve-2018-17144] have still
found their way into the code (and more probably exist).  Fuzz testing
allows developers to leverage cheap and abundant CPU and memory to test
functions with massive numbers of random inputs to see if something
fails.

Press:

- Transcript of fuzzing presentation by Niklas Gögge - **Bitcoin Transcripts** [¶](https://btctranscripts.com/bitcoin-core-dev-tech/2023-04/2023-04-27-fuzzing/)

## Security engineering

> Every now and then security focused work pays a dividend by turning up
> security relevant bugs in production code. Disclosure highlights the
> importance of security focused work and those who fund it: Brink.

Niklas had 16 pull requests merged in 2023 (and several more in early
2024) that helped improve the safety of Bitcoin Core.  Some notable pull
requests include:

- [#29412][] drops mutated blocks received over the network as early as
  possible.  This class of problems stems from a weird choice for the
  original consensus-enforced design for Bitcoin's merkle tree and has
  led to multiple serious vulnerabilities in the past (e.g.
  [CVE-2012-2459][] and [2019-merkle][]).  Addressing the issue
  proactively lowers the risk of future vulnerabilities.

- [#28956][] removes the use of _adjusted time_ from consensus code
  (without requiring any actual consensus changes).  Adjusted time is
  another weird feature that was included in very early versions of
  Bitcoin and potentially creates more problems than it solves.

- [#28460][] significantly sped up many fuzz tests and [#28480][] fixed
  an issue where some fuzz tests weren't actually being run.

- [#29064][], [#29219][], [#29031][], [#28558][] increased the stability
  of fuzzing harnesses, which has already resulted in the discovery of
  undefined behavior.

Bitcoin Core's [fuzzing corpora][qa-assets] repository is maintained by
Niklas.  The corpora is used by the project's continuous integration
tests and regularly finds bugs before they get released to users.

> New fuzzing techniques and research is constantly published. We should
> explore the use of new tools and techniques to ensure our bug finding
> capabilities are as good as they can be. As of now, none of the [new]
> techniques have uncovered any bugs but they all widen the space of
> bugs we could find. I keep some of this work in private repos until I
> am reasonably confident it can’t be used to trivially find new bugs.

Niklas experimented with multiple new fuzzing tools, looking for ways to
speed up fuzzing, increase coverage, and automatically find
discrepancies between different code paths that are supposed to be
identical (e.g., code running on different computer architectures).
He's also used fuzz testing on Bitcoin projects beyond Bitcoin Core,
resulting in the discovery of multiple serious vulnerabilities that
were all responsibly disclosed.  After being fixed, multiple
vulnerabilities were able to be publicly disclosed in 2023 and early
2024:

- [Two LND gossip handling vulnerabilities][lnd vulns]: an attacker
  could exploit the first bug to crash LND, leading to it being unable to
  send time-sensitive transactions, potentially allowing the attacker to
  steal from the user.  The second bug could be exploited by an attacker
  to prevent an LND node from learning about certain channels,
  potentially forcing the user to forward payments partially or entirely
  across the attacker's channels, reducing the user's privacy and
  allowing the attacker to collect additional routing fees from the
  user.  After Niklas's private disclosure, both bugs were quietly
  fixed; they weren't revealed until after users already had other
  security-related reasons to upgrade.

- [Btcd consensus vulnerability][btcd vuln]: an attacker could make the
  btcd full node accept a block with a transaction that every Bitcoin
  Core full node would consider invalid.  As Bitcoin Core nodes are
  predominate on the network, btcd users would mistakenly believe the
  block was valid and that the transactions in it were confirmed.  This
  could lead to miners who use btcd losing money creating invalid
  blocks, Lightning Network users losing funds due to a false view of
  the blockchain, and onchain users believing transactions were
  confirmed when they weren't.  After Niklas's private disclosure, the
  bug was quietly fixed.  Later, shortly after Niklas's public
  disclosure, the bug was exploited on testnet, with the fixed version
  of btcd able to handle the bug.

- [Core Lightning invoice parsing vulnerabilities][cln vulns]: after
  discovering several vulnerabilities in CLN in 2022, Niklas submitted
  the fuzzing harness he had used to discover the bugs in 2023.  Matt
  Morehouse realized the fuzz tests had actually discovered three
  additional vulnerabilities and further expanded them to find two more
  vulnerabilities, for a total of five vulnerabilities, all related to
  how CLN handled invoices.  Three of the the vulnerabilities could be
  used to crash CLN, which can be a serious problem for an automated
  Lightning Network node due to it needing to be able to respond quickly
  in some cases to protect user funds.  One of the bugs allowed the use
  of uninitialized memory which, in theory, could have allowed an
  attacker to extract private information from the node---although CLN
  keeps most of its private data in a separate process to help minimize
  such issues, so an actual attack would have been quite difficult.  All
  of the vulnerabilities were fixed and none are known to have been
  exploited.

Press:

- Disclosure of past LND vulnerabilities - **Bitcoin Optech Newsletter #283** [¶](https://bitcoinops.org/en/newsletters/2024/01/03/#disclosure-of-past-lnd-vulnerabilities)

- Discussion with Niklas Gögge, discovered of LND vulnerabilities - **Bitcoin Optech Podcast #283** [¶](https://bitcoinops.org/en/podcast/2024/01/04/#disclosure-of-past-lnd-vulnerabilities-transcript)

- Disclosure of fixed consensus failure in btcd - **Bitcoin Optech Newsletter #286** [¶](https://bitcoinops.org/en/newsletters/2024/01/24/#disclosure-of-fixed-consensus-failure-in-btcd)

- Discussion with Niklas Gögge, discoverer of btcd vulnerability - **Bitcoin Optech Podcast #286** [¶](https://bitcoinops.org/en/podcast/2024/01/25/#disclosure-of-fixed-consensus-failure-in-btcd-transcript)

## Plans for 2024

> I want to continue building out the [differential fuzzing
> engine](https://github.com/dergoegge/libdimpl). I want it to be a
> general tool for differential fuzzing, not just for fuzzing across
> different architectures.  For example, we could continuously
> differentially fuzz the latest version of the script interpreter
> against old versions of itself (as a hard-fork sanitizer).

Comparing Bitcoin Core against versions of itself, whether for different
platforms or different versions, has the potential to automatically
discover the types of vulnerabilities that have been among the worst yet
seen in Bitcoin.  For example, [CVE-2018-17144][topic cve-2018-17144]
was accidentally introduced in Bitcoin Core versions 0.14 and 15.0,
allowing the same bitcoins to be spent more than once; it's possible
that differential fuzzing between version 0.13 and 0.15 could have
discovered that bug.  Another example would be the vulnerability fixed
by the [BIP66][] soft fork: the old signature verification library used
by Bitcoin Core (OpenSSL) would accept some signatures as valid on some
platforms while considering them invalid on other platforms, which could
have been used to split the network; differential fuzzing between those
platforms could have discovered that vulnerability.

> I want to research/experiment with Bitcoin Core specific fuzzing
> feedback.  For example: our current mempool harnesses are great at
> achieving high coverage in the mempool code but they do not (for
> example) manage to successfully submit large transaction clusters to
> the pool.  A custom mempool feedback, focusing on maximising “cluster
> size” (or other graph complexity metrics) could guide the fuzzer to
> bugs arising from complex mempool structures. The idea is to speculate
> on where bugs might be and try to guide the fuzzer to them through
> application specific feedback.

Bitcoin Core currently depends on very talented and careful developers
thinking through all possible ways a particular piece of code might be
used.  Fuzz testing can't entirely replace that, but it can allow us to
throw money (in the form of CPU cycles) at checking that a developer's
logic about what will happen matches the reality in millions or billions
of different permutations, increasing our confidence that the analysis
is correct.  This is especially useful given the limited amount of time
available from high-quality reviewers.  It's much easier to scale up
testing than it is to find, train, and retain new developers.

> Something I want to get working next year is smarter scheduling
> for continuous fuzzing. It currently uses simple round-robin
> scheduling over all harnesses, i.e. each harness gets N hours of CPU
> hours every day. A smarter scheduling algorithm could take code
> changes (between revisions of Bitcoin Core) and coverage reached by
> each harness into account, to prioritise scheduling harnesses that
> reach the changed code. This will also be helpful to efficiently
> automate fuzzing of PRs, since it avoids fuzzing harnesses that are
> unrelated to the code changes being tested. A second goal is to allow
> scheduling of fuzzing jobs across multiple machines (it currently only
> supports one machine). This will allow us to scale up the
> infrastructure as needed.

Again, Niklas is working on scaling up Bitcoin Core's testing
capabilities.  This has the potential to find existing bugs in the code,
allowing them to be fixed quietly.  It also increases the chance that
new bugs will be found before they can be exploited.  Improved automatic
testing of pull requests will speed up development as it allows
developers to address many issues in their code before it's ever seen by
reviewers.  This makes the work more meaningful for reviewers and makes
pull request authors happy by reducing the number of re-review cycles
necessary to get good code merged.

> More bug disclosures.  There is one Bitcoin Core bug that I found that
> will be up for disclosure this year (pending discussion with the other
> devs). There are also a few disclosures I have written up for older
> Bitcoin Core bugs that were never disclosed (publishing these will be
> discussed at the next CoreDev meeting).

Publicly disclosing vulnerabilities that have been fixed makes it
easier for new developers to learn from those old vulnerabilities.  It
also demonstrates the work that Bitcoin Core developers are quietly
performing in order to keep users safe, and helps motivate users to
upgrade to new versions (even if just the oldest [maintained
version][bcc versions] of Bitcoin Core).

Niklas has also asked to attend conferences and training related to
cutting-edge fuzzing techniques, which Brink will be proudly sponsoring
him to attend.

\vspace{10pt}
\begin{mdframed}[backgroundcolor=blue!10]

Want to work with Niklas?  Brink is looking to hire an additional
full-time test engineer in 2024, preferably someone to work
directly with Niklas in our London office.  Compensation amount is based on
experience and qualifications.  We will pay for any required work visa.
Apply at https://brink.dev/programs

\end{mdframed}

[#28948]: https://github.com/bitcoin/bitcoin/pull/28948
[#28685]: https://github.com/bitcoin/bitcoin/pull/28685
[#28578]: https://github.com/bitcoin/bitcoin/pull/28578
[#29242]: https://github.com/bitcoin/bitcoin/pull/29242
[topic cve-2018-17144]: https://bitcoinops.org/en/topics/cve-2018-17144/
[#29412]: https://github.com/bitcoin/bitcoin/pull/29412
[cve-2012-2459]: https://bitcointalk.org/?topic=102395
[2019-merkle]: https://bitcoinops.org/en/newsletters/2019/03/12/#bitcoin-core-vulnerability-disclosure
[#28956]: https://github.com/bitcoin/bitcoin/pull/28956
[#28460]: https://github.com/bitcoin/bitcoin/pull/28460
[#28480]: https://github.com/bitcoin/bitcoin/pull/28480
[#29064]: https://github.com/bitcoin/bitcoin/pull/29064
[#29219]: https://github.com/bitcoin/bitcoin/pull/29219
[#29031]: https://github.com/bitcoin/bitcoin/pull/29031
[#28558]: https://github.com/bitcoin/bitcoin/pull/28558
[qa-assets]: https://github.com/bitcoin-core/qa-assets
[lnd vulns]: https://delvingbitcoin.org/t/denial-of-service-bugs-in-lnds-channel-update-gossip-handling/314
[btcd vuln]: https://delvingbitcoin.org/t/disclosure-btcd-consensus-bugs-due-to-usage-of-signed-transaction-version/455
[cln vulns]: https://morehouse.github.io/lightning/cln-invoice-parsing/
[bip66]: https://github.com/bitcoin/bips/blob/master/bip-0066.mediawiki
[bcc versions]: https://bitcoincore.org/en/lifecycle/#schedule
