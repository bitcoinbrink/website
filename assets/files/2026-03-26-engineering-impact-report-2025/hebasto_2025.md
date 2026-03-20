# Bitcoin Core Contributions by @hebasto (2025-01-01 to 2025-12-31)

## Summary

- **Total PRs:** 152
- **Merged:** 106 (69%)
- **Open:** 9
- **Closed (not merged):** 37
- **Total commits:** 249
- **Lines added:** 58,164
- **Lines deleted:** 90,375

## By Component

- **Build system:** 83
- **Tests:** 24
- **Other:** 20
- **Docs:** 15
- **GUI:** 4
- **Wallet:** 3
- **Utils/log/libs:** 2
- **P2P:** 1

## Pull Requests

### ❌ [#31595](https://github.com/bitcoin/bitcoin/pull/31595) qa: Ensure consistent use of decimals instead of floats

- **Status:** closed
- **Created:** 2025-01-02
- **Component:** Tests
- **Changes:** +205 / -186 lines in 28 files
- **Commits:** 2
- **Review comments:** 6
- **Reviewers:** @l0rinc, @mzumsande

Updates functional tests to use decimal numbers instead of floats to fix test failures on NetBSD with newer Python versions.

*Note: The following is AI-generated interpretation:*
This change likely ensures more consistent test behavior across different operating systems and Python versions, which may help maintain the reliability of Bitcoin Core's testing infrastructure and reduce platform-specific CI failures.

### ❌ [#31597](https://github.com/bitcoin/bitcoin/pull/31597) ci: Switch to latest macOS and Windows images

- **Status:** closed
- **Created:** 2025-01-03
- **Component:** Tests
- **Changes:** +5 / -5 lines in 1 files
- **Commits:** 1
- **Review comments:** 3
- **Reviewers:** @maflcko

Updates CI infrastructure to use the latest macOS and Windows images, including upgrading to Xcode 16.2.

*Note: The following is AI-generated interpretation:*
Using updated CI images likely ensures Bitcoin Core is tested against more recent system dependencies and compiler versions, which may help catch compatibility issues earlier and maintain support for modern operating systems.

### ❌ [#31613](https://github.com/bitcoin/bitcoin/pull/31613) depends, NetBSD: Fix `bdb` package compilation with GCC-14

- **Status:** closed
- **Created:** 2025-01-06
- **Component:** Build system
- **Changes:** +1 / -0 lines in 1 files
- **Commits:** 1

Fixes compilation issues with the Berkeley DB package when building with GCC-14 on NetBSD 10.

*Note: The following is AI-generated interpretation:*
This fix appears to ensure Bitcoin Core can be built with newer compiler versions on NetBSD, which may help maintain broader platform compatibility and support for users running Bitcoin Core on diverse Unix-like systems.

### ✅ [#31617](https://github.com/bitcoin/bitcoin/pull/31617) build, test: Build `db_tests.cpp` regardless of `USE_BDB`

- **Status:** merged
- **Created:** 2025-01-07
- **Merged:** 2025-01-09 (open 2 days)
- **Component:** Wallet
- **Changes:** +3 / -6 lines in 2 files
- **Commits:** 1
- **Reviewers:** @theuni

Ensures database tests are built and run for both BDB and SQLite wallets, regardless of the USE_BDB configuration setting.

*Note: The following is AI-generated interpretation:*
This change likely improves test coverage by ensuring SQLite wallet tests run even when BDB is disabled, which may help catch wallet-related bugs and ensure both wallet database backends are properly validated.

### ✅ [#31626](https://github.com/bitcoin/bitcoin/pull/31626) depends: Use base system's `sha256sum` utility on FreeBSD

- **Status:** merged
- **Created:** 2025-01-09
- **Merged:** 2025-01-17 (open 8 days)
- **Component:** Build system
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Review comments:** 8
- **Reviewers:** @davidgumberg, @l0rinc, @theuni

Modifies the build system to use FreeBSD's built-in sha256sum utility instead of requiring the separately-installed shasum tool.

*Note: The following is AI-generated interpretation:*
This change likely reduces build dependencies on FreeBSD by using base system utilities, which may make Bitcoin Core easier to build on FreeBSD systems without requiring additional package installations.

### ✅ [#31627](https://github.com/bitcoin/bitcoin/pull/31627) depends: Fix spacing issue

- **Status:** merged
- **Created:** 2025-01-09
- **Merged:** 2025-01-10
- **Component:** Build system
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Reviewers:** @sedited, @theuni

Fixes a spacing issue in the build system where a missing space caused AR and NM variables to be incorrectly concatenated, leading to build failures.

*Note: The following is AI-generated interpretation:*
This likely prevents build failures that could block developers from compiling Bitcoin Core, which may help maintain development velocity and reduce frustration for contributors working on the codebase.

### ✅ [#31661](https://github.com/bitcoin/bitcoin/pull/31661) depends: Override default build type for `libevent`

- **Status:** merged
- **Created:** 2025-01-15
- **Merged:** 2025-01-21 (open 6 days)
- **Component:** Build system
- **Changes:** +2 / -1 lines in 1 files
- **Commits:** 1
- **Review comments:** 3
- **Reviewers:** @fanquake, @thomasplantin

Overrides the default build type for the libevent dependency to prevent it from using -O3 optimization flags that conflict with Bitcoin Core's build configuration.

*Note: The following is AI-generated interpretation:*
This appears to ensure consistent optimization settings across the build, which may help maintain predictable performance characteristics and prevent potential issues from conflicting compiler flags that could affect Bitcoin Core's behavior.

### ✅ [#31662](https://github.com/bitcoin/bitcoin/pull/31662) cmake: Do not modify `CMAKE_TRY_COMPILE_TARGET_TYPE` globally

- **Status:** merged
- **Created:** 2025-01-15
- **Merged:** 2025-02-20 (open 36 days)
- **Component:** Build system
- **Changes:** +76 / -64 lines in 7 files
- **Commits:** 6
- **Review comments:** 30
- **Reviewers:** @TheCharlatan, @theuni

Modifies CMake configuration to avoid globally setting CMAKE_TRY_COMPILE_TARGET_TYPE, which affects how CMake's internal compilation checks behave.

*Note: The following is AI-generated interpretation:*
This likely improves the reliability of CMake's feature detection during configuration, which may help ensure that Bitcoin Core builds correctly across different platforms and environments by avoiding interference with CMake's internal compilation tests.

### ❌ [#31669](https://github.com/bitcoin/bitcoin/pull/31669) cmake: Introduce `WITH_PYTHON` build option

- **Status:** closed
- **Created:** 2025-01-16
- **Component:** Build system
- **Changes:** +10 / -13 lines in 1 files
- **Commits:** 1
- **Review comments:** 6
- **Reviewers:** @fanquake, @janb84, @maflcko

Introduces a WITH_PYTHON build option that makes the build fail by default when the required Python version is unavailable, rather than silently continuing without Python support.

*Note: The following is AI-generated interpretation:*
This appears to make build configuration more explicit and predictable, which may help developers catch missing dependencies early rather than discovering issues later when Python-dependent functionality is needed for Bitcoin Core development or testing.

### ✅ [#31709](https://github.com/bitcoin/bitcoin/pull/31709) cmake: Fail if `Libmultiprocess` is missing when `WITH_MULTIPROCESS=ON`

- **Status:** merged
- **Created:** 2025-01-22
- **Merged:** 2025-01-23
- **Component:** Build system
- **Changes:** +2 / -2 lines in 1 files
- **Commits:** 1
- **Reviewers:** @ryanofsky, @sedited, @vasild

Makes the build system fail explicitly when Libmultiprocess is missing but WITH_MULTIPROCESS=ON is specified, rather than continuing silently.

*Note: The following is AI-generated interpretation:*
This likely prevents configuration errors where users expect multiprocess support but don't have the required dependencies, which may help avoid runtime issues and make it clearer when Bitcoin Core's multiprocess features won't be available.

### ✅ [#31722](https://github.com/bitcoin/bitcoin/pull/31722) cmake: Copy `cov_tool_wrapper.sh.in` to the build tree

- **Status:** merged
- **Created:** 2025-01-23
- **Merged:** 2025-02-13 (open 20 days)
- **Component:** Build system
- **Changes:** +2 / -1 lines in 3 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @jimhashhq, @theuni

Fixes a build system issue where the coverage tool wrapper script wasn't available when running coverage analysis from different directories.

*Note: The following is AI-generated interpretation:*
This likely improves the developer experience by making code coverage analysis more reliable and accessible from any working directory, which may help maintainers better assess test coverage quality.

### ❌ [#31724](https://github.com/bitcoin/bitcoin/pull/31724) cmake: Fix `-pthread` flags presentation in summary

- **Status:** closed
- **Created:** 2025-01-23
- **Component:** Build system
- **Changes:** +12 / -1 lines in 1 files
- **Commits:** 1
- **Review comments:** 10
- **Reviewers:** @davidgumberg, @fanquake

Cleans up the CMake build summary output by removing raw generator expressions from the pthread flags display.

*Note: The following is AI-generated interpretation:*
This appears to improve the readability of build configuration summaries, which may help developers and CI systems better understand build settings and troubleshoot compilation issues.

### ❌ [#31726](https://github.com/bitcoin/bitcoin/pull/31726) ci: Replace `CMAKE_CXX_FLAGS` with `APPEND_CXXFLAGS`

- **Status:** closed
- **Created:** 2025-01-23
- **Component:** Tests
- **Changes:** +6 / -8 lines in 7 files
- **Commits:** 2
- **Review comments:** 4
- **Reviewers:** @maflcko

Changes the CI system to use APPEND_CXXFLAGS instead of CMAKE_CXX_FLAGS to ensure compiler flags are only applied during compilation, not linking.

*Note: The following is AI-generated interpretation:*
This likely prevents potential linking issues and ensures more precise control over when compiler flags are applied, which may help avoid subtle build problems in continuous integration.

### ❌ [#31764](https://github.com/bitcoin/bitcoin/pull/31764) cmake: Generate man pages at install time

- **Status:** closed
- **Created:** 2025-01-30
- **Component:** Build system
- **Changes:** +13 / -36 lines in 11 files
- **Commits:** 2
- **Review comments:** 2
- **Reviewers:** @fanquake

Modifies the build system to generate man pages automatically during installation using help2man, with this feature disabled by default.

*Note: The following is AI-generated interpretation:*
This likely streamlines the installation process by generating up-to-date documentation on-demand, which may help ensure users always have current manual pages that match their installed Bitcoin Core version.

### ❌ [#31765](https://github.com/bitcoin/bitcoin/pull/31765) cmake: Install man pages for configured targets only

- **Status:** closed
- **Created:** 2025-01-30
- **Component:** Build system
- **Changes:** +16 / -8 lines in 2 files
- **Commits:** 1
- **Review comments:** 5
- **Reviewers:** @BrandonOdiwuor, @stickies-v

Ensures that man pages are only installed for the specific Bitcoin Core components that were actually configured and built.

*Note: The following is AI-generated interpretation:*
This appears to prevent installation of documentation for disabled features, which may help avoid confusion and ensure users only receive relevant manual pages for their specific build configuration.

### ❌ [#31779](https://github.com/bitcoin/bitcoin/pull/31779) cmake: Improve safety and robustness during building `crc32c` subtree

- **Status:** closed
- **Created:** 2025-02-02
- **Component:** Build system
- **Changes:** +27 / -8 lines in 1 files
- **Commits:** 3
- **Review comments:** 3
- **Reviewers:** @fanquake

Improves the custom CMake build script for the crc32c library subtree to better handle upstream changes and prevent build issues.

*Note: The following is AI-generated interpretation:*
This likely helps ensure Bitcoin Core's build system remains stable and secure when the crc32c dependency is updated, potentially preventing subtle build failures or security issues from unnoticed upstream changes.

### ✅ [#31800](https://github.com/bitcoin/bitcoin/pull/31800) depends: Avoid using the `-ffile-prefix-map` compiler option

- **Status:** merged
- **Created:** 2025-02-05
- **Merged:** 2025-02-07 (open 1 days)
- **Component:** Build system
- **Changes:** +4 / -4 lines in 4 files
- **Commits:** 1
- **Reviewers:** @theuni

Removes the `-ffile-prefix-map` compiler option from all dependency packages to fix OSS-Fuzz build issues.

*Note: The following is AI-generated interpretation:*
This appears to resolve compatibility problems with fuzzing infrastructure, which may help maintain Bitcoin Core's continuous security testing and bug detection capabilities.

### ✅ [#31804](https://github.com/bitcoin/bitcoin/pull/31804) ci: Remove no longer needed `-Wno-error=documentation`

- **Status:** merged
- **Created:** 2025-02-05
- **Merged:** 2025-02-06
- **Component:** Tests
- **Changes:** +0 / -1 lines in 1 files
- **Commits:** 1

Removes an outdated compiler warning suppression flag that is no longer needed in CI builds.

*Note: The following is AI-generated interpretation:*
This likely helps clean up the build configuration and may allow legitimate documentation warnings to surface, potentially improving code documentation quality.

