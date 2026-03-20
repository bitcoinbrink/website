# Bitcoin Core Contributions by @fanquake (2025-01-01 to 2025-12-31)

## Summary

- **Total PRs:** 176
- **Merged:** 160 (90%)
- **Open:** 0
- **Closed (not merged):** 16
- **Total commits:** 534
- **Lines added:** 13,614
- **Lines deleted:** 11,146

## By Component

- **Other:** 72
- **Build system:** 54
- **Docs:** 22
- **Tests:** 22
- **Utils/log/libs:** 4
- **Validation:** 1
- **P2P:** 1

## Pull Requests

### ✅ [#31648](https://github.com/bitcoin/bitcoin/pull/31648) [28.x] Backports

- **Status:** merged
- **Created:** 2025-01-13
- **Merged:** 2025-03-05 (open 51 days)
- **Changes:** +44 / -55 lines in 8 files
- **Commits:** 5
- **Reviewers:** @stickies-v, @willcl-ark

This PR backports four previously merged pull requests to the 28.x branch for inclusion in a maintenance release.

*Note: The following is AI-generated interpretation:*
This likely helps maintain the stability of the 28.x release branch by including important fixes or improvements that were merged into the main development branch, ensuring users on the maintenance branch receive critical updates.

### ✅ [#31671](https://github.com/bitcoin/bitcoin/pull/31671) Update leveldb subtree to latest upstream

- **Status:** merged
- **Created:** 2025-01-16
- **Merged:** 2025-01-21 (open 5 days)
- **Changes:** +8 / -63 lines in 8 files
- **Commits:** 3
- **Reviewers:** @hebasto, @theuni

This PR updates Bitcoin Core's embedded LevelDB subtree to the latest upstream version from Google's LevelDB project.

*Note: The following is AI-generated interpretation:*
This may help improve database performance, security, and stability by incorporating upstream bug fixes and optimizations, which could benefit Bitcoin Core's blockchain storage and retrieval operations.

### ✅ [#31766](https://github.com/bitcoin/bitcoin/pull/31766) leveldb: pull upstream C++23 changes

- **Status:** merged
- **Created:** 2025-01-30
- **Merged:** 2025-03-20 (open 48 days)
- **Changes:** +23 / -13 lines in 4 files
- **Commits:** 3
- **Reviewers:** @darosior, @dergoegge

This PR cherry-picks upstream LevelDB changes that remove deprecated C++ features to maintain compatibility with C++23 standards.

*Note: The following is AI-generated interpretation:*
This likely ensures Bitcoin Core can continue to compile with modern C++ compilers and toolchains, preventing future build issues as older C++ features become obsolete or removed from compiler support.

### ✅ [#31818](https://github.com/bitcoin/bitcoin/pull/31818) guix: remove test-security/symbol-check scripts

- **Status:** merged
- **Created:** 2025-02-07
- **Merged:** 2025-02-12 (open 4 days)
- **Component:** Build system
- **Changes:** +2 / -327 lines in 5 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @hebasto, @theuni

This PR removes test scripts that check security symbols and features in release binaries, arguing they've become more problematic than helpful.

*Note: The following is AI-generated interpretation:*
This appears to streamline the build process by removing tests that may have become obsolete due to improved toolchain defaults in the Guix build environment, potentially reducing false positives and build complexity.

### ✅ [#31819](https://github.com/bitcoin/bitcoin/pull/31819) doc: swap CPPFLAGS for APPEND_CPPFLAGS

- **Status:** merged
- **Created:** 2025-02-07
- **Merged:** 2025-02-10 (open 2 days)
- **Component:** Docs
- **Changes:** +2 / -2 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto

This PR updates documentation to use the correct CMake variable name for preprocessor flags.

*Note: The following is AI-generated interpretation:*
This likely helps developers correctly configure CMake builds by providing accurate documentation, which may prevent build configuration errors and improve the developer experience when customizing compilation settings.

### ✅ [#31820](https://github.com/bitcoin/bitcoin/pull/31820) build: consistently use `CLIENT_NAME` in libbitcoinkernel.pc.in

- **Status:** merged
- **Created:** 2025-02-07
- **Merged:** 2025-02-10 (open 2 days)
- **Component:** Build system
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto, @luke-jr, @stickies-v, @theuni

Updates the libbitcoinkernel.pc.in file to consistently use the CLIENT_NAME variable instead of hardcoded values. This is a follow-up to when the pkg-config file was originally added.

*Note: The following is AI-generated interpretation:*
This change likely improves build consistency and maintainability by ensuring the kernel library's pkg-config file uses standardized naming conventions, which may help downstream projects that depend on libbitcoinkernel integrate more reliably.

### ✅ [#31840](https://github.com/bitcoin/bitcoin/pull/31840) depends: add missing Darwin objcopy

- **Status:** merged
- **Created:** 2025-02-11
- **Merged:** 2025-02-12 (open 1 days)
- **Component:** Build system
- **Changes:** +1 / -0 lines in 1 files
- **Commits:** 1
- **Reviewers:** @djs19901, @laanwj, @theuni

Adds the missing Darwin objcopy tool reference in the CMake toolchain configuration. While objcopy isn't currently used for Darwin builds, this ensures the toolchain file doesn't reference non-existent tools.

*Note: The following is AI-generated interpretation:*
This change likely prevents potential build errors or warnings when the toolchain file references missing tools, and may improve the robustness of cross-compilation setups for macOS builds.

### ✅ [#31849](https://github.com/bitcoin/bitcoin/pull/31849) depends: set `CMAKE_*_COMPILER_TARGET` in toolchain

- **Status:** merged
- **Created:** 2025-02-12
- **Merged:** 2025-03-27 (open 42 days)
- **Component:** Build system
- **Changes:** +5 / -0 lines in 2 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @hebasto, @willcl-ark

Sets the CMAKE_*_COMPILER_TARGET variables in the toolchain file according to CMake documentation for proper Clang cross-compilation setup. This appears to fix duplicate target flags in Apple cross builds.

*Note: The following is AI-generated interpretation:*
This change likely improves cross-compilation reliability by following CMake best practices for Clang toolchains, which may prevent compiler flag duplication issues and ensure more consistent builds across different platforms.

### ❌ [#31850](https://github.com/bitcoin/bitcoin/pull/31850) ci: switch MSAN to use prebuilt Clang binaries

- **Status:** closed
- **Created:** 2025-02-12
- **Component:** Tests
- **Changes:** +9 / -21 lines in 3 files
- **Commits:** 1
- **Review comments:** 1
- **Reviewers:** @fanquake, @maflcko

Switches the Memory Sanitizer (MSAN) continuous integration setup to use prebuilt Clang binaries from apt.llvm.org instead of building from source.

*Note: The following is AI-generated interpretation:*
This change likely speeds up CI builds and reduces resource usage by avoiding the time-consuming process of compiling Clang from source, which may improve developer productivity and reduce CI infrastructure costs.

### ✅ [#31857](https://github.com/bitcoin/bitcoin/pull/31857) depends: avoid an unset `CMAKE_OBJDUMP`

- **Status:** merged
- **Created:** 2025-02-13
- **Merged:** 2025-02-14
- **Component:** Build system
- **Changes:** +1 / -0 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto, @theuni

Fixes the Linux toolchain file to properly set CMAKE_OBJDUMP instead of leaving it as an empty string. This ensures consistency with other toolchain variables that point to actual tools.

*Note: The following is AI-generated interpretation:*
This change likely prevents potential build issues when CMAKE_OBJDUMP is needed and improves toolchain file consistency, which may help avoid subtle cross-compilation problems in Linux builds.

### ✅ [#31864](https://github.com/bitcoin/bitcoin/pull/31864) doc: add missing copyright headers

- **Status:** merged
- **Created:** 2025-02-14
- **Merged:** 2025-05-20 (open 94 days)
- **Component:** Docs
- **Changes:** +40 / -17 lines in 14 files
- **Commits:** 4
- **Review comments:** 6
- **Reviewers:** @i-am-yuvi, @l0rinc, @willcl-ark

Adds missing copyright headers to various files and removes some obsolete documentation and code.

*Note: The following is AI-generated interpretation:*
This likely helps ensure proper legal compliance and code attribution across the Bitcoin Core codebase, which may be important for maintaining the project's open-source licensing integrity.

### ✅ [#31865](https://github.com/bitcoin/bitcoin/pull/31865) build: move `rpc/external_signer` to node library

- **Status:** merged
- **Created:** 2025-02-14
- **Merged:** 2025-02-14
- **Component:** Build system
- **Changes:** +1 / -4 lines in 2 files
- **Commits:** 1
- **Reviewers:** @TheCharlatan, @hebasto

Moves the RPC external signer functionality from the common library to the node library and removes related dependency check suppressions.

*Note: The following is AI-generated interpretation:*
This appears to improve the modular architecture by placing external signer RPC code in a more appropriate library location, which may help with code organization and potentially reduce unnecessary dependencies in the common library.

### ✅ [#31892](https://github.com/bitcoin/bitcoin/pull/31892) build: remove ENABLE_HARDENING condition from check-security

- **Status:** merged
- **Created:** 2025-02-17
- **Merged:** 2025-02-18
- **Component:** Build system
- **Changes:** +5 / -9 lines in 1 files
- **Commits:** 1
- **Reviewers:** @TheCharlatan, @hebasto

Removes the conditional check that would skip security hardening verification in release builds.

*Note: The following is AI-generated interpretation:*
This likely strengthens Bitcoin Core's security posture by ensuring that security hardening checks always run in release builds, which may help prevent accidentally shipping releases without proper security protections enabled.

### ✅ [#31982](https://github.com/bitcoin/bitcoin/pull/31982) scripted-diff: rename libmultiprocess repository

- **Status:** merged
- **Created:** 2025-03-04
- **Merged:** 2025-03-05 (open 1 days)
- **Changes:** +7 / -7 lines in 3 files
- **Commits:** 1
- **Reviewers:** @hebasto

Renames references to the libmultiprocess repository in preparation for moving it to the bitcoin-core organization.

*Note: The following is AI-generated interpretation:*
This appears to be organizational maintenance that may help consolidate Bitcoin Core-related repositories under a unified organization structure, potentially improving project governance and dependency management.

### ✅ [#31983](https://github.com/bitcoin/bitcoin/pull/31983) build: don't show ccache summary with MSVC

- **Status:** merged
- **Created:** 2025-03-04
- **Merged:** 2025-03-05
- **Component:** Build system
- **Changes:** +2 / -0 lines in 1 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @hebasto

Prevents ccache summary information from displaying when using MSVC compiler by setting WITH_CCACHE to OFF.

*Note: The following is AI-generated interpretation:*
This likely fixes a misleading build configuration display issue specific to MSVC builds, which may help developers avoid confusion about whether ccache is actually being used in their Windows build environment.

### ✅ [#31993](https://github.com/bitcoin/bitcoin/pull/31993) ci: use LLVM 20.1.0 for MSAN

- **Status:** merged
- **Created:** 2025-03-05
- **Merged:** 2025-03-06 (open 1 days)
- **Component:** Tests
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1

Updates the continuous integration system to use the final release version of LLVM 20.1.0 for Memory Sanitizer (MSAN) testing instead of the release candidate.

*Note: The following is AI-generated interpretation:*
This likely improves the reliability of automated testing by using a stable release version rather than a pre-release candidate, which may help catch memory-related bugs more consistently in Bitcoin Core development.

### ✅ [#31996](https://github.com/bitcoin/bitcoin/pull/31996) doc: link to benchcoin over bitcoinperf

- **Status:** merged
- **Created:** 2025-03-05
- **Merged:** 2025-03-08 (open 2 days)
- **Component:** Docs
- **Changes:** +1 / -3 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto, @laanwj

Updates documentation to link to the benchcoin repository instead of bitcoinperf for Bitcoin benchmarking tools.

*Note: The following is AI-generated interpretation:*
This appears to provide developers with better or more current benchmarking tools, which may help with performance testing and optimization of Bitcoin Core.

### ✅ [#31997](https://github.com/bitcoin/bitcoin/pull/31997) doc: update location of minisketch repository

- **Status:** merged
- **Created:** 2025-03-05
- **Merged:** 2025-03-05
- **Component:** Docs
- **Changes:** +2 / -2 lines in 2 files
- **Commits:** 1
- **Reviewers:** @hebasto, @theStack

Updates documentation to reflect that the minisketch repository has moved to a new location under bitcoin-core organization.

*Note: The following is AI-generated interpretation:*
This likely ensures developers can find the correct repository for minisketch, which is used for set reconciliation in Bitcoin and may be important for certain peer-to-peer communication optimizations.

### ✅ [#31998](https://github.com/bitcoin/bitcoin/pull/31998) depends: patch around PlacementNew issue in capnp

- **Status:** merged
- **Created:** 2025-03-05
- **Merged:** 2025-03-13 (open 7 days)
- **Component:** Build system
- **Changes:** +76 / -0 lines in 2 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @TheCharlatan, @ryanofsky

Applies a patch to work around a PlacementNew issue in the Cap'n Proto (capnp) dependency used in the build system.

*Note: The following is AI-generated interpretation:*
This likely fixes a build compatibility issue that may prevent Bitcoin Core from compiling correctly on certain systems or configurations, ensuring broader platform support.

### ✅ [#32000](https://github.com/bitcoin/bitcoin/pull/32000) Update minisketch subtree to d1e6bb8bbf8ef104b9dd002cab14a71b91061177

- **Status:** merged
- **Created:** 2025-03-05
- **Merged:** 2025-03-07 (open 1 days)
- **Changes:** +3 / -3 lines in 2 files
- **Commits:** 2
- **Reviewers:** @hebasto

Updates the minisketch subtree to a newer commit, incorporating upstream changes from the minisketch project.

*Note: The following is AI-generated interpretation:*
This likely brings bug fixes or improvements to the minisketch library, which may enhance the efficiency of set reconciliation operations used in Bitcoin's peer-to-peer networking.

### ✅ [#32002](https://github.com/bitcoin/bitcoin/pull/32002) doc: add note to Windows build about stripping bins

- **Status:** merged
- **Created:** 2025-03-05
- **Merged:** 2025-03-08 (open 2 days)
- **Component:** Docs
- **Changes:** +12 / -3 lines in 1 files
- **Commits:** 1
- **Review comments:** 8
- **Reviewers:** @hebasto, @hodlinator

Adds documentation to Windows build instructions about using the --strip option to reduce binary size from nearly 500mb when debug info is included.

*Note: The following is AI-generated interpretation:*
This likely helps Windows developers and users manage disk space more efficiently when building Bitcoin Core, as debug binaries can consume significant storage space which may discourage development or testing.

### ✅ [#32003](https://github.com/bitcoin/bitcoin/pull/32003) doc: remove note about macOS self-signing

