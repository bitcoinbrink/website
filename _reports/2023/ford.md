# Michael Ford

![](img/michael-ford.jpg)

A Bitcoin Core contributor since 2012 and project maintainer since
2019, Michael is one of Brink's most senior developers.  In 2023, he
provided almost 1,600 review comments and helped lead the effort to
modernize Bitcoin Core's build system.  He was also the release manager
for every Bitcoin Core release in 2023.  He's often the first to comment
on a new pull request, and he's been praised by colleagues for his
"encyclopedic knowledge of everything that's happening in the project,"
allowing him to help coordinate disparate efforts across the project.

On behalf or our sponsors, Brink is pleased to be able to continue
funding Michael's essential engineering work.

## Review

> A lot of my reviews are just churning through uninteresting day-today
> PRs/changes. For example, minor code refactors, CI fixes,
> documentation changes etc.

A major software project consists of a million moving parts that each
occasionally wear down, fall out of alignment, or need to be replaced
with a newer version.  Almost nobody ever writes or talks about that
low-level of background maintenance, but if it ever stops being
performed, the whole machine will quickly start to tear itself apart and
no further progress will be made.

150 years ago, the person responsible for maintaining all of the parts
of a moving train engine was called an engineer, and we don't think
anyone earns the title of _software engineer_ more than people like
Michael who get their hands dirty every day by quietly taking care of
all the live maintenance that a major open source project needs to be
successful.  The public will almost never hear about an engineer who
does their job well, but engineers like Michael are an essential part of
what makes possible every major accomplishment in the Bitcoin Core
project that you do hear about.

## Maintainer and release manager

> I merged 60% (586/962) of the PRs to Bitcoin Core last year. This
> involves having a birds eye view of the entire project day-to-day.
> Keeping tabs of what has been reviewed, and by who, what is ready for
> merge (and what it may conflict with), and what the merge order of
> changes should be.
>
> All Bitcoin Core releases were put together by me last year (23.2,
> 24.1, 25, 25.1, 24.2, 26.0). I spend about 20-30% of my time making
> sure the projects continues to release software to Bitcoin Core users.

The Bitcoin Core project has a rule that each pull request needs to be
receive several "ACKs" from qualified reviewers before it gets merged
and the code is changed for the next release.  It's up to maintainers to
review the reviews of pull requests and decide if a pull request has
received high-quality review and if it's in line with the project's
philosophy and goals.

This can be an especially thankless job.  Advocates for a pull request
will complain that maintainers are taking too long to merge, while
critics of the same pull request will complain if they think it was
merged prematurely.  Many arguments between well-meaning advocates and
critics come down entirely to difficult-to-compare sets of tradeoffs,
often in cases where not merging a pull request is just as much of an
expressed choice as choosing to merge it.

But even for unexciting pull requests, being a maintainer takes a
significant amount of time away from a developer's own projects.  Being
a maintainer is a commitment to working on other people's projects, even
people who are sometimes unappreciative of the maintainer's time and
effort.

Through these incredible stats---over 11 careful merges per week, every
week, for all of 2023, plus release management for two major and four
minor releases---we again see Michael's commitment to helping other
developers achieve their goals.

> The project got numerous bug/security issue reports (multiple emails a
> day) and fixed those bugs in major and minor releases. Generally I
> consider this a success, because:
>
> - There were no major incidents involving the network, throughout the
>   year.
> - As far as I’m aware, none of those bugs have leaked/been discovered.
> - No issues remained untriaged, although some have not yet been
>   patched in a release.

In addition to his regular maintainer duties, Michael serves on Bitcoin
Core's security sub-project where he helps triage and quietly resolve
bugs that affect user safety and security.  As quoted above, he describes
this as a "general success", although we think Bitcoin Core's security
track record can currently be qualified as an _extraordinary success_.

## Toolchain modernization

> Good progress to modernise our toolchains, but still work to do.  LLD
> work is almost done, now mostly just stalled on Qt (the GUI).  GCC
> release compiler upgrade is blocked on determinism issues. This just
> needs more time spent.  C++20 was nice, and we are already seeing the
> benefits of that migration.  CMake work has progressed to a point
> where it’s usable, but is still blocked on final architecture
> decisions.

Bitcoin Core is not only compiled software but software that aims to be
compiled deterministically---meaning everyone who compiles a release
version should be able to obtain identical executables.  This is
essential to minimizing trust in the release manager or any particular
developer.  Anyone who compiles the software themselves can verify that
the executables being served from BitcoinCore.org are identical,
ensuring users are receiving the actual code that's been so
painstakingly reviewed and tested.

However, Bitcoin Core's determinism and need to run on a wide range of
platforms brings a variety of challenges.  The build system is
complicated and changes that seem like simple improvements in one area
can cause confusing problems in other areas.  Additionally, Bitcoin Core
needs to continue to support some code that was originally designed
15 years ago, such as code for the legacy wallet.

Bitcoin Core's build system only works well because of continued
contributions by Michael and a handful of colleagues who quietly work on
this area of the code that almost never receives any publicity.

## Plans for 2024

> Linux release compiler upgraded to GCC 12 or 13, finish the macOS LLD
> migration (completing a 3-year project that allows us to drop Apple's
> semi-open source tools entirely, simplifying our own toolchain, and
> removing reliance on poorly maintained upstream projects), move
> Windows builds from GCC to Clang, get fully static release builds
> done, CMake migration completed (probably for Bitcoin Core 29.x), and
> initial Rust integration into Bitcoin Core (somewhat of a pipedream,
> but the migration of the project towards Rust, would seem inevitable).

In additional to continuing as a maintainer and frequent release
manager, Michael has multiple ambitious for further modernizing and
improving Bitcoin Core's build tools.  Several of these changes improve
safety by replacing custom code and tools with standard libraries and
tools.

\vspace{10pt}
\begin{mdframed}[backgroundcolor=blue!10]

Want to work with Michael?  Brink is looking to hire an additional
full-time build-system engineer in 2024, preferably someone to work
directly with Michael in our London office.  Compensation amount is based on
experience and qualifications.  We will pay for any required work visa.
Apply at https://brink.dev/programs

\end{mdframed}
