# Gloria Zhao

![](img/gloria-zhao.jpg)

Gloria joined Brink in January 2021 as the first member of our one-year
Fellowship program, just a few months after she started contributing to
Bitcoin Core.  She became a Brink engineer in 2022 and Bitcoin Core
maintainer for the P2P subsystem in the same year.  In 2023, she
provided 900 review comments and was the driving force within the
Bitcoin Core project for _package relay_, an upgrade to the P2P protocol
that will significantly enhance the security of contract protocols such
as Lightning Network.  She's also been one of the lead developers on
TRUC (also called _version 3 transaction relay_) and cluster mempool,
which aim to solve additional security-related problems for contract
protocols.

On behalf or our sponsors, Brink is pleased to be able to continue
funding Gloria's ongoing work to improve the Bitcoin P2P network.

## Review and maintainer duties

> When reviewing other peoples' PRs, [sometimes][zhao1] I [found][zhao2]
> [bugs][zhao3], wrote [tests][zhao4], or [provided][zhao5] some insight
> from a bigger picture understanding. I don't always find bugs, but I
> think my reviews are helpful---I try to focus on making progress on
> high priority things, even if they require understanding complex areas
> of the codebase.

As maintainer of the P2P subsystem, Gloria commented on almost every
substantial pull request affecting that part of the code.  She also left
comments on many pull requests outside of P2P, including multiple pull
requests by promising new Bitcoin Core contributor Abubakar Sadiq
Ismail, who has been working on improving [fee estimation][topic fee
estimation].

Many of Gloria's review comments in 2023 were on her own pull requests,
which are some of the most high-impact pull requests that were opened to
Bitcoin Core in 2023.  She replied to hundreds of comments from other
reviewers, quickly acknowledging and addressing their concerns.  Without
her commitment to timely and professional replies, we doubt she would
have been able to get pull requests with such large scope merged.

Press:

