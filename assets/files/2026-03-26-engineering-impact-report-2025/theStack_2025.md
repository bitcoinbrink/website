# Bitcoin Core Contributions by @theStack (2025-01-01 to 2025-12-31)

## Summary

- **Total PRs:** 35
- **Merged:** 31 (88%)
- **Open:** 0
- **Closed (not merged):** 4
- **Total commits:** 60
- **Lines added:** 1,928
- **Lines deleted:** 1,438

## By Component

- **Tests:** 18
- **Other:** 9
- **Docs:** 5
- **Build system:** 2
- **Mempool:** 1

## Pull Requests

### ❌ [#31588](https://github.com/bitcoin/bitcoin/pull/31588) contrib: fix `test_deterministic_coverage.sh` script for out-of-tree builds

- **Status:** closed
- **Created:** 2025-01-01
- **Changes:** +8 / -6 lines in 1 files
- **Commits:** 2
- **Review comments:** 6
- **Reviewers:** @fjahr, @hodlinator, @maflcko

Fixes the deterministic coverage testing script to work properly with out-of-tree builds after the switch from autotools to CMake.

*Note: The following is AI-generated interpretation:*
This change likely helps maintain code quality by ensuring that test coverage analysis works correctly in the new build system, which may help developers identify untested code paths and improve overall software reliability.

### ✅ [#31658](https://github.com/bitcoin/bitcoin/pull/31658) test: p2p: fix sending of manual INVs in tx download test

- **Status:** merged
- **Created:** 2025-01-15
- **Merged:** 2025-01-24 (open 9 days)
- **Component:** Tests
- **Changes:** +33 / -2 lines in 1 files
- **Commits:** 2
- **Reviewers:** @danielabrozzoni, @mzumsande, @yuvicc

Fixes a bug in the transaction download test where manual inventory announcements were being ignored due to mismatched wtxidrelay settings.

*Note: The following is AI-generated interpretation:*
This fix likely ensures that P2P transaction download tests properly validate the intended scenarios, which may help catch regressions in Bitcoin's peer-to-peer transaction relay mechanisms and improve network reliability.

### ✅ [#31879](https://github.com/bitcoin/bitcoin/pull/31879) doc: add release note for #27432 (utxo-to-sqlite tool)

- **Status:** merged
- **Created:** 2025-02-16
- **Merged:** 2025-02-16
- **Component:** Docs
- **Changes:** +7 / -0 lines in 1 files
- **Commits:** 1

Adds a missing release note documenting the utxo-to-sqlite tool that was previously added to Bitcoin Core.

*Note: The following is AI-generated interpretation:*
This documentation likely helps users and developers understand new tooling capabilities for UTXO analysis, which may facilitate better blockchain research and debugging workflows.

### ✅ [#32050](https://github.com/bitcoin/bitcoin/pull/32050) test: avoid treating hash results as integers

- **Status:** merged
- **Created:** 2025-03-13
- **Merged:** 2025-03-27 (open 14 days)
- **Component:** Tests
- **Changes:** +22 / -28 lines in 5 files
- **Commits:** 2
- **Review comments:** 8
- **Reviewers:** @BrandonOdiwuor, @maflcko, @rkrux, @ryanofsky

Modifies the functional test framework to treat hash results (like transaction IDs and block hashes) as byte strings rather than integers.

*Note: The following is AI-generated interpretation:*
This change likely improves code clarity and reduces confusion by representing cryptographic hashes in their natural byte format, which may help prevent subtle bugs and make the codebase more maintainable for developers.

### ❌ [#32116](https://github.com/bitcoin/bitcoin/pull/32116) contrib: refactor: dedup deserialization routines in utxo-to-sqlite script

- **Status:** closed
- **Created:** 2025-03-21
- **Changes:** +10 / -49 lines in 1 files
- **Commits:** 1
- **Review comments:** 8
- **Reviewers:** @l0rinc, @rkrux