### ✅ [#31809](https://github.com/bitcoin/bitcoin/pull/31809) Prepare "Open Transifex translations for v29.0" release step

- **Status:** merged
- **Created:** 2025-02-06
- **Merged:** 2025-02-06
- **Component:** GUI
- **Changes:** +1283 / -1236 lines in 5 files
- **Commits:** 3
- **Reviewers:** @stickies-v

Prepares the codebase for opening Transifex translations for the v29.0 release according to the standard release process.

*Note: The following is AI-generated interpretation:*
This appears to enable international translation work for the next major release, which may help make Bitcoin Core more accessible to non-English speaking users worldwide.

### ✅ [#31869](https://github.com/bitcoin/bitcoin/pull/31869) cmake: Add `libbitcoinkernel` target

- **Status:** merged
- **Created:** 2025-02-14
- **Merged:** 2025-02-17 (open 2 days)
- **Component:** Build system
- **Changes:** +9 / -5 lines in 1 files
- **Commits:** 2
- **Review comments:** 2
- **Reviewers:** @BrandonOdiwuor, @TheCharlatan, @purpleKarrot, @theuni

Adds a `libbitcoinkernel` CMake target and renames the corresponding component for better consistency in the build system.

*Note: The following is AI-generated interpretation:*
This likely improves the developer experience when building Bitcoin's kernel library separately, which may facilitate future modularization efforts and make it easier for other projects to integrate Bitcoin's consensus logic.

### ✅ [#31880](https://github.com/bitcoin/bitcoin/pull/31880) cmake: Add optional sources to `minisketch` library directly

- **Status:** merged
- **Created:** 2025-02-16
- **Merged:** 2025-02-25 (open 9 days)
- **Component:** Build system
- **Changes:** +22 / -30 lines in 1 files
- **Commits:** 1
- **Reviewers:** @theuni

This PR improves the CMake build system by adding optional sources directly to the minisketch library and removing a workaround for a CMake bug.

*Note: The following is AI-generated interpretation:*
This change likely improves build system reliability and maintainability, which may help reduce compilation issues for developers and packagers building Bitcoin Core from source.

### ✅ [#31884](https://github.com/bitcoin/bitcoin/pull/31884) cmake: Make implicit `libbitcoinkernel` dependencies explicit

- **Status:** merged
- **Created:** 2025-02-16
- **Merged:** 2025-02-20 (open 4 days)
- **Component:** Build system
- **Changes:** +6 / -8 lines in 3 files
- **Commits:** 2
- **Reviewers:** @TheCharlatan, @theuni

This PR fixes two regressions in the CMake build system that were causing installation errors with the libbitcoinkernel component.

*Note: The following is AI-generated interpretation:*
This fix appears to be critical for developers and packagers who need to build and install the kernel library separately, which may be important for modular Bitcoin applications and testing infrastructure.

### ✅ [#31899](https://github.com/bitcoin/bitcoin/pull/31899) cmake: Exclude generated sources from translation

- **Status:** merged
- **Created:** 2025-02-18
- **Merged:** 2025-02-19 (open 1 days)
- **Component:** Build system
- **Changes:** +7 / -2 lines in 1 files
- **Commits:** 2
- **Reviewers:** @TheCharlatan, @pablomartin4btc

This PR excludes generated source files from the translation build target to fix compilation errors when building translations.

*Note: The following is AI-generated interpretation:*
This fix likely ensures that Bitcoin Core can be properly localized into different languages, which may help improve accessibility for non-English speaking users worldwide.

### ✅ [#31928](https://github.com/bitcoin/bitcoin/pull/31928) ci: Fix filtering out Qt-generated files from `compile_commands.json`

- **Status:** merged
- **Created:** 2025-02-21
- **Merged:** 2025-02-21
- **Component:** Tests
- **Changes:** +6 / -4 lines in 1 files
- **Commits:** 1
- **Reviewers:** @pablomartin4btc

This PR fixes the filtering of Qt-generated files from compile_commands.json and optimizes the order of operations in the CI build process.

*Note: The following is AI-generated interpretation:*
This change likely improves the efficiency of automated code quality checks and may help ensure that static analysis tools focus on relevant code rather than auto-generated files.

### ✅ [#31987](https://github.com/bitcoin/bitcoin/pull/31987) wallet: Replace "non-0" with "non-zero" in translatable error message

- **Status:** merged
- **Created:** 2025-03-04
- **Merged:** 2025-03-12 (open 8 days)
- **Component:** Wallet
- **Changes:** +2 / -2 lines in 2 files
- **Commits:** 1
- **Review comments:** 1
- **Reviewers:** @1440000bytes, @BrandonOdiwuor, @l0rinc, @laanwj, @yancyribbens

This PR changes "non-0" to "non-zero" in a wallet error message to avoid translation system warnings.

*Note: The following is AI-generated interpretation:*
This small text change likely improves the translation workflow and may help ensure more accurate localization of Bitcoin Core's user interface across different languages.

### ✅ [#32004](https://github.com/bitcoin/bitcoin/pull/32004) qt: 29.0 translations update

- **Status:** merged
- **Created:** 2025-03-05
- **Merged:** 2025-03-12 (open 6 days)
- **Component:** GUI
- **Changes:** +17573 / -4113 lines in 104 files
- **Commits:** 1
- **Review comments:** 19
- **Reviewers:** @achow101, @darosior, @fanquake, @glozow, @pablomartin4btc

Updates translations for the Bitcoin Core GUI as part of the 29.0 release process. This follows previous translation-related PRs and is required before the release branch is created.

*Note: The following is AI-generated interpretation:*
This likely improves accessibility for non-English speaking Bitcoin users by ensuring the GUI interface is properly translated in multiple languages for the 29.0 release, which may help expand Bitcoin adoption globally.

### ✅ [#32014](https://github.com/bitcoin/bitcoin/pull/32014) ci: Do not try to install for fuzz builds

- **Status:** merged
- **Created:** 2025-03-07
- **Merged:** 2025-03-07
- **Component:** Tests
- **Changes:** +2 / -2 lines in 2 files
- **Commits:** 1
- **Review comments:** 3
- **Reviewers:** @dergoegge

Modifies the continuous integration system to skip installation steps for fuzz builds across all CI configurations. This extends previous changes that were only applied to some fuzz builds.

*Note: The following is AI-generated interpretation:*
This appears to optimize the CI build process by avoiding unnecessary installation steps during fuzz testing, which may reduce build times and computational resources needed for automated testing.

### ✅ [#32019](https://github.com/bitcoin/bitcoin/pull/32019) cmake: Check for `makensis` and `zip` tools before using them for optional `deploy` targets

- **Status:** merged
- **Created:** 2025-03-07
- **Merged:** 2025-03-18 (open 10 days)
- **Component:** Build system
- **Changes:** +26 / -12 lines in 2 files
- **Commits:** 2
- **Review comments:** 7
- **Reviewers:** @fanquake, @hodlinator, @laanwj

Adds CMake checks to verify that required tools (`makensis` for Windows and `zip` for macOS) are available before attempting to build deployment targets. These tools are only checked when actually needed for deployment.

*Note: The following is AI-generated interpretation:*
This likely improves the developer experience by providing clear error messages when deployment tools are missing, which may help developers set up their build environment more efficiently and reduce configuration frustration.

### ✅ [#32027](https://github.com/bitcoin/bitcoin/pull/32027) cmake: Add `NO_CACHE_IF_FAILED` option for checking linker flags

- **Status:** merged
- **Created:** 2025-03-10
- **Merged:** 2025-03-27 (open 16 days)
- **Component:** Build system
- **Changes:** +6 / -1 lines in 2 files
- **Commits:** 1
- **Reviewers:** @fanquake

Adds a CMake option to avoid caching failed linker flag checks, specifically for sanitizer flags. This eliminates the need to manually clean the CMake cache when installing missing libraries.

*Note: The following is AI-generated interpretation:*
This appears to streamline the development workflow by automatically retrying configuration after dependencies are installed, which may reduce friction for developers working with sanitizer builds and debugging tools.

### ✅ [#32028](https://github.com/bitcoin/bitcoin/pull/32028) Update `secp256k1` subtree to latest master

- **Status:** merged
- **Created:** 2025-03-10
- **Merged:** 2025-05-13 (open 63 days)
- **Component:** Build system
- **Changes:** +11168 / -409 lines in 49 files
- **Commits:** 2
- **Reviewers:** @fanquake

Updates the secp256k1 cryptographic library subtree to the latest master branch, incorporating multiple recent changes and improvements to the elliptic curve cryptography implementation.

*Note: The following is AI-generated interpretation:*
This likely brings security improvements, performance optimizations, or bug fixes to Bitcoin's core cryptographic operations, which may enhance the reliability and efficiency of signature verification and key operations.

### ❌ [#32054](https://github.com/bitcoin/bitcoin/pull/32054) cmake, guix: Skip building tests in subtrees for releases

- **Status:** closed
- **Created:** 2025-03-13
- **Component:** Build system
- **Changes:** +12 / -10 lines in 4 files
- **Commits:** 2

Introduces a new BUILD_TEST_BINARY variable to allow building only the main test_bitcoin binary without building tests in subtree dependencies like secp256k1 and univalue for release builds.

*Note: The following is AI-generated interpretation:*
This change likely helps optimize release build times and resource usage by avoiding unnecessary compilation of dependency tests that aren't needed for production releases, which may improve the efficiency of the release process.

### ✅ [#32056](https://github.com/bitcoin/bitcoin/pull/32056) doc: Adjust path in comment

- **Status:** merged
- **Created:** 2025-03-13
- **Merged:** 2025-03-13
- **Component:** Docs
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Reviewers:** @dergoegge

