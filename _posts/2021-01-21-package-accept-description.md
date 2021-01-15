---
title: "Fellowship Project: Package Mempool Accept"
permalink: /blog/2021/01/21/fellowship-project-package-accept/
layout: post
author: glozow
image: /assets/images/b_logo_square.png
alt: Package Mempool Accept Project Description 
category: "technical"
description: A description of the Package Mempool Accept project.

---

## Motivation

As the Bitcoin ecosystem expands, Bitcoin‘s responsibility as a base-layer
protocol becomes more complex. More specifically, as transaction volume more
frequently exceeds the default mempool size, fee-bumping is not only a nice
feature for users to express urgency in their transactions but also a key
mechanism for security. Many second layer applications provide off-chain
scaling and privacy solutions but rely on being able to settle on-chain in a
timely manner. The ability to promote transactions for inclusion in a block is
crucial.

For example, the Lightning Network relies on constructing, but not
broadcasting, chains of transactions. Each transfer on the Lightning Network
creates contingency transactions that can be broadcast to redeem the channel
balance if a counterparty tries to cheat (i.e. tries to close the channel with
an outdated balance). The contingency transaction must be broadcast within a
certain period of time of the attacker’s malicious one (usually from one day to
two weeks). Creating a refund output with a timelock delay is a common
technique to give participants enough time to detect malicious activity and
broadcast their “justice transaction.” From an attacker’s perspective, however,
this means they’ll get away with their money as long as they can prevent the
justice transaction from being mined for the duration of the timelock.

While it’s relatively difficult to censor a transaction entirely, an attacker can
try to artificially flood mempools with higher-fee transactions to bury it. If one
of the transaction's outputs belongs to the attacker, they may employ [transaction
pinning](https://bitcoinops.org/en/topics/transaction-pinning/) methods to
prevent it from being fee-bumped. Sometimes, such attacks may not
even be necessary, since high congestion can cause transactions to
remain unconfirmed for weeks.

Currently, when a transaction becomes “stuck in the mempool” due to a low fee,
a user’s options include BIP 125 [Replace By Fee
(RBF)](https://bitcoinops.org/en/topics/replace-by-fee/) (creating a
higher-fee transaction spending the same inputs) or [Child Pays for Parent
(CPFP)](https://bitcoinops.org/en/topics/cpfp/) (spending the transaction’s
outputs in a new, higher-fee child transaction, increasing the overall feerate
of the two transactions). RBF is not possible in multi-party, possibly
adversarial situations since it requires signing a new transaction -- it’s
unlikely that someone trying to steal from you would agree to co-sign a
transaction to prevent it.

In general, CPFP is our best choice in fee-bumping transactions that we are
unable to revise, such as Lightning transactions or other multi-party
applications like [CoinJoin](https://bitcoinops.org/en/topics/coinjoin/). But
CPFP also currently has a restriction: while it can be used to fee-bump
transactions, the feerate of that package of transactions is only considered
after all the transactions in the package are _already_ in the mempool. Each
individual transaction in a package must pass validation and mempool policy, so
it’s impossible to use CPFP on a transaction that doesn’t already meet the
minimum mempool feerate. Right now, when mempools fill up and a user’s
transaction gets evicted, their only option is to wait for space to open up.

The design choice to evaluate packages only after individual transactions are
already in the mempool is a defensive one -- Bitcoin Core tries to expend as
few computational resources as possible on unverified transactions to
protect itself from DoS attacks. It’s also what makes package acceptance complex;
computationally intensive logic that helps users bump fees could also
potentially be abused by adversaries to stall Bitcoin Core nodes.

## Project Road Map

Our ultimate goal is [Package
Relay](https://bitcoinops.org/en/topics/package-relay/) -- relaying
transactions as packages on the P2P network. However, much of the early work
lies in our validation code and careful considerations around DoS before we
expose it to the P2P network. My plan is to introduce packages in small steps,
from relatively safer interfaces like RPC, before we make P2P protocol changes.

The [first reviewable chunk](https://github.com/bitcoin/bitcoin/pull/20833) of
work is introducing the concept of package mempool acceptance in Bitcoin Core
and enabling dry runs of it through the `testmempoolaccept` RPC. This feature
may be useful for contract protocols to test (but not submit) transaction
chains on Bitcoin Core nodes to ensure they are valid and meet mempool
policies.

The second step is to enable submitting packages to the mempool through an RPC.
This would be limited in terms of _new_ functionality, since the node would still
relay transactions individually. It would, however, provide us with a
relatively safe way to start testing out package mempool acceptance. Since RPC
is a privileged interface -- clients are either the node operator themselves or
otherwise permissioned to make requests to the node -- we can reason about and
empirically test DoS vectors without exposing nodes to attacks from unknown
network peers.

Finally, we’ll formally specify how to communicate packages on the P2P network
and what protocol changes would be most appropriate. Concerns here include
privacy (would we leak transaction origins through the way we construct
packages?), bandwidth (would this congest network traffic with redundant
information?), DoS (could peers exhaust our computational resources by sending
us large amounts of invalid transactions?), and backwards compatibility (does
this inhibit older nodes from participating fully?). 

You can follow my progress and day-to-day activities on
[Github](https://github.com/glozow/). I also plan to post updates throughout
the fellowship; you can get notified by subscribing to the newsletter
or following [@bitcoinbrink](https://twitter.com/bitcoinbrink)! :)