Removes duplicate deserialization code from the utxo-to-sqlite script by reusing existing routines from the functional test framework.

*Note: The following is AI-generated interpretation:*
This refactoring likely reduces code duplication and maintenance burden while leveraging well-tested deserialization functions, which may improve code reliability and make future updates easier.

### ✅ [#32305](https://github.com/bitcoin/bitcoin/pull/32305) test: add test for decoding PSBT with MuSig2 PSBT key types (BIP 373)

- **Status:** merged
- **Created:** 2025-04-18
- **Merged:** 2025-05-14 (open 25 days)
- **Component:** Tests
- **Changes:** +82 / -0 lines in 2 files
- **Commits:** 2
- **Review comments:** 8
- **Reviewers:** @rkrux

Adds functional tests for decoding PSBTs (Partially Signed Bitcoin Transactions) that contain MuSig2 key types, building on previous MuSig2 implementation work.

*Note: The following is AI-generated interpretation:*
This likely helps ensure the robustness of MuSig2 multi-signature functionality by adding test coverage for PSBT decoding, which may be important for wallet interoperability and preventing regressions in advanced signature schemes.

### ✅ [#32415](https://github.com/bitcoin/bitcoin/pull/32415) scripted-diff: adapt script error constant names in feature_taproot.py

- **Status:** merged
- **Created:** 2025-05-03
- **Merged:** 2025-05-06 (open 3 days)
- **Changes:** +98 / -98 lines in 1 files
- **Commits:** 1
- **Reviewers:** @rkrux, @stratospher

Refactors script error constant names in taproot tests to resolve naming confusion between legacy and Schnorr signature error codes.

*Note: The following is AI-generated interpretation:*
This appears to improve code clarity and maintainability by eliminating ambiguous constant names, which may help prevent developer confusion and potential bugs when working with different signature validation paths.

### ✅ [#32421](https://github.com/bitcoin/bitcoin/pull/32421) test: refactor: overhaul (w)txid determination for `CTransaction` objects

- **Status:** merged
- **Created:** 2025-05-05
- **Merged:** 2025-06-11 (open 37 days)
- **Component:** Tests
- **Changes:** +333 / -499 lines in 45 files
- **Commits:** 7
- **Review comments:** 3
- **Reviewers:** @ZKcash-IrishGov, @maflcko, @marcofleon, @rkrux

Overhauls how transaction IDs (txid/wtxid) are determined for CTransaction objects in the test framework by removing caching mechanisms and improving naming consistency.

*Note: The following is AI-generated interpretation:*
This likely reduces potential for test bugs and developer confusion by simplifying the transaction ID interface in tests, which may help ensure more reliable testing of transaction-related functionality.

### ✅ [#32436](https://github.com/bitcoin/bitcoin/pull/32436) test: refactor: negate signature-s using libsecp256k1

- **Status:** merged
- **Created:** 2025-05-07
- **Merged:** 2025-05-09 (open 2 days)
- **Component:** Tests
- **Changes:** +9 / -16 lines in 1 files
- **Commits:** 1
- **Review comments:** 9
- **Reviewers:** @laanwj, @rkrux, @w0xlt

Replaces manual ECDSA signature-s negation code in unit tests with calls to the libsecp256k1 library function.

*Note: The following is AI-generated interpretation:*
This appears to improve code reliability and maintainability by using well-tested library functions instead of custom cryptographic operations, which may reduce the risk of subtle bugs in signature handling tests.

### ✅ [#32505](https://github.com/bitcoin/bitcoin/pull/32505) depends: bump to latest config.guess and config.sub

- **Status:** merged
- **Created:** 2025-05-14
- **Merged:** 2025-05-16 (open 1 days)
- **Component:** Build system
- **Changes:** +587 / -185 lines in 2 files
- **Commits:** 2
- **Review comments:** 1
- **Reviewers:** @fanquake