Adjusts a file path in a comment that was missed in a previous pull request (#31161).

*Note: The following is AI-generated interpretation:*
This appears to be a simple documentation maintenance fix that likely ensures code comments accurately reflect the current file structure, which may help developers navigate the codebase more effectively.

### ✅ [#32132](https://github.com/bitcoin/bitcoin/pull/32132) build: Remove bitness suffix from Windows installer

- **Status:** merged
- **Created:** 2025-03-24
- **Merged:** 2025-03-27 (open 2 days)
- **Component:** Build system
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @hodlinator, @l0rinc, @laanwj

Removes the bitness suffix from Windows installer names since 32-bit Windows support has been dropped.

*Note: The following is AI-generated interpretation:*
This change likely simplifies the installation experience for Windows users by removing unnecessary version distinctions, and may help reduce confusion since Bitcoin Core no longer supports 32-bit Windows systems.

### 🔄 [#32162](https://github.com/bitcoin/bitcoin/pull/32162) depends: Switch from multilib to platform-specific toolchains

- **Status:** open
- **Created:** 2025-03-29
- **Component:** Build system
- **Changes:** +28 / -48 lines in 4 files
- **Commits:** 1
- **Review comments:** 11
- **Reviewers:** @BrandonOdiwuor, @laanwj, @maflcko

Switches the build system from using multilib GCC toolchains to platform-specific toolchains to resolve conflicts and improve cross-compilation capabilities.

*Note: The following is AI-generated interpretation:*
This change likely improves the developer experience by enabling simultaneous cross-compilation for multiple platforms and may help resolve package conflicts that could prevent successful builds on various target architectures.

### ✅ [#32182](https://github.com/bitcoin/bitcoin/pull/32182) ci: Switch to dynamic library linkage in native Windows job

- **Status:** merged
- **Created:** 2025-04-01
- **Merged:** 2025-04-03 (open 1 days)
- **Component:** Tests
- **Changes:** +4 / -3 lines in 1 files
- **Commits:** 1

Changes the native Windows CI job to use dynamic library linkage instead of static linkage, reducing the vcpkg binary cache size from 2.6 GB to 430 MB.

*Note: The following is AI-generated interpretation:*
This change likely improves CI performance by significantly reducing cache sizes and download times, which may help speed up the continuous integration process and reduce infrastructure costs for Bitcoin Core development.

### ✅ [#32184](https://github.com/bitcoin/bitcoin/pull/32184) ci: Add workaround for vcpkg's `libevent` package

- **Status:** merged
- **Created:** 2025-04-01
- **Merged:** 2025-04-01
- **Component:** Tests
- **Changes:** +2 / -2 lines in 1 files
- **Commits:** 2
- **Reviewers:** @pinheadmz

Adds a workaround for vcpkg's libevent package compatibility with CMake 4.0+ on Windows GitHub Actions images.

*Note: The following is AI-generated interpretation:*
This likely ensures that Bitcoin Core's continuous integration system remains functional on Windows as GitHub updates their build environments, which may help maintain reliable testing and development workflows.

### ✅ [#32194](https://github.com/bitcoin/bitcoin/pull/32194) ci, windows: Do not exclude `wallet_migration.py` in command line

- **Status:** merged
- **Created:** 2025-04-01
- **Merged:** 2025-04-02
- **Component:** Tests
- **Changes:** +2 / -2 lines in 1 files
- **Commits:** 1

Removes an unnecessary exclusion of the wallet_migration.py test from Windows CI command line that was causing a silent merge conflict.

*Note: The following is AI-generated interpretation:*
This appears to improve test coverage consistency across platforms and may help ensure that wallet functionality is properly validated on Windows systems, though the underlying test still needs fixes.

### ✅ [#32211](https://github.com/bitcoin/bitcoin/pull/32211) doc: Amend Qt 6 dependency packages for Ubuntu

- **Status:** merged
- **Created:** 2025-04-03
- **Merged:** 2025-04-03
- **Component:** Docs
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Reviewers:** @laanwj

Updates Ubuntu documentation to explicitly list Qt 6 dependency packages that aren't automatically installed on older systems like Ubuntu 22.04.

*Note: The following is AI-generated interpretation:*
This likely reduces build friction for developers and users setting up Bitcoin Core on older but still widely-used Ubuntu versions, which may help broaden the developer base and improve accessibility.

### ✅ [#32213](https://github.com/bitcoin/bitcoin/pull/32213) msvc: Update vcpkg manifest

- **Status:** merged
- **Created:** 2025-04-03
- **Merged:** 2025-04-19 (open 16 days)
- **Component:** Build system
- **Changes:** +13 / -3 lines in 1 files
- **Commits:** 2
- **Reviewers:** @hodlinator

Updates the vcpkg manifest baseline to the 2025.03.19 release, upgrading several packages including boost, Qt, and sqlite3.

*Note: The following is AI-generated interpretation:*
This likely improves security, performance, and compatibility by keeping dependencies current, and may help Bitcoin Core benefit from upstream bug fixes and optimizations in critical libraries.

### ✅ [#32215](https://github.com/bitcoin/bitcoin/pull/32215) depends: Fix cross-compiling on macOS

- **Status:** merged
- **Created:** 2025-04-03
- **Merged:** 2025-04-25 (open 21 days)
- **Component:** Build system
- **Changes:** +5 / -1 lines in 1 files
- **Commits:** 2
- **Review comments:** 1
- **Reviewers:** @fanquake, @janb84, @laanwj

Fixes cross-compilation issues on macOS by specifying Objective C/C++ compilers for native_qt and removing incompatible mv command options.

*Note: The following is AI-generated interpretation:*
This appears to restore the ability to cross-compile Bitcoin Core on macOS systems, which may help developers working in Apple environments contribute to multi-platform builds and testing.

### 🔄 [#32220](https://github.com/bitcoin/bitcoin/pull/32220) cmake: Get rid of undocumented `BITCOIN_GENBUILD_NO_GIT` environment variable

- **Status:** open
- **Created:** 2025-04-04
- **Component:** Build system
- **Changes:** +58 / -55 lines in 3 files
- **Commits:** 3
- **Review comments:** 3
- **Reviewers:** @luke-jr

Removes an undocumented environment variable from the CMake build system that was used to skip git operations when generating build information.

*Note: The following is AI-generated interpretation:*
This change likely simplifies the build system by removing undocumented configuration options, which may help reduce maintenance burden and make the build process more predictable for developers and packagers.

### ❌ [#32230](https://github.com/bitcoin/bitcoin/pull/32230) depends: Make native package paths platform-agnostic

- **Status:** closed
- **Created:** 2025-04-07
- **Component:** Build system
- **Changes:** +39 / -29 lines in 7 files
- **Commits:** 2

Modifies the depends system to make native package paths work across different host platforms, allowing better reuse of native packages.

*Note: The following is AI-generated interpretation:*
This appears to improve build efficiency and consistency by enabling native packages to be shared across different build environments, which may particularly benefit reproducible builds like those used in Guix.

### ✅ [#32242](https://github.com/bitcoin/bitcoin/pull/32242) guix: Remove unused `file` package

- **Status:** merged
- **Created:** 2025-04-09
- **Merged:** 2025-04-25 (open 15 days)
- **Component:** Build system
- **Changes:** +1 / -4 lines in 2 files
- **Commits:** 1
- **Reviewers:** @fanquake, @janb84, @laanwj

Removes the unused `file` utility package from Guix build dependencies that has been unnecessary since Guix builds were first introduced.

*Note: The following is AI-generated interpretation:*
This likely reduces build dependencies and complexity by removing an obsolete requirement, which may help streamline the Guix build process and reduce potential points of failure.

### ❌ [#32262](https://github.com/bitcoin/bitcoin/pull/32262) build: Restore cross-compilation for Android

- **Status:** closed
- **Created:** 2025-04-13
- **Component:** Build system
- **Changes:** +538 / -47 lines in 27 files
- **Commits:** 4
- **Reviewers:** @D33r-Gee

Restores the ability to cross-compile Bitcoin Core for Android platforms, which was previously removed, though CI integration is still pending.

*Note: The following is AI-generated interpretation:*
This appears to expand Bitcoin Core's platform support by re-enabling Android compilation, which may help developers building Bitcoin applications for mobile platforms, though the lack of Qt static linking support suggests this is primarily for non-GUI builds.

### ✅ [#32266](https://github.com/bitcoin/bitcoin/pull/32266) depends: Avoid `warning: "_FORTIFY_SOURCE" redefined` for `libevent`

- **Status:** merged
- **Created:** 2025-04-14
- **Merged:** 2025-10-23 (open 191 days)
- **Component:** Build system
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Reviewers:** @shahsb, @theuni

Fixes compiler warnings about redefined `_FORTIFY_SOURCE` macros when building the libevent dependency on Alpine Linux.

*Note: The following is AI-generated interpretation:*
This likely improves the build experience on Alpine Linux by eliminating warning messages, which may help developers using Alpine-based build environments and could prevent potential compilation issues in some configurations.

### ✅ [#32287](https://github.com/bitcoin/bitcoin/pull/32287) build: Fix `macdeployqtplus` after switching to Qt 6

- **Status:** merged
- **Created:** 2025-04-16
- **Merged:** 2025-05-06 (open 20 days)
- **Component:** Build system
- **Changes:** +11 / -10 lines in 2 files
- **Commits:** 3
- **Review comments:** 4
- **Reviewers:** @fanquake, @i-am-yuvi

Fixes the macdeployqtplus script to work properly with Qt 6 on macOS, handling differences in how Qt 6 uses @rpath references compared to Qt 5.

*Note: The following is AI-generated interpretation:*
This likely ensures Bitcoin Core can continue to be built and deployed on macOS systems as the project transitions to Qt 6, which may be important for maintaining compatibility with newer macOS versions and development environments.

### ❌ [#32289](https://github.com/bitcoin/bitcoin/pull/32289) doc: Add note for building on macOS (Intel) with CMake ≥ 4.0

- **Status:** closed
- **Created:** 2025-04-16
- **Component:** Docs
- **Changes:** +2 / -0 lines in 1 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @fanquake

Adds documentation note for building Bitcoin Core on Intel-based macOS systems when using CMake 4.0 or later, addressing warning suppression issues.

*Note: The following is AI-generated interpretation:*
This appears to help developers avoid build warnings when using newer CMake versions on Intel Macs, which may improve the development experience and reduce confusion during the build process.

### ✅ [#32306](https://github.com/bitcoin/bitcoin/pull/32306) ci: Temporarily disable `WalletMigration` benchmark

- **Status:** merged
- **Created:** 2025-04-18
- **Merged:** 2025-04-19
- **Component:** Wallet
- **Changes:** +2 / -1 lines in 1 files
- **Commits:** 1
- **Review comments:** 3
- **Reviewers:** @TheCharlatan, @l0rinc

Temporarily disables the WalletMigration benchmark test that is currently failing in the continuous integration system.

*Note: The following is AI-generated interpretation:*
This likely prevents CI pipeline failures from blocking other development work while the underlying benchmark issue is being investigated and resolved, helping maintain development velocity.

### ✅ [#32308](https://github.com/bitcoin/bitcoin/pull/32308) ci: Drop no longer necessary `-Wno-error=array-bounds`

- **Status:** merged
- **Created:** 2025-04-19
- **Merged:** 2025-04-22 (open 3 days)
- **Component:** Tests
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Reviewers:** @TheCharlatan

Removes the `-Wno-error=array-bounds` compiler flag that is no longer needed for Windows cross-compilation builds.

*Note: The following is AI-generated interpretation:*
This appears to clean up build configuration by removing unnecessary warning suppressions, which may help catch potential array bounds issues that could affect code safety and reliability.

### ❌ [#32324](https://github.com/bitcoin/bitcoin/pull/32324) test: Treat executable paths in tests consistently

- **Status:** closed
- **Created:** 2025-04-22
- **Component:** Build system
- **Changes:** +3 / -1 lines in 2 files
- **Commits:** 1
- **Reviewers:** @janb84

Standardizes how executable paths are handled in tests when using multi-config CMake generators, making the approach consistent across different test runners.

*Note: The following is AI-generated interpretation:*
This likely improves build system reliability and consistency across different CMake configurations, which may help prevent test failures and make the codebase easier to maintain for developers using various build setups.

### ❌ [#32349](https://github.com/bitcoin/bitcoin/pull/32349) test: Increase stack size for "Debug" builds with MSVC

- **Status:** closed
- **Created:** 2025-04-25
- **Component:** Tests
- **Changes:** +5 / -0 lines in 1 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @fanquake

This PR increases the stack size for Debug builds with MSVC to accommodate deep recursion in miniscript tests. It fixes stack overflow issues that occur during testing.

*Note: The following is AI-generated interpretation:*
This change likely improves the development experience on Windows by preventing test failures due to stack limitations, which may help maintain consistent testing across different platforms and build configurations.

### ✅ [#32352](https://github.com/bitcoin/bitcoin/pull/32352) [29.x] qt: 29.1 translations update

- **Status:** merged
- **Created:** 2025-04-25
- **Merged:** 2025-05-06 (open 11 days)
- **Changes:** +3501 / -10706 lines in 36 files
- **Commits:** 1
- **Review comments:** 8
- **Reviewers:** @laanwj

This PR updates translations for the 29.x branch by fetching recent updates from Transifex. It also removes territory-specific translations and discards problematic translations.

*Note: The following is AI-generated interpretation:*
Translation updates likely improve Bitcoin Core's accessibility for non-English users, which may help expand adoption and usability across different regions and languages.

### ✅ [#32356](https://github.com/bitcoin/bitcoin/pull/32356) cmake: Respect user-provided configuration-specific flags

- **Status:** merged
- **Created:** 2025-04-26
- **Merged:** 2025-05-08 (open 12 days)
- **Component:** Build system
- **Changes:** +11 / -8 lines in 2 files
- **Commits:** 1
- **Review comments:** 10
- **Reviewers:** @janb84, @purpleKarrot, @ryanofsky

This PR fixes the CMake build system to respect user-provided configuration-specific compiler flags. It ensures that explicitly set flags like CMAKE_CXX_FLAGS_RELEASE are properly honored.

*Note: The following is AI-generated interpretation:*
This change likely improves the build system's flexibility and reliability, which may help developers who need specific compiler optimizations or custom build configurations for their environments.

### ✅ [#32357](https://github.com/bitcoin/bitcoin/pull/32357) depends: Fix cross-compiling `qt` package from macOS to Windows

- **Status:** merged
- **Created:** 2025-04-26
- **Merged:** 2025-04-28 (open 1 days)
- **Component:** Build system
- **Changes:** +8 / -0 lines in 1 files
- **Commits:** 1
- **Reviewers:** @fanquake, @shahsb

This PR fixes cross-compilation of the Qt package from macOS to Windows by disabling Qt's unnecessary search for native packages during cross-compilation.

*Note: The following is AI-generated interpretation:*
This fix likely enables more developers to cross-compile Bitcoin Core on macOS for Windows targets, which may help improve the development workflow and accessibility of building Windows binaries.

### ✅ [#32358](https://github.com/bitcoin/bitcoin/pull/32358) subprocess: Backport upstream changes

- **Status:** merged
- **Created:** 2025-04-27
- **Merged:** 2025-05-05 (open 7 days)
- **Changes:** +82 / -46 lines in 1 files
- **Commits:** 9
- **Reviewers:** @laanwj, @theStack

This PR backports upstream changes to the subprocess utility header that were previously developed for Bitcoin Core and then contributed upstream. It synchronizes the local copy with the upstream improvements.

*Note: The following is AI-generated interpretation:*
Backporting these changes likely improves the reliability and functionality of subprocess handling in Bitcoin Core, which may help with various internal processes and external tool integration.

### 🔄 [#32367](https://github.com/bitcoin/bitcoin/pull/32367) cmake: Check user-defined `APPEND_*FLAGS` variables early

- **Status:** open
- **Created:** 2025-04-28
- **Component:** Build system
- **Changes:** +61 / -25 lines in 4 files
- **Commits:** 3
- **Reviewers:** @BrandonOdiwuor, @janb84

Modifies the CMake build system to handle user-defined APPEND_*FLAGS variables earlier in the build process to ensure they are properly considered during compiler checks.

*Note: The following is AI-generated interpretation:*
This change likely improves build reliability by ensuring user-specified compiler flags are consistently applied throughout the build process, which may help prevent build failures or subtle configuration issues that could affect Bitcoin Core's compilation on different systems.

### ✅ [#32380](https://github.com/bitcoin/bitcoin/pull/32380) Modernize use of UTF-8 in Windows code

- **Status:** merged
- **Created:** 2025-04-29
- **Merged:** 2025-10-28 (open 182 days)
- **Changes:** +27 / -80 lines in 16 files
- **Commits:** 5
- **Review comments:** 20
- **Reviewers:** @davidgumberg, @fanquake, @hodlinator, @laanwj

Updates Windows-specific code to use modern UTF-8 handling approaches, removing deprecated code that will be removed in C++26.

*Note: The following is AI-generated interpretation:*
This modernization likely ensures Bitcoin Core remains compatible with future C++ standards while potentially improving Unicode text handling on Windows, which may help with international character support in file paths and user interfaces.

### ✅ [#32383](https://github.com/bitcoin/bitcoin/pull/32383) util: Remove `fsbridge::get_filesystem_error_message()`

- **Status:** merged
- **Created:** 2025-04-30
- **Merged:** 2025-04-30
- **Component:** Utils/log/libs
- **Changes:** +6 / -24 lines in 7 files
- **Commits:** 1
- **Review comments:** 7
- **Reviewers:** @davidgumberg, @laanwj, @maflcko

Removes the fsbridge::get_filesystem_error_message() function which is no longer needed after migrating from boost::filesystem to std::filesystem.

*Note: The following is AI-generated interpretation:*
This cleanup likely reduces code complexity and may improve UTF-8 path display on Windows, potentially making Bitcoin Core easier to maintain and providing better error messages for users with non-ASCII characters in their file paths.

### ✅ [#32396](https://github.com/bitcoin/bitcoin/pull/32396) cmake: Add application manifests when cross-compiling for Windows

- **Status:** merged
- **Created:** 2025-05-01
- **Merged:** 2025-05-16 (open 14 days)
- **Component:** Build system
- **Changes:** +74 / -2 lines in 8 files
- **Commits:** 3
- **Review comments:** 24
- **Reviewers:** @davidgumberg, @fanquake, @hodlinator, @laanwj

Adds Windows application manifests when cross-compiling for Windows, which provides enhanced security settings and better Windows version control.

*Note: The following is AI-generated interpretation:*
This enhancement likely improves Bitcoin Core's integration with Windows security features and may provide better compatibility across different Windows versions, potentially reducing security vulnerabilities and improving the user experience on Windows systems.

### 🔄 [#32409](https://github.com/bitcoin/bitcoin/pull/32409) test: Introduce `SUPPRESS_ABORT_MESSAGE` environment variable

- **Status:** open
- **Created:** 2025-05-02
- **Component:** Tests
- **Changes:** +17 / -0 lines in 1 files
- **Commits:** 1
- **Review comments:** 6
- **Reviewers:** @fanquake, @maflcko, @shahsb

Introduces a SUPPRESS_ABORT_MESSAGE environment variable to prevent abort message boxes from appearing during Windows testing with debug builds.

*Note: The following is AI-generated interpretation:*
This testing improvement likely prevents CI timeouts and makes automated testing more reliable on Windows, which may help maintain better code quality by ensuring tests can run to completion without manual intervention.

### ✅ [#32469](https://github.com/bitcoin/bitcoin/pull/32469) cmake: Allow `WITH_DBUS` on all Unix-like systems

- **Status:** merged
- **Created:** 2025-05-11
- **Merged:** 2025-05-12
- **Component:** Build system
- **Changes:** +2 / -2 lines in 1 files
- **Commits:** 1
- **Reviewers:** @theStack

Makes the D-Bus notification option available on all Unix-like systems instead of just Linux, fixing a regression from the build system migration.

*Note: The following is AI-generated interpretation:*
This may help ensure Bitcoin Core users on various Unix systems can receive desktop notifications consistently, which could improve user experience by making transaction and network status updates more visible across different operating systems.

### ✅ [#32472](https://github.com/bitcoin/bitcoin/pull/32472) doc: Fix typo

- **Status:** merged
- **Created:** 2025-05-12
- **Merged:** 2025-05-12
- **Component:** Docs
- **Changes:** +2 / -2 lines in 2 files
- **Commits:** 1
- **Reviewers:** @janb84, @l0rinc, @pinheadmz

Fixes a minor typo by replacing double dots (..) with proper ellipsis (…) in user interface text.

*Note: The following is AI-generated interpretation:*
This likely improves the professional appearance and consistency of Bitcoin Core's user interface, which may help maintain user trust and ensure proper localization for international users.

### ❌ [#32499](https://github.com/bitcoin/bitcoin/pull/32499) cmake: Restrict MSVC-specific workaround to affected versions

- **Status:** closed
- **Created:** 2025-05-14
- **Component:** Build system
- **Changes:** +9 / -4 lines in 1 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @davidgumberg

Updates the build system to only apply MSVC compiler workarounds to older versions that need them, allowing newer MSVC versions to compile previously excluded fuzz testing code.

*Note: The following is AI-generated interpretation:*
This appears to improve Bitcoin Core's fuzzing test coverage on Windows with newer compilers, which may help identify more potential bugs and security vulnerabilities through more comprehensive testing.

### ❌ [#32537](https://github.com/bitcoin/bitcoin/pull/32537) Set minimum supported Windows version to 1903 (May 2019 Update)

- **Status:** closed
- **Created:** 2025-05-16
- **Component:** Build system
- **Changes:** +19 / -3 lines in 3 files
- **Commits:** 2
- **Review comments:** 4
- **Reviewers:** @laanwj

Sets the minimum supported Windows version to Windows 10 version 1903 (May 2019 Update) and adds verification for this requirement.

*Note: The following is AI-generated interpretation:*
This likely enables Bitcoin Core to use UTF-8 encoding features that may improve text handling and internationalization, while potentially allowing the removal of legacy compatibility code that could introduce security or maintenance burdens.

### ❌ [#32550](https://github.com/bitcoin/bitcoin/pull/32550) cmake: Add missed `SSE41_CXXFLAGS`

- **Status:** closed
- **Created:** 2025-05-18
- **Component:** Build system
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1

Adds missing SSE4.1 compiler flags to the CMake build system that were discovered when building with clang-cl on Windows.

*Note: The following is AI-generated interpretation:*
This may help ensure Bitcoin Core can properly utilize SSE4.1 CPU optimizations on Windows builds, which could improve performance for cryptographic operations and other computationally intensive tasks.

### ✅ [#32551](https://github.com/bitcoin/bitcoin/pull/32551) cmake: Remove `ENABLE_{SSE41,AVX2,X86_SHANI,ARM_SHANI}` from `bitcoin-build-config.h`

- **Status:** merged
- **Created:** 2025-05-18
- **Merged:** 2025-05-22 (open 3 days)
- **Component:** Build system
- **Changes:** +2 / -28 lines in 5 files
- **Commits:** 5
- **Reviewers:** @fanquake

Removes redundant CPU instruction set definitions from global build configuration since they're already defined where needed for crypto operations.

*Note: The following is AI-generated interpretation:*
This cleanup likely improves build maintainability by eliminating duplicate configuration definitions, which may reduce build complexity and potential conflicts in the CMake build system.

### ❌ [#32552](https://github.com/bitcoin/bitcoin/pull/32552) refactor: Remove workaround for resolved MSVC bug

- **Status:** closed
- **Created:** 2025-05-18
- **Changes:** +7 / -17 lines in 1 files
- **Commits:** 1

Removes code workaround that was needed for an old MSVC compiler bug that has since been fixed.

*Note: The following is AI-generated interpretation:*
This refactoring likely simplifies the codebase by removing technical debt, which may improve code maintainability and reduce complexity now that newer MSVC versions are required.

### ✅ [#32564](https://github.com/bitcoin/bitcoin/pull/32564) miniscript, refactor: Make `operator""_mst` `consteval` (re-take)

- **Status:** merged
- **Created:** 2025-05-19
- **Merged:** 2025-07-02 (open 44 days)
- **Changes:** +30 / -37 lines in 3 files
- **Commits:** 2
- **Review comments:** 5
- **Reviewers:** @hodlinator

Makes a miniscript string literal operator compile-time evaluated, re-implementing a previous change without MSVC bug workarounds.

*Note: The following is AI-generated interpretation:*
This optimization likely improves performance by moving miniscript parsing to compile-time where possible, which may reduce runtime overhead when processing Bitcoin scripts and smart contracts.

### ✅ [#32567](https://github.com/bitcoin/bitcoin/pull/32567) subprocess: Backport upstream changes

- **Status:** merged
- **Created:** 2025-05-20
- **Merged:** 2025-05-21 (open 1 days)
- **Changes:** +6 / -1 lines in 1 files
- **Commits:** 1
- **Reviewers:** @laanwj

Updates the subprocess utility library by backporting upstream improvements from the original cpp-subprocess project.

*Note: The following is AI-generated interpretation:*
These updates likely improve the reliability and functionality of subprocess handling, which may benefit Bitcoin Core's interaction with external processes and system commands.

### ❌ [#32577](https://github.com/bitcoin/bitcoin/pull/32577) subprocess: Let shell parse command on non-Windows systems

- **Status:** closed
- **Created:** 2025-05-21
- **Component:** Utils/log/libs
- **Changes:** +57 / -11 lines in 5 files
- **Commits:** 2
- **Review comments:** 8
- **Reviewers:** @fanquake, @hebasto, @laanwj

Changes subprocess command handling to let the shell parse commands on non-Windows systems instead of manual parsing.

*Note: The following is AI-generated interpretation:*
This change likely improves command execution reliability and compatibility on Unix-like systems, which may reduce issues when Bitcoin Core needs to run external commands or scripts.

### ❌ [#32601](https://github.com/bitcoin/bitcoin/pull/32601) test: Fix `system_tests/run_command` test

- **Status:** closed
- **Created:** 2025-05-23
- **Component:** Tests
- **Changes:** +15 / -6 lines in 3 files
- **Commits:** 1
- **Review comments:** 11
- **Reviewers:** @maflcko

Fixes a test that checks command execution by ensuring it validates the exact exit code (1) and properly handles error message parsing by removing process invocation strings from exception messages.

*Note: The following is AI-generated interpretation:*
This likely improves the reliability of Bitcoin Core's test suite by ensuring that system command tests work correctly across different environments, which may help catch regressions and maintain code quality during development.

### ✅ [#32633](https://github.com/bitcoin/bitcoin/pull/32633) windows: Use predefined `RC_INVOKED` macro instead of custom one

- **Status:** merged
- **Created:** 2025-05-28
- **Merged:** 2025-05-29
- **Component:** Build system
- **Changes:** +3 / -11 lines in 2 files
- **Commits:** 1
- **Reviewers:** @fanquake, @hodlinator

Replaces a custom macro with the predefined Windows `RC_INVOKED` macro in resource compilation.

*Note: The following is AI-generated interpretation:*
This change likely improves code maintainability and follows Windows development best practices, which may help reduce build system complexity and potential compatibility issues on Windows platforms.

### ✅ [#32634](https://github.com/bitcoin/bitcoin/pull/32634) build: Add resource file and manifest to `bitcoin.exe`

- **Status:** merged
- **Created:** 2025-05-28
- **Merged:** 2025-05-29
- **Component:** Build system
- **Changes:** +35 / -0 lines in 2 files
- **Commits:** 2
- **Review comments:** 3
- **Reviewers:** @hodlinator

Adds a resource file and application manifest to the main `bitcoin.exe` executable to match other Windows executables and meet release requirements.

*Note: The following is AI-generated interpretation:*
This appears to ensure consistency across Bitcoin Core's Windows executables and may help with proper Windows integration, potentially improving user experience and meeting Windows application standards for release binaries.

### ❌ [#32648](https://github.com/bitcoin/bitcoin/pull/32648) cmake, qt: Process `*.qrc` files manually

- **Status:** closed
- **Created:** 2025-05-30
- **Component:** Build system
- **Changes:** +35 / -5 lines in 1 files
- **Commits:** 2

Modifies the CMake build system to manually process Qt resource files, enabling better control over compiler properties and silencing specific warnings.

*Note: The following is AI-generated interpretation:*
This likely improves the build experience by reducing compiler warnings that may distract developers, and appears to provide more flexibility in handling Qt resources during compilation.

### ✅ [#32651](https://github.com/bitcoin/bitcoin/pull/32651) cmake: Replace deprecated `qt6_add_translation` with `qt6_add_lrelease`

- **Status:** merged
- **Created:** 2025-05-30
- **Merged:** 2025-06-04 (open 4 days)
- **Component:** Build system
- **Changes:** +7 / -7 lines in 1 files
- **Commits:** 1
- **Review comments:** 4
- **Reviewers:** @fanquake

Updates the CMake configuration to use the newer `qt6_add_lrelease` function instead of the deprecated `qt6_add_translation` for Qt translations.

*Note: The following is AI-generated interpretation:*
This change likely ensures compatibility with current and future Qt versions by following Qt's recommended practices, which may help prevent build issues as Qt continues to evolve.

### ✅ [#32662](https://github.com/bitcoin/bitcoin/pull/32662) doc: Remove build instruction for running `clang-tidy`

- **Status:** merged
- **Created:** 2025-06-02
- **Merged:** 2025-06-02
- **Component:** Docs
- **Changes:** +0 / -1 lines in 1 files
- **Commits:** 1
- **Reviewers:** @TheCharlatan, @janb84

Removes outdated build instructions for running clang-tidy since the CMake compilation database allows running it without building the code first.

*Note: The following is AI-generated interpretation:*
This likely improves the developer experience by simplifying the static analysis workflow and may reduce confusion from outdated documentation.

### ✅ [#32667](https://github.com/bitcoin/bitcoin/pull/32667) build: Find Boost in config mode

- **Status:** merged
- **Created:** 2025-06-02
- **Merged:** 2025-06-27 (open 24 days)
- **Component:** Build system
- **Changes:** +5 / -24 lines in 1 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @fanquake

Updates the build system to find Boost in config mode instead of using the deprecated FindBoost module.

*Note: The following is AI-generated interpretation:*
This appears to be necessary for compatibility with newer CMake versions and may prevent future build failures as the deprecated module is removed.

### ❌ [#32668](https://github.com/bitcoin/bitcoin/pull/32668) refactor: Drop unused `#include <boost/operators.hpp>`

- **Status:** closed
- **Created:** 2025-06-02
- **Changes:** +0 / -2 lines in 2 files
- **Commits:** 1

Removes an unused #include for boost/operators.hpp from the mini_miner.cpp file.

*Note: The following is AI-generated interpretation:*
This likely reduces compilation dependencies and may slightly improve build times while keeping the codebase cleaner.

### ❌ [#32709](https://github.com/bitcoin/bitcoin/pull/32709) cmake: Fix `FindQt` module

- **Status:** closed
- **Created:** 2025-06-09
- **Component:** Build system
- **Changes:** +12 / -3 lines in 1 files
- **Commits:** 2
- **Review comments:** 13
- **Reviewers:** @BrandonOdiwuor, @fanquake

Fixes the FindQt CMake module to treat missing Qt components as fatal errors and cleans up cache variables after Qt 6 migration.

*Note: The following is AI-generated interpretation:*
This likely prevents subtle build issues by catching missing Qt dependencies earlier and may improve the developer experience with clearer error messaging.

### ✅ [#32716](https://github.com/bitcoin/bitcoin/pull/32716) depends: Override host compilers for FreeBSD and OpenBSD

- **Status:** merged
- **Created:** 2025-06-10
- **Merged:** 2025-07-03 (open 22 days)
- **Component:** Build system
- **Changes:** +8 / -0 lines in 2 files
- **Commits:** 1

Fixes compiler selection for FreeBSD and OpenBSD aarch64 builds to use Clang instead of incorrectly defaulting to GCC.

*Note: The following is AI-generated interpretation:*
This likely ensures proper compilation on these BSD systems where Clang is the default compiler and may prevent build failures or suboptimal binaries.

### ✅ [#32717](https://github.com/bitcoin/bitcoin/pull/32717) doc: Update Qt 6 packages on FreeBSD

- **Status:** merged
- **Created:** 2025-06-10
- **Merged:** 2025-06-13 (open 2 days)
- **Component:** Docs
- **Changes:** +2 / -2 lines in 1 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @vasild

Updates documentation to reflect the correct Qt 6 package names for FreeBSD installations.

*Note: The following is AI-generated interpretation:*
This likely helps FreeBSD users properly install dependencies needed to build Bitcoin Core's GUI, which may reduce build errors and improve the developer experience on FreeBSD systems.

### ✅ [#32731](https://github.com/bitcoin/bitcoin/pull/32731) depends: Build `qt` package for FreeBSD hosts

- **Status:** merged
- **Created:** 2025-06-11
- **Merged:** 2025-06-26 (open 14 days)
- **Component:** Build system
- **Changes:** +10 / -3 lines in 5 files
- **Commits:** 1
- **Review comments:** 15
- **Reviewers:** @Sjors, @vasild

Adds support for building Qt packages through the depends system on FreeBSD hosts, enabling GUI compilation.

*Note: The following is AI-generated interpretation:*
This appears to improve Bitcoin Core's build system portability by allowing FreeBSD users to build the GUI components more reliably, potentially expanding the user base and reducing platform-specific build issues.

### 🔄 [#32764](https://github.com/bitcoin/bitcoin/pull/32764) guix: Build for macOS using Clang only

- **Status:** open
- **Created:** 2025-06-17
- **Component:** Build system
- **Changes:** +38 / -17 lines in 2 files
- **Commits:** 1
- **Review comments:** 9
- **Reviewers:** @fanquake, @w0xlt

Changes the Guix build system to use only Clang compiler with libc++ for macOS builds instead of mixed toolchains.

*Note: The following is AI-generated interpretation:*
This likely improves build consistency and may resolve compatibility issues on macOS, potentially making Bitcoin Core more reliable for macOS users and reducing build-related bugs.

### ✅ [#32773](https://github.com/bitcoin/bitcoin/pull/32773) cmake: Create subdirectories in build tree in advance

- **Status:** merged
- **Created:** 2025-06-18
- **Merged:** 2026-02-09 (open 235 days)
- **Component:** Build system
- **Changes:** +62 / -14 lines in 1 files
- **Commits:** 2
- **Review comments:** 3
- **Reviewers:** @BrandonOdiwuor, @janb84, @m3dwards, @sedited

Fixes CMake build system to create necessary subdirectories before attempting to create symlinks, preventing fallback to copying files.

*Note: The following is AI-generated interpretation:*
This appears to improve build efficiency and correctness by ensuring symlinks are created properly instead of falling back to file copying, which may speed up builds and reduce disk usage during development.

### ❌ [#32804](https://github.com/bitcoin/bitcoin/pull/32804) Fix build on macOS when `qt@6` is installed

- **Status:** closed
- **Created:** 2025-06-24
- **Component:** Build system
- **Changes:** +15 / -3 lines in 2 files
- **Commits:** 2

Resolves build failures that occur on macOS systems when qt@6 is installed via Homebrew on both ARM64 and x64 architectures.

*Note: The following is AI-generated interpretation:*
This likely fixes a common build issue for macOS developers who have Qt 6 installed, potentially reducing friction for contributors and making Bitcoin Core more accessible to macOS-based developers.

### ✅ [#32805](https://github.com/bitcoin/bitcoin/pull/32805) cmake: Use `HINTS` instead of `PATHS` in `find_*` commands

- **Status:** merged
- **Created:** 2025-06-24
- **Merged:** 2025-06-26 (open 1 days)
- **Component:** Build system
- **Changes:** +3 / -3 lines in 1 files
- **Commits:** 1
- **Reviewers:** @fanquake

Changes CMake build configuration to use HINTS instead of PATHS when finding the QRencode library, which affects search order and path resolution.

*Note: The following is AI-generated interpretation:*
This change may help ensure more reliable builds on macOS by locating Homebrew packages at their actual filesystem locations rather than through symlinks, which could potentially reduce build inconsistencies or linking issues.

### ✅ [#32814](https://github.com/bitcoin/bitcoin/pull/32814) cmake: Explicitly specify `Boost_ROOT` for Homebrew's package

- **Status:** merged
- **Created:** 2025-06-25
- **Merged:** 2025-06-26
- **Component:** Build system
- **Changes:** +12 / -0 lines in 1 files
- **Commits:** 1
- **Reviewers:** @fanquake

Explicitly specifies Boost_ROOT for Homebrew's Boost package in CMake configuration on macOS systems.

*Note: The following is AI-generated interpretation:*
This appears to prevent build contamination issues where incorrect include directories might be used, likely improving build reliability on macOS and ensuring the correct Boost libraries are linked against Bitcoin Core.

### ✅ [#32828](https://github.com/bitcoin/bitcoin/pull/32828) build, docs: Fix Boost-related issues on NetBSD

- **Status:** merged
- **Created:** 2025-06-29
- **Merged:** 2025-07-02 (open 2 days)
- **Component:** Build system
- **Changes:** +10 / -1 lines in 2 files
- **Commits:** 2
- **Review comments:** 2
- **Reviewers:** @fanquake

Fixes Boost-related build issues on NetBSD by updating documentation to recommend different packages and addressing CMake configuration problems.

*Note: The following is AI-generated interpretation:*
This may help maintain Bitcoin Core's buildability across diverse Unix-like platforms, which could be important for decentralization by ensuring the software remains accessible to developers and users on various operating systems.

### ✅ [#32856](https://github.com/bitcoin/bitcoin/pull/32856) Update `minisketch` subtree

- **Status:** merged
- **Created:** 2025-07-02
- **Merged:** 2025-11-10 (open 131 days)
- **Component:** Build system
- **Changes:** +467 / -4 lines in 9 files
- **Commits:** 2
- **Review comments:** 8
- **Reviewers:** @BrandonOdiwuor, @purpleKarrot

Updates the minisketch subtree dependency to the latest upstream version, incorporating recent improvements and fixes.

*Note: The following is AI-generated interpretation:*
This likely brings performance improvements or bug fixes to the minisketch library used in Bitcoin Core's set reconciliation protocols, which may help improve the efficiency of block relay and other peer-to-peer communications.

### ✅ [#32858](https://github.com/bitcoin/bitcoin/pull/32858) doc: Add workaround for vcpkg issue with paths with embedded spaces

- **Status:** merged
- **Created:** 2025-07-02
- **Merged:** 2025-07-03 (open 1 days)
- **Component:** Docs
- **Changes:** +23 / -13 lines in 1 files
- **Commits:** 1

Adds documentation for a workaround to handle vcpkg build issues when file paths contain spaces on Windows systems.

*Note: The following is AI-generated interpretation:*
This may help Windows developers build Bitcoin Core more reliably in environments where installation paths contain spaces, potentially lowering barriers to contribution and improving the development experience on Windows platforms.

### ✅ [#32940](https://github.com/bitcoin/bitcoin/pull/32940) cmake: Use newer signature of `qt6_add_lrelease` when available

- **Status:** merged
- **Created:** 2025-07-10
- **Merged:** 2025-07-11
- **Component:** Build system
- **Changes:** +5 / -4 lines in 1 files
- **Commits:** 1
- **Reviewers:** @fanquake

Updates the CMake build system to use a newer signature of the qt6_add_lrelease function when available, fixing a compatibility issue.

*Note: The following is AI-generated interpretation:*
This change likely helps ensure Bitcoin Core's build system remains compatible with newer versions of Qt6, which may be important for maintaining GUI functionality across different development environments and preventing build failures.

### ✅ [#32943](https://github.com/bitcoin/bitcoin/pull/32943) depends: Force `CMAKE_EXPORT_NO_PACKAGE_REGISTRY=TRUE`

- **Status:** merged
- **Created:** 2025-07-10
- **Merged:** 2025-07-14 (open 3 days)
- **Component:** Build system
- **Changes:** +1 / -0 lines in 1 files
- **Commits:** 1

Forces CMAKE_EXPORT_NO_PACKAGE_REGISTRY=TRUE globally to prevent CMake from populating the user package registry outside the build tree.

*Note: The following is AI-generated interpretation:*
This appears to improve build isolation and reproducibility by preventing CMake from creating side effects outside the intended build directory, which may help ensure more predictable builds across different environments.

### ❌ [#32951](https://github.com/bitcoin/bitcoin/pull/32951) build: Explicitly set Qt's `AUTO{MOC,RCC,UIC}` property per target

- **Status:** closed
- **Created:** 2025-07-11
- **Component:** Build system
- **Changes:** +42 / -15 lines in 2 files
- **Commits:** 2

Explicitly sets Qt's AUTOMOC, AUTORCC, and AUTOUIC properties per target in the CMake build system.

*Note: The following is AI-generated interpretation:*
This change likely provides more granular control over Qt's automatic code generation tools, which may help improve build performance and ensure that GUI-related code generation only occurs where needed.

### ❌ [#32953](https://github.com/bitcoin/bitcoin/pull/32953) [POC] ci: Skip compilation when running static code analysis

- **Status:** closed
- **Created:** 2025-07-12
- **Component:** Tests
- **Changes:** +22 / -15 lines in 4 files
- **Commits:** 3
- **Review comments:** 2
- **Reviewers:** @maflcko

Proof of concept that skips compilation when running static code analysis by using a compilation database with tools like clang-tidy.

*Note: The following is AI-generated interpretation:*
This approach may significantly speed up continuous integration by allowing static analysis to run without full compilation, which could help catch code quality issues faster and reduce CI resource usage.

### ✅ [#32954](https://github.com/bitcoin/bitcoin/pull/32954) cmake: Drop no longer necessary "cmakeMinimumRequired" object

- **Status:** merged
- **Created:** 2025-07-12
- **Merged:** 2025-07-14 (open 1 days)
- **Component:** Build system
- **Changes:** +0 / -1 lines in 1 files
- **Commits:** 1
- **Reviewers:** @fanquake

Removes a no longer necessary "cmakeMinimumRequired" object from the CMake build system.

*Note: The following is AI-generated interpretation:*
This appears to be a cleanup that removes obsolete code related to CMake version requirements, likely simplifying the build configuration and reducing maintenance burden.

### ✅ [#33077](https://github.com/bitcoin/bitcoin/pull/33077) kernel: create monolithic kernel static library

- **Status:** merged
- **Created:** 2025-07-28
- **Merged:** 2025-08-06 (open 9 days)
- **Component:** Build system
- **Changes:** +7 / -33 lines in 2 files
- **Commits:** 1
- **Reviewers:** @TheCharlatan, @stickies-v

Creates a monolithic static library for the Bitcoin kernel that includes all dependency object files in a single library file. This simplifies distribution by eliminating the need to separately manage multiple dependency libraries.

*Note: The following is AI-generated interpretation:*
This change likely simplifies the build process and distribution of Bitcoin Core by reducing dependency management complexity, which may make it easier for developers to integrate the Bitcoin kernel into other projects and could improve build reliability.

### ✅ [#33101](https://github.com/bitcoin/bitcoin/pull/33101) cmake: Proactively avoid use of `SECP256K1_DISABLE_SHARED`

- **Status:** merged
- **Created:** 2025-07-30
- **Merged:** 2025-08-06 (open 6 days)
- **Component:** Build system
- **Changes:** +53 / -48 lines in 2 files
- **Commits:** 2
- **Reviewers:** @fanquake, @theuni

Removes usage of the `SECP256K1_DISABLE_SHARED` CMake variable that has been removed from the upstream secp256k1 library. This prevents build breakage when the secp256k1 dependency is updated.

*Note: The following is AI-generated interpretation:*
This proactive change likely prevents future build failures and maintains compatibility with upstream cryptographic library updates, which appears important for ensuring Bitcoin Core can continue to benefit from security improvements and bug fixes in secp256k1.

### ✅ [#33113](https://github.com/bitcoin/bitcoin/pull/33113) refactor: Use immediate lambda to work around GCC bug 117966

- **Status:** merged
- **Created:** 2025-08-01
- **Merged:** 2025-08-06 (open 4 days)
- **Changes:** +7 / -2 lines in 2 files
- **Commits:** 2

Implements a workaround using immediate lambda functions to address a specific GCC compiler bug (117966) that causes build failures when using GCC 13 or 14 with debug flags.

*Note: The following is AI-generated interpretation:*
This fix likely ensures Bitcoin Core can be compiled and debugged on systems using affected GCC versions, which may be important for maintaining broad compiler compatibility and enabling developers to debug the software effectively.

### ✅ [#33115](https://github.com/bitcoin/bitcoin/pull/33115) cmake: Switch to generated `ts_files.cmake` file

- **Status:** merged
- **Created:** 2025-08-01
- **Merged:** 2025-08-06 (open 4 days)
- **Component:** GUI
- **Changes:** +7201 / -41826 lines in 63 files
- **Commits:** 3
- **Review comments:** 8
- **Reviewers:** @BrandonOdiwuor, @fanquake, @maflcko

Refactors the CMake build system to use an explicitly generated list of Qt translation files instead of globbing patterns, moving translation file handling into the locale directory.

*Note: The following is AI-generated interpretation:*
This change likely improves build reliability and maintainability by making translation file dependencies explicit rather than implicit, which may reduce build errors and make the internationalization process more predictable for Bitcoin Core's global user base.

### ✅ [#33152](https://github.com/bitcoin/bitcoin/pull/33152) Release: Prepare "Open Transifex translations for v30.0" step

- **Status:** merged
- **Created:** 2025-08-07
- **Merged:** 2025-08-08 (open 1 days)
- **Changes:** +2067 / -2219 lines in 8 files
- **Commits:** 3
- **Reviewers:** @laanwj, @stickies-v

Prepares the codebase for opening Transifex translations for the upcoming v30.0 release by updating translation-related files and configurations.

*Note: The following is AI-generated interpretation:*
This preparation step likely enables the Bitcoin Core community to begin translating the software into various languages for the next major release, which appears important for maintaining Bitcoin's global accessibility and user adoption across different linguistic communities.

### ❌ [#33156](https://github.com/bitcoin/bitcoin/pull/33156) cmake: Do not require Python to build GUI

- **Status:** closed
- **Created:** 2025-08-08
- **Component:** Docs
- **Changes:** +5 / -1 lines in 2 files
- **Commits:** 2
- **Reviewers:** @pablomartin4btc

Modifies the CMake build system so that Python is not required when building the GUI component of Bitcoin Core.

*Note: The following is AI-generated interpretation:*
This change likely makes Bitcoin Core easier to build on systems where Python may not be readily available or where developers want to minimize build dependencies, potentially improving accessibility for contributors and users who need to compile from source.

### 🔄 [#33164](https://github.com/bitcoin/bitcoin/pull/33164) Avoid file overwriting in fallback `AllocateFileRange` implementation

- **Status:** open
- **Created:** 2025-08-09
- **Changes:** +18 / -7 lines in 1 files
- **Commits:** 1
- **Review comments:** 11
- **Reviewers:** @luke-jr

Fixes the fallback file allocation implementation to prevent overwriting existing file content, which was causing issues during blockchain reindexing on certain operating systems.

*Note: The following is AI-generated interpretation:*
This appears to be critical for node reliability on BSD-based systems and other Unix variants, as file corruption during reindexing could lead to data loss or require users to restart the entire blockchain sync process, which may take days to complete.

### ✅ [#33171](https://github.com/bitcoin/bitcoin/pull/33171) ci: Update `actions/checkout` version

- **Status:** merged
- **Created:** 2025-08-11
- **Merged:** 2025-08-13 (open 1 days)
- **Component:** Tests
- **Changes:** +6 / -6 lines in 1 files
- **Commits:** 1
- **Reviewers:** @janb84, @jonatack, @pablomartin4btc

Updates the GitHub Actions checkout action to version 5.0.0 in the continuous integration pipeline.

*Note: The following is AI-generated interpretation:*
This likely helps maintain the security and reliability of Bitcoin Core's automated testing infrastructure by using the latest version of the checkout action, which may include security patches and performance improvements.

### ✅ [#33193](https://github.com/bitcoin/bitcoin/pull/33193) Release: Prepare "Translation string freeze" step

- **Status:** merged
- **Created:** 2025-08-15
- **Merged:** 2025-08-20 (open 5 days)
- **Changes:** +689 / -818 lines in 3 files
- **Commits:** 1
- **Reviewers:** @janb84

Prepares for the translation string freeze step in the release process by updating translatable strings that were introduced in recent pull requests.

*Note: The following is AI-generated interpretation:*
This appears to be part of Bitcoin Core's internationalization efforts, which may help make the software more accessible to non-English speaking users worldwide, potentially expanding Bitcoin's global adoption.

### ❌ [#33194](https://github.com/bitcoin/bitcoin/pull/33194) cmake: Collect headers for extracting translatable strings

- **Status:** closed
- **Created:** 2025-08-15
- **Component:** Build system
- **Changes:** +11 / -36 lines in 1 files
- **Commits:** 1

Modifies the CMake build system to include header files when extracting translatable strings for the translation process.

*Note: The following is AI-generated interpretation:*
This likely ensures that all user-facing text in Bitcoin Core gets properly translated, which may improve the user experience for international users and help maintain consistency in the translation process across the entire codebase.

### ✅ [#33215](https://github.com/bitcoin/bitcoin/pull/33215) Fix compatibility with `-debuglogfile` command-line option

- **Status:** merged
- **Created:** 2025-08-19
- **Merged:** 2026-03-19 (open 212 days)
- **Changes:** +6 / -5 lines in 5 files
- **Commits:** 1
- **Review comments:** 7
- **Reviewers:** @luke-jr, @sedited

Fixes hardcoded 'debug.log' filename to respect custom filenames specified via the `-debuglogfile` command-line option.

*Note: The following is AI-generated interpretation:*
This likely improves operational flexibility for node operators who may want to customize log file locations or naming schemes for better organization or compliance with system administration practices.

### ✅ [#33275](https://github.com/bitcoin/bitcoin/pull/33275) Release: 30.0 translations update

- **Status:** merged
- **Created:** 2025-09-01
- **Merged:** 2025-09-09 (open 7 days)
- **Component:** GUI
- **Changes:** +10140 / -26645 lines in 123 files
- **Commits:** 1
- **Review comments:** 7
- **Reviewers:** @l0rinc

Updates translations for the 30.0 release as part of the standard release process.

*Note: The following is AI-generated interpretation:*
This may help improve Bitcoin Core's accessibility to non-English speaking users worldwide, potentially expanding the user base and making the software more inclusive.

### ✅ [#33312](https://github.com/bitcoin/bitcoin/pull/33312) clang-tidy: Disable `UndefinedBinaryOperatorResult` check in `src/ipc`

- **Status:** merged
- **Created:** 2025-09-04
- **Merged:** 2025-09-08 (open 3 days)
- **Changes:** +5 / -0 lines in 2 files
- **Commits:** 1
- **Reviewers:** @ryanofsky

Disables a clang-tidy check that produces false positive warnings in IPC-related source files.

*Note: The following is AI-generated interpretation:*
This likely improves the development experience by reducing noise from build tools, allowing developers to focus on actual issues rather than false positives from static analysis tools.

### ✅ [#33340](https://github.com/bitcoin/bitcoin/pull/33340) Fix benchmark CSV output

- **Status:** merged
- **Created:** 2025-09-08
- **Merged:** 2025-09-09
- **Changes:** +4 / -4 lines in 1 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @janb84, @l0rinc

Replaces comma with semicolon in benchmark output naming to fix broken CSV formatting.

*Note: The following is AI-generated interpretation:*
This may help developers and researchers who rely on benchmark data for performance analysis, ensuring that CSV output can be properly parsed by data analysis tools.

### ✅ [#33379](https://github.com/bitcoin/bitcoin/pull/33379) cmake: Fix regression in `secp256k1.cmake`

- **Status:** merged
- **Created:** 2025-09-12
- **Merged:** 2025-09-15 (open 2 days)
- **Component:** Build system
- **Changes:** +2 / -1 lines in 1 files
- **Commits:** 1
- **Reviewers:** @TheCharlatan, @furszy

Fixes a CMake regression in secp256k1 configuration that violated CMake function call restrictions.

*Note: The following is AI-generated interpretation:*
This likely ensures that Bitcoin Core can be properly built using CMake, which appears to be important for developers and packagers who prefer CMake over the traditional build system.

### ✅ [#33407](https://github.com/bitcoin/bitcoin/pull/33407) cmake: Install `bitcoin` manpage

- **Status:** merged
- **Created:** 2025-09-16
- **Merged:** 2025-09-17
- **Component:** Build system
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Reviewers:** @ryanofsky

This PR adds installation of the bitcoin manpage to the CMake build system. It appears to be a follow-up fix to a previous PR that may have missed including manpage installation.

*Note: The following is AI-generated interpretation:*
This likely improves the user experience for those building Bitcoin Core from source using CMake, as they would have proper manual page documentation available after installation, which may help with command-line usage and system integration.

### ✅ [#33408](https://github.com/bitcoin/bitcoin/pull/33408) msvc: Update vcpkg manifest

- **Status:** merged
- **Created:** 2025-09-16
- **Merged:** 2025-09-23 (open 6 days)
- **Component:** Build system
- **Changes:** +2 / -2 lines in 1 files
- **Commits:** 1

This PR updates the vcpkg dependency manifest for Windows builds, upgrading several key libraries including Boost, Qt, and SQLite to newer versions. The update moves from the March 2025 vcpkg baseline to the August 2025 baseline.

*Note: The following is AI-generated interpretation:*
This likely improves security and stability by incorporating bug fixes and security patches from newer library versions, and may help ensure Bitcoin Core benefits from performance improvements and compatibility updates in its dependencies.

### ✅ [#33445](https://github.com/bitcoin/bitcoin/pull/33445) ci: Update Clang in "tidy" job

- **Status:** merged
- **Created:** 2025-09-20
- **Merged:** 2025-11-04 (open 44 days)
- **Component:** Tests
- **Changes:** +22 / -14 lines in 10 files
- **Commits:** 2
- **Review comments:** 15
- **Reviewers:** @fanquake, @ryanofsky, @vasild

This PR updates the Clang toolchain in the continuous integration 'tidy' job to a newer version and fixes associated code analysis warnings. It also updates the Include-What-You-Use tool to version 0.25.

*Note: The following is AI-generated interpretation:*
This likely improves code quality by leveraging newer static analysis capabilities that may catch more potential bugs or style issues, and appears to help maintain consistency with modern C++ best practices in the codebase.

### ✅ [#33451](https://github.com/bitcoin/bitcoin/pull/33451) doc: Add `INSTALL.md` to Linux release tarballs

- **Status:** merged
- **Created:** 2025-09-21
- **Merged:** 2026-03-13 (open 173 days)
- **Component:** Docs
- **Changes:** +30 / -0 lines in 2 files
- **Commits:** 1
- **Review comments:** 6
- **Reviewers:** @fanquake, @janb84, @sedited, @w0xlt

This PR adds installation instructions documentation (INSTALL.md) to Linux release tarballs. It appears to address user requests for better installation guidance for popular desktop distributions.

*Note: The following is AI-generated interpretation:*
This likely improves user adoption and reduces support burden by providing clear installation instructions directly with the software package, which may help users successfully install Bitcoin Core without needing to search for documentation elsewhere.

### ✅ [#33452](https://github.com/bitcoin/bitcoin/pull/33452) Release: 30.0rc2 translations update

- **Status:** merged
- **Created:** 2025-09-21
- **Merged:** 2025-09-23 (open 1 days)
- **Changes:** +143 / -151 lines in 2 files
- **Commits:** 1

This PR updates Spanish and Czech translations for the upcoming 30.0rc2 release. It selectively updates only these two languages while skipping others to focus review effort during the release process.

*Note: The following is AI-generated interpretation:*
This likely improves accessibility for Spanish and Czech-speaking users by providing more accurate or complete translations, which may help expand Bitcoin Core's usability in these language communities without overwhelming the release process with extensive translation reviews.

### ✅ [#33494](https://github.com/bitcoin/bitcoin/pull/33494) depends: Update URL for `qrencode` package source tarball

- **Status:** merged
- **Created:** 2025-09-29
- **Merged:** 2025-10-07 (open 8 days)
- **Component:** Build system
- **Changes:** +5 / -6 lines in 2 files
- **Commits:** 4
- **Review comments:** 2
- **Reviewers:** @janb84, @luke-jr, @vasild

Updates the download URL for the qrencode package dependency from fukuchi.org to GitHub releases page due to the original source being unavailable.

*Note: The following is AI-generated interpretation:*
This change likely ensures build reliability by maintaining access to required dependencies, which may help prevent build failures for users compiling Bitcoin Core with QR code functionality.

### ✅ [#33541](https://github.com/bitcoin/bitcoin/pull/33541) Release: 30.0rc3 translations update

- **Status:** merged
- **Created:** 2025-10-05
- **Merged:** 2025-10-06
- **Changes:** +337 / -388 lines in 1 files
- **Commits:** 1
- **Reviewers:** @janb84

Updates Polish translations for the 30.0rc3 release candidate while skipping updates for other languages due to review effort considerations.

*Note: The following is AI-generated interpretation:*
This appears to improve accessibility for Polish-speaking Bitcoin users and may help ensure the release candidate has up-to-date localization for key languages during the release process.

### ✅ [#33561](https://github.com/bitcoin/bitcoin/pull/33561) [28.x] ci: Fix Qt 5.15 URL

- **Status:** merged
- **Created:** 2025-10-07
- **Merged:** 2025-10-07
- **Changes:** +2 / -2 lines in 2 files
- **Commits:** 1

Fixes the Qt 5.15 download URL in the continuous integration system for the 28.x branch.

*Note: The following is AI-generated interpretation:*
This likely ensures CI builds can successfully download Qt dependencies, which may help maintain automated testing reliability for the 28.x maintenance branch.

### 🔄 [#33593](https://github.com/bitcoin/bitcoin/pull/33593) guix: Use UCRT runtime for Windows release binaries

- **Status:** open
- **Created:** 2025-10-09
- **Component:** Build system
- **Changes:** +57 / -78 lines in 9 files
- **Commits:** 4
- **Review comments:** 10
- **Reviewers:** @fanquake, @maflcko, @trevarj

Switches Windows release binaries from MSVCRT to UCRT runtime, updates documentation, and removes MSVCRT-related workarounds.

*Note: The following is AI-generated interpretation:*
This change likely modernizes Windows compatibility and may help improve performance and reduce maintenance burden by using a more current Windows runtime environment.

### ❌ [#33725](https://github.com/bitcoin/bitcoin/pull/33725) ci, iwyu: Treat warnings as errors for `src/init` and `src/policy`

- **Status:** closed
- **Created:** 2025-10-28
- **Component:** Tests
- **Changes:** +64 / -39 lines in 28 files
- **Commits:** 4
- **Review comments:** 13
- **Reviewers:** @fanquake, @maflcko

Extends the Include What You Use (IWYU) tool to treat warnings as errors for the src/init and src/policy directories in continuous integration.

*Note: The following is AI-generated interpretation:*
This appears to enforce stricter code quality standards and may help prevent header dependency issues that could lead to compilation problems or slower build times.

### ✅ [#33764](https://github.com/bitcoin/bitcoin/pull/33764) ci: Add Windows + UCRT jobs for cross-compiling and native testing

- **Status:** merged
- **Created:** 2025-11-02
- **Merged:** 2025-11-28 (open 26 days)
- **Component:** Tests
- **Changes:** +54 / -9 lines in 3 files
- **Commits:** 2
- **Review comments:** 11
- **Reviewers:** @fanquake, @maflcko

Adds CI jobs for building and testing Bitcoin Core on Windows using the modern UCRT runtime instead of the legacy MSVCRT runtime.

*Note: The following is AI-generated interpretation:*
This migration likely improves Windows compatibility and security by moving to Microsoft's modern Universal C Runtime, which may provide better stability and reduced maintenance burden for Windows users.

### ✅ [#33774](https://github.com/bitcoin/bitcoin/pull/33774) cmake: Move IPC tests to `ipc/test`

- **Status:** merged
- **Created:** 2025-11-04
- **Merged:** 2025-12-04 (open 30 days)
- **Component:** Build system
- **Changes:** +51 / -48 lines in 10 files
- **Commits:** 2
- **Review comments:** 4
- **Reviewers:** @janb84, @ryanofsky

Reorganizes IPC tests in the CMake build system by moving them to a dedicated ipc/test directory and removes an obsolete clang-tidy configuration file.

*Note: The following is AI-generated interpretation:*
This appears to improve code organization and maintainability of the IPC (Inter-Process Communication) testing infrastructure, which may facilitate future development of Bitcoin Core's modular architecture.

### ✅ [#33779](https://github.com/bitcoin/bitcoin/pull/33779) ci, iwyu: Fix warnings in `src/kernel` and treat them as errors

- **Status:** merged
- **Created:** 2025-11-04
- **Merged:** 2026-01-19 (open 75 days)
- **Changes:** +17 / -17 lines in 8 files
- **Commits:** 1
- **Review comments:** 11
- **Reviewers:** @maflcko, @sedited, @willcl-ark

Updates include-what-you-use (IWYU) configuration to fix warnings in the src/kernel directory and treat them as build errors going forward.

*Note: The following is AI-generated interpretation:*
This likely improves code quality and compilation efficiency by ensuring proper header inclusion practices in the kernel module, which may reduce build times and prevent subtle dependency issues.

### ✅ [#33781](https://github.com/bitcoin/bitcoin/pull/33781) clang-tidy: Remove no longer needed NOLINT

- **Status:** merged
- **Created:** 2025-11-04
- **Merged:** 2025-11-05
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1

Removes an unnecessary NOLINT comment that was previously needed to suppress a clang-tidy warning that no longer applies.

*Note: The following is AI-generated interpretation:*
This appears to be routine maintenance that keeps the codebase clean by removing obsolete lint suppressions, which may help maintain code quality standards and reduce false positives in static analysis.

### ✅ [#33810](https://github.com/bitcoin/bitcoin/pull/33810) ci: Add IWYU job

- **Status:** merged
- **Created:** 2025-11-06
- **Merged:** 2025-12-22 (open 45 days)
- **Component:** Tests
- **Changes:** +653 / -12 lines in 12 files
- **Commits:** 6
- **Review comments:** 20
- **Reviewers:** @fanquake, @maflcko, @sedited, @w0xlt

Creates a separate CI job specifically for include-what-you-use (IWYU) checks to provide faster feedback to developers.

*Note: The following is AI-generated interpretation:*
This likely improves developer productivity by providing quicker feedback on header inclusion issues without waiting for the full tidy job to complete, which may encourage better coding practices and faster iteration cycles.

### ✅ [#33818](https://github.com/bitcoin/bitcoin/pull/33818) ci: Extend tidy job to cover kernel code

- **Status:** merged
- **Created:** 2025-11-07
- **Merged:** 2025-11-07
- **Component:** Tests
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Review comments:** 3
- **Reviewers:** @maflcko

Extends the continuous integration tidy job to include code analysis coverage for Bitcoin's kernel code module.

*Note: The following is AI-generated interpretation:*
This likely helps improve code quality and consistency by ensuring the kernel module, which may contain core Bitcoin logic, is subject to the same automated code style and static analysis checks as other components.

### ✅ [#33826](https://github.com/bitcoin/bitcoin/pull/33826) scripted-diff: Remove obsolete comment

- **Status:** merged
- **Created:** 2025-11-08
- **Merged:** 2025-11-10 (open 1 days)
- **Component:** Docs
- **Changes:** +6 / -6 lines in 5 files
- **Commits:** 1
- **Reviewers:** @rkrux

Removes a comment from the codebase that became outdated after previous pull requests were merged.

*Note: The following is AI-generated interpretation:*
This appears to help maintain code clarity and prevent developer confusion by removing documentation that may no longer accurately reflect the current implementation after recent changes.

### ✅ [#33827](https://github.com/bitcoin/bitcoin/pull/33827) doc: Correct `pkgin` command usage on NetBSD

- **Status:** merged
- **Created:** 2025-11-08
- **Merged:** 2025-11-10 (open 1 days)
- **Component:** Docs
- **Changes:** +3 / -3 lines in 1 files
- **Commits:** 1
- **Review comments:** 1

Corrects the documentation for installing dependencies on NetBSD by fixing the pkgin command syntax to include the required 'install' subcommand.

*Note: The following is AI-generated interpretation:*
This likely helps NetBSD users successfully build Bitcoin Core by providing accurate package installation instructions, potentially expanding the platform compatibility and user base.

### 🔄 [#33841](https://github.com/bitcoin/bitcoin/pull/33841) cmake: Switch to `minisketch` upstream build system

- **Status:** open
- **Created:** 2025-11-10
- **Component:** Build system
- **Changes:** +17 / -85 lines in 2 files
- **Commits:** 1
- **Review comments:** 1
- **Reviewers:** @BrandonOdiwuor

Changes the build system to use minisketch's native build configuration instead of Bitcoin's custom integration.

*Note: The following is AI-generated interpretation:*
This may help improve maintainability by leveraging upstream build configurations and could potentially make it easier to update the minisketch dependency in the future, while minisketch appears to be used for transaction relay optimizations.

### ❌ [#33852](https://github.com/bitcoin/bitcoin/pull/33852) test, refactor: Fix `-Warray-bounds` warning

- **Status:** closed
- **Created:** 2025-11-11
- **Component:** Tests
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1

Fixes a compiler warning about array bounds that occurs when using GCC 14 to cross-compile Bitcoin Core for Windows.

*Note: The following is AI-generated interpretation:*
This likely helps ensure Bitcoin Core can be reliably built across different compiler versions and target platforms, which may be important for maintaining consistent release processes and supporting Windows users.

### ✅ [#33857](https://github.com/bitcoin/bitcoin/pull/33857) doc: Add `x86_64-w64-mingw32ucrt` triplet to `depends/README.md`

- **Status:** merged
- **Created:** 2025-11-11
- **Merged:** 2025-12-03 (open 21 days)
- **Component:** Docs
- **Changes:** +7 / -3 lines in 2 files
- **Commits:** 2
- **Review comments:** 15
- **Reviewers:** @fanquake, @hodlinator, @m3dwards

Updates documentation to include the new x86_64-w64-mingw32ucrt triplet for building Windows binaries with the modern UCRT runtime.

*Note: The following is AI-generated interpretation:*
This documentation update likely supports the broader effort to modernize Windows builds, which may help improve compatibility and reduce runtime issues for Bitcoin Core users on Windows systems.

### ✅ [#33861](https://github.com/bitcoin/bitcoin/pull/33861) build: Bump VS minimum supported version to 18.3

- **Status:** merged
- **Created:** 2025-11-12
- **Merged:** 2026-02-11 (open 90 days)
- **Component:** Build system
- **Changes:** +29 / -38 lines in 5 files
- **Commits:** 2
- **Review comments:** 10
- **Reviewers:** @hodlinator, @janb84, @maflcko

Raises the minimum required Visual Studio version to 18.3 to take advantage of bug fixes and improvements in newer compiler versions.

*Note: The following is AI-generated interpretation:*
Updating compiler requirements likely helps ensure Bitcoin Core builds use more reliable tooling and may prevent build failures or subtle bugs that could affect the stability of Windows binaries.

### ✅ [#33865](https://github.com/bitcoin/bitcoin/pull/33865) cmake: Specify Windows plugin path in `test_bitcoin-qt` property

- **Status:** merged
- **Created:** 2025-11-12
- **Merged:** 2025-11-15 (open 2 days)
- **Component:** Build system
- **Changes:** +8 / -6 lines in 2 files
- **Commits:** 1
- **Review comments:** 3
- **Reviewers:** @purpleKarrot

Configures the Qt plugin path automatically in the CMake build system for Windows test binaries, eliminating the need to manually set environment variables.

*Note: The following is AI-generated interpretation:*
This change appears to streamline the testing process on Windows, which may help developers catch bugs more easily and improve the overall quality assurance for Bitcoin Core on Windows platforms.

### ✅ [#33876](https://github.com/bitcoin/bitcoin/pull/33876) doc: Update NetBSD Build Guide

- **Status:** merged
- **Created:** 2025-11-15
- **Merged:** 2025-11-17 (open 1 days)
- **Component:** Docs
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1

Updates the NetBSD build documentation to reference Python 3.13 packages instead of Python 3.10 packages that are no longer available.

*Note: The following is AI-generated interpretation:*
This documentation fix likely ensures that NetBSD users can successfully build Bitcoin Core, which may help maintain the project's accessibility across different BSD operating systems.

### ✅ [#33906](https://github.com/bitcoin/bitcoin/pull/33906) depends: Add patch for Windows11Style plugin

- **Status:** merged
- **Created:** 2025-11-18
- **Merged:** 2025-11-25 (open 6 days)
- **Component:** Build system
- **Changes:** +115 / -0 lines in 2 files
- **Commits:** 1

Adds a patch to fix issues with the Windows11Style Qt plugin that was causing GUI problems.

*Note: The following is AI-generated interpretation:*
This GUI fix likely improves the user experience for Bitcoin Core users on Windows 11, which may help ensure the application displays correctly and functions properly on modern Windows systems.

### ✅ [#33918](https://github.com/bitcoin/bitcoin/pull/33918) depends: Update Qt download link

- **Status:** merged
- **Created:** 2025-11-20
- **Merged:** 2025-11-25 (open 4 days)
- **Component:** Build system
- **Changes:** +4 / -4 lines in 1 files
- **Commits:** 1
- **Reviewers:** @fanquake

Updates the Qt download link in the build system to use a GitHub mirror instead of the unreliable code.qt.io domain.

*Note: The following is AI-generated interpretation:*
This change likely improves build reliability for developers and automated systems by switching to a more stable download source, which may reduce build failures and maintenance overhead.

### ❌ [#33924](https://github.com/bitcoin/bitcoin/pull/33924) qa: Remove no longer needed `feature_dirsymlinks.py`

- **Status:** closed
- **Created:** 2025-11-22
- **Component:** Tests
- **Changes:** +0 / -42 lines in 2 files
- **Commits:** 1

Removes the feature_dirsymlinks.py test file that is no longer needed after previous cleanup work.

*Note: The following is AI-generated interpretation:*
This appears to reduce technical debt and maintenance burden by removing obsolete test code, which may help keep the test suite focused and easier to maintain.

### ✅ [#33929](https://github.com/bitcoin/bitcoin/pull/33929) test: Remove `system_tests/run_command` runtime dependencies

- **Status:** merged
- **Created:** 2025-11-23
- **Merged:** 2026-03-06 (open 102 days)
- **Component:** Tests
- **Changes:** +59 / -26 lines in 4 files
- **Commits:** 2
- **Review comments:** 13
- **Reviewers:** @fanquake, @janb84, @maflcko, @sedited

Eliminates runtime dependencies on system commands like cat, echo, false and sh in system tests while reducing platform-specific code paths.

*Note: The following is AI-generated interpretation:*
This likely improves portability and reduces external dependencies for testing, which may make Bitcoin Core easier to build and test in constrained or specialized environments like Guix.

### ✅ [#33971](https://github.com/bitcoin/bitcoin/pull/33971) cmake: Set `WITH_ZMQ` to `ON` in Windows presets

- **Status:** merged
- **Created:** 2025-11-30
- **Merged:** 2025-12-01
- **Component:** Build system
- **Changes:** +7 / -5 lines in 3 files
- **Commits:** 1
- **Reviewers:** @fdtwd8vv45-sketch

Enables the WITH_ZMQ configuration option by default in Windows CMake build presets to match the existing vcpkg.json configuration.

*Note: The following is AI-generated interpretation:*
This appears to improve consistency in Windows builds and may help ensure ZeroMQ functionality is properly available for Windows users who rely on it for notifications and external integrations.

### ✅ [#33972](https://github.com/bitcoin/bitcoin/pull/33972) cmake: Make `BUILD_KERNEL_TEST` depend on `BUILD_KERNEL_LIB`

- **Status:** merged
- **Created:** 2025-11-30
- **Merged:** 2025-12-01
- **Component:** Build system
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Reviewers:** @sedited

Makes the BUILD_KERNEL_TEST CMake option dependent on BUILD_KERNEL_LIB to fix misleading configuration summaries.

*Note: The following is AI-generated interpretation:*
This likely prevents confusing build configurations where kernel tests appear enabled but cannot actually be built, which may reduce developer confusion and build errors.

### 🔄 [#33974](https://github.com/bitcoin/bitcoin/pull/33974) cmake: Check dependencies after build option interaction

- **Status:** open
- **Created:** 2025-11-30
- **Component:** Build system
- **Changes:** +91 / -75 lines in 2 files
- **Commits:** 1
- **Review comments:** 7
- **Reviewers:** @BrandonOdiwuor, @fanquake, @sedited

Restructures CMake configuration to check dependencies only after build options are processed. This avoids unnecessary dependency checks when certain build options are enabled.

*Note: The following is AI-generated interpretation:*
This change likely improves build efficiency by reducing unnecessary dependency checks, which may help developers compile Bitcoin Core faster, especially in specialized build configurations like fuzzing mode.

### ❌ [#33975](https://github.com/bitcoin/bitcoin/pull/33975) depends, doc: Add `tcl` as build dependency for `sqlite` package

- **Status:** closed
- **Created:** 2025-11-30
- **Component:** Docs
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Review comments:** 1
- **Reviewers:** @hebasto, @janb84

Adds `tcl` as a documented build dependency for the `sqlite` package in the depends system. This addresses build failures when no native C compiler is available under default names.

*Note: The following is AI-generated interpretation:*
This documentation update appears to help developers understand required dependencies for building Bitcoin Core's SQLite component, likely reducing build failures and improving developer experience across different system configurations.

### ✅ [#33995](https://github.com/bitcoin/bitcoin/pull/33995) depends: Propagate native C compiler to `sqlite` package

- **Status:** merged
- **Created:** 2025-12-02
- **Merged:** 2025-12-05 (open 3 days)
- **Component:** Build system
- **Changes:** +26 / -2 lines in 3 files
- **Commits:** 2
- **Reviewers:** @sedited

Modifies the depends system to properly propagate the native C compiler to the SQLite package build process. This ensures SQLite can build its bootstrap tools even when standard compiler names aren't available.

*Note: The following is AI-generated interpretation:*
This change likely improves Bitcoin Core's build reliability across different platforms and compiler configurations, which may help ensure consistent builds in diverse development and deployment environments.

### ❌ [#34047](https://github.com/bitcoin/bitcoin/pull/34047) cmake: Add fail pattern to `try_append_cxx_flags`

- **Status:** closed
- **Created:** 2025-12-10
- **Component:** Build system
- **Changes:** +5 / -1 lines in 1 files
- **Commits:** 1
- **Review comments:** 9
- **Reviewers:** @fanquake, @maflcko

Adds fail pattern detection to CMake's compiler flag checking function to handle cases where build environments disable compiler warnings. This specifically addresses issues with OSS-Fuzz build environments.

*Note: The following is AI-generated interpretation:*
This change appears to improve build system robustness in automated testing environments like OSS-Fuzz, which may help ensure Bitcoin Core's security testing infrastructure works correctly and catches potential issues.

### ✅ [#34090](https://github.com/bitcoin/bitcoin/pull/34090) net: Fix `-Wmissing-braces`

- **Status:** merged
- **Created:** 2025-12-17
- **Merged:** 2026-01-22 (open 35 days)
- **Component:** P2P
- **Changes:** +22 / -7 lines in 5 files
- **Commits:** 1
- **Reviewers:** @sedited, @vasild

Fixes compiler warnings related to missing braces that occur with Clang on some non-POSIX platforms like OpenIndiana/illumos. The warnings are triggered by network address initialization macros.

*Note: The following is AI-generated interpretation:*
This fix likely improves Bitcoin Core's compatibility with alternative Unix-like operating systems, which may help expand the range of platforms where Bitcoin Core can be cleanly compiled and potentially broaden its deployment options.

### ❌ [#34103](https://github.com/bitcoin/bitcoin/pull/34103) cmake: Add missed `Boost::headers`

- **Status:** closed
- **Created:** 2025-12-18
- **Component:** Build system
- **Changes:** +1 / -0 lines in 1 files
- **Commits:** 1

Fixes a CMake build system issue by adding missing Boost::headers dependency that was causing compilation failures on Fedora 43.

*Note: The following is AI-generated interpretation:*
This likely ensures Bitcoin Core can be built reliably across different Linux distributions, which may help maintain developer accessibility and reduce build environment compatibility issues that could hinder development and testing.

### ✅ [#34107](https://github.com/bitcoin/bitcoin/pull/34107) build: Update minimum required Boost version

- **Status:** merged
- **Created:** 2025-12-18
- **Merged:** 2025-12-19
- **Component:** Build system
- **Changes:** +2 / -2 lines in 2 files
- **Commits:** 1
- **Reviewers:** @janb84, @l0rinc, @pablomartin4btc

Updates the minimum required Boost library version from 1.73.0 to 1.74.0 due to build breakage introduced by a previous change.

*Note: The following is AI-generated interpretation:*
This appears to maintain build system stability while likely having minimal impact on users since major distributions already provide newer Boost versions, ensuring Bitcoin Core remains buildable without forcing outdated dependency usage.

### ❌ [#34116](https://github.com/bitcoin/bitcoin/pull/34116) cmake: Fix debugging info

- **Status:** closed
- **Created:** 2025-12-19
- **Component:** Build system
- **Changes:** +11 / -14 lines in 5 files
- **Commits:** 3
- **Review comments:** 1
- **Reviewers:** @maflcko

Reverts a previous CMake change and takes an alternative approach to fix debugging information issues that caused unintended side effects.

*Note: The following is AI-generated interpretation:*
This likely improves the developer experience by ensuring proper debugging symbols are generated during builds, which may help developers troubleshoot issues more effectively and contribute to Bitcoin Core development.

### ❌ [#34127](https://github.com/bitcoin/bitcoin/pull/34127) iwyu: Add `pragma: always_keep` to `bitcoin-build-config.h`

- **Status:** closed
- **Created:** 2025-12-20
- **Changes:** +69 / -74 lines in 67 files
- **Commits:** 3

Adds an 'always_keep' pragma to the bitcoin-build-config.h header to simplify include-what-you-use (IWYU) tool integration.

*Note: The following is AI-generated interpretation:*
This appears to streamline code maintenance by reducing boilerplate pragma comments throughout the codebase, which may help maintain cleaner code organization and make it easier for developers to manage header dependencies.

### ✅ [#34143](https://github.com/bitcoin/bitcoin/pull/34143) build: Prevent system header fallback and include path pollution

- **Status:** merged
- **Created:** 2025-12-23
- **Merged:** 2026-02-11 (open 49 days)
- **Component:** Build system
- **Changes:** +12 / -3 lines in 5 files
- **Commits:** 4
- **Review comments:** 1
- **Reviewers:** @hebasto, @theuni

Prevents accidental exposure of dependency headers through include path pollution in the depends build system, making missing dependencies more visible.

*Note: The following is AI-generated interpretation:*
This likely improves build system robustness by ensuring dependencies are explicitly declared rather than accidentally available, which may help prevent future build breakages and make the build configuration more maintainable and reliable.

### ✅ [#34168](https://github.com/bitcoin/bitcoin/pull/34168) qa: Require `--exclude` for each excluded test

- **Status:** merged
- **Created:** 2025-12-29
- **Merged:** 2026-01-13 (open 15 days)
- **Component:** Tests
- **Changes:** +19 / -10 lines in 4 files
- **Commits:** 1
- **Review comments:** 9
- **Reviewers:** @l0rinc, @rkrux

This PR modifies the test runner script to allow the `--exclude` argument to be split across multiple lines with optional comments for each excluded test. This makes it easier to organize and document which tests are being excluded and why.

*Note: The following is AI-generated interpretation:*
This change likely improves the maintainability of CI scripts and testing configurations by making it easier to document why specific tests are excluded. It may help developers better understand test exclusions and reduce the likelihood of accidentally excluding tests without proper justification.

### ✅ [#34182](https://github.com/bitcoin/bitcoin/pull/34182) doc: Update OpenBSD Build Guide

- **Status:** merged
- **Created:** 2025-12-30
- **Merged:** 2025-12-31
- **Component:** Docs
- **Changes:** +6 / -3 lines in 1 files
- **Commits:** 1
- **Reviewers:** @janb84

This PR updates the OpenBSD build documentation to reflect that OpenBSD 7.8 now ships with LLVM/Clang 19.1.7. The documentation is updated to indicate that this version satisfies Bitcoin Core's recently updated minimum compiler requirements.

*Note: The following is AI-generated interpretation:*
This documentation update likely helps OpenBSD users understand that they can now build Bitcoin Core with the system-provided compiler without needing to install additional compiler versions. This may reduce build complexity and support burden for users on this platform.


---

*Report generated by brink_pr_csv.py from bitcoin-data/github-metadata-backup-bitcoin-bitcoin*
