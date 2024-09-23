# Fabian Jahr

![](img/fabian-jahr.jpg)

After a long history of volunteer part-time contribution to Bitcoin,
Brink began funding Fabian full time in April of 2023.  During the
remainder of the year, he left over 200 review comments on PRs related
to assumeUTXO, multiprocess, and package relay.  He also led major
improvements to distributed generation of ASMap files to improve Bitcoin
Core's denial-of-service protection, wrote proof-of-concept code for
batch validation of schnorr signatures to speed up block verification
while simultaneously researching cross-input signature aggregation
(CISA), and automated the process of moving Bitcoin Core's repository
from third-party GitHub to a self-hosted GitLab instance.

On behalf of our sponsors, Brink is pleased to be able to continue
funding Fabian full time for all of 2024.

## Reviews

> I focused my review on larger projects, and particularly I think my
> review helped get AssumeUTXO merged into Bitcoin Core. This can be
> seen in my review statistics above and also in this [bug][#28685],
> which I discovered during testing post-merge.

Nearly a quarter of Fabian's review comments in 2023 were left on
Bitcoin Core pull request [#27596][], "assumeutxo (2)".  This code
contribution by James O'Beirne "finishe[d] the first phase of the
assumeutxo project.  It [made] UTXO snapshots loadable via RPC."
[AssumeUTXO][topic assumeutxo] has been a top priority for the Bitcoin
Core project as it makes a new node on fast hardware fully functional
for everyday users within a matter of minutes, rather than hours.  This
massively lowers the barrier of entry to a user validating their own
transactions with their own node---a fundamental requirement if we want
Bitcoin's consensus rules to remain in control of everyday people.

Over the five months the AssumeUTXO pull request was being reviewed by
developers, it received 448 comments---over 10% of which came from
Fabian, who reviewed it and re-reviewed it multiple times.  Fabian also
found the above-mentioned bug, [#28685][], which could have led to
security problems, and he helped review multiple AssumeUTXO follow-up
pull requests, helping the project progress.

Press:

- Bug found in UTXO set summary hash - **Bitcoin Optech Newsletter #274** [¶](https://bitcoinops.org/en/newsletters/2023/10/25/#bitcoin-utxo-set-summary-hash-replacement)
- Podcast with Fabian Jahr, discoverer of UTXO set summary hash bug - **Bitcoin Optech Podcast #274** [¶](https://bitcoinops.org/en/podcast/2023/10/26/#bitcoin-utxo-set-summary-hash-replacement-transcript)
- Bitcoin Core #27596 finishes the first phase of the assumeutxo project - **Bitcoin Optech Newsletter #272** [¶](https://bitcoinops.org/en/newsletters/2023/10/11/#bitcoin-core-27596)

## ASMap

> Amazingly, what we have now actually shouldn’t even be working
> according to experts I talked to (network engineers from ISPs, CDNs,
> IRRs, etc.), so in some regards what we have now is even better than
> what I had hoped for a year ago.

[ASMap][#28794] is a project started within Bitcoin Core in 2019 to
improve node resistance against cheap denial-of-service attacks,
including dangerous [eclipse attacks][topic eclipse attacks].  A full
node is only fully secure if it connected to at least one honest peer.
If a malicious entity controls a large number of IP address across a
wide range of the major subnets, it's possible that some nodes could
make all of their connections to that malicious entity, allowing it to
censor blocks from the most-proof-of-work blockchain and instead provide
blocks that well-connected nodes would mostly ignore.

Entities that directly control blocks of IP addresses are called
autonomous services (ASes) and a map to all of them (ASmap) could allow
Bitcoin Core to ensure it connected to a variety of different ASes.
This wouldn't prevent an eclipse attack based on collusion between
different entities, but it would make eclipse attacks and other
denial-of-service attacks more difficult than they are today.

Creating an ASMap is challenging for an individual, but even doing that
isn't enough for Bitcoin Core.  The project rightfully doesn't want to
trust information from a single individual.  Because IP addresses are
frequently traded from one AS to another, there's no reliable way for
Bitcoin Core contributors to verify an ASMap that a single contributor
created in the past.  Instead, Fabian worked to develop tools for a
mapping process that could be run by multiple contributors independently
in parallel.  If they all obtained the same result, that would allow the
project to use the resulting map without trusting any individual person.

Professional network engineers who frequently work with ASes and routing
tables didn't think a distributed parallel process could work well
enough for multiple people to all obtain the same results---but Fabian
made it work through the development of [new tools][kartograf] and
[processes][asmap process].  This may allow Bitcoin Core to begin
including a default ASMap file in future releases, improving safety and
reliability for everyone operating a full node.

Press:

- Improved reproducible ASMap creation process - **Bitcoin Optech Newsletter #290** [¶](https://bitcoinops.org/en/newsletters/2024/02/21/#improved-reproducible-asmap-creation-process)

- Discussion with ASMap contributor Fabian Jahr - **Bitcoin Optech Podcast #290** [¶](https://bitcoinops.org/en/podcast/2024/02/22/#improved-reproducible-asmap-creation-process-transcript)

## Schnorr batch verification and CISA research

> While simultaneously getting started learning more about CISA I
> reviewed and [rebased the secp256k1
> code](https://github.com/bitcoin-core/secp256k1/pull/1134) for
> schnorr batch verification, had some discussions, and experimented
> with the integration into Core.  The proof of concept code is
> available [here](https://github.com/bitcoin/bitcoin/pull/29491) and
> some conceptual discussion has happened based off of it there and in
> libsep256k1.

One of many advantages of [schnorr-style signature verification][topic
schnorr signatures] discussed prior to the activation of [taproot][topic
taproot] is the ability to batch verify multiple signatures at the same
time.  For example, if a typical block consisted entirely of taproot
transactions using schnorr signatures, it would be possible to verify
all of those signatures simultaneously about twice as fast as verifying
each of them independently.

Fabian started his work this year by reviewing a previous [experimental
module for libsecp256k1][#1134].  He later [rebased the code][#1134]
and, in early 2024, opened a [draft PR][#29491] to Bitcoin Core
that begins performing batch validation.  His work has already received
several review comments.

> I realized that CISA was just very far off from batch validation in
> terms of conceptual work that was still needed.

Validating multiple signatures together, described above, seems similar
to combining multiple signatures together, which in Bitcoin is called
cross-input signature aggregation ([CISA][topic cisa]).   Two types of
aggregation are known: half aggregation would allow a transaction with
multiple inputs to only include a single full signature (about 16
vbytes) and half a signature (about 8 vbytes) for each additional input,
reducing the size of transactions generated by a single user or a group
of cooperating users (such as in a coinjoin) by about 8% in a typical
case (or about 14% in the best case).  Full aggregation would allow a
transaction to contain only a single full signature no matter how many
inputs it had, reducing its size by about 16% in a typical case (or
about 40% in the best case).

<!-- typical case: 1000-in, 1000-out P2TR keypath:
  - half-agg: x=100510.5 ; (x - 8 * 1000) / x
  - full-agg x=100510.5 ; (x - 16 * 1000) / x
-->

Either type of CISA would require a soft fork and both types may
conflict with other proposed soft fork upgrades.  Much more research on
the topic is required, some of which Fabian conducted this year.  He
began maintaining [CISAResearch.org][], which contains a collection of
education about the topic, and created a proof of concept
[implementation][halfagg.py] in Python for half aggregation.

## GitHub alternative

> Based on my initial testing on my own GitLab server before my grant
> application, I thought this would be a matter of a few days.
> Unfortunately, the sync between GitHub and GitLab was unstable and
> several approaches did not work as expected.  Paid support from GitLab
> was not very helpful and their open source community also didn’t help
> in a meaningful way. Our main contact person there also left the
> company in the meantime.
>
> It was almost a strike of luck that I started trying to use one of
> their professional service tools for the migration task and started
> contributing there with PRs and issues. Through a conversation in one
> issue I was able to find a configuration that allowed the sync to
> finally work.

Although it's easy to obtain a complete copy of every revision to
Bitcoin Core's code using Git, the discussions behind those code changes
are all stored on a single centralized platform: GitHub.  In the past,
GitHub has ceased hosting popular open source projects due to government
requests and their own policies.  They've also had persistent bugs on
their platform that have slowed development of Bitcoin Core, including
website optimizations that increased the risk that important code
feedback might not be seen by reviewing developers before
safety-critical code was merged.

For many years, several contributors have been hosting backups of
Bitcoin Core's GitHub issues and PRs in case there was a problem.  That
ensures critical context isn't lost.  But if GitHub were to suddenly
delist the Bitcoin Core project, it could potentially take weeks or
months until the project was able to restart on a different platform and
import all of the context needed to continue development at the same
pace as before.

One of Fabian's projects this year was figuring how to minimize that
gap.  He's [created][backup scripts] a set of scripts that frequently
backs up the Bitcoin Core repository and creates a self-hosted version
using the open source GitLab software.  In the event of a problem with
GitHub, the project can begin using the GitLab version in a matter of
days (at most)---with every existing user being automatically issued
their own GitLab account and every issue and pull request being updated
to its latest state as of the backup.  He [achieved][delving gitlab]
this goal early in 2024 and is continuing to maintain it in case it is
ever needed.

Press:

- GitLab backup for Bitcoin Core GitHub project - **Bitcoin Optech Newsletter #292** [¶](https://bitcoinops.org/en/newsletters/2024/03/06/#gitlab-backup-for-bitcoin-core-github-project)

- Discussion with GitLab backup contributor Fabian Jahr - **Bitcoin Optech Podcast #292** [¶](https://bitcoinops.org/en/podcast/2024/03/07/#gitlab-backup-for-bitcoin-core-github-project-transcript)

## Other activities

> I regularly get good feedback from participants who started to
> contribute to Bitcoin projects because of it.

Fabian is an organizer for the Berlin Bitdevs meetup, which can have up
to 50 attendees.  He's been giving presentations at conferences, such as
BTC23 in Innsbruck, and helped organize the Bitcoin Core developer
meeting in early 2024.

## Plans for 2024

> I feel like I have only recently gotten into a position where I can
> help drive faster development of CISA, given what I have described
> above. I want to continue the work on CISA in 2024 with more focus.

He hopes to continue working with cryptographers such as Jonas Nick and
Tim Ruffing as they develop a scheme for full signature aggregation and
develop a signature proof for it.  Even if full aggregation remains
elusive, he hopes to create a BIP proposal for half aggregation that can
be extended to full aggregation if that later becomes available.

> I want to continue to support the implementation of Silent Payments
> because I think it is rare that a non-softfork proposal has seen so
> much excitement and only very little pushback. I also think that my
> experience is helpful, given it interacts with secp256k1 and looks to
> leverage indices as well.

Fabian joins fellow Brink engineer Sebastian Falbesoner in helping to
support the implementation of [silent payments][topic silent payments]
for Bitcoin Core.  As we mentioned in Sebastian's section of this annual
report, silent payments provides a privacy-enhanced reusable address
format that works especially well for users of full nodes, making it a
natural fit to be implemented first in Bitcoin Core before spreading to
other wallets.

> I will put together a new tracking issue for AssumeUTXO mainnet params
> deployment and will champion for more focused review so that we can
> finally let users take advantage of this feature.

Fabian plans to continue his work on AssumeUTXO, helping to bring it to
100% support and allowing new users of full nodes to start using them
for receiving transactions potentially within minutes of installation.
This will arguably be the largest single improvement in the usability of
a full node in Bitcoin's history.  We're excited that Fabian is working
with other developers to help get it across the finish line.

> I would like to continue maintaining/championing these projects: batch
> validation, default ASMap, GitLab code hosting, and
> BitDevs and other educational events.  None of them are completely
> done but many of them have now entered a different phase that allows
> me to focus more time on other topics, such as dedicating more time to
> review overall.

We've already mentioned the importance of the projects that Fabian
worked on last year, and we're happy to see him continue to maintain
them and move the ones that can be completed a little closer to
eventually being included in Bitcoin Core.  Given the high quality of
the reviews he's been able to provide, we're especially excited to see
him able to devote more time to reviews in 2024.

[#27596]: https://github.com/bitcoin/bitcoin/issues/27596
[topic assumeutxo]: https://bitcoinops.org/en/topics/assumeutxo/
[topic package relay]: https://bitcoinops.org/en/topics/package-relay/
[#28722]: https://github.com/bitcoin/bitcoin/issues/28722
[#28794]: https://github.com/bitcoin/bitcoin/issues/28794
[#28685]: https://github.com/bitcoin/bitcoin/issues/28685
[topic eclipse attacks]: https://bitcoinops.org/en/topics/eclipse-attacks/
[kartograf]: https://github.com/fjahr/kartograf
[asmap process]: https://delvingbitcoin.org/t/asmap-creation-process/548
[topic schnorr signatures]: https://bitcoinops.org/en/topics/schnorr-signatures/
[topic taproot]: https://bitcoinops.org/en/topics/taproot/
[backup scripts]: https://gist.github.com/fjahr/9a28abefe0ab8413d96aa1dd7903c5d4
[delving gitlab]: https://delvingbitcoin.org/t/gitlab-backups-for-bitcoin-core-repository/624
[CISAResearch.org]: https://cisaresearch.org/
[topic cisa]: https://bitcoinops.org/en/topics/cross-input-signature-aggregation/
[topic silent payments]: https://bitcoinops.org/en/topics/silent-payments/
[#1134]: https://github.com/bitcoin-core/secp256k1/pull/1134
[#29491]: https://github.com/bitcoin/bitcoin/pull/29491
[halfagg.py]: https://github.com/fjahr/cisa-playground/tree/main