Updates the config.guess and config.sub files in the depends system to their latest versions from upstream.

*Note: The following is AI-generated interpretation:*
This likely improves build system compatibility with newer platforms and architectures, which may help ensure Bitcoin Core can be compiled on a wider range of systems and reduce build failures.

### ✅ [#32533](https://github.com/bitcoin/bitcoin/pull/32533) test: properly check for per-tx sigops limit

- **Status:** merged
- **Created:** 2025-05-16
- **Merged:** 2025-05-22 (open 5 days)
- **Component:** Tests
- **Changes:** +21 / -2 lines in 2 files
- **Commits:** 1
- **Review comments:** 2
- **Reviewers:** @darosior, @instagibbs, @tapcrafter

Adds proper testing for the per-transaction signature operations limit by creating direct test cases rather than relying on indirect testing through block-level limits.

*Note: The following is AI-generated interpretation:*
This may help ensure Bitcoin's standardness rules for transaction signature operations are properly validated, which could be important for preventing resource exhaustion attacks and maintaining network performance.

### ✅ [#32544](https://github.com/bitcoin/bitcoin/pull/32544) scripted-diff: test: remove 'descriptors=True' argument for `createwallet` calls

- **Status:** merged
- **Created:** 2025-05-17
- **Merged:** 2025-05-19 (open 1 days)
- **Changes:** +53 / -54 lines in 12 files
- **Commits:** 1

Removes redundant 'descriptors=True' arguments from createwallet calls in tests since descriptor wallets are now the default and only option.

*Note: The following is AI-generated interpretation:*
This cleanup likely improves code maintainability and reduces confusion for developers by removing parameters that no longer provide meaningful configuration options after legacy wallet removal.

### ✅ [#32596](https://github.com/bitcoin/bitcoin/pull/32596) wallet, rpc, doc: various legacy wallet removal cleanups in RPCs

- **Status:** merged
- **Created:** 2025-05-22
- **Merged:** 2025-05-23
- **Component:** Tests
- **Changes:** +6 / -37 lines in 7 files
- **Commits:** 3
- **Review comments:** 5
- **Reviewers:** @1440000bytes, @rkrux

Removes obsolete wallet RPC fields and documentation related to legacy wallets, including the 'keypoololdest' field and descriptor wallet mentions in rescan documentation.

*Note: The following is AI-generated interpretation:*
This cleanup may help reduce confusion for users and developers by removing outdated information that no longer applies now that only descriptor wallets are supported, potentially improving the user experience.

### ✅ [#32621](https://github.com/bitcoin/bitcoin/pull/32621) contrib: utxo_to_sqlite.py: add option to store txid/spk as BLOBs

- **Status:** merged
- **Created:** 2025-05-27
- **Merged:** 2026-02-08 (open 257 days)
- **Changes:** +60 / -22 lines in 2 files
- **Commits:** 2
- **Review comments:** 2
- **Reviewers:** @sedited, @w0xlt

Adds an option to the UTXO-to-SQLite conversion script to store transaction IDs and scriptPubKeys as binary data (BLOBs) instead of hex strings.

*Note: The following is AI-generated interpretation:*
This enhancement likely provides more efficient storage and processing of UTXO data by using native binary format, which may reduce disk space usage and improve query performance for analysis tools.

### ✅ [#32642](https://github.com/bitcoin/bitcoin/pull/32642) test: update BIP340 test vectors and implementation (variable-length messages)

- **Status:** merged
- **Created:** 2025-05-30
- **Merged:** 2025-06-20 (open 21 days)
- **Component:** Tests
- **Changes:** +5 / -3 lines in 2 files
- **Commits:** 1
- **Reviewers:** @jonasnick, @real-or-random

Updates the BIP340 Schnorr signature test implementation and test vectors to support variable-length messages according to the latest BIP specification changes.