- **Status:** merged
- **Created:** 2025-03-05
- **Merged:** 2025-03-06 (open 1 days)
- **Component:** Docs
- **Changes:** +0 / -7 lines in 1 files
- **Commits:** 1
- **Reviewers:** @luke-jr

Removes a note about macOS self-signing from documentation as a followup to a previous change.

*Note: The following is AI-generated interpretation:*
This appears to be maintenance work that likely removes outdated or no longer relevant information about the macOS build process, helping keep documentation accurate and current.

### ✅ [#32009](https://github.com/bitcoin/bitcoin/pull/32009) contrib: turn off compression of macOS SDK to fix determinism (across distros)

- **Status:** merged
- **Created:** 2025-03-06
- **Merged:** 2025-11-27 (open 265 days)
- **Changes:** +23 / -26 lines in 4 files
- **Commits:** 3
- **Review comments:** 15
- **Reviewers:** @l0rinc, @stickies-v

Modifies macOS SDK packaging to be more selective about included files and removes compression to fix determinism issues across different Linux distributions.

*Note: The following is AI-generated interpretation:*
This likely improves the reproducible build process for Bitcoin Core, which may be important for security and verification purposes, ensuring that builds produce identical results regardless of the build environment.

### ✅ [#32038](https://github.com/bitcoin/bitcoin/pull/32038) depends: remove `NO_HARDEN` option

- **Status:** merged
- **Created:** 2025-03-12
- **Merged:** 2025-03-14 (open 1 days)
- **Component:** Build system
- **Changes:** +4 / -21 lines in 5 files
- **Commits:** 1
- **Reviewers:** @laanwj

Removes the NO_HARDEN option from the build system, which was previously needed to work around a Windows-specific issue that no longer occurs.

*Note: The following is AI-generated interpretation:*
This likely improves security by removing a carveout that disabled hardening features, potentially making Bitcoin Core binaries more resistant to certain types of exploits on Windows systems.

### ❌ [#32081](https://github.com/bitcoin/bitcoin/pull/32081) depends: patch Qt rounding bugs

- **Status:** closed
- **Created:** 2025-03-17
- **Component:** Build system
- **Changes:** +102 / -0 lines in 2 files
- **Commits:** 1
- **Reviewers:** @ryanofsky

Patches Qt rounding bugs that were causing runtime failures in 32-bit Clang GUI wallet tests when compiled with -O0 optimization.

*Note: The following is AI-generated interpretation:*
This likely improves the reliability of Bitcoin Core's GUI components, particularly for developers running tests or debugging, which may help ensure the wallet interface works correctly across different compilation scenarios.

### ✅ [#32226](https://github.com/bitcoin/bitcoin/pull/32226) ci: switch to LLVM 20 in tidy job

- **Status:** merged
- **Created:** 2025-04-06
- **Merged:** 2025-04-23 (open 17 days)
- **Component:** Tests
- **Changes:** +17 / -17 lines in 12 files
- **Commits:** 2
- **Review comments:** 5
- **Reviewers:** @hebasto, @l0rinc

Updates the continuous integration system to use LLVM version 20 for the code tidiness checking job.

*Note: The following is AI-generated interpretation:*
This likely helps maintain code quality by leveraging newer static analysis capabilities in LLVM 20, which may catch more potential issues or provide better linting feedback during development.

### ✅ [#32252](https://github.com/bitcoin/bitcoin/pull/32252) [29.x] doc: minor rel notes changes

- **Status:** merged
- **Created:** 2025-04-11
- **Merged:** 2025-04-11
- **Changes:** +0 / -103 lines in 2 files
- **Commits:** 1
- **Reviewers:** @Jacksdad2015, @janb84, @jonatack

Makes minor changes to release notes documentation for the 29.x branch, removing unused headers and empty templates.

*Note: The following is AI-generated interpretation:*
This appears to streamline the release documentation process and may help reduce confusion by removing unnecessary boilerplate from point release notes.

### ✅ [#32288](https://github.com/bitcoin/bitcoin/pull/32288) ci: drop -priority-level from bench in win cross CI

- **Status:** merged
- **Created:** 2025-04-16
- **Merged:** 2025-04-17
- **Component:** Tests
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Review comments:** 8
- **Reviewers:** @hebasto, @mabu44

Removes the priority-level filter from benchmark testing in Windows cross-compilation CI to ensure all benchmarks are checked.

*Note: The following is AI-generated interpretation:*
This likely improves test coverage by ensuring that performance benchmarks are properly validated across different priority levels, which may help catch performance regressions more effectively.

### ✅ [#32292](https://github.com/bitcoin/bitcoin/pull/32292) [29.x] Backports

- **Status:** merged
- **Created:** 2025-04-17
- **Merged:** 2025-05-22 (open 35 days)
- **Changes:** +137 / -320 lines in 22 files
- **Commits:** 22
- **Review comments:** 1
- **Reviewers:** @hebasto, @willcl-ark

Backports multiple fixes and improvements from the main development branch to the 29.x release branch.

*Note: The following is AI-generated interpretation:*
This appears to bring important bug fixes and stability improvements to the 29.x release series, which likely helps maintain reliability for users running that version while avoiding major feature changes.

### ✅ [#32299](https://github.com/bitcoin/bitcoin/pull/32299) [28.x] Backports

- **Status:** merged
- **Created:** 2025-04-17
- **Merged:** 2025-05-13 (open 25 days)
- **Changes:** +56 / -25 lines in 11 files
- **Commits:** 6
- **Reviewers:** @willcl-ark

Backports selected fixes and improvements from newer versions to the 28.x release branch.

*Note: The following is AI-generated interpretation:*
This likely provides critical bug fixes and stability improvements to users still running the 28.x series, which may help maintain network stability and security for those not yet upgraded to newer versions.

### ✅ [#32403](https://github.com/bitcoin/bitcoin/pull/32403) test: remove Boost SIGCHLD workaround.

- **Status:** merged
- **Created:** 2025-05-02
- **Merged:** 2025-05-02
- **Component:** Tests
- **Changes:** +0 / -8 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto, @laanwj, @mabu44

Removes a workaround for Boost SIGCHLD handling in tests since the related code was removed from the Boost library itself.

*Note: The following is AI-generated interpretation:*
This likely helps maintain code cleanliness by removing obsolete workarounds and may prevent potential test failures or compatibility issues with newer versions of Boost.

### ✅ [#32405](https://github.com/bitcoin/bitcoin/pull/32405) build: replace header checks with `__has_include`

- **Status:** merged
- **Created:** 2025-05-02
- **Merged:** 2025-05-05 (open 2 days)
- **Component:** Build system
- **Changes:** +4 / -24 lines in 4 files
- **Commits:** 1
- **Reviewers:** @TheCharlatan, @hebasto, @shahsb

Replaces CMake header checks with the C++17 standard library `__has_include` preprocessor directive.

*Note: The following is AI-generated interpretation:*
This appears to modernize the build system by using standard C++17 features instead of build-system-specific checks, which may improve build reliability and reduce dependency on CMake-specific functionality.

### ✅ [#32437](https://github.com/bitcoin/bitcoin/pull/32437) crypto: disable ASan for sha256_sse4 with Clang

- **Status:** merged
- **Created:** 2025-05-07
- **Merged:** 2025-05-08
- **Component:** Utils/log/libs
- **Changes:** +6 / -2 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto, @laanwj

Disables AddressSanitizer (ASan) for SHA256 SSE4 code when using Clang compiler to fix compilation failures.

*Note: The following is AI-generated interpretation:*
This likely resolves build issues that could prevent developers from using important debugging tools like ASan, which may help maintain code quality and testing capabilities for Bitcoin's cryptographic functions.

### ✅ [#32439](https://github.com/bitcoin/bitcoin/pull/32439) guix: accomodate migration to codeberg

- **Status:** merged
- **Created:** 2025-05-07
- **Merged:** 2025-05-27 (open 20 days)
- **Component:** Build system
- **Changes:** +5 / -5 lines in 2 files
- **Commits:** 1
- **Review comments:** 7
- **Reviewers:** @hebasto, @maflcko

Updates Guix build system configuration to accommodate the migration from one hosting platform to Codeberg.

*Note: The following is AI-generated interpretation:*
This appears to ensure continued functionality of the deterministic build system as upstream dependencies change hosting platforms, which may help maintain the integrity and reproducibility of Bitcoin Core builds.

### ✅ [#32444](https://github.com/bitcoin/bitcoin/pull/32444) doc: swap "Docker image" for "container image"

- **Status:** merged
- **Created:** 2025-05-08
- **Merged:** 2025-05-08
- **Component:** Docs
- **Changes:** +5 / -5 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto, @laanwj

Updates documentation to use the generic term "container image" instead of the Docker-specific "Docker image".

*Note: The following is AI-generated interpretation:*
This likely makes the documentation more inclusive of different container runtimes like Podman, which may help developers who prefer alternative containerization tools while working with Bitcoin Core.

### ❌ [#32445](https://github.com/bitcoin/bitcoin/pull/32445) build: let CMake determine the year

- **Status:** closed
- **Created:** 2025-05-08
- **Component:** Build system
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Review comments:** 4
- **Reviewers:** @hebasto, @laanwj, @ryanofsky, @w0xlt

Updates the build system to automatically determine the current year using CMake's timestamp functionality instead of manually updating it. This change respects the SOURCE_DATE_EPOCH environment variable for reproducible builds.

*Note: The following is AI-generated interpretation:*
This change likely reduces maintenance overhead by eliminating the need for developers to manually bump year values in the codebase, and may help ensure better reproducible builds by properly handling timestamp generation during compilation.

### ✅ [#32446](https://github.com/bitcoin/bitcoin/pull/32446) build: simplify *ifaddr handling

- **Status:** merged
- **Created:** 2025-05-08
- **Merged:** 2025-05-10 (open 2 days)
- **Component:** Build system
- **Changes:** +12 / -21 lines in 7 files
- **Commits:** 1
- **Review comments:** 3
- **Reviewers:** @TheCharlatan, @hebasto

Simplifies the build system's handling of network interface address functions by focusing the conditional logic on Windows builds and removing redundant header checks. It consolidates two separate interface address defines into one.

*Note: The following is AI-generated interpretation:*
This refactoring likely makes the build configuration more maintainable and may reduce complexity in cross-platform compilation, particularly for network-related functionality that Bitcoin Core uses for peer discovery and connection management.

### ✅ [#32448](https://github.com/bitcoin/bitcoin/pull/32448) contrib: remove bdb exception from FORTIFY check

- **Status:** merged
- **Created:** 2025-05-08
- **Merged:** 2025-05-08
- **Changes:** +1 / -2 lines in 1 files
- **Commits:** 1
- **Reviewers:** @laanwj, @pablomartin4btc, @theuni

Removes Berkeley DB (BDB) related exceptions from the FORTIFY security check script since BDB support was previously removed from Bitcoin Core. The change cleans up the security validation tooling.

*Note: The following is AI-generated interpretation:*
This cleanup likely ensures that security hardening checks are more accurate and focused, which may help maintain Bitcoin Core's security posture by removing outdated exceptions that could mask potential issues in the current codebase.

### ❌ [#32450](https://github.com/bitcoin/bitcoin/pull/32450) randomenv: remove some `/proc/` accesses

- **Status:** closed
- **Created:** 2025-05-08
- **Component:** Utils/log/libs
- **Changes:** +0 / -12 lines in 1 files
- **Commits:** 1

Removes certain `/proc/` filesystem accesses from the random environment data gathering code to reduce spam and issues with sandboxed environments like snap packages.

*Note: The following is AI-generated interpretation:*
This change likely improves Bitcoin Core's compatibility with containerized and sandboxed deployment environments, which may help users run Bitcoin Core in restricted security contexts without generating excessive log noise.

### ✅ [#32458](https://github.com/bitcoin/bitcoin/pull/32458) guix: move `*-check.py` scripts under contrib/guix/

- **Status:** merged
- **Created:** 2025-05-09
- **Merged:** 2025-05-12 (open 3 days)
- **Component:** Build system
- **Changes:** +9 / -34 lines in 5 files
- **Commits:** 1
- **Reviewers:** @TheCharlatan, @hebasto, @laanwj

Moves binary validation scripts from a general location to under the contrib/guix/ directory to clarify that these tools are specifically for checking official release binaries rather than general development use.

*Note: The following is AI-generated interpretation:*
This reorganization likely helps prevent confusion among developers and may reduce support burden by making it clearer that these validation scripts are designed specifically for release binaries compiled with particular assumptions about the build environment.

### ✅ [#32460](https://github.com/bitcoin/bitcoin/pull/32460) fs: remove `_POSIX_C_SOURCE` defining

- **Status:** merged
- **Created:** 2025-05-09
- **Merged:** 2025-05-30 (open 20 days)
- **Component:** Utils/log/libs
- **Changes:** +0 / -18 lines in 2 files
- **Commits:** 1
- **Review comments:** 1
- **Reviewers:** @hebasto, @laanwj

Removes the manual defining of `_POSIX_C_SOURCE` macro since Linux systems default to a newer version automatically.

*Note: The following is AI-generated interpretation:*
This change likely helps modernize the codebase by leveraging newer POSIX standards by default, which may provide better compatibility and access to more recent system features across different Linux distributions.

### ✅ [#32479](https://github.com/bitcoin/bitcoin/pull/32479) [27.x] Backports

- **Status:** merged
- **Created:** 2025-05-13
- **Merged:** 2025-06-09 (open 26 days)
- **Changes:** +67 / -32 lines in 15 files
- **Commits:** 9
- **Reviewers:** @willcl-ark

