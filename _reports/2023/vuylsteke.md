# Stéphan Vuylsteke

![](img/stephan-vuylsteke.jpg)

Stéphan joined Brink part-time in 2022 while continuing to provide
education and mentorship through Qala.  He now works almost full time
for Brink, providing reviews of Bitcoin Core pull requests.  He
continues to help new developers through office hours with Qala, hosting
the London BitDevs, and co-maintaining the Bitcoin Core PR Review Club.

On behalf or our sponsors, Brink is pleased to be able to continue
funding Stéphan's careful reviews and ongoing educational initiatives
for another year.

## Reviews

> I try to spend a good chunk of my time on PRs (on various parts of the
> codebase) that are quite self contained, important to the project, and
> have good enough momentum to reasonably be able to be merged. I try to
> focus on going in-depth while providing quick re-review to prevent the
> PR from losing momentum.

Almost 600 review comments were left by Stéphan in 2023.  One of his
peers remarked, "something I really appreciate about Stéphan, which is
somewhat rare in Bitcoin Core: if he reviews something, he does
re-reviews very quickly, and he sticks with it until it's merged.
Afterward, he'll open followups to fix remaining issues, write tests,
etc. If you tag him for review on areas of the code he is familiar with,
he is very reliable."

> For the release of v26, I have focused mostly on the libbitcoinkernel
> project. This was quite a new area for me to explore, requiring me to
> dig quite deep for each PR.

Bitcoin Core's [libbitcoinkernel][#27587] sub-project, originally
championed by Carl Dong and extensively worked on by several other
developers, has been carefully refactoring Bitcoin Core's code to
separate consensus logic from any other code.  In an idealized form of
the Bitcoin system, each full node verifies every block of transactions
using exactly the same consensus rules, all of them coming to exactly
the same conclusion about whether the block is valid or not.  This
allows each node, acting independently from every other node, to come to
consensus without depending on voting or any other process that's
vulnerable to manipulation.

This idealized process only works if every node actually does use
_exactly_ equivalent consensus code.  When they don't, serious bugs can
result---for an example, see the section of this report that describes
Niklas Gögge's discovery of a vulnerability in the btcd alternative
full node.  Ensuring that different versions of Bitcoin Core remain
compatible with each other makes it imperative to ensure that any change
to consensus code is obvious to developers (and to users who audit the
developers' work), and that the changes are well reviewed.  The
libbitcoinkernel sub-project makes this easier by working to clearly
separate consensus code from other code used for other purposes.

The separation of consensus code from other code also requires the
creation of a clean interface between the two, which may eventually
allow other programs to interface with the exact consensus code Bitcoin
Core uses.  For example, it could be possible for future versions of
btcd to validate new blocks both with their own code and with
libbitcoinkernel, allowing them to warn their users when an
incompatibility was discovered, rather than risking falling out of
consensus.

Despite the long-term importance of the libbitcoinkernel project, it's
always a challenge to attract and retain attention on refactoring-type
projects that don't deliver any immediate benefits for users and rarely
receive headlines.  That makes it especially useful to have reviewers
like Stéphan whose fast reviews and re-reviews help pull requests
maintain momentum and get merged without becoming stale.

## Educational projects

> Since my previous grant application in May 2023, my educational
> efforts have mostly revolved around: hosting the monthly London
> BitDevs, with an attendance of usually at least 15-20 people every
> month; become a project co-maintainer of the Bitcoin Core PR Review
> Club alongside Gloria [Zhao]; built [VS
> Core](https://github.com/stickies-v/vs-core) to help new developers or
> experienced "drive-by" contributors quickly get up and running with a
> Bitcoin Core development environment; contributed to various
> discussions about how to improve open source education curricula,
> mostly stemming from my experience with and focusing on Qala; helped
> Max Edwards with the v26 RC Testing guide.

When Stéphan first came to Brink, part of his time was spent working on
Bitcoin developer education with [Qala][].  He's maintained a strong
commitment on helping educate new developers, which has always been a
great fit with Brink's focus on increasing the capabilities of open
source contributors.

The Bitcoin Core Pull Request (PR) Review Club meets online regularly to
help less experienced developers gain experience reviewing a current or
recently-merged Bitcoin Core pull request.  More experienced developers
such as Stéphan are available to answer questions and suggest how
reviewers can make the most of their effort.

Stéphan also created a project this year that allows anyone who uses the
VS Code integrated development environment to automatically set up a
build environment for working on Bitcoin Core in an isolated container.
Normally, creating a build environment requires carefully following a
[detailed setup guide][].  Stéphan's VS Code extension makes it much
easier for new contributors to get a little experience with Bitcoin
Core, or for already experienced open source contributors to simply fix
an issue themselves (and hopefully submit the fix as a pull request)
rather than opening an issue that some other developer will need to
reproduce and fix.

## Plans for 2024

> I plan to largely continue contributing like I have in 2023, focusing
> on one or two priority projects that require deeper knowledge and
> continued commitment. Current projects that I'm interested in are
> multiprocess, package relay, and cluster mempool, but most importantly
> I try to focus on where my help is best used---which is difficult to
> predict in advance

Stéphan's ability to provide fast and comprehensive review will remain in
high demand in 2024.  We will describe in detail the importance of
work on package relay and cluster mempool in the section of this report
about Brink engineer Gloria Zhao, but we will briefly note here that
those projects that Stéphan plans to focus on are also the top two
projects [voted on][#29465] by Bitcoin Core contributors for the version
28 release planned for late 2024.  They will definitely benefit from as
much review as possible.

[Multiprocess][#28722] is a project championed by Russell Yanofsky for
many years now, and it's one that many contributors continue to strongly
support.  The goal is to clearly separate the operation of Bitcoin Core
as a node, as a wallet, and as a GUI.  In other words, each of those
parts of Bitcoin Core should be able to run in a separate process, with
them communicating with each other over a clearly defined interface
(API).

If such an API becomes stable, it should be possible for external
software to substitute for any part.  For example, instead of using the
default GUI, you could use an alternative GUI (for example, the QML GUI
being worked on by Brink engineer Hennadii Stepanov), allowing users of
that alternative GUI to continue benefiting from Bitcoin Core's
predominant node implementation and highly-reviewed wallet.
Alternatively, an experimental new wallet could be substituted for
Bitcoin Core's default wallet.

Multiprocess may eventually allow the node, the wallet, and the GUI to
be split into completely separate repositories to be maintained by
different sets of developers, each with their own development
priorities. This is similar to how other aspects of Bitcoin that were
originally handled directly by Bitcoin Core (e.g. proof-of-work hashing)
are now developed separately and managed using external tools.  This
separation of concerns can help node developers focus on providing the
best possible node---a node that's as easy as possible for everyone in
Bitcoin to run.

As a project that's important long term, but never urgent, multiprocess
is always in need of additional reviewers that can help give pull
requests momentum towards being merged.  Whether on multiprocess,
package relay, or cluster mempool, we're excited to see how much
critical review Stéphan will be able to perform in 2024.

[#27587]: https://github.com/bitcoin/bitcoin/issues/27587
[qala]: https://builders.btrust.tech/
[detailed setup guide]: https://github.com/bitcoin/bitcoin/blob/master/doc/build-unix.md
[#28722]: https://github.com/bitcoin/bitcoin/issues/28722
[#29465]: https://github.com/bitcoin/bitcoin/issues/29465