*Note: The following is AI-generated interpretation:*
This update appears to ensure Bitcoin's test framework stays aligned with the evolving BIP340 standard, which may help maintain compatibility and correctness of Schnorr signature implementations in future protocol development.

### ❌ [#32645](https://github.com/bitcoin/bitcoin/pull/32645) fs: use `ftruncate` in `AllocateFileRange` on OpenBSD

- **Status:** closed
- **Created:** 2025-05-30
- **Changes:** +4 / -1 lines in 1 files
- **Commits:** 1
- **Review comments:** 3
- **Reviewers:** @luke-jr

Updates Bitcoin Core's file allocation function to use `ftruncate` on OpenBSD systems since they don't support the standard `fallocate` or `posix_fallocate` functions.

*Note: The following is AI-generated interpretation:*
This change likely improves Bitcoin Core's compatibility with OpenBSD systems by providing a working file allocation mechanism, which may be important for database operations and blockchain storage management on this platform.

### ✅ [#32690](https://github.com/bitcoin/bitcoin/pull/32690) depends: fix multiprocess build on OpenBSD (apply capnp patch, correct SHA256SUM command)

- **Status:** merged
- **Created:** 2025-06-06
- **Merged:** 2025-06-11 (open 5 days)
- **Component:** Build system
- **Changes:** +151 / -2 lines in 5 files
- **Commits:** 2
- **Review comments:** 6
- **Reviewers:** @fanquake, @hebasto

Fixes the multiprocess build system for OpenBSD by applying an upstream patch to capnproto and correcting the SHA256SUM command format.

*Note: The following is AI-generated interpretation:*
This appears to enable multiprocess functionality on OpenBSD systems, which may improve Bitcoin Core's modularity and security by allowing process separation, and ensures build integrity through proper hash verification.

### ✅ [#32711](https://github.com/bitcoin/bitcoin/pull/32711) doc: add missing packages for BSDs (cmake, gmake, curl) to depends/README.md

- **Status:** merged
- **Created:** 2025-06-09
- **Merged:** 2025-06-10
- **Component:** Docs
- **Changes:** +3 / -3 lines in 1 files
- **Commits:** 1
- **Review comments:** 4
- **Reviewers:** @hebasto

Adds documentation for missing package dependencies (cmake, gmake, curl) required to build Bitcoin Core's depends system on various BSD operating systems.

*Note: The following is AI-generated interpretation:*
This likely helps developers more easily set up build environments on BSD systems, potentially expanding the contributor base and improving Bitcoin Core's cross-platform accessibility.

### ✅ [#32742](https://github.com/bitcoin/bitcoin/pull/32742) test: fix catchup loop in outbound eviction functional test

- **Status:** merged
- **Created:** 2025-06-13
- **Merged:** 2025-06-25 (open 12 days)
- **Component:** Tests
- **Changes:** +2 / -1 lines in 1 files
- **Commits:** 1
- **Review comments:** 4
- **Reviewers:** @danielabrozzoni, @maflcko, @mzumsande, @pablomartin4btc

Fixes a flaw in the outbound eviction functional test's catchup loop that was incorrectly waiting for getheaders messages.

*Note: The following is AI-generated interpretation:*
This appears to improve test reliability and accuracy, which may help ensure that Bitcoin Core's peer connection and eviction mechanisms work correctly in production environments.

### ✅ [#32746](https://github.com/bitcoin/bitcoin/pull/32746) test: remove unnecessary m_best_header setting hack in feature_assumeutxo.py

- **Status:** merged
- **Created:** 2025-06-13
- **Merged:** 2025-06-13
- **Component:** Tests
- **Changes:** +0 / -6 lines in 1 files
- **Commits:** 1
- **Reviewers:** @janb84, @mzumsande

Removes an unnecessary workaround hack for setting m_best_header in the assumeutxo test since the underlying bug has been fixed.