Backports multiple pull requests (#32070, #32187, #32286, #32439, #32568) to the 27.x branch.

*Note: The following is AI-generated interpretation:*
This appears to be maintenance work to ensure the 27.x release branch receives important fixes and improvements, likely helping maintain stability and security for users running that version.

### ✅ [#32480](https://github.com/bitcoin/bitcoin/pull/32480) [28.x] 28.2rc1

- **Status:** merged
- **Created:** 2025-05-13
- **Merged:** 2025-05-16 (open 3 days)
- **Changes:** +28 / -28 lines in 8 files
- **Commits:** 3
- **Reviewers:** @willcl-ark

Prepares final changes for the v28.2rc1 release candidate.

*Note: The following is AI-generated interpretation:*
This likely represents the culmination of testing and refinements needed before releasing version 28.2, which may include critical bug fixes and improvements for Bitcoin Core users.

### ✅ [#32482](https://github.com/bitcoin/bitcoin/pull/32482) build: add `-W*-whitespace`

- **Status:** merged
- **Created:** 2025-05-13
- **Merged:** 2025-11-12 (open 182 days)
- **Component:** Build system
- **Changes:** +626 / -615 lines in 6 files
- **Commits:** 8
- **Review comments:** 8
- **Reviewers:** @hebasto, @l0rinc

Adds GCC compiler flags to detect and fail compilation on leading and trailing whitespace issues, while fixing existing whitespace problems.

*Note: The following is AI-generated interpretation:*
This change likely helps maintain code quality and consistency by catching whitespace issues at compile time, which may reduce development friction and prevent formatting-related pull request iterations.

### ❌ [#32484](https://github.com/bitcoin/bitcoin/pull/32484) [28.x] build: suppress `-Wunterminated-string-initialization` in secp256k1

- **Status:** closed
- **Created:** 2025-05-13
- **Changes:** +3 / -0 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto

Suppresses compiler warnings about unterminated string initialization in secp256k1 when using GCC 15.

*Note: The following is AI-generated interpretation:*
This appears to address compatibility with newer compiler versions, likely ensuring Bitcoin Core can be built without warnings on systems with GCC 15, which may be important for maintaining broad platform support.

### ✅ [#32485](https://github.com/bitcoin/bitcoin/pull/32485) Update minisketch subtree

- **Status:** merged
- **Created:** 2025-05-13
- **Merged:** 2025-05-16 (open 2 days)
- **Changes:** +4 / -4 lines in 1 files
- **Commits:** 2
- **Reviewers:** @willcl-ark

Updates the minisketch subtree to incorporate upstream changes from the minisketch library. This appears to pull in recent improvements or fixes from the external minisketch repository.

*Note: The following is AI-generated interpretation:*
This likely helps maintain Bitcoin Core's ability to efficiently synchronize transaction sets between nodes, as minisketch is used for compact block relay and may include performance improvements or bug fixes that enhance P2P communication efficiency.

### ✅ [#32491](https://github.com/bitcoin/bitcoin/pull/32491) build: document why we check for `std::system`

- **Status:** merged
- **Created:** 2025-05-14
- **Merged:** 2025-05-16 (open 2 days)
- **Component:** Build system
- **Changes:** +2 / -0 lines in 1 files
- **Commits:** 1

Adds documentation explaining why Bitcoin Core's build system checks for the std::system function availability. This clarifies that certain platforms like iOS don't support this standard library feature.

*Note: The following is AI-generated interpretation:*
This may help developers understand build requirements and platform compatibility, potentially preventing confusion when attempting to build Bitcoin Core on unsupported platforms like iOS where certain system functions are unavailable.

### ✅ [#32492](https://github.com/bitcoin/bitcoin/pull/32492) test: add skip_if_running_under_valgrind()

- **Status:** merged
- **Created:** 2025-05-14
- **Merged:** 2025-05-15
- **Component:** Tests
- **Changes:** +10 / -0 lines in 6 files
- **Commits:** 1
- **Reviewers:** @willcl-ark

Introduces a helper function to skip tests when running under Valgrind and applies it to USDT (User Statically Defined Tracing) tests. This addresses issues where Valgrind intercepts SIGTRAP signals fired by tracepoints and aborts.

*Note: The following is AI-generated interpretation:*
This likely improves the reliability of Bitcoin Core's testing infrastructure by preventing test failures when running under memory debugging tools, which may help developers catch memory issues without being blocked by incompatible tracing functionality.

### ✅ [#32496](https://github.com/bitcoin/bitcoin/pull/32496) depends: drop `ltcg` for Windows Qt

- **Status:** merged
- **Created:** 2025-05-14
- **Merged:** 2025-06-05 (open 21 days)
- **Component:** Build system
- **Changes:** +0 / -3 lines in 1 files
- **Commits:** 1

Removes Link Time Code Generation (LTCG) configuration for Windows Qt builds in the depends system. This change reflects that related Windows patches were previously dropped and cross-compilation doesn't support LTO.

*Note: The following is AI-generated interpretation:*
This likely simplifies the build process and removes unused configuration that may have been causing build issues or confusion, potentially making Windows builds more reliable and easier to maintain.

### ✅ [#32498](https://github.com/bitcoin/bitcoin/pull/32498) doc: remove Carls substitute server from Guix docs

- **Status:** merged
- **Created:** 2025-05-14
- **Merged:** 2025-05-15
- **Component:** Docs
- **Changes:** +5 / -11 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto

Removes a reference to Carl's substitute server from the Guix documentation since that server no longer exists. Updates the example to use other available Guix servers instead.

*Note: The following is AI-generated interpretation:*
This likely helps developers successfully build Bitcoin Core using Guix by ensuring documentation points to working substitute servers, which may reduce build times and prevent confusion when following the reproducible build process.

### ✅ [#32500](https://github.com/bitcoin/bitcoin/pull/32500) init: drop `-upnp`

- **Status:** merged
- **Created:** 2025-05-14
- **Merged:** 2025-05-16 (open 1 days)
- **Changes:** +3 / -28 lines in 2 files
- **Commits:** 1
- **Reviewers:** @darosior

Removes the deprecated `-upnp` command line option that was scheduled for removal in version 30.0.

*Note: The following is AI-generated interpretation:*
This likely helps maintain a cleaner codebase by removing deprecated functionality, which may reduce maintenance burden and prevent users from relying on outdated configuration options.

### ✅ [#32534](https://github.com/bitcoin/bitcoin/pull/32534) Update leveldb subtree to latest upstream

- **Status:** merged
- **Created:** 2025-05-16
- **Merged:** 2025-05-17
- **Changes:** +13 / -16 lines in 5 files
- **Commits:** 3
- **Reviewers:** @hebasto

Updates the embedded LevelDB database library to the latest upstream version and removes related warning suppressions.

*Note: The following is AI-generated interpretation:*
This likely improves Bitcoin Core's database performance and security by incorporating upstream bug fixes and optimizations, which may enhance node stability and data integrity.

### ✅ [#32562](https://github.com/bitcoin/bitcoin/pull/32562) doc: remove // for ... comments

- **Status:** merged
- **Created:** 2025-05-19
- **Merged:** 2025-05-20
- **Component:** Docs
- **Changes:** +117 / -92 lines in 28 files
- **Commits:** 3
- **Review comments:** 4
- **Reviewers:** @Sjors, @stickies-v, @willcl-ark

Removes outdated '// for ...' comments from the codebase that were providing little value and containing incorrect information.

*Note: The following is AI-generated interpretation:*
This appears to improve code maintainability by removing misleading documentation comments, which may help developers better understand the codebase and reduce confusion during development.

### ✅ [#32563](https://github.com/bitcoin/bitcoin/pull/32563) [28.x] Backport #31407

- **Status:** merged
- **Created:** 2025-05-19
- **Merged:** 2025-06-05 (open 17 days)
- **Changes:** +144 / -75 lines in 7 files
- **Commits:** 11
- **Review comments:** 3
- **Reviewers:** @pinheadmz

Backports pull request #31407 and #32003 to the 28.x release branch.

*Note: The following is AI-generated interpretation:*
This likely brings important fixes or improvements to the stable 28.x branch, which may help users on that version receive critical updates without upgrading to a newer major version.

### ✅ [#32568](https://github.com/bitcoin/bitcoin/pull/32568) depends: use "mkdir -p" when installing xproto

- **Status:** merged
- **Created:** 2025-05-20
- **Merged:** 2025-06-03 (open 14 days)
- **Component:** Build system
- **Changes:** +3 / -1 lines in 1 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @hebasto, @janb84, @willcl-ark

Forces the use of 'mkdir -p' when installing xproto dependency to fix build issues on Alpine Linux.

*Note: The following is AI-generated interpretation:*
This appears to resolve build system compatibility issues on Alpine Linux, which may help expand Bitcoin Core's buildability across different operating systems and improve developer experience.

### ✅ [#32584](https://github.com/bitcoin/bitcoin/pull/32584) depends: hard-code necessary c(xx)flags rather than setting them per-host

- **Status:** merged
- **Created:** 2025-05-22
- **Merged:** 2025-07-30 (open 69 days)
- **Component:** Build system
- **Changes:** +16 / -14 lines in 7 files
- **Commits:** 1
- **Reviewers:** @ryanofsky, @theuni

Modifies the Bitcoin Core build system to hard-code necessary compiler flags instead of setting them per-host platform. This change prevents duplication and ensures that required C/C++ standard flags are consistently applied even when environment variables override default settings.

*Note: The following is AI-generated interpretation:*
This change likely improves build reliability and consistency across different platforms by ensuring that essential compiler standards are always enforced. It may help prevent build failures that could occur when platform-specific defaults are inadvertently overridden by environment variables.

### ✅ [#32589](https://github.com/bitcoin/bitcoin/pull/32589) [29.x] More backports

- **Status:** merged
- **Created:** 2025-05-22
- **Merged:** 2025-06-25 (open 33 days)
- **Changes:** +175 / -42 lines in 31 files
- **Commits:** 22
- **Review comments:** 4
- **Reviewers:** @glozow, @instagibbs, @theuni, @willcl-ark

A collection of backports to the 29.x release branch, incorporating multiple previously merged pull requests. This appears to be maintenance work to bring important fixes and improvements to the stable release branch.

*Note: The following is AI-generated interpretation:*
This backport collection likely helps maintain the stability and security of the 29.x release series by incorporating important bug fixes and improvements that were developed for newer versions. It may ensure that users on the stable branch receive critical updates without needing to upgrade to bleeding-edge versions.

### ✅ [#32639](https://github.com/bitcoin/bitcoin/pull/32639) [28.x] Backport guix: accomodate migration to codeberg

- **Status:** merged
- **Created:** 2025-05-29
- **Merged:** 2025-05-30
- **Changes:** +5 / -5 lines in 2 files
- **Commits:** 1
- **Reviewers:** @hebasto

Backports changes to accommodate the Guix project's migration from their old repository to Codeberg. This updates build tooling to work with the new repository location.

*Note: The following is AI-generated interpretation:*
This change appears necessary to maintain Bitcoin Core's reproducible build system, which relies on Guix for deterministic compilation. The migration accommodation likely ensures that Bitcoin's build process continues to work seamlessly as external dependencies update their infrastructure.

### ✅ [#32644](https://github.com/bitcoin/bitcoin/pull/32644) doc: miscellaneous changes

- **Status:** merged
- **Created:** 2025-05-30
- **Merged:** 2025-06-03 (open 3 days)
- **Component:** Docs
- **Changes:** +42 / -45 lines in 31 files
- **Commits:** 4
- **Review comments:** 2
- **Reviewers:** @maflcko

Makes miscellaneous improvements to Bitcoin Core's documentation. This appears to be a cleanup effort that consolidates various documentation updates and changes.

*Note: The following is AI-generated interpretation:*
Documentation improvements likely help make Bitcoin Core more accessible to developers and users by clarifying instructions, fixing errors, or updating outdated information. This may reduce confusion and support better adoption of the software.

### ✅ [#32647](https://github.com/bitcoin/bitcoin/pull/32647) build: add -Wthread-safety-pointer

- **Status:** merged
- **Created:** 2025-05-30
- **Merged:** 2025-06-04 (open 4 days)
- **Component:** Build system
- **Changes:** +3 / -2 lines in 2 files
- **Commits:** 3
- **Reviewers:** @theuni

Adds the -Wthread-safety-pointer compiler warning flag for Clang 21, which will help detect potential thread safety issues when passing pointers to guarded variables. This is a proactive security and code quality improvement.

*Note: The following is AI-generated interpretation:*
This addition likely improves Bitcoin Core's thread safety by catching potential concurrency bugs at compile time. Given Bitcoin's multi-threaded nature and the critical importance of avoiding race conditions in financial software, this warning may help prevent subtle but dangerous threading issues that could lead to consensus failures or security vulnerabilities.

### ✅ [#32655](https://github.com/bitcoin/bitcoin/pull/32655) depends: sqlite 3.50.4; switch to autosetup

- **Status:** merged
- **Created:** 2025-06-01
- **Merged:** 2025-11-25 (open 176 days)
- **Component:** Build system
- **Changes:** +17 / -21 lines in 2 files
- **Commits:** 2
- **Review comments:** 4
- **Reviewers:** @hebasto, @sedited, @willcl-ark

Updates SQLite dependency to version 3.50.4 and switches from the old build system to the new Autosetup build system.

*Note: The following is AI-generated interpretation:*
This likely improves build reliability and security by using a newer SQLite version with potential bug fixes and performance improvements. The switch to Autosetup may help streamline the build process and reduce maintenance overhead.

### ✅ [#32656](https://github.com/bitcoin/bitcoin/pull/32656) depends: don't install & then delete sqlite pkgconf

- **Status:** merged
- **Created:** 2025-06-01
- **Merged:** 2025-06-02
- **Component:** Build system
- **Changes:** +1 / -2 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto, @stickies-v

Removes the installation and subsequent deletion of SQLite pkgconf files during the build process.

*Note: The following is AI-generated interpretation:*
This appears to be a build system cleanup that may improve build efficiency by avoiding unnecessary file operations. It likely reduces build complexity and potential points of failure.

### ✅ [#32665](https://github.com/bitcoin/bitcoin/pull/32665) depends: Bump boost to 1.88.0 and use new CMake buildsystem

- **Status:** merged
- **Created:** 2025-06-02
- **Merged:** 2025-06-26 (open 23 days)
- **Component:** Build system
- **Changes:** +161 / -6 lines in 2 files
- **Commits:** 1
- **Review comments:** 6
- **Reviewers:** @hebasto, @theuni, @willcl-ark

Updates Boost dependency to version 1.88.0 and switches from copying headers to using the new CMake build system.

*Note: The following is AI-generated interpretation:*
This likely improves build efficiency and maintainability by only installing necessary Boost components rather than all headers. The CMake integration may help with better dependency management and could reduce compilation times.

### ✅ [#32684](https://github.com/bitcoin/bitcoin/pull/32684) [28.x] 28.2rc2

- **Status:** merged
- **Created:** 2025-06-05
- **Merged:** 2025-06-09 (open 4 days)
- **Changes:** +31 / -22 lines in 9 files
- **Commits:** 4
- **Review comments:** 2
- **Reviewers:** @glozow, @willcl-ark

Backports changes to the 28.x branch and bumps version to release candidate 2 (28.2rc2).

*Note: The following is AI-generated interpretation:*
This appears to be standard release management, ensuring that important fixes and improvements are included in the stable 28.x release branch. This likely helps maintain stability and security for users on the 28.x version series.

### ✅ [#32735](https://github.com/bitcoin/bitcoin/pull/32735) [28.x] More backports

- **Status:** merged
- **Created:** 2025-06-12
- **Merged:** 2025-06-17 (open 5 days)
- **Changes:** +39 / -9 lines in 5 files
- **Commits:** 3
- **Reviewers:** @josibake, @stickies-v, @willcl-ark

Backports additional commits that were missed in previous backports to the 28.x branch.

*Note: The following is AI-generated interpretation:*
This likely ensures completeness of the 28.x release by including previously missed changes. This may help maintain consistency between development and release branches and could address bugs or improvements that should be available to 28.x users.

### ✅ [#32739](https://github.com/bitcoin/bitcoin/pull/32739) tsan: remove note about dropping Qt wildcards

- **Status:** merged
- **Created:** 2025-06-12
- **Merged:** 2025-06-13
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1

Removes a note about dropping Qt wildcards from thread sanitizer configuration, citing maintainability concerns.

*Note: The following is AI-generated interpretation:*
This change likely simplifies the thread sanitizer setup by removing unmaintainable elements, which may help improve the reliability of automated testing and reduce maintenance burden for developers.

### ✅ [#32760](https://github.com/bitcoin/bitcoin/pull/32760) depends: capnp 1.2.0

- **Status:** merged
- **Created:** 2025-06-16
- **Merged:** 2025-06-16
- **Component:** Build system
- **Changes:** +2 / -227 lines in 5 files
- **Commits:** 1
- **Reviewers:** @ryanofsky, @theStack

Updates the Cap'n Proto dependency from version 1.1.0 to 1.2.0 in the build system.

*Note: The following is AI-generated interpretation:*
This update likely brings bug fixes and improvements from the newer Cap'n Proto version, and appears to simplify the build process by removing previously required patches, which may enhance build reliability.

### ✅ [#32777](https://github.com/bitcoin/bitcoin/pull/32777) doc: fix Transifex 404s

- **Status:** merged
- **Created:** 2025-06-19
- **Merged:** 2025-06-19
- **Component:** Docs
- **Changes:** +5 / -5 lines in 4 files
- **Commits:** 1
- **Review comments:** 5
- **Reviewers:** @fanquake, @hebasto

Fixes broken Transifex documentation links that now return 404 errors.

*Note: The following is AI-generated interpretation:*
This documentation fix likely helps contributors and translators find the correct translation resources, which may improve the accessibility of Bitcoin Core in different languages.

### ✅ [#32780](https://github.com/bitcoin/bitcoin/pull/32780) lsan: add more Qt suppressions

- **Status:** merged
- **Created:** 2025-06-19
- **Merged:** 2025-06-24 (open 4 days)
- **Changes:** +2 / -0 lines in 1 files
- **Commits:** 1

Adds additional Qt-related suppressions to the leak sanitizer configuration for testing.

*Note: The following is AI-generated interpretation:*
These suppressions likely help reduce false positive leak detections in Qt components during automated testing, which may improve the signal-to-noise ratio of memory leak detection and make CI more reliable.

### ✅ [#32797](https://github.com/bitcoin/bitcoin/pull/32797) doc: archive 28.2 release notes

- **Status:** merged
- **Created:** 2025-06-23
- **Merged:** 2025-06-23
- **Component:** Docs
- **Changes:** +83 / -0 lines in 1 files
- **Commits:** 1
- **Reviewers:** @glozow

Archives the release notes for Bitcoin Core version 28.2 now that it has been officially tagged and released.

*Note: The following is AI-generated interpretation:*
This documentation maintenance likely helps keep the release notes organized and accessible for users who need to reference the changes in version 28.2, which may improve user experience when tracking Bitcoin Core updates.

### ✅ [#32810](https://github.com/bitcoin/bitcoin/pull/32810) [29.x] More backports

- **Status:** merged
- **Created:** 2025-06-25
- **Merged:** 2025-07-03 (open 8 days)
- **Changes:** +61 / -7 lines in 8 files
- **Commits:** 8
- **Reviewers:** @Ahz9619, @hebasto, @pinheadmz, @willcl-ark

This PR backports multiple fixes and improvements to the 29.x release branch of Bitcoin Core.

*Note: The following is AI-generated interpretation:*
Backporting likely helps ensure that the stable 29.x release branch receives important bug fixes and improvements from the main development branch, which may help maintain stability and security for users running the 29.x version.

### ✅ [#32811](https://github.com/bitcoin/bitcoin/pull/32811) [28.x] Backports

- **Status:** merged
- **Created:** 2025-06-25
- **Merged:** 2025-07-03 (open 8 days)
- **Changes:** +38 / -36 lines in 7 files
- **Commits:** 5
- **Reviewers:** @hebasto

This PR backports multiple changes to the 28.x release branch but appears to have failed continuous integration tests.

*Note: The following is AI-generated interpretation:*
Similar to other backport PRs, this likely aims to bring important fixes to the 28.x stable branch, though the CI failure suggests there may be compatibility issues that need to be resolved before these changes can be safely integrated.

### ✅ [#32837](https://github.com/bitcoin/bitcoin/pull/32837) depends: fix libevent `_WIN32_WINNT` usage

- **Status:** merged
- **Created:** 2025-06-30
- **Merged:** 2025-07-16 (open 15 days)
- **Component:** Build system
- **Changes:** +125 / -1 lines in 2 files
- **Commits:** 1
- **Review comments:** 3
- **Reviewers:** @hebasto, @theuni, @willcl-ark

This PR fixes how libevent handles Windows version definitions to prevent compatibility issues with newer mingw headers.

*Note: The following is AI-generated interpretation:*
This appears to address a build system issue specific to Windows compilation that may help ensure Bitcoin Core can be properly built on Windows systems using newer development tools, which is important for maintaining cross-platform compatibility.

### ✅ [#32863](https://github.com/bitcoin/bitcoin/pull/32863) [29.x] Backports

- **Status:** merged
- **Created:** 2025-07-03
- **Merged:** 2025-07-18 (open 15 days)
- **Changes:** +249 / -64 lines in 21 files
- **Commits:** 15
- **Reviewers:** @glozow, @hebasto

This PR backports a large collection of fixes and improvements to the 29.x release branch.

*Note: The following is AI-generated interpretation:*
This extensive backport likely helps ensure the 29.x stable release incorporates numerous important fixes and improvements from active development, which may help improve stability, security, and functionality for users of the 29.x version.

### ❌ [#32865](https://github.com/bitcoin/bitcoin/pull/32865) cmake: Use `AUTHOR_WARNING` for warnings

- **Status:** closed
- **Created:** 2025-07-03
- **Component:** Build system
- **Changes:** +6 / -19 lines in 3 files
- **Commits:** 1
- **Review comments:** 9
- **Reviewers:** @hebasto, @maflcko, @ryanofsky

This PR improves the CMake build system by using CMake's built-in warning system instead of custom warning handling.

*Note: The following is AI-generated interpretation:*
Using CMake's standard warning mechanisms likely helps improve the build system's maintainability and consistency, which may make it easier for developers to build Bitcoin Core and identify configuration issues during compilation.

### ✅ [#32937](https://github.com/bitcoin/bitcoin/pull/32937) Enable `-Werror=dev` in CI & Guix

- **Status:** merged
- **Created:** 2025-07-10
- **Merged:** 2025-07-11 (open 1 days)
- **Changes:** +5 / -2 lines in 5 files
- **Commits:** 3
- **Reviewers:** @hebasto

Enables strict developer warning errors in the build system's CI, Guix, and dev-mode configurations. This makes CMake treat developer-focused warnings as compilation errors.

*Note: The following is AI-generated interpretation:*
This change likely helps improve code quality by catching potential issues earlier in the development process, which may reduce bugs and improve the reliability of Bitcoin Core builds.

### ✅ [#32969](https://github.com/bitcoin/bitcoin/pull/32969) [28.x] Backports

- **Status:** merged
- **Created:** 2025-07-14
- **Merged:** 2025-07-23 (open 9 days)
- **Changes:** +3 / -0 lines in 2 files
- **Commits:** 2
- **Reviewers:** @marcofleon

Backports changes from PR #32943 to the 28.x release branch. This appears to be maintenance work to keep the stable branch updated with important fixes.

*Note: The following is AI-generated interpretation:*
Backporting likely helps ensure that users on the 28.x version receive important bug fixes or improvements without needing to upgrade to newer versions, which may improve stability and security for existing deployments.

### ✅ [#33036](https://github.com/bitcoin/bitcoin/pull/33036) Update secp256k1 subtree to latest master

- **Status:** merged
- **Created:** 2025-07-22
- **Merged:** 2025-07-23
- **Changes:** +281 / -303 lines in 17 files
- **Commits:** 2
- **Reviewers:** @stickies-v, @theStack

Updates the secp256k1 cryptographic library subtree to the latest master version (v0.7.0). This brings in the newest improvements and changes from the secp256k1 project.

*Note: The following is AI-generated interpretation:*
Updating secp256k1 likely brings performance improvements, bug fixes, and potentially new cryptographic features that may enhance Bitcoin's signature verification speed and security.

### ✅ [#33044](https://github.com/bitcoin/bitcoin/pull/33044) contrib: drop use of `PermissionsStartOnly` & `Group=`

- **Status:** merged
- **Created:** 2025-07-23
- **Merged:** 2025-08-06 (open 14 days)
- **Changes:** +1 / -3 lines in 1 files
- **Commits:** 2
- **Review comments:** 2
- **Reviewers:** @willcl-ark

Removes deprecated systemd configuration directives by dropping the redundant 'Group=' and replacing the deprecated 'PermissionsStartOnly' in service files. This modernizes the systemd integration for current systems.

*Note: The following is AI-generated interpretation:*
This cleanup likely ensures Bitcoin Core's systemd service files work properly on modern Linux distributions and may prevent warnings or compatibility issues when running Bitcoin Core as a system service.

### ✅ [#33045](https://github.com/bitcoin/bitcoin/pull/33045) depends: disable variables, rules and suffixes.

- **Status:** merged
- **Created:** 2025-07-23
- **Merged:** 2025-11-04 (open 103 days)
- **Component:** Build system
- **Changes:** +2 / -0 lines in 1 files
- **Commits:** 2
- **Reviewers:** @hebasto

Disables implicit make rules, variables, and suffixes in the depends build system by adding flags that prevent make from looking for builtin rules. This simplifies and potentially speeds up the build process.

*Note: The following is AI-generated interpretation:*
This change likely improves build performance by reducing unnecessary rule lookups and may make the build process more deterministic and predictable, which could help with reproducible builds.

### ✅ [#33046](https://github.com/bitcoin/bitcoin/pull/33046) [29.x] test: Do not pass tests on unhandled exceptions

- **Status:** merged
- **Created:** 2025-07-23
- **Merged:** 2025-07-24
- **Changes:** +4 / -15 lines in 2 files
- **Commits:** 3
- **Reviewers:** @marcofleon, @pablomartin4btc

This backports a fix to the 29.x branch that ensures tests properly fail when unhandled exceptions occur.

*Note: The following is AI-generated interpretation:*
This likely improves test reliability by preventing false positives where tests appear to pass despite encountering unexpected errors, which may help maintain code quality and catch regressions more effectively.

### ✅ [#33064](https://github.com/bitcoin/bitcoin/pull/33064) test: fix RPC coverage check

- **Status:** merged
- **Created:** 2025-07-25
- **Merged:** 2025-07-28 (open 2 days)
- **Component:** Tests
- **Changes:** +6 / -1 lines in 3 files
- **Commits:** 2
- **Reviewers:** @cedwies

This fixes the RPC coverage checking mechanism in tests, cleaning up a previous PR now that legacy wallet code has been removed.

*Note: The following is AI-generated interpretation:*
This appears to ensure that RPC test coverage metrics are accurate, which may help developers identify untested code paths and maintain comprehensive test coverage for Bitcoin's RPC interface.

### ✅ [#33074](https://github.com/bitcoin/bitcoin/pull/33074) [29.x] Backports

- **Status:** merged
- **Created:** 2025-07-28
- **Merged:** 2025-08-15 (open 18 days)
- **Changes:** +62 / -33 lines in 10 files
- **Commits:** 8
- **Reviewers:** @glozow

This backports multiple fixes and improvements to the 29.x maintenance branch.

*Note: The following is AI-generated interpretation:*
This likely ensures that important bug fixes and improvements are available to users running the 29.x release series, which may help maintain stability and security for that version.

### ✅ [#33076](https://github.com/bitcoin/bitcoin/pull/33076) [28.x] Backports

- **Status:** merged
- **Created:** 2025-07-28
- **Merged:** 2025-07-30 (open 2 days)
- **Changes:** +36 / -29 lines in 6 files
- **Commits:** 5
- **Reviewers:** @marcofleon, @willcl-ark

This backports several fixes to the 28.x maintenance branch, though CI tests are currently failing.

*Note: The following is AI-generated interpretation:*
This appears to bring important fixes to the 28.x release series, which may help users on that version avoid bugs and maintain system reliability, though the CI failures suggest potential compatibility issues.

### ✅ [#33079](https://github.com/bitcoin/bitcoin/pull/33079) ci: limit max stack size to 512 KiB

- **Status:** merged
- **Created:** 2025-07-28
- **Merged:** 2025-07-29 (open 1 days)
- **Component:** Tests
- **Changes:** +11 / -2 lines in 8 files
- **Commits:** 2
- **Review comments:** 4
- **Reviewers:** @dergoegge, @maflcko

This limits the maximum stack size to 512 KiB in CI environments to prevent stack overflow issues during testing.

*Note: The following is AI-generated interpretation:*
This likely helps prevent test failures and crashes due to excessive stack usage, which may improve CI reliability and help catch potential stack overflow vulnerabilities in Bitcoin Core code.

### ❌ [#33081](https://github.com/bitcoin/bitcoin/pull/33081) [NO MERGE]: TSAN should fail

- **Status:** closed
- **Created:** 2025-07-28
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1

This is a test PR marked as 'NO MERGE' that intentionally causes ThreadSanitizer (TSAN) to fail. It appears to be testing CI behavior related to sanitizer failures.

*Note: The following is AI-generated interpretation:*
This likely helps verify that Bitcoin Core's continuous integration system properly detects and reports ThreadSanitizer failures, which may be important for catching concurrency bugs that could affect node stability or consensus behavior.

### ✅ [#33088](https://github.com/bitcoin/bitcoin/pull/33088) doc: move `cmake -B build -LH` up in Unix build docs

- **Status:** merged
- **Created:** 2025-07-29
- **Merged:** 2025-07-29
- **Component:** Docs
- **Changes:** +4 / -7 lines in 1 files
- **Commits:** 1
- **Reviewers:** @janb84, @stickies-v

This documentation update moves the `cmake -B build -LH` command higher up in the Unix build documentation to make it more prominent. This command helps users discover available build configuration flags.

*Note: The following is AI-generated interpretation:*
This change likely improves the developer experience by making it easier for contributors to discover build options early in the process, which may reduce build-related support requests and help developers enable features they need for testing or development.

### ✅ [#33099](https://github.com/bitcoin/bitcoin/pull/33099) ci: allow for any libc++ intrumentation & use it for TSAN

- **Status:** merged
- **Created:** 2025-07-30
- **Merged:** 2025-07-31 (open 1 days)
- **Component:** Tests
- **Changes:** +27 / -24 lines in 5 files
- **Commits:** 3
- **Review comments:** 4
- **Reviewers:** @dergoegge, @maflcko

This changes the CI configuration to allow libc++ to be instrumented with any sanitizer (not just MemoryWithOrigins) and enables this for ThreadSanitizer (TSAN). It also removes the need for DEBUG_LOCKORDER in TSAN builds.

*Note: The following is AI-generated interpretation:*
This likely improves Bitcoin Core's ability to detect threading issues and memory problems during testing, which may help catch subtle concurrency bugs that could affect node reliability or lead to undefined behavior in production.

### ✅ [#33100](https://github.com/bitcoin/bitcoin/pull/33100) ci: remove `ninja-build` from MSAN jobs

- **Status:** merged
- **Created:** 2025-07-30
- **Merged:** 2025-07-30
- **Component:** Tests
- **Changes:** +1 / -2 lines in 2 files
- **Commits:** 1
- **Reviewers:** @hebasto

This removes the redundant `ninja-build` package from MemorySanitizer (MSAN) CI jobs since it's already included in the base CI packages. This is a cleanup change to reduce duplication.

*Note: The following is AI-generated interpretation:*
This appears to be a minor maintenance improvement that may help keep CI configurations cleaner and reduce potential conflicts or confusion from duplicate package specifications in the build environment.

### ❌ [#33111](https://github.com/bitcoin/bitcoin/pull/33111) build: note that sysctl was removed from Linux

- **Status:** closed
- **Created:** 2025-08-01
- **Component:** Build system
- **Changes:** +2 / -2 lines in 1 files
- **Commits:** 1
- **Reviewers:** @janb84

This adds documentation noting that the sysctl system call was removed from Linux kernel 5.5, explaining why certain build system checks need to remain until older kernel support is dropped.

*Note: The following is AI-generated interpretation:*
This likely helps future maintainers understand why seemingly obsolete build system checks exist, which may prevent premature removal of compatibility code that's still needed for users running Bitcoin Core on older Linux systems.

### ✅ [#33125](https://github.com/bitcoin/bitcoin/pull/33125) ci: Use mlc `v1` and fix typos

- **Status:** merged
- **Created:** 2025-08-02
- **Merged:** 2025-08-07 (open 4 days)
- **Component:** Tests
- **Changes:** +10 / -10 lines in 6 files
- **Commits:** 6
- **Review comments:** 4
- **Reviewers:** @maflcko

Updates CI tools including mlc to version 1 and shellcheck to 0.11.0, while fixing various typos found during linting.

*Note: The following is AI-generated interpretation:*
This likely improves the development process by ensuring more accurate automated checks for documentation links and shell scripts, which may help catch issues earlier and maintain code quality standards.

### ✅ [#33143](https://github.com/bitcoin/bitcoin/pull/33143) [28.x] Backports

- **Status:** merged
- **Created:** 2025-08-06
- **Merged:** 2025-08-15 (open 9 days)
- **Changes:** +6 / -5 lines in 2 files
- **Commits:** 2
- **Reviewers:** @willcl-ark

A backport pull request for the 28.x branch that includes changes from PR #33133, though the CI has failed.

*Note: The following is AI-generated interpretation:*
This appears to be maintaining stability across Bitcoin Core versions by backporting fixes to the 28.x release branch, which may help ensure users on that version receive important updates.

### ✅ [#33151](https://github.com/bitcoin/bitcoin/pull/33151) subtree: update crc32c subtree

- **Status:** merged
- **Created:** 2025-08-07
- **Merged:** 2025-08-07
- **Changes:** +111 / -117 lines in 7 files
- **Commits:** 2
- **Reviewers:** @janb84

Updates the crc32c subtree to sync with the latest upstream version, which includes no functional changes but fixes typos.

*Note: The following is AI-generated interpretation:*
This likely ensures Bitcoin Core stays current with upstream dependencies and may help prevent potential compatibility issues or security vulnerabilities in the future.

### ✅ [#33155](https://github.com/bitcoin/bitcoin/pull/33155) contrib: drop `bitcoin-util` exception from FORTIFY check

- **Status:** merged
- **Created:** 2025-08-08
- **Merged:** 2025-08-11 (open 2 days)
- **Changes:** +0 / -3 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto

Removes the bitcoin-util exception from FORTIFY security checks since the utility now has proper memcpy_chk implementation.

*Note: The following is AI-generated interpretation:*
This appears to strengthen security by enabling FORTIFY protections for bitcoin-util, which may help detect buffer overflows and other memory-related vulnerabilities at runtime.

### ✅ [#33158](https://github.com/bitcoin/bitcoin/pull/33158) macdeploy: avoid use of `Bitcoin Core` in Linux cross build

- **Status:** merged
- **Created:** 2025-08-08
- **Merged:** 2025-09-24 (open 46 days)
- **Changes:** +18 / -18 lines in 3 files
- **Commits:** 2
- **Review comments:** 2
- **Reviewers:** @hodlinator, @jonatack, @willcl-ark

Changes the macOS build output filename to avoid using 'Bitcoin Core' branding in Linux cross-compilation builds.

*Note: The following is AI-generated interpretation:*
This likely improves build consistency across platforms and may help avoid trademark or branding issues when the software is built in cross-compilation environments.

### ✅ [#33178](https://github.com/bitcoin/bitcoin/pull/33178) guix: increase maximum allowed (runtime) GCC to 7

- **Status:** merged
- **Created:** 2025-08-12
- **Merged:** 2025-08-13
- **Component:** Build system
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto

Updates the Guix build system to allow GCC version 7 as the maximum runtime version to fix symbol compatibility issues. This resolves build failures where binaries require newer GCC symbols that aren't available on older systems.

*Note: The following is AI-generated interpretation:*
This change likely improves Bitcoin Core's compatibility across different Linux distributions by ensuring binaries can run on systems with GCC 7, which may help maintain broader deployment support and reduce user installation issues.

### ❌ [#33180](https://github.com/bitcoin/bitcoin/pull/33180) ASAN: turn on more not-enabled-by-default options

- **Status:** closed
- **Created:** 2025-08-13
- **Changes:** +2 / -2 lines in 2 files
- **Commits:** 2
- **Review comments:** 1
- **Reviewers:** @stickies-v

Enables additional AddressSanitizer (ASAN) options for stricter memory safety checks, including null-termination validation for strings and detection of invalid pointer comparisons. These options are not enabled by default in ASAN.

*Note: The following is AI-generated interpretation:*
This change likely enhances Bitcoin Core's development and testing process by catching more potential memory safety bugs earlier, which may help prevent security vulnerabilities and improve overall code reliability.

### ✅ [#33181](https://github.com/bitcoin/bitcoin/pull/33181) guix: build for Linux HOSTS with `-static-libgcc`

- **Status:** merged
- **Created:** 2025-08-13
- **Merged:** 2025-11-11 (open 90 days)
- **Component:** Build system
- **Changes:** +24 / -17 lines in 4 files
- **Commits:** 3
- **Review comments:** 5
- **Reviewers:** @hebasto, @janb84, @theuni, @willcl-ark

Modifies the Guix build system to compile Linux release binaries with the `-static-libgcc` flag, which statically links the GCC runtime library. This prevents runtime dependency issues with different GCC versions.

*Note: The following is AI-generated interpretation:*
This change likely improves Bitcoin Core's portability by reducing runtime dependencies on specific GCC library versions, which may help ensure binaries work consistently across different Linux distributions without compatibility issues.

### ✅ [#33185](https://github.com/bitcoin/bitcoin/pull/33185) guix: update time-machine to 5cb84f2013c5b1e48a7d0e617032266f1e6059e2

- **Status:** merged
- **Created:** 2025-08-13
- **Merged:** 2025-10-28 (open 75 days)
- **Component:** Build system
- **Changes:** +68 / -11 lines in 6 files
- **Commits:** 5
- **Review comments:** 9
- **Reviewers:** @hebasto, @maflcko, @willcl-ark

Updates the Guix time-machine to a newer commit that provides access to updated packages including LLVM 19 and newer versions of core libraries like glibc. This modernizes the build environment while maintaining stability.

*Note: The following is AI-generated interpretation:*
This change likely improves Bitcoin Core's build infrastructure by providing access to newer development tools and libraries, which may help with build reliability, security updates, and compatibility with modern development practices.

### ✅ [#33217](https://github.com/bitcoin/bitcoin/pull/33217) depends: remove xinerama extension from libxcb

- **Status:** merged
- **Created:** 2025-08-19
- **Merged:** 2025-08-22 (open 2 days)
- **Component:** Build system
- **Changes:** +1 / -2 lines in 2 files
- **Commits:** 2
- **Reviewers:** @hebasto

Removes the xinerama extension dependency from libxcb in the depends system, eliminating a requirement that's only recommended by Qt and primarily used for multi-screen window management. This addresses user installation difficulties on modern Linux distributions.

*Note: The following is AI-generated interpretation:*
This change likely simplifies Bitcoin Core's build dependencies and reduces installation friction for users, as the xinerama extension appears to be non-essential for core functionality and may help avoid common build failures on modern Linux systems.

### ✅ [#33225](https://github.com/bitcoin/bitcoin/pull/33225) [29.x] Backport logging ratelimiting

- **Status:** merged
- **Created:** 2025-08-20
- **Merged:** 2025-08-20
- **Changes:** +512 / -89 lines in 10 files
- **Commits:** 17
- **Review comments:** 7
- **Reviewers:** @dergoegge, @fanquake, @stickies-v

This PR backports logging rate limiting functionality to the 29.x branch, including multiple related commits.

*Note: The following is AI-generated interpretation:*
Rate limiting for logs likely helps prevent Bitcoin Core from generating excessive log output during periods of high activity, which may help reduce disk usage and improve performance during network events or attacks.

### ✅ [#33234](https://github.com/bitcoin/bitcoin/pull/33234) doc: update example bitcoin conf for 29.1rc2

- **Status:** merged
- **Created:** 2025-08-21
- **Merged:** 2025-08-21
- **Changes:** +2 / -2 lines in 1 files
- **Commits:** 1
- **Reviewers:** @dergoegge, @willcl-ark

Updates the example Bitcoin configuration file documentation for the 29.1rc2 release candidate.

*Note: The following is AI-generated interpretation:*
Keeping example configurations current likely helps users properly configure their Bitcoin nodes and may prevent misconfigurations that could impact node performance or security.

### ✅ [#33235](https://github.com/bitcoin/bitcoin/pull/33235) build: set ENABLE_IPC to OFF when fuzzing

- **Status:** merged
- **Created:** 2025-08-21
- **Merged:** 2025-09-04 (open 13 days)
- **Component:** Build system
- **Changes:** +1 / -0 lines in 1 files
- **Commits:** 1
- **Reviewers:** @dergoegge, @janb84

Fixes the build system to disable IPC functionality when building for fuzzing to resolve configuration failures.

*Note: The following is AI-generated interpretation:*
This appears to resolve build issues that likely prevent developers from creating fuzz testing builds, which may be important for finding security vulnerabilities and bugs in Bitcoin Core.

### ❌ [#33238](https://github.com/bitcoin/bitcoin/pull/33238) [29.x] depends: remove xinerama extension from libxcb

- **Status:** closed
- **Created:** 2025-08-22
- **Changes:** +2 / -2 lines in 3 files
- **Commits:** 3

Backports a change to remove the obsolete xinerama extension from libxcb dependencies to the 29.x branch.

*Note: The following is AI-generated interpretation:*
Removing obsolete dependencies likely helps reduce the attack surface and build complexity, and may improve compatibility with newer systems where xinerama is no longer available.

### ✅ [#33258](https://github.com/bitcoin/bitcoin/pull/33258) ci: use LLVM 21

- **Status:** merged
- **Created:** 2025-08-26
- **Merged:** 2025-08-28 (open 2 days)
- **Component:** Tests
- **Changes:** +5 / -5 lines in 5 files
- **Commits:** 1
- **Reviewers:** @janb84, @l0rinc

Updates the continuous integration system to use LLVM version 21 for sanitizer and fuzzing builds.

*Note: The following is AI-generated interpretation:*
Using a newer LLVM version likely provides better bug detection capabilities and more up-to-date tooling, which may help identify security issues and improve the overall quality of Bitcoin Core.

### ✅ [#33261](https://github.com/bitcoin/bitcoin/pull/33261) ci: return to using dash in CentOS job

- **Status:** merged
- **Created:** 2025-08-27
- **Merged:** 2025-08-28 (open 1 days)
- **Component:** Tests
- **Changes:** +2 / -2 lines in 2 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @janb84, @maflcko

Updates the CentOS continuous integration job to use the dash shell again after it became available following a bug fix.

*Note: The following is AI-generated interpretation:*
This change likely helps maintain consistent testing environments and may improve CI reliability by reverting to the originally intended shell configuration now that the upstream issue has been resolved.

### ✅ [#33271](https://github.com/bitcoin/bitcoin/pull/33271) [29.x] finalise v29.1

- **Status:** merged
- **Created:** 2025-08-29
- **Merged:** 2025-09-03 (open 4 days)
- **Changes:** +51 / -48 lines in 13 files
- **Commits:** 5
- **Review comments:** 1
- **Reviewers:** @Ystel2001, @glozow, @stickies-v, @willcl-ark

Finalizes version 29.1 by backporting multiple previous pull requests including the CentOS dash fix and other updates.

*Note: The following is AI-generated interpretation:*
This appears to be preparing a stable release by incorporating important fixes and updates, which likely helps ensure users have access to bug fixes and improvements in a tested release branch.

### ✅ [#33274](https://github.com/bitcoin/bitcoin/pull/33274) kernel: chainparams & headersync updates for 30.0

- **Status:** merged
- **Created:** 2025-09-01
- **Merged:** 2025-09-03 (open 1 days)
- **Component:** Validation
- **Changes:** +46 / -35 lines in 3 files
- **Commits:** 6
- **Review comments:** 23
- **Reviewers:** @Sjors, @achow101, @darosior, @hodlinator, @w0xlt

Updates chain parameters and header sync logic for version 30.0, including adding assumeutxo parameters for mainnet and testnet4.

*Note: The following is AI-generated interpretation:*
This likely prepares the network for the next major release by updating consensus parameters and may help improve initial blockchain synchronization performance through the assumeutxo feature enhancements.

### ✅ [#33283](https://github.com/bitcoin/bitcoin/pull/33283) contrib: update fixed seeds

- **Status:** merged
- **Created:** 2025-09-02
- **Merged:** 2025-09-08 (open 5 days)
- **Changes:** +1947 / -4398 lines in 7 files
- **Commits:** 3
- **Reviewers:** @dergoegge, @marcofleon

Updates the hardcoded list of seed nodes that new Bitcoin nodes use to initially connect to the network.

*Note: The following is AI-generated interpretation:*
This change likely helps ensure new nodes can reliably find initial peers to connect to the Bitcoin network, which may improve network connectivity and bootstrap reliability as the network topology evolves.

### ✅ [#33294](https://github.com/bitcoin/bitcoin/pull/33294) [29.x] *san CI backports

- **Status:** merged
- **Created:** 2025-09-03
- **Merged:** 2025-09-08 (open 5 days)
- **Changes:** +57 / -217 lines in 8 files
- **Commits:** 6
- **Reviewers:** @marcofleon

Backports sanitizer-related continuous integration improvements to the 29.x branch, including build system updates.

*Note: The following is AI-generated interpretation:*
This likely improves code quality assurance by ensuring memory and address sanitizers work properly in the release branch, which may help catch potential security issues and bugs before they reach users.

### ✅ [#33304](https://github.com/bitcoin/bitcoin/pull/33304) depends: strip when installing qt binaries

- **Status:** merged
- **Created:** 2025-09-04
- **Merged:** 2025-09-05
- **Component:** Build system
- **Changes:** +2 / -2 lines in 2 files
- **Commits:** 1
- **Reviewers:** @TheCharlatan, @hebasto

Modifies the build system to strip debug symbols from Qt binaries during installation to reduce their size from ~1.5GB when DEBUG=1 is used.

*Note: The following is AI-generated interpretation:*
This change likely improves build efficiency and reduces resource consumption, particularly in CI environments where disk space may be limited, which could help maintain faster and more reliable automated testing infrastructure.

### ✅ [#33308](https://github.com/bitcoin/bitcoin/pull/33308) doc: fix `LIBRARY_PATH` comment

- **Status:** merged
- **Created:** 2025-09-04
- **Merged:** 2025-09-08 (open 3 days)
- **Component:** Docs
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Review comments:** 3
- **Reviewers:** @hebasto, @l0rinc, @willcl-ark

Updates a documentation comment about LIBRARY_PATH to reflect that capnp is now built in addition to qt as a native package.

*Note: The following is AI-generated interpretation:*
This documentation fix appears to help maintain accurate build system documentation, which may assist developers in understanding the current native package dependencies and build process.

### ✅ [#33339](https://github.com/bitcoin/bitcoin/pull/33339) doc: move release notes to wiki pre branch off

- **Status:** merged
- **Created:** 2025-09-08
- **Merged:** 2025-09-08
- **Component:** Docs
- **Changes:** +0 / -206 lines in 24 files
- **Commits:** 1
- **Reviewers:** @janb84, @willcl-ark

Moves release notes to the wiki before branching off, referencing the v30.0 Release Notes Draft location.

*Note: The following is AI-generated interpretation:*
This change likely helps streamline the release process by centralizing release notes in a more accessible wiki format, which may improve coordination among contributors and make release information easier to track and update.

### ✅ [#33342](https://github.com/bitcoin/bitcoin/pull/33342) guix: strip binaries in libexec

- **Status:** merged
- **Created:** 2025-09-08
- **Merged:** 2025-09-09
- **Component:** Build system
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto, @ryanofsky

Updates the Guix build system to strip debug symbols from binaries located in the libexec/ directory, which was missed when binaries were moved there in a previous PR.

*Note: The following is AI-generated interpretation:*
This fix likely ensures consistent binary optimization across all Bitcoin Core executables, which may help reduce the overall installation size and improve deployment efficiency while maintaining the intended debug symbol removal behavior.

### ✅ [#33344](https://github.com/bitcoin/bitcoin/pull/33344) [29.x] Backports

- **Status:** merged
- **Created:** 2025-09-09
- **Merged:** 2025-09-17 (open 8 days)
- **Changes:** +158 / -106 lines in 20 files
- **Commits:** 11
- **Reviewers:** @darosior, @mzumsande

Backports multiple PRs (#32646, #33296, #33310, #33340, #33364, #33395) to the 29.x branch and includes changes for the 29.2rc1 release candidate.

*Note: The following is AI-generated interpretation:*
This backport appears to bring important fixes and improvements to the stable 29.x release branch, which likely helps maintain the reliability and security of the current production version while preparing for a new release candidate.

### ✅ [#33346](https://github.com/bitcoin/bitcoin/pull/33346) doc: remove release note fragment

- **Status:** merged
- **Created:** 2025-09-09
- **Merged:** 2025-09-09
- **Component:** Docs
- **Changes:** +0 / -4 lines in 1 files
- **Commits:** 1
- **Reviewers:** @dergoegge

Removes a release note fragment from the repository after moving its content to the v30.0 release notes draft on the developer wiki.

*Note: The following is AI-generated interpretation:*
This likely helps maintain clean repository hygiene by removing temporary documentation fragments once they've been incorporated into the official release notes, which may help reduce clutter in the codebase.

### ✅ [#33347](https://github.com/bitcoin/bitcoin/pull/33347) build: bump `CLIENT_VERSION_MAJOR` to 30

- **Status:** merged
- **Created:** 2025-09-09
- **Merged:** 2025-09-09
- **Component:** Build system
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto

Updates the major version number to 30 in preparation for creating the release branch.

*Note: The following is AI-generated interpretation:*
This appears to be a critical step in the Bitcoin Core release process that ensures the software reports the correct version number, which may help users and systems properly identify the software version for compatibility and security purposes.

### ✅ [#33348](https://github.com/bitcoin/bitcoin/pull/33348) contrib: add bitcoin binary to gen-manpages

- **Status:** merged
- **Created:** 2025-09-09
- **Merged:** 2025-09-09
- **Changes:** +6 / -0 lines in 2 files
- **Commits:** 2
- **Reviewers:** @dergoegge

Adds the bitcoin binary to the manual page generation script, fixing an omission from a previous change.

*Note: The following is AI-generated interpretation:*
This likely ensures that documentation is generated for all Bitcoin Core binaries, which may help users have complete reference materials and improve the overall user experience with proper manual pages.

### ✅ [#33349](https://github.com/bitcoin/bitcoin/pull/33349) [30.x] v30.0rc1

- **Status:** merged
- **Created:** 2025-09-09
- **Merged:** 2025-09-09
- **Changes:** +2992 / -121 lines in 12 files
- **Commits:** 5
- **Reviewers:** @hebasto, @janb84, @stickies-v

Creates the first release candidate (rc1) for Bitcoin Core v30.0, including version bumps, configuration generation, and documentation updates.

*Note: The following is AI-generated interpretation:*
This appears to be a milestone release preparation that likely enables broader testing of the new version before final release, which may help identify issues and ensure stability for the Bitcoin network when users upgrade.

### ✅ [#33356](https://github.com/bitcoin/bitcoin/pull/33356) [30.0] rc2 backports

- **Status:** merged
- **Created:** 2025-09-10
- **Merged:** 2025-09-17 (open 7 days)
- **Changes:** +299 / -20 lines in 22 files
- **Commits:** 15
- **Reviewers:** @darosior, @hebasto

Backports multiple fixes and improvements to the 30.0 release branch for the second release candidate (rc2).

*Note: The following is AI-generated interpretation:*
This likely incorporates important bug fixes and improvements into the release candidate, which may help ensure the final v30.0 release is more stable and addresses issues discovered during testing of rc1.

### ✅ [#33364](https://github.com/bitcoin/bitcoin/pull/33364) ci: always use tag for LLVM checkout

- **Status:** merged
- **Created:** 2025-09-11
- **Merged:** 2025-09-12
- **Component:** Tests
- **Changes:** +2 / -3 lines in 1 files
- **Commits:** 1
- **Reviewers:** @willcl-ark

Changes the CI system to use a fixed LLVM tag instead of trying to match the apt-installed clang version. This addresses intermittent issues with version matching.

*Note: The following is AI-generated interpretation:*
This change likely improves the reliability and reproducibility of Bitcoin Core's continuous integration builds by eliminating version mismatches that could cause build failures or inconsistent testing environments.

### ✅ [#33373](https://github.com/bitcoin/bitcoin/pull/33373) depends: systemtap 5.3

- **Status:** merged
- **Created:** 2025-09-12
- **Merged:** 2025-09-16 (open 3 days)
- **Component:** Build system
- **Changes:** +2 / -2 lines in 1 files
- **Commits:** 1
- **Reviewers:** @0xB10C

Updates systemtap dependency to version 5.3, which includes a fix for proper C99 standard version checking in header files.

*Note: The following is AI-generated interpretation:*
This update may help ensure Bitcoin Core builds correctly across different compiler environments by fixing a potential compilation issue where the C99 standard version wasn't being checked properly.

### ❌ [#33411](https://github.com/bitcoin/bitcoin/pull/33411) ci: re-add Valgrind job to the CI

- **Status:** closed
- **Created:** 2025-09-17
- **Component:** Tests
- **Changes:** +6 / -0 lines in 1 files
- **Commits:** 1
- **Review comments:** 3
- **Reviewers:** @maflcko

Re-adds the Valgrind memory debugging job back to the main continuous integration pipeline after migrating to a new CI setup.

*Note: The following is AI-generated interpretation:*
This likely helps improve Bitcoin Core's code quality and stability by automatically detecting memory-related bugs and leaks during development, which appears particularly important for financial software.

### ✅ [#33415](https://github.com/bitcoin/bitcoin/pull/33415) [28.x] More backports

- **Status:** merged
- **Created:** 2025-09-17
- **Merged:** 2025-09-25 (open 8 days)
- **Changes:** +48 / -35 lines in 7 files
- **Commits:** 4
- **Review comments:** 3
- **Reviewers:** @achow101, @glozow, @willcl-ark

Backports multiple previously merged changes to the 28.x release branch for inclusion in Bitcoin Core version 28.

*Note: The following is AI-generated interpretation:*
This likely ensures that important fixes and improvements from the main development branch are available to users of the 28.x stable release series, potentially improving stability or addressing security concerns.

### ✅ [#33416](https://github.com/bitcoin/bitcoin/pull/33416) [27.x] Backports

- **Status:** merged
- **Created:** 2025-09-17
- **Merged:** 2025-10-13 (open 25 days)
- **Changes:** +57 / -5 lines in 5 files
- **Commits:** 3
- **Reviewers:** @marcofleon, @willcl-ark

Backports selected changes to the 27.x release branch, including a partial backport and a complete one.

*Note: The following is AI-generated interpretation:*
This appears to bring important fixes to the older 27.x release branch, likely helping maintain stability and security for users who haven't upgraded to newer versions yet.

### ✅ [#33424](https://github.com/bitcoin/bitcoin/pull/33424) [30.0] Final changes + rc2

- **Status:** merged
- **Created:** 2025-09-18
- **Merged:** 2025-09-23 (open 5 days)
- **Changes:** +203 / -64 lines in 24 files
- **Commits:** 13
- **Reviewers:** @hebasto, @willcl-ark

This PR backports multiple changes and finalizes the v30.0rc2 release candidate. It includes various fixes and improvements from other PRs to prepare for the Bitcoin Core 30.0 release.

*Note: The following is AI-generated interpretation:*
This appears to be critical for the Bitcoin Core release process, as it likely ensures that important bug fixes and improvements are included in the stable release that nodes across the network will use.

### ✅ [#33425](https://github.com/bitcoin/bitcoin/pull/33425) ci: remove Clang build from msan fuzz job

- **Status:** merged
- **Created:** 2025-09-18
- **Merged:** 2025-09-23 (open 5 days)
- **Component:** Tests
- **Changes:** +4 / -18 lines in 2 files
- **Commits:** 1
- **Review comments:** 3
- **Reviewers:** @Sjors

This PR removes the Clang build from the memory sanitizer (msan) fuzz job and switches to using apt-installed LLVM/Clang with standard C++ library linking. It streamlines the continuous integration testing setup.

*Note: The following is AI-generated interpretation:*
This may help improve the efficiency of Bitcoin Core's testing infrastructure by simplifying the build process, which could lead to faster detection of memory-related bugs and security issues.

### ✅ [#33428](https://github.com/bitcoin/bitcoin/pull/33428) depends: Boost 1.90.0

- **Status:** merged
- **Created:** 2025-09-18
- **Merged:** 2026-01-09 (open 113 days)
- **Component:** Build system
- **Changes:** +2 / -143 lines in 2 files
- **Commits:** 1
- **Reviewers:** @hebasto, @sedited

This PR updates the Boost library dependency to version 1.90.0 in the Bitcoin Core build system. It upgrades a core C++ library that Bitcoin Core relies on for various functionality.

*Note: The following is AI-generated interpretation:*
This likely helps maintain Bitcoin Core's security and performance by incorporating bug fixes, performance improvements, and new features from the latest Boost release, while keeping dependencies current.

### ✅ [#33434](https://github.com/bitcoin/bitcoin/pull/33434) depends: static libxcb-cursor

- **Status:** merged
- **Created:** 2025-09-19
- **Merged:** 2025-10-03 (open 14 days)
- **Component:** Build system
- **Changes:** +1 / -8 lines in 3 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @hebasto, @willcl-ark

This PR makes libxcb-cursor statically linked in the depends system, removing the runtime requirement for this library. It addresses compatibility issues with modern Ubuntu systems where this library is no longer present.

*Note: The following is AI-generated interpretation:*
This appears to improve Bitcoin Core's portability and ease of installation by eliminating a runtime dependency that may not be available on newer systems, potentially reducing user setup issues.

### ❌ [#33436](https://github.com/bitcoin/bitcoin/pull/33436) ci: run s390x job

- **Status:** closed
- **Created:** 2025-09-19
- **Component:** Tests
- **Changes:** +16 / -0 lines in 3 files
- **Commits:** 3
- **Review comments:** 1
- **Reviewers:** @maflcko

This PR enables the s390x architecture job in the continuous integration system. It appears to be testing the performance and compatibility of Bitcoin Core on IBM's s390x mainframe architecture.

*Note: The following is AI-generated interpretation:*
This may help ensure Bitcoin Core works properly on enterprise mainframe systems, potentially expanding the range of hardware platforms where Bitcoin nodes can reliably operate.

### ✅ [#33461](https://github.com/bitcoin/bitcoin/pull/33461) ci: add Valgrind fuzz

- **Status:** merged
- **Created:** 2025-09-22
- **Merged:** 2025-10-22 (open 29 days)
- **Component:** Tests
- **Changes:** +6 / -0 lines in 1 files
- **Commits:** 1
- **Review comments:** 3
- **Reviewers:** @dergoegge, @maflcko

This PR adds Valgrind memory debugging tool integration to the fuzz testing continuous integration pipeline.

*Note: The following is AI-generated interpretation:*
This likely helps improve Bitcoin Core's reliability by catching memory-related bugs (leaks, use-after-free, buffer overflows) during fuzz testing, which may help prevent potential security vulnerabilities or crashes in production.

### ✅ [#33462](https://github.com/bitcoin/bitcoin/pull/33462) ci: add libcpp hardening flags to macOS fuzz job

- **Status:** merged
- **Created:** 2025-09-23
- **Merged:** 2025-10-15 (open 21 days)
- **Component:** Tests
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Review comments:** 3
- **Reviewers:** @maflcko

This PR adds libcpp hardening flags to the macOS fuzz testing job in continuous integration.

*Note: The following is AI-generated interpretation:*
This appears to strengthen security by enabling additional runtime checks and protections during fuzz testing on macOS, which may help catch potential memory corruption issues or other security-related bugs earlier in development.

### ✅ [#33473](https://github.com/bitcoin/bitcoin/pull/33473) [30.x] Backports & rc3

- **Status:** merged
- **Created:** 2025-09-24
- **Merged:** 2025-10-06 (open 11 days)
- **Changes:** +146 / -119 lines in 26 files
- **Commits:** 13
- **Reviewers:** @Zero-1729, @dergoegge, @hebasto, @marcofleon

This PR backports multiple fixes to the 30.x release branch and prepares release candidate 3 with version updates and documentation regeneration.

*Note: The following is AI-generated interpretation:*
This likely ensures that important bug fixes and improvements are included in the Bitcoin Core 30.0 release, which may help maintain stability and reliability for users running the latest major version.

### ✅ [#33474](https://github.com/bitcoin/bitcoin/pull/33474) [29.x] Backports

- **Status:** merged
- **Created:** 2025-09-24
- **Merged:** 2025-10-03 (open 8 days)
- **Changes:** +116 / -52 lines in 11 files
- **Commits:** 7
- **Review comments:** 22
- **Reviewers:** @dergoegge, @marcofleon

This PR backports selected fixes to the 29.x maintenance branch for the older release series.

*Note: The following is AI-generated interpretation:*
This appears to provide important bug fixes to users still running Bitcoin Core 29.x, which may help maintain security and stability for those who haven't upgraded to newer versions yet.

### ✅ [#33487](https://github.com/bitcoin/bitcoin/pull/33487) ci: use latest versions of lint deps

- **Status:** merged
- **Created:** 2025-09-28
- **Merged:** 2025-09-30 (open 1 days)
- **Component:** Tests
- **Changes:** +4 / -4 lines in 1 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @hebasto, @janb84, @stickies-v

This PR updates the versions of linting dependencies like mypy and ruff to their latest available versions.

*Note: The following is AI-generated interpretation:*
This likely helps maintain code quality by using the most current static analysis tools, which may catch newer types of code issues and ensure the linting process remains effective, though the author notes these tools rarely catch actual issues.

### ❌ [#33522](https://github.com/bitcoin/bitcoin/pull/33522) guix: use LIEF 0.17.3

- **Status:** closed
- **Created:** 2025-10-02
- **Component:** Build system
- **Changes:** +4 / -4 lines in 3 files
- **Commits:** 3
- **Reviewers:** @hebasto

Updates the LIEF library to version 0.17.3 in the Guix build system and continuous integration setup.

*Note: The following is AI-generated interpretation:*
This update likely brings security patches, bug fixes, or compatibility improvements that may help ensure reliable binary analysis and manipulation during the build process, potentially improving the overall security and stability of Bitcoin Core builds.

### ✅ [#33534](https://github.com/bitcoin/bitcoin/pull/33534) [29.x] Finalise 29.2rc2

- **Status:** merged
- **Created:** 2025-10-03
- **Merged:** 2025-10-03
- **Changes:** +31 / -27 lines in 9 files
- **Commits:** 4
- **Review comments:** 3
- **Reviewers:** @darosior, @glozow

Prepares the second release candidate (rc2) for Bitcoin Core version 29.2 by incorporating recent backported changes.

*Note: The following is AI-generated interpretation:*
This appears to be part of the standard release process, likely ensuring that important bug fixes and improvements from the main development branch are included in the stable 29.x release, which may help provide users with a more stable and secure version.

### ✅ [#33535](https://github.com/bitcoin/bitcoin/pull/33535) [28.x] More backports

- **Status:** merged
- **Created:** 2025-10-03
- **Merged:** 2025-10-07 (open 3 days)
- **Changes:** +58 / -36 lines in 4 files
- **Commits:** 4
- **Reviewers:** @darosior, @dergoegge, @instagibbs

Backports additional changes to the 28.x branch, specifically including PR #33504.

*Note: The following is AI-generated interpretation:*
This likely brings important fixes or improvements from newer development to the older 28.x stable branch, which may help users running the 28.x series benefit from critical updates without upgrading to a newer major version.

### ✅ [#33537](https://github.com/bitcoin/bitcoin/pull/33537) guix: build `bitcoin-qt` with static libxcb & utils

- **Status:** merged
- **Created:** 2025-10-04
- **Merged:** 2025-11-17 (open 44 days)
- **Component:** Build system
- **Changes:** +100 / -24 lines in 10 files
- **Commits:** 8
- **Review comments:** 5
- **Reviewers:** @TheCharlatan, @hebasto, @willcl-ark

Modifies the Guix build system to compile bitcoin-qt with static versions of libxcb and related utilities.

*Note: The following is AI-generated interpretation:*
This change likely aims to reduce external dependencies and improve compatibility across different Linux distributions, which may help make Bitcoin Core's GUI more reliable and easier to deploy on various systems without dependency conflicts.

### ✅ [#33551](https://github.com/bitcoin/bitcoin/pull/33551) [29.x] Finalise 29.2

- **Status:** merged
- **Created:** 2025-10-06
- **Merged:** 2025-10-10 (open 4 days)
- **Changes:** +21 / -21 lines in 8 files
- **Commits:** 3
- **Reviewers:** @glozow, @stickies-v

Finalizes Bitcoin Core version 29.2 for release, expressing confidence that no third release candidate will be needed.

*Note: The following is AI-generated interpretation:*
This appears to complete the release process for version 29.2, likely providing users with a stable release that includes accumulated bug fixes and improvements, which may help enhance the overall reliability and security of Bitcoin Core.

### ✅ [#33557](https://github.com/bitcoin/bitcoin/pull/33557) [28.x] 28.3rc2

- **Status:** merged
- **Created:** 2025-10-07
- **Merged:** 2025-10-13 (open 6 days)
- **Changes:** +33 / -30 lines in 11 files
- **Commits:** 5
- **Review comments:** 1
- **Reviewers:** @dergoegge, @marcofleon, @stickies-v

This PR backports two changes and prepares the release candidate 2 for Bitcoin Core version 28.3.

*Note: The following is AI-generated interpretation:*
This appears to be part of the regular maintenance release process, which likely helps ensure users receive important bug fixes and improvements in a stable branch while maintaining backwards compatibility.

### ✅ [#33559](https://github.com/bitcoin/bitcoin/pull/33559) [30.x] Finalise v30.0

- **Status:** merged
- **Created:** 2025-10-07
- **Merged:** 2025-10-09 (open 2 days)
- **Changes:** +460 / -23 lines in 10 files
- **Commits:** 3
- **Review comments:** 2
- **Reviewers:** @darosior, @janb84

This PR finalizes the v30.0 release by importing the official release notes from the development wiki.

*Note: The following is AI-generated interpretation:*
This likely represents a major milestone release that may include significant new features, improvements, or changes that could enhance Bitcoin Core's functionality, security, or performance.

### ✅ [#33563](https://github.com/bitcoin/bitcoin/pull/33563) [29.x] build: fix depends Qt download link

- **Status:** merged
- **Created:** 2025-10-07
- **Merged:** 2025-10-07
- **Changes:** +2 / -2 lines in 2 files
- **Commits:** 1
- **Reviewers:** @hebasto

This PR fixes the Qt download link in the build dependencies to prevent always falling back to backup download sources.

*Note: The following is AI-generated interpretation:*
This may help improve the reliability and speed of the Bitcoin Core build process by ensuring the primary Qt download source is accessible, which could reduce build times and potential build failures for developers and users compiling from source.

### ✅ [#33564](https://github.com/bitcoin/bitcoin/pull/33564) [27.x] Fix Qt download URLs

- **Status:** merged
- **Created:** 2025-10-07
- **Merged:** 2025-10-08
- **Changes:** +6 / -4 lines in 5 files
- **Commits:** 3
- **Reviewers:** @hebasto, @willcl-ark

This PR backports fixes for Qt download URLs to the 27.x branch, including changes from two previous PRs.

*Note: The following is AI-generated interpretation:*
This likely ensures that users building older stable versions of Bitcoin Core can still successfully download dependencies, which may help maintain the ability to build and verify older releases for compatibility or security research purposes.

### ✅ [#33574](https://github.com/bitcoin/bitcoin/pull/33574) doc: update Guix INSTALL.md

- **Status:** merged
- **Created:** 2025-10-08
- **Merged:** 2025-11-04 (open 26 days)
- **Component:** Docs
- **Changes:** +3 / -5 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto, @willcl-ark

This PR updates the Guix installation documentation to reflect that Guix is being removed from some Linux distribution repositories.

*Note: The following is AI-generated interpretation:*
This appears to help users navigate changes in how they can install Guix for deterministic builds, which may be important for maintaining Bitcoin Core's reproducible build system that helps ensure binary authenticity and security verification.

### ✅ [#33601](https://github.com/bitcoin/bitcoin/pull/33601) doc: archive release notes for v30.0

- **Status:** merged
- **Created:** 2025-10-11
- **Merged:** 2025-10-13 (open 1 days)
- **Component:** Docs
- **Changes:** +438 / -0 lines in 1 files
- **Commits:** 1
- **Review comments:** 4
- **Reviewers:** @janb84, @kevkevinpal, @willcl-ark

This PR archives the release notes for Bitcoin Core version 30.0, moving them from active documentation to historical records.

*Note: The following is AI-generated interpretation:*
This likely helps maintain clean documentation structure by moving completed release notes to archives, which may help users and developers navigate current versus historical version information more effectively.

### ✅ [#33609](https://github.com/bitcoin/bitcoin/pull/33609) [30.x] Backports

- **Status:** merged
- **Created:** 2025-10-13
- **Merged:** 2025-12-02 (open 49 days)
- **Changes:** +519 / -422 lines in 38 files
- **Commits:** 21
- **Reviewers:** @marcofleon, @willcl-ark

This PR backports multiple fixes and improvements from the main development branch to the 30.x maintenance branch, including both core and GUI changes.

*Note: The following is AI-generated interpretation:*
These backports likely provide important bug fixes and stability improvements to users running Bitcoin Core v30.x, which may help maintain network stability and user experience without requiring upgrades to newer major versions.

### ✅ [#33610](https://github.com/bitcoin/bitcoin/pull/33610) doc: archive release notes for v29.2

- **Status:** merged
- **Created:** 2025-10-13
- **Merged:** 2025-10-14 (open 1 days)
- **Component:** Docs
- **Changes:** +91 / -0 lines in 1 files
- **Commits:** 1
- **Reviewers:** @janb84, @stickies-v

This PR archives the release notes for Bitcoin Core version 29.2, moving them from active documentation to historical records.

*Note: The following is AI-generated interpretation:*
This likely helps maintain organized documentation by archiving completed release notes, which may improve navigation and clarity for users looking for current versus historical version information.

### ✅ [#33611](https://github.com/bitcoin/bitcoin/pull/33611) [29.x] Backports

- **Status:** merged
- **Created:** 2025-10-13
- **Merged:** 2025-11-18 (open 35 days)
- **Changes:** +16 / -44 lines in 4 files
- **Commits:** 4
- **Reviewers:** @willcl-ark

This PR backports three specific fixes from the main development branch to the 29.x maintenance branch.

*Note: The following is AI-generated interpretation:*
These backports likely provide critical bug fixes or security improvements to users still running Bitcoin Core v29.x, which may help maintain network security and stability for nodes that haven't upgraded to newer versions.

### ✅ [#33613](https://github.com/bitcoin/bitcoin/pull/33613) [28.x] Backport & finalise 28.3

- **Status:** merged
- **Created:** 2025-10-13
- **Merged:** 2025-10-16 (open 2 days)
- **Changes:** +24 / -22 lines in 9 files
- **Commits:** 4
- **Reviewers:** @stickies-v, @willcl-ark

This PR backports one fix to the 28.x branch and includes the necessary changes to finalize the v28.3 release.

*Note: The following is AI-generated interpretation:*
This likely provides an important fix to older Bitcoin Core installations while preparing the v28.3 maintenance release, which may help ensure continued stability and security for users running the 28.x series.

### ✅ [#33625](https://github.com/bitcoin/bitcoin/pull/33625) Update secp256k1 subtree to latest master

- **Status:** merged
- **Created:** 2025-10-14
- **Merged:** 2025-10-19 (open 4 days)
- **Changes:** +1208 / -585 lines in 42 files
- **Commits:** 2
- **Reviewers:** @hebasto, @janb84

Updates the secp256k1 cryptographic library subtree to the latest version from the upstream repository.

*Note: The following is AI-generated interpretation:*
This likely brings security improvements, bug fixes, or performance optimizations to Bitcoin's elliptic curve cryptography operations, which may help ensure the robustness of signature verification and key generation.

### ✅ [#33626](https://github.com/bitcoin/bitcoin/pull/33626) ci: run native fuzz with MSAN job

- **Status:** merged
- **Created:** 2025-10-14
- **Merged:** 2025-11-04 (open 20 days)
- **Component:** Tests
- **Changes:** +8 / -2 lines in 2 files
- **Commits:** 2
- **Review comments:** 4
- **Reviewers:** @dergoegge, @maflcko

Adds a native fuzzing job with Memory Sanitizer (MSAN) to the continuous integration pipeline.

*Note: The following is AI-generated interpretation:*
This appears to improve testing coverage by detecting memory-related bugs in Bitcoin Core's code, which may help prevent potential security vulnerabilities or crashes that could affect node stability.

### ✅ [#33641](https://github.com/bitcoin/bitcoin/pull/33641) Update leveldb subtree to latest master

- **Status:** merged
- **Created:** 2025-10-16
- **Merged:** 2025-10-16
- **Changes:** +8 / -8 lines in 7 files
- **Commits:** 2
- **Reviewers:** @stickies-v

Updates the LevelDB database library subtree to the latest version, including fixes for typos.

*Note: The following is AI-generated interpretation:*
This likely brings database performance improvements, bug fixes, or stability enhancements that may help improve Bitcoin Core's blockchain data storage and retrieval efficiency.

### ✅ [#33642](https://github.com/bitcoin/bitcoin/pull/33642) doc: archive release notes for v28.3

- **Status:** merged
- **Created:** 2025-10-16
- **Merged:** 2025-10-16
- **Component:** Docs
- **Changes:** +110 / -0 lines in 1 files
- **Commits:** 1
- **Reviewers:** @stickies-v

Archives the release notes for Bitcoin Core version 28.3 in the documentation.

*Note: The following is AI-generated interpretation:*
This appears to be routine documentation maintenance that may help keep the repository organized and provide historical context for users and developers reviewing past releases.

### ✅ [#33693](https://github.com/bitcoin/bitcoin/pull/33693) ci: use pycapnp 2.2.1

- **Status:** merged
- **Created:** 2025-10-24
- **Merged:** 2025-10-29 (open 5 days)
- **Component:** Tests
- **Changes:** +3 / -10 lines in 3 files
- **Commits:** 2
- **Reviewers:** @hebasto

Updates the continuous integration to use pycapnp version 2.2.1 and simplifies the installation process by removing the git clone step.

*Note: The following is AI-generated interpretation:*
This likely improves build reliability and speed by using a stable release version rather than building from source, which may help reduce CI failures and maintenance overhead.

### ✅ [#33714](https://github.com/bitcoin/bitcoin/pull/33714) random: scope environ extern to macOS, BSDs and Illumos

- **Status:** merged
- **Created:** 2025-10-27
- **Merged:** 2025-11-04 (open 7 days)
- **Component:** Utils/log/libs
- **Changes:** +6 / -2 lines in 1 files
- **Commits:** 1
- **Review comments:** 6
- **Reviewers:** @hebasto, @l0rinc, @maflcko

Limits the use of the environ external variable declaration to specific platforms (macOS, BSDs, and Illumos) where it's required for compilation.

*Note: The following is AI-generated interpretation:*
This change likely improves code portability and prevents compilation failures on platforms that don't need or support the environ extern declaration, which may help ensure Bitcoin Core builds successfully across different operating systems.

### ✅ [#33775](https://github.com/bitcoin/bitcoin/pull/33775) guix: use GCC 14.3.0 over 13.3.0

- **Status:** merged
- **Created:** 2025-11-04
- **Merged:** 2026-01-13 (open 70 days)
- **Component:** Build system
- **Changes:** +75 / -10 lines in 8 files
- **Commits:** 7
- **Review comments:** 12
- **Reviewers:** @hebasto, @maflcko, @sedited, @theuni

Updates the Guix build system to use GCC version 14.3.0 instead of the previous 13.3.0 for compilation.

*Note: The following is AI-generated interpretation:*
This compiler upgrade likely provides access to newer optimizations and language features that may improve Bitcoin Core's performance and security, and appears to be a prerequisite for future development work on the codebase.

### ❌ [#33778](https://github.com/bitcoin/bitcoin/pull/33778) depends: add zeromq patch to fix mingw CMake file install location

- **Status:** closed
- **Created:** 2025-11-04
- **Component:** Build system
- **Changes:** +18 / -0 lines in 2 files
- **Commits:** 1

Adds a patch to the zeromq dependency to fix the installation location of CMake files on Windows mingw builds.

*Note: The following is AI-generated interpretation:*
This fix likely ensures that Bitcoin Core's Windows builds can properly locate and link against the zeromq library, which may be essential for the software's networking functionality on Windows platforms.

### ✅ [#33780](https://github.com/bitcoin/bitcoin/pull/33780) guix: disable libsanitizer in Linux GCC build

- **Status:** merged
- **Created:** 2025-11-04
- **Merged:** 2025-11-05
- **Component:** Build system
- **Changes:** +1 / -0 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto, @willcl-ark

Disables libsanitizer in the Linux GCC build configuration to resolve compilation errors with newer glibc versions.

*Note: The following is AI-generated interpretation:*
This change likely ensures Bitcoin Core can compile successfully on systems with newer C library versions, preventing build failures that could hinder development and deployment on modern Linux distributions.

### ❌ [#33821](https://github.com/bitcoin/bitcoin/pull/33821) guix: build glibc with `--enable-static-pie`

- **Status:** closed
- **Created:** 2025-11-07
- **Component:** Build system
- **Changes:** +1 / -0 lines in 1 files
- **Commits:** 1

Configures glibc to build with static Position Independent Executable (PIE) support enabled in the Guix build system.

*Note: The following is AI-generated interpretation:*
This enhancement likely improves Bitcoin Core's security posture by enabling additional memory protection features and address space layout randomization for static executables, which may help defend against certain types of exploits.

### ✅ [#33850](https://github.com/bitcoin/bitcoin/pull/33850) depends: drop qtbase_avoid_native_float16 qt patch

- **Status:** merged
- **Created:** 2025-11-11
- **Merged:** 2025-11-11
- **Component:** Build system
- **Changes:** +0 / -39 lines in 2 files
- **Commits:** 1
- **Reviewers:** @hebasto, @laanwj

Removes an unused Qt patch that was previously needed for libgcc compatibility issues. This patch is no longer necessary after recent changes to minimum version requirements.

*Note: The following is AI-generated interpretation:*
This likely helps streamline the build system by removing technical debt and unnecessary patches, which may reduce maintenance burden and potential build complications for developers.

### ✅ [#33851](https://github.com/bitcoin/bitcoin/pull/33851) depends: update xcb-util packages to latest versions

- **Status:** merged
- **Created:** 2025-11-11
- **Merged:** 2025-11-20 (open 9 days)
- **Component:** Build system
- **Changes:** +27 / -49 lines in 12 files
- **Commits:** 11
- **Review comments:** 4
- **Reviewers:** @hebasto

Updates multiple X11/xcb-related libraries to their latest versions, including libXau, libxcb, and various xcb utilities, as well as updating expat from 2.4.8 to 2.7.3. These updates follow recent changes that made these libraries static dependencies.

*Note: The following is AI-generated interpretation:*
This appears to improve security and stability by incorporating bug fixes and improvements from newer library versions, and may help ensure better compatibility with modern Linux desktop environments for the GUI.

### ✅ [#33860](https://github.com/bitcoin/bitcoin/pull/33860) depends: drop Qt patches

- **Status:** merged
- **Created:** 2025-11-12
- **Merged:** 2025-11-14 (open 1 days)
- **Component:** Build system
- **Changes:** +0 / -37 lines in 4 files
- **Commits:** 2
- **Reviewers:** @TheCharlatan, @hebasto

Removes two Qt patches from the build system - one that was already unused and another that is no longer needed for successful compilation.

*Note: The following is AI-generated interpretation:*
This likely reduces build system complexity and maintenance overhead by eliminating unnecessary patches, which may make the build process more reliable and easier to maintain.

### ✅ [#33945](https://github.com/bitcoin/bitcoin/pull/33945) depends: latest config.guess & config.sub

- **Status:** merged
- **Created:** 2025-11-25
- **Merged:** 2025-11-26
- **Component:** Build system
- **Changes:** +29 / -16 lines in 2 files
- **Commits:** 2
- **Reviewers:** @hebasto, @janb84

Updates the config.guess and config.sub files to their latest versions after approximately one year since the last update.

*Note: The following is AI-generated interpretation:*
This appears to improve build system compatibility by ensuring support for newer platforms and architectures, which may help Bitcoin Core compile successfully on more recent or less common systems.

### ❌ [#33949](https://github.com/bitcoin/bitcoin/pull/33949) ubsan: add another suppression for InsecureRandomContext

- **Status:** closed
- **Created:** 2025-11-26
- **Changes:** +1 / -0 lines in 1 files
- **Commits:** 1
- **Reviewers:** @dergoegge

Adds another suppression for InsecureRandomContext in the UBSan (Undefined Behavior Sanitizer) configuration to handle issues that have been appearing in CI environments.

*Note: The following is AI-generated interpretation:*
This likely helps maintain clean CI builds and testing environments by suppressing known false positives or acceptable undefined behavior in test code, which may improve developer productivity and testing reliability.

### ✅ [#33950](https://github.com/bitcoin/bitcoin/pull/33950) guix: reduce allowed exported symbols

- **Status:** merged
- **Created:** 2025-11-26
- **Merged:** 2025-12-08 (open 11 days)
- **Component:** Build system
- **Changes:** +1 / -2 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto, @sedited

This PR reduces the number of exported symbols in the Bitcoin Core build system, likely limiting which internal functions are exposed externally.

*Note: The following is AI-generated interpretation:*
This likely improves security and maintainability by reducing the attack surface and preventing external code from depending on internal implementation details that may change.

### ✅ [#33952](https://github.com/bitcoin/bitcoin/pull/33952) depends: update freetype and document remaining `bitcoin-qt` runtime libs

- **Status:** merged
- **Created:** 2025-11-26
- **Merged:** 2025-12-08 (open 11 days)
- **Component:** Build system
- **Changes:** +11 / -4 lines in 3 files
- **Commits:** 2
- **Reviewers:** @hebasto, @sedited

This PR updates the freetype library to version 2.11.1 and documents the runtime libraries expected for bitcoin-qt in the symbol checking system.

*Note: The following is AI-generated interpretation:*
Updating freetype may provide security patches and bug fixes for font rendering in the GUI, while better documentation of runtime dependencies appears to help ensure consistent builds across different environments.

### ✅ [#33996](https://github.com/bitcoin/bitcoin/pull/33996) contrib: fix manpage generation

- **Status:** merged
- **Created:** 2025-12-02
- **Merged:** 2025-12-03
- **Changes:** +6 / -4 lines in 1 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @janb84, @rkrux

This PR fixes a bug in the manpage generation script that was broken by previous changes to how version numbers are formatted in binary outputs.

*Note: The following is AI-generated interpretation:*
This likely ensures that documentation remains properly generated and up-to-date, which may help users understand command-line options and maintain consistency in the project's documentation.

### ✅ [#33997](https://github.com/bitcoin/bitcoin/pull/33997) [30.x] Backports & 30.1rc1

- **Status:** merged
- **Created:** 2025-12-03
- **Merged:** 2025-12-05 (open 2 days)
- **Changes:** +116 / -57 lines in 18 files
- **Commits:** 10
- **Reviewers:** @hebasto, @marcofleon

This is a backport PR for the 30.x release branch that includes multiple previous fixes and prepares a release candidate.

*Note: The following is AI-generated interpretation:*
Backporting appears to ensure that important bug fixes and improvements reach users on the stable release branch, likely improving reliability and maintaining security for production deployments.

### ✅ [#34031](https://github.com/bitcoin/bitcoin/pull/34031) net: Remove "tor" as a network specification

- **Status:** merged
- **Created:** 2025-12-08
- **Merged:** 2025-12-10 (open 1 days)
- **Component:** P2P
- **Changes:** +15 / -12 lines in 5 files
- **Commits:** 2
- **Reviewers:** @janb84, @laanwj, @pablomartin4btc, @sipa, @stickies-v

This PR removes the deprecated "tor" network specification, requiring users to use "onion" instead, which has been the preferred term since v0.17.0.

*Note: The following is AI-generated interpretation:*
This likely simplifies the codebase by removing deprecated functionality and may help standardize terminology around onion services, potentially reducing confusion for users and developers.

### ✅ [#34036](https://github.com/bitcoin/bitcoin/pull/34036) contrib: update macOS SDK to Xcode-26.1.1-17B100

- **Status:** merged
- **Created:** 2025-12-09
- **Merged:** 2026-02-02 (open 54 days)
- **Changes:** +21 / -15 lines in 5 files
- **Commits:** 2
- **Review comments:** 5
- **Reviewers:** @Sjors, @hebasto, @janb84, @sedited

Updates the macOS SDK version used in Guix builds to Xcode-26.1.1-17B100.

*Note: The following is AI-generated interpretation:*
This update likely ensures Bitcoin Core builds remain compatible with newer macOS versions and may help address security vulnerabilities or build issues present in the older SDK version.

### ✅ [#34092](https://github.com/bitcoin/bitcoin/pull/34092) [30.x] Finalise v30.1

- **Status:** merged
- **Created:** 2025-12-17
- **Merged:** 2025-12-18
- **Changes:** +23 / -23 lines in 9 files
- **Commits:** 3
- **Reviewers:** @brunoerg, @hebasto, @janb84, @w0xlt

Finalizes the v30.1 release of Bitcoin Core.

*Note: The following is AI-generated interpretation:*
This appears to be the final step in preparing a maintenance release that likely includes bug fixes and security improvements for the 30.x branch, ensuring users have access to a stable updated version.

### ✅ [#34102](https://github.com/bitcoin/bitcoin/pull/34102) depends: capnp 1.3.0

- **Status:** merged
- **Created:** 2025-12-18
- **Merged:** 2025-12-30 (open 12 days)
- **Component:** Build system
- **Changes:** +2 / -2 lines in 1 files
- **Commits:** 1
- **Reviewers:** @hebasto, @sedited

Updates the Cap'n Proto dependency to version 1.3.0.

*Note: The following is AI-generated interpretation:*
This dependency update may help improve build reliability, address security vulnerabilities, or provide performance improvements in the serialization library that Bitcoin Core appears to use.

### ✅ [#34106](https://github.com/bitcoin/bitcoin/pull/34106) doc: add missing copyright headers

- **Status:** merged
- **Created:** 2025-12-18
- **Merged:** 2025-12-19
- **Component:** Docs
- **Changes:** +11 / -0 lines in 3 files
- **Commits:** 2
- **Reviewers:** @janb84, @rkrux

Adds missing copyright headers to various files in the codebase.

*Note: The following is AI-generated interpretation:*
This likely helps ensure proper legal attribution and compliance with open-source licensing requirements, which may be important for Bitcoin Core's legal standing and contributor protection.

### ✅ [#34119](https://github.com/bitcoin/bitcoin/pull/34119) contrib: remove `copyright_header.py`

- **Status:** merged
- **Created:** 2025-12-19
- **Merged:** 2025-12-29 (open 9 days)
- **Changes:** +1 / -661 lines in 3 files
- **Commits:** 2
- **Reviewers:** @janb84, @rkrux

Removes the copyright_header.py script that was previously used to manage copyright headers.

*Note: The following is AI-generated interpretation:*
This appears to be cleanup following recent copyright header standardization work, likely simplifying the codebase by removing tooling that is no longer needed for maintenance.

### ✅ [#34174](https://github.com/bitcoin/bitcoin/pull/34174) doc: update copyright year to 2026

- **Status:** merged
- **Created:** 2025-12-29
- **Merged:** 2025-12-31 (open 1 days)
- **Component:** Docs
- **Changes:** +4 / -4 lines in 3 files
- **Commits:** 1
- **Review comments:** 1
- **Reviewers:** @janb84, @maflcko, @pinheadmz

This PR updates copyright notices in documentation and source files to reflect the year 2026.

*Note: The following is AI-generated interpretation:*
This appears to be routine maintenance that likely helps ensure Bitcoin Core's copyright notices remain current and legally accurate, which may be important for the project's intellectual property management and compliance.


---

*Report generated by brink_pr_csv.py from bitcoin-data/github-metadata-backup-bitcoin-bitcoin*
