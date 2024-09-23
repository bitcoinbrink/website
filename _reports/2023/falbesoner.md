# Sebastian Falbesoner

![](img/sebastian-falbesoner.jpg)

Brink has been funding Sebastian since 2021 for his part time
review-focused work.  During the year, he left over 300
review comments, most of them focused on pull requests for [BIP324][]
version 2 encrypted peer-to-peer transport---a protocol improvement that
greatly increases user privacy and can also improve security.

On behalf or our sponsors, Brink is pleased to be able to continue
funding Sebastian for a third year (all of 2024) and to provide him an
open-ended offer to upgrade to a full-time engineer role either this year or
the beginning of 2025.

## Review and testing

> Fortunately, the [BIP324] project progressed very smoothly last year
> (faster than I personally expected) and [v2 transport protocol][topic
> v2 p2p transport] support is available since release v26.0, as
> default-off option. It will be default-on with the next release v27.0.
>
> I helped reach this goal by providing thorough code reviews and
> testing both for the PRs implementing the cryptographic primitives
> ([#27985][], [#27993][], [#28008][]), the actual changes in the
> network layer ([#28165][], [#28196][]) and the final
> signalling/integration ([#28331][]).  In parallel, I reviewed the
> corresponding changes in the functional test framework ([#24005][],
> [#26222][], [#28374][], [#24748][]).

Adding support for encrypted peer connections has long been on the
wishlist of many developers, and contributors to the Bitcoin Core
project [voted it][26.0 priorities] as a high priority for the 26.0
release.  Although the original Bitcoin protocol uses cryptographic
functions such as signatures and hash digests, it did not use
encryption, so an encryption algorithm needed to be selected and then integrated
into Bitcoin Core.  Further, the peer-to-peer (P2P) protocol needed to be
upgraded to allow negotiating encrypted connections in a way that was
backwards-compatible with older unencrypted connections.  Several
optimizations were also made for upgraded connections at the same time.

All of that required careful review.  In most software, connection
problems lead, at worst, to frustrated users.  But Bitcoin nodes that
can't reliably connect to peers may be vulnerable to problems such as
[eclipse attacks][topic eclipse attacks]. Additionally, a failure to
correctly implement encryption may put users at risk of an unexpected
privacy loss.

Sebastian carefully reviewed pull requests that affected Bitcoin Core's
P2P code, its tests, and its libsecp256k1 dependency.  Other
contributors told us how much they appreciated his fast reviews and
re-reviews, and how that helped the project to maintain momentum and
achieve the goal of being included in 26.0.  As we're writing this
report, we are only days away from BIP324 encryption being enabled by
default in the upcoming 27.0 release---a testament to the work of many
different Bitcoin Core contributors, including Sebastian.

Press:

- Brink Renews Grant for Sebastian Falbesoner's Review of BIP324 to Enhance Bitcoin's Censorship-Resistance - **Bitcoin Magazine** [¶](https://bitcoinmagazine.com/technical/brink-renews-grant-for-sebastian-falbesoners-review-of-bip324)
- Bitcoin Core adds optional support for v2 encrypted P2P connections - **Bitcoin Optech Newsletter #272** [¶](https://bitcoinops.org/en/newsletters/2023/10/11/#bitcoin-core-28331)
- Bitcoin Core #29347 enables v2 P2P transport by default - **Bitcoin Optech Newsletter #288** [¶](https://bitcoinops.org/en/newsletters/2024/02/07/#bitcoin-core-29347)

## Libsecp256k1

> In the course of reviewing the ElligatorSwift [key negotiation] part
> of BIP324, I dug deeper into libsecp2561 and started contributing
> there. Several PRs were opened in the categories of improving
> documentation ([#1340][], [#1341][]), various refactoring and cleanups
> ([#1339][], [#1357][], [#1393][]), but also adding exhaustive test
> coverage for secp256k1-ellswift ([#1371][]), and some mild performance
> improvements by tightening group magnitude limits ([#1344][],
> [#1348][]).

The libsecp256k1 library is the dependency Bitcoin Core and many other
Bitcoin-focused programs rely on for multiple cryptographic operations.
Many developers find it to be a very intimidating piece of software.
Sebastian not only took on the challenge of reviewing code there this
year in order to help advance the BIP324 project, but he continued
contributing there afterwards.  We at Brink are very excited to see
this: it's hard to find contributors to libsecp256k1 and it's essential
to the long-term safety of Bitcoin that we have a number of experienced
contributors.

Press:

- Libsecp256k1 #1129 implements the ElligatorSwift technique for establishing v2 P2P connections - **Bitcoin Optech Newsletter #257** [¶](https://bitcoinops.org/en/newsletters/2023/06/28/#libsecp256k1-1129)

## Plans for 2024

> Silent Payments is the project where I want to invest most of my
> energy in the next grant period; the only change is that the focus
> shifts exclusively on the libsecp256k1 side of it right now, as any
> work on Bitcoin Core directly depends on that.

[Silent payments][topic silent payments], originally proposed by Ruben
Somsen and co-championed by Josie Baker, is a new type of Bitcoin
address that can be reused for multiple payments without creating any
link between those payments onchain.  This is a significant improvement
over most existing Bitcoin addresses where sending multiple payments to
the same address creates a strong link between them that [reduces the
privacy][topic output linking] of the spender, the receiver, and the
people who later receive payments from the receiver.

Silent payments requires wallets perform more work than is required for
most address types, but it's mostly work that full nodes already
perform, so it makes particular sense for an initial silent payment
implementation to be made for Bitcoin Core's wallet.  If it's successful
and people begin using it, silent payments could easily spread to other
wallets just as other recent innovations have spread from Bitcoin Core's
wallet to other wallets (such as [PSBTs][topic psbt], [miniscript][topic
miniscript], and [output script descriptors][topic descriptors]).

Silent payments does require a different type of cryptography than is
used in Bitcoin Core today, so some of the work to add support for it is
being done in Bitcoin Core's cryptographic library, libsecp256k1.
As noted in a previous section, Sebastian has already built a strong
familiarity with this library, so he's well poised to help make and
review further improvements.

> My other priorities for the year will be package relay and legacy wallet removal.

[Package relay][topic package relay], in its initial planned version,
will allow two related transactions to be considered as a package
rather than as two independent transactions.  This enhances the
child-pays-for-parent ([CPFP][topic cpfp]) fee bumping mechanism already
used on Bitcoin by allowing even very-low-feerate parent transactions to
get confirmed alongside a high-feerate child.

CPFP fee bumping is critical to the security of several time-sensitive
contract protocols, such as Lightning Network.  Certain Lightning
transactions have to be created and signed long before they're
broadcast.  If they're created with a high feerate but feerates are low
when they're broadcast, the user will lose money by overpaying fees.  If
they're created with a low feerate but feerates are high when they're
broadcast, nodes will discard them in order to prevent excess use of
their memory, making it impossible to fee bump them with CPFP.  Package
relay avoids that problem and makes Lighting and other contract
protocols more secure by allowing a low-feerate transaction to be
bundled with a high-feerate child transaction, evaluating them as a
group under the CPFP rules.

Bitcoin Core's legacy wallet dates (in part) back to the original
Bitcoin 0.1 code release in 2009.  Wallets since then have evolved in
many ways, including the adoption of [BIP32 HD wallets][topic bip32] and
Bitcoin Core's recent switch to descriptor-based wallets.  Currently,
Bitcoin Core supports both old (legacy) wallets and newer (descriptor)
wallets, with a set of tools that will help a user convert from legacy
to descriptors.  The plan is to drop legacy wallet support in a future
release.  Anyone who still has a legacy wallet will still be able to run
an old release (offline if desired), convert to a descriptor wallet, and
use that descriptor wallet with a current Bitcoin Core release.

Adding support for package relay and carefully removing legacy wallet
code will require diligent reviews, which Sebastian has proven time and
again is something he can provide.

[BIP324]: https://github.com/bitcoin/bips/blob/master/bip-0324.mediawiki
[#27985]: https://github.com/bitcoin/bitcoin/pull/27985
[#27993]: https://github.com/bitcoin/bitcoin/pull/27993
[#28008]: https://github.com/bitcoin/bitcoin/pull/28008
[#28165]: https://github.com/bitcoin/bitcoin/pull/28165
[#28196]: https://github.com/bitcoin/bitcoin/pull/28196
[#28331]: https://github.com/bitcoin/bitcoin/pull/28331
[#24005]: https://github.com/bitcoin/bitcoin/pull/24005
[#26222]: https://github.com/bitcoin/bitcoin/pull/26222
[#28374]: https://github.com/bitcoin/bitcoin/pull/28374
[#24748]: https://github.com/bitcoin/bitcoin/pull/24748
[v2 p2p transport]: https://bitcoinops.org/en/topics/v2-p2p-transport/
[26.0 priorities]: https://bitcoin-irc.chaincode.com/bitcoin-core-dev/2023-05-04#919409;
[topic eclipse attacks]: https://bitcoinops.org/en/topics/eclipse-attacks/
[#1340]: https://github.com/bitcoin-core/secp256k1/pull/1340
[#1341]: https://github.com/bitcoin-core/secp256k1/pull/1341
[#1339]: https://github.com/bitcoin-core/secp256k1/pull/1339
[#1357]: https://github.com/bitcoin-core/secp256k1/pull/1357
[#1393]: https://github.com/bitcoin-core/secp256k1/pull/1393
[#1371]: https://github.com/bitcoin-core/secp256k1/pull/1371
[#1344]: https://github.com/bitcoin-core/secp256k1/pull/1344
[#1348]: https://github.com/bitcoin-core/secp256k1/pull/1348
[topic silent payments]: https://bitcoinops.org/en/topics/silent-payments/
[topic output linking]: https://bitcoinops.org/en/topics/output-linking/
[topic psbt]: https://bitcoinops.org/en/topics/psbt/
[topic miniscript]: https://bitcoinops.org/en/topics/miniscript/
[topic descriptors]: https://bitcoinops.org/en/topics/output-script-descriptors/
[topic package relay]: https://bitcoinops.org/en/topics/package-relay/
[topic cpfp]: https://bitcoinops.org/en/topics/cpfp/
[topic bip32]: https://bitcoinops.org/en/topics/hd-key-generation/
[topic v2 p2p transport]: https://bitcoinops.org/en/topics/v2-p2p-transport/