*Note: The following is AI-generated interpretation:*
This likely improves code maintainability and test clarity by removing obsolete workarounds, which may help prevent confusion and reduce technical debt in the assumeutxo testing framework.

### ✅ [#32799](https://github.com/bitcoin/bitcoin/pull/32799) mempool: use `FeeFrac` for ancestor/descendant score comparators

- **Status:** merged
- **Created:** 2025-06-24
- **Merged:** 2025-07-09 (open 15 days)
- **Component:** Mempool
- **Changes:** +19 / -43 lines in 1 files
- **Commits:** 3
- **Review comments:** 1
- **Reviewers:** @glozow, @ismaelsadeeq

Replaces manual fee-rate calculations in mempool index comparators with the standardized FeeFrac class to simplify code and eliminate floating-point arithmetic.

*Note: The following is AI-generated interpretation:*
This change likely improves mempool code maintainability and may reduce subtle bugs related to floating-point precision in fee calculations, which could help ensure more consistent transaction prioritization behavior.

### ✅ [#32842](https://github.com/bitcoin/bitcoin/pull/32842) doc: add `/spenttxouts` to REST-interface.md

- **Status:** merged
- **Created:** 2025-06-30
- **Merged:** 2025-07-01
- **Component:** Docs
- **Changes:** +7 / -0 lines in 1 files
- **Commits:** 1
- **Reviewers:** @pablomartin4btc

Adds missing documentation for the /spenttxouts endpoint in the REST interface documentation.

*Note: The following is AI-generated interpretation:*
This appears to help developers and users understand all available REST API endpoints, which may improve adoption and correct usage of Bitcoin Core's REST interface.

### ✅ [#32868](https://github.com/bitcoin/bitcoin/pull/32868) test: refactor: overhaul block hash determination for `CBlock{,Header}` objects

- **Status:** merged
- **Created:** 2025-07-03
- **Merged:** 2025-07-18 (open 15 days)
- **Component:** Tests
- **Changes:** +241 / -278 lines in 39 files
- **Commits:** 7
- **Reviewers:** @danielabrozzoni, @rkrux

Removes block header caching mechanism and introduces consistent naming for block hash determination in CBlockHeader and CBlock objects.

*Note: The following is AI-generated interpretation:*
This change likely reduces the potential for testing bugs related to stateful behavior and may make the codebase more predictable, which could help prevent future issues in block handling logic.

### ✅ [#32924](https://github.com/bitcoin/bitcoin/pull/32924) test: add valid tx test with minimum-sized ECDSA signature (8 bytes DER-encoded)

- **Status:** merged
- **Created:** 2025-07-08
- **Merged:** 2025-10-30 (open 113 days)
- **Component:** Tests
- **Changes:** +4 / -0 lines in 1 files
- **Commits:** 1
- **Reviewers:** @real-or-random

Adds test coverage for the minimum-sized valid ECDSA signature case (8 bytes DER-encoded) using a real testnet transaction.

*Note: The following is AI-generated interpretation:*
This likely improves test coverage for edge cases in signature validation, which may help ensure Bitcoin Core correctly handles unusual but valid transactions that could appear on the network.

### ✅ [#33065](https://github.com/bitcoin/bitcoin/pull/33065) rpc, wallet: replace remaining hardcoded output types with `FormatAllOutputTypes`

- **Status:** merged
- **Created:** 2025-07-25
- **Merged:** 2025-07-28 (open 2 days)
- **Changes:** +8 / -8 lines in 4 files
- **Commits:** 2
- **Reviewers:** @pablomartin4btc, @rkrux

Replaces remaining hardcoded output type strings in wallet RPC and documentation with the FormatAllOutputTypes helper function.

*Note: The following is AI-generated interpretation:*
This change likely reduces code duplication and may help ensure consistency in how output types are presented across different RPC commands and documentation, potentially reducing user confusion.