- The Role of Bitcoin Core Maintainers & the Path Forward - **Bitcoin 2023 Conference (Bitcoin Magazine)** [¶](https://www.youtube.com/watch?v=mdnkZunIphA&ab_channel=BitcoinMagazine)

## Package validation and P2P package relay

> My original plan last year was to get package validation done first,
> and implement the p2p changes. There was some thought to do them in
> parallel, but my main collaborator (Greg Sanders) and I quickly
> realized it was much more productive to focus on one track at a
> time.
>
> Championing a large project also involves convincing others to
> prioritize and review it. Bitcoin Core contributors have continuously
> voted package relay as the highest priority project for every release
> cycle, so I think I have been somewhat successful in that effort.

When Alice spends bitcoins to Bob and then Bob spends those bitcoins to
Carol, Bitcoin's consensus rules requires Alice's transaction appear
earlier in the blockchain than Bob's transaction.  This ensures Bob can
only spend bitcoins he owns; he can't spend on credit.  Alice's
transaction is the _parent_ of Bob's _child_ transaction.  If both of
their transactions are currently unconfirmed, then a miner can only
include Bob's transaction in a block if they also include Alice's
transaction in the same block.  This dependency created by Bitcoin's
consensus rules provides a mechanism for fee bumping, called
[child-pays-for-parent][topic cpfp]: if Alice's transaction pays a low
feerate---too low for a miner to want to include it in a block---then
Bob can choose a high feerate for his transaction, and the weighted
average of both Alice's parent transaction and Bob's child transaction
can be high enough for a miner to profitably mine both transactions in
the same block.

CPFP fee bumping is a powerful tool for contract protocols, such as
Lightning Network, where certain transactions are created and signed
long before they are broadcast, preventing the signers from knowing what
feerate to use.  With CPFP, the pre-signed transaction can use a low
feerate and whoever receives money from the transaction (e.g. Bob) can
simply create a child transaction with an appropriate feerate to get
both the pre-signed parent and the high-feerate child included in the
next block.

However, Bitcoin Core full nodes have a limited amount of memory to use
for storing unconfirmed transactions, so they don't store transactions
with a feerate below the amount necessary to get confirmed within the
next day (approximately).  That means a low-feerate parent transaction
by Alice might not be stored in a node's mempool, resulting in the
node rejecting Bob's high-feerate child transaction because its parent
is unavailable.

The two-part solution for this is allowing a _package_ of related
transactions to be both relayed and validated together.  In _package
validation_, Alice's parent transaction and Bob's child transaction are
validated together and it's their weighted average feerate that
determines whether they are able to enter the mempool.  For nodes to
effectively use package validation on the network, they need to know
when receiving Alice's parent transaction not to validate it as an
independent transaction---that they should wait for Bob's child
transaction to arrive and that they should run package validation on the
both transactions together; this ultimate objective is called [package
relay][topic package relay].

Although these changes are relatively easy to describe, they represent a
significant difference from the way Bitcoin Core has been independently
validating each transaction since its initial release in 2009.  Because
package relay will be used in a security sensitive way by contract
protocols such as Lightning Network, it's critical that it be carefully
evaluated for any potential problems.

Zhao's continuing work on package relay has included not just writing
code for Bitcoin Core but also writing a [draft BIP][bip331] and
engaging developers working on Lightning Network to ensure that the
ultimate project meets their needs and expectations.

Press:

- Gloria Zhao - v3 Transactions and Package Relay - **Stephan Livera Podcast** [¶](https://stephanlivera.com/episode/511/)

## Addressing pinning and RBF problems with v3 and cluster mempool

> This is very much tied to package relay, as we’re trying to answer a
> common set of questions. They also share some code, dependencies on
> one another, and the same small group of reviewers.
>
> In 2022, while I was gathering information about RBF and pinning, one
> major issue identified was "we don't have a good way of assessing or
> enforcing incentive-compatibility in mempool," which can lead to
> undesirable behavior in replacements and evictions. Fortunately, this
> problem nerd-sniped some very smart folks who have been working on a
> better way to assess incentive compatibility and rewriting the mempool
> to address these underlying issues.
>
> Now, this project takes the form of v3 and cluster mempool (mostly
> review). As I’m writing this, we’ve pretty much finished v3 and are
> starting to review/merge things for cluster mempool.

Package relay solves one problem for contract protocol developers---how
to pay fees on transactions signed long before they're broadcast.
Another problem occurs when more than one party to a contract attempts
to pay fees.  To prevent wasting the resources of full node operators,
such as memory and bandwidth, Bitcoin Core has to limit the number,
size, and flexibility of the transactions it accepts, but a malicious
party to a contract can sometimes abuse those rules to prevent honest
parties from getting a transaction confirmed in a timely manner, called
[transaction pinning][topic transaction pinning].  Pinning is especially
a problem for contract protocols such as Lightning Network where safety
sometimes depends on time sensitive transactions.

Gloria researched and helped design one solution to many current
transaction pinning attacks: _topologically restricted until
confirmation_ ([TRUC][topic truc]) transactions, also known as _version
3_ (v3) transactions.  This allows the creators of transactions to
opt-in to a set of restrictions that limits the severity of pinning
attacks by 99% or more without creating any problems for honest users.

Gloria has also worked with several other Bitcoin Core contributors,
including Suhas Daftuar, Pieter Wuille, and Greg Sanders on a ground-up
redesign of Bitcoin Core's mempool to make it easier to ensure each new
transaction added to the mempool strictly improves the set of
transactions available to be mined.  This has long been the goal of
Bitcoin Core's mempool policy, but Bitcoin Core previously attempted to
achieve that using a variety of different heuristics.  In the redesigned
mempool, called [cluster mempool][topic cluster mempool], a fast sorting
function is used to put every transaction in the mempool into a linear
order.  If a new transaction is received to a full mempool, it is only
accepted if it sorts higher than at least one other transaction.  If a
replace-by-fee ([RBF][topic rbf]) replacement is received, it must rank
higher than all of the transactions it replaces.

This conceptually simple new design makes it much easier to reason about
mempool behavior and also provides new capabilities that can be used in
the development of new policies for avoiding pinning and other problems
that affect users of contract protocols.  Gloria has been working
closely with her colleagues to implement, review, and test cluster
mempool, parts of which have already started being incorporated in
Bitcoin Core as of early 2024.

Press:

- Sibling replace-by-fee - **Bitcoin Optech Newsletter #287** [¶](https://bitcoinops.org/en/newsletters/2024/01/31/#kindred-replace-by-fee)
- Discussion with Gloria Zhao, who proposed sibling replace by fee - **Bitcoin Optech Podcast #287** [¶](https://bitcoinops.org/en/podcast/2024/02/01/#kindred-replace-by-fee-transcript)

## Advocacy

> The goal of this work is to get the broader Bitcoin community to
> understand and participate productively in protocol development. I
> think most would agree advocacy is important (decentralized open
> source development is really hard but it’s what we signed up for!).
> Funding is less of a pain point now than before, but the number of
> total and new contributors to Bitcoin Core has been steadily
> decreasing.
>
> I limit this to 10-15% of my time, as there is an infinite supply of
> things to do. A framework I came up with last year was allocating my
> time across a “funnel.” The top is spreading a message “the code needs
> work and runs on donations,” and the bottom might be recruiting
> somebody to work on Bitcoin Core and looking at PRs together.

Gloria came to Brink after being a participant in the [Bitcoin Core Pull
Request Review Club][pr review club], a project she now co-maintains
with fellow Brink engineer Stéphan Vuylsteke.  She's also been teaching
and mentoring new Bitcoin Core developers.

She's also begun giving more public talks and presentations, including
talks at Africa Bitcoin Conference, Bitcoin 2023, Oslo Freedom Forum,
BTC Prague, and btc++.  With Mark "Murch" Erhardt, she co-authored a
[10-part series][waiting for confirmation] about Bitcoin Core's mempool
for the weekly Optech Newsletter, and helped host 9 socratic seminars
with London BitDevs.

## Plans for 2024

> - V3 policy: get it done and deployed
> - I think it’ll be reasonable to get at least 1 of the package relay subprojects done
> - Review cluster mempool PRs when they are ready
> - More review, maintenance, and advocacy/mentoring/teaching work

Gloria's plans for 2024 are very similar to her extraordinary
accomplishments for 2023.  The deployment of v3 policy will be a major
boon to the security of Lightning Network and other contract protocols.
Package relay will unlock the full set of benefits that v3 policy makes
available.  Cluster mempool will make Bitcoin Core's mempool policy much
easier for developers and interested laypeople to analyze holistically,
and will provide the foundation for multiple future improvements in
speed and security.  And we expect Gloria's excellent advocacy to
continue to inspire both new and existing developers to work on Bitcoin
Core.

[waiting for confirmation]: https://bitcoinops.org/en/blog/waiting-for-confirmation/
[zhao1]: https://github.com/bitcoin/bitcoin/pull/29019#issuecomment-1877401757
[zhao2]: https://github.com/bitcoin/bitcoin/pull/28368#pullrequestreview-1718119056
[zhao3]: https://github.com/bitcoin/bitcoin/pull/27675#pullrequestreview-1556437447
[zhao4]: https://github.com/bitcoin/bitcoin/pull/27460#discussion_r1169040746
[zhao5]: https://github.com/bitcoin/bitcoin/pull/28335#pullrequestreview-1603077161
[topic cpfp]: https://bitcoinops.org/en/topics/cpfp/
[topic package relay]: https://bitcoinops.org/en/topics/package-relay/
[bip331]: https://github.com/bitcoin/bips/pull/1382
[ln package relay]: https://bitcoinops.org/en/newsletters/2023/07/26/#reliable-transaction-confirmation
[topic transaction pinning]: https://bitcoinops.org/en/topics/transaction-pinning/
[topic truc]: https://bitcoinops.org/en/topics/version-3-transaction-relay/
[topic cluster mempool]: https://bitcoinops.org/en/topics/cluster-mempool/
[topic rbf]: https://bitcoinops.org/en/topics/replace-by-fee/
[pr review club]: https://bitcoincore.reviews/
[topic fee estimation]: https://bitcoinops.org/en/topics/fee-estimation/
