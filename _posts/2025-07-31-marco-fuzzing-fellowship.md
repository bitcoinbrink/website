---
title: "Marco's fuzzing fellowship followup"
permalink: /blog/2025/07/31/marco-fuzzing-fellowship/
layout: post
author: brink
name: "brink"
image: /assets/images/marco-de-leon.png
alt: Marco De Leon recounts his experiences and accomplishments during his year long fellowship.
category: "News"
description: Marco De Leon recounts his experiences and accomplishments during his year long fellowship.
---
<div class="header-images">
  <img src="/assets/images/marco-de-leon.png" alt="Marco De Leon celebrates his year as a Brink fellow">
</div>

Last year, Brink announced [Marco De Leon would join us][blog marco
announcement] in London for a year long [fellowship][fellowship] with Niklas
Gögge as his mentor. Today we celebrate not only all that he accomplished in the
last year, but also that we are excited to continue support for him full-time as
a Bitcoin Core engineer.

Marco writes of his Brink fellowship experiences:

This past year, I had the awesome opportunity to work on Bitcoin Core as a
fellow, sponsored by Brink. Like many people, my initial fascination with
Bitcoin came from its philosophical and economic implications. But the more I
learned, the more I realized that to truly grasp it at the level I wanted, I
would have to understand the code underlying the network. The idea of diving
into a codebase as critical and complex as Bitcoin Core's was intimidating, and
frankly, I was a bit worried I didn't have enough experience to contribute
meaningfully. The fellowship provided the perfect bridge. It gave me a path to
receive mentorship and guidance from an experienced developer ([dergoegge][]),
allowing me to learn how to make valuable contributions and build my confidence
along the way.

My fellowship proposal was centered on using fuzz testing as my primary tool,
and this became the foundation of my work. [Fuzzing][blog fuzzing] is a software testing
technique where the target code is automatically provided with random and
unexpected data to see if it crashes or behaves incorrectly. What I quickly came
to appreciate is that to fuzz code effectively, you first have to understand
the code—its inputs, its outputs, and the invariants it's supposed to maintain. This
process of learning the code in order to break it proved to be an effective way
to build a mental model of the system from the ground up.

My mentor, Niklas, was instrumental here. He not only guided me through some of
the more technical aspects of how fuzzing works, but was also there to answer my
many (and I mean many) questions about the details of Bitcoin Core. He provided
me with crucial direction from the start, helping me learn how to identify what
makes for a valuable contribution and pointing me toward areas of the codebase
where my efforts would be most impactful.

This guidance led me to one of my first contributions, reviving and improving
the [fuzz test for the headers pre-sync][github fuzz presync] logic. This test
served as my hands-on introduction to the peer-to-peer code. In order to
properly test the specific logic I was targeting, I first had to learn how we
construct and deliver the various network messages that would trigger it,
essentially simulating the P2P communication between nodes from scratch. Adding
this fuzz target to our testing suite provided me with an initial understanding
of how a node receives, processes, and validates data from its peers. It also
ended up being the final piece needed to give the project the confidence to
[remove the longstanding mainnet checkpoints][github remove checkpoints].

I’ve found that one of the best uses of fuzzing in a project as large as Bitcoin
Core is its ability to act as an automated line of defense, catching subtle bugs
and [security vulnerabilities][CVE-2024-35202] before the code is even merged into the master
branch. It makes the entire review process more robust. I applied this
testing-focused perspective when helping to review the new orphanage
implementation. As a fellow, tackling a review of this size, over various PRs,
was a great way to get more comfortable navigating the codebase. It was an
exercise in tracing logic across different parts of the P2P code and
understanding how all the different components connect.

As I grew more comfortable with the code, I was able to take on a different kind
of task: [a larger refactoring project][github type safety]. The goal was to improve type safety by
replacing the generic uint256 type with the more specific Txid and Wtxid types
wherever possible. This improves the maintainability of the codebase by letting
the compiler catch any potential txid/wtxid mix-ups. It was the first project I
worked on that touched dozens of files, and it taught me how to break a large,
cross-cutting change into a series of smaller, manageable commits. Not only is
the code now more robust, but the process even helped uncover one minor,
pre-existing bug.

Looking back, my main goals for the fellowship were to develop a solid mental
model of how a Bitcoin node works and to get comfortable enough to navigate and
contribute to Bitcoin Core’s massive codebase. I can confidently say I’ve
achieved that. My experience has been overwhelmingly positive, and I owe a huge
thanks to multiple other developers who have helped me along the way, especially
Niklas. Going forward, I’d like to keep expanding my knowledge of the P2P and
validation code, which will allow me to review more substantial and critical
pull requests. Fuzzing will, of course, remain a central part of my work. I’m
looking to help Niklas improve [fuzzamoto][], as this will likely help us uncover even more subtle bugs in
consensus-critical parts of the codebase. I’ve been given a great foundation
this last year through the fellowship, and I’m excited to continue my journey as
a contributor.

## About Brink

Brink is a Bitcoin research and development centre, founded in 2020 to support
independent open source protocol developers and mentor new contributors. Find
out more about our [grants][] and [fellowship][] programs, and how to [support
us][].

[marco github]: https://github.com/marcofleon
[marco twitter]: https://x.com/macrohead7
[blog marco announcement]: /blog/2024/08/01/marco/
[dergoegge]: https://github.com/dergoegge/
[blog fuzzing]: /blog/2023/07/14/fuzzing/
[github fuzz presync]: https://github.com/bitcoin/bitcoin/pull/30661
[github remove checkpoints]: https://github.com/bitcoin/bitcoin/pull/31649
[CVE-2024-35202]: https://bitcoincore.org/en/2024/10/08/disclose-blocktxn-crash/
[github type safety]: https://github.com/bitcoin/bitcoin/pull/32189
[fuzzamoto]: https://github.com/dergoegge/fuzzamoto
[grants]: /programs#grants
[fellowship]: /programs#fellowship
[support us]: /donate