### ✅ [#33132](https://github.com/bitcoin/bitcoin/pull/33132) fuzz: txgraph: fix `real_is_optimal` flag propagation in `CommitStaging`

- **Status:** merged
- **Created:** 2025-08-04
- **Merged:** 2025-08-04
- **Component:** Tests
- **Changes:** +3 / -0 lines in 1 files
- **Commits:** 1
- **Review comments:** 1
- **Reviewers:** @glozow, @sipa

Fixes a bug in the txgraph fuzz test where the `real_is_optimal` flag wasn't being properly propagated when committing staging changes to the main simulation level.

*Note: The following is AI-generated interpretation:*
This likely helps ensure the txgraph fuzz testing accurately reflects the optimization state of transaction graph linearization, which may help catch bugs in transaction ordering and mempool management logic.

### ✅ [#33399](https://github.com/bitcoin/bitcoin/pull/33399) key: use static context for libsecp256k1 calls where applicable

- **Status:** merged
- **Created:** 2025-09-15
- **Merged:** 2025-09-26 (open 10 days)
- **Changes:** +16 / -16 lines in 3 files
- **Commits:** 1
- **Review comments:** 3
- **Reviewers:** @Eunovo, @furszy, @l0rinc, @real-or-random, @rkrux

Optimizes libsecp256k1 usage by using static context instead of dynamic context for operations that don't require secret key multiplication.

*Note: The following is AI-generated interpretation:*
This appears to improve performance by avoiding unnecessary dynamic context creation for cryptographic operations that don't need it, which may reduce computational overhead in signature verification and other elliptic curve operations.

### ✅ [#33459](https://github.com/bitcoin/bitcoin/pull/33459) doc: remove unrelated `bitcoin-wallet` binary from `libbitcoin_ipc` description

- **Status:** merged
- **Created:** 2025-09-22
- **Merged:** 2025-09-23
- **Component:** Docs
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Reviewers:** @pablomartin4btc

Removes incorrect reference to `bitcoin-wallet` binary from the `libbitcoin_ipc` documentation since the wallet tool doesn't use IPC functionality.

*Note: The following is AI-generated interpretation:*
This likely helps developers understand the correct architecture by ensuring documentation accurately reflects which components actually use the IPC library for multiprocess communication.

### ✅ [#33484](https://github.com/bitcoin/bitcoin/pull/33484) doc: rpc: fix case typo in `finalizepsbt` help (final_scriptwitness)

- **Status:** merged
- **Created:** 2025-09-26
- **Merged:** 2025-09-28 (open 2 days)
- **Component:** Docs
- **Changes:** +1 / -1 lines in 1 files
- **Commits:** 1
- **Reviewers:** @l0rinc, @rkrux

Fixes a case sensitivity typo in the `finalizepsbt` RPC help text to match the actual field name used in `decodepsbt`.

*Note: The following is AI-generated interpretation:*
This appears to improve developer experience by ensuring RPC documentation consistently uses the correct field names, which may reduce confusion when working with PSBT (Partially Signed Bitcoin Transaction) functionality.

### ✅ [#33546](https://github.com/bitcoin/bitcoin/pull/33546) test: add functional test for `TestShell` (matching doc example)

- **Status:** merged
- **Created:** 2025-10-06
- **Merged:** 2025-10-28 (open 22 days)
- **Component:** Tests
- **Changes:** +49 / -2 lines in 3 files
- **Commits:** 2
- **Review comments:** 5
- **Reviewers:** @brunoerg, @pinheadmz, @stratospher

Adds a functional test for the `TestShell` class that matches the documentation example to prevent the interactive Python shell instructions from becoming outdated.

*Note: The following is AI-generated interpretation:*
This likely helps maintain the reliability of developer tooling by ensuring the documented examples for interactive testing continue to work, which may improve the development and debugging experience for contributors.

### ✅ [#33782](https://github.com/bitcoin/bitcoin/pull/33782) test: remove obsolete `get_{key,multisig}` helpers from wallet_util.py

- **Status:** merged
- **Created:** 2025-11-04
- **Merged:** 2025-11-07 (open 2 days)
- **Component:** Tests
- **Changes:** +0 / -51 lines in 1 files
- **Commits:** 1
- **Reviewers:** @brunoerg, @rkrux

Removes unused helper functions from wallet test utilities that relied on deprecated RPC methods. These functions were previously used for testing importmulti RPC which no longer exists.

*Note: The following is AI-generated interpretation:*
This cleanup likely helps maintain code quality by removing dead code that references legacy functionality, which may reduce confusion for developers and prevent accidental use of obsolete patterns in future tests.

### ✅ [#33872](https://github.com/bitcoin/bitcoin/pull/33872) init: completely remove `-maxorphantx` option

- **Status:** merged
- **Created:** 2025-11-13
- **Merged:** 2025-11-18 (open 4 days)
- **Changes:** +5 / -18 lines in 3 files
- **Commits:** 1
- **Review comments:** 1
- **Reviewers:** @rkrux, @stickies-v, @w0xlt

Completely removes the deprecated `-maxorphantx` command line option that was previously marked for removal. This follows up on earlier work to phase out this configuration option.

*Note: The following is AI-generated interpretation:*
Removing deprecated options likely helps streamline the codebase and prevents users from relying on obsolete configuration parameters, which may reduce maintenance burden and potential confusion.

### ✅ [#33893](https://github.com/bitcoin/bitcoin/pull/33893) test: add `-alertnotify` test for large work invalid chain warning

- **Status:** merged
- **Created:** 2025-11-17
- **Merged:** 2025-11-25 (open 7 days)
- **Component:** Tests
- **Changes:** +44 / -2 lines in 1 files
- **Commits:** 1
- **Review comments:** 7
- **Reviewers:** @brunoerg, @maflcko, @mzumsande, @rkrux

Adds test coverage for the large work invalid chain warning system that triggers `-alertnotify` notifications. The test creates invalid blocks to trigger the warning condition.

*Note: The following is AI-generated interpretation:*
This test coverage likely helps ensure that Bitcoin's fork warning system works correctly, which may be important for alerting node operators about potential network attacks or unusual chain reorganization events.

### ✅ [#33951](https://github.com/bitcoin/bitcoin/pull/33951) test: check for output to stdout in `TestShell` test

- **Status:** merged
- **Created:** 2025-11-26
- **Merged:** 2025-11-27
- **Component:** Tests
- **Changes:** +7 / -2 lines in 1 files
- **Commits:** 1
- **Reviewers:** @rkrux

Adds verification that the TestShell testing framework properly outputs a warning message when trying to create multiple instances. This improves test coverage for the testing infrastructure.

*Note: The following is AI-generated interpretation:*
Better test coverage of the testing framework itself likely helps ensure that Bitcoin's development tools work reliably, which may improve the quality and reliability of future code changes and testing procedures.

### ❌ [#33990](https://github.com/bitcoin/bitcoin/pull/33990) test: p2p: check that peer's announced starting height is remembered

- **Status:** closed
- **Created:** 2025-12-02
- **Component:** Tests
- **Changes:** +29 / -2 lines in 1 files
- **Commits:** 1
- **Review comments:** 1
- **Reviewers:** @brunoerg, @mzumsande, @rkrux

Adds test coverage to verify that a peer's announced starting block height is correctly stored and reported via RPC. The announced height is used only for informational purposes and debug messages.

*Note: The following is AI-generated interpretation:*
This test likely helps ensure that peer information reporting works correctly, which may be useful for network monitoring and debugging, though it appears to have limited impact on core Bitcoin functionality since the height isn't used for validation logic.


---

*Report generated by brink_pr_csv.py from bitcoin-data/github-metadata-backup-bitcoin-bitcoin*
