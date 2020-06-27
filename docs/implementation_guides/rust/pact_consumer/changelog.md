---
title: 0.6.2 - Updated XML Matching
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_consumer/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

To generate the log, run `git log --pretty='* %h - %s (%an, %ad)' TAGNAME..HEAD .` replacing TAGNAME and HEAD as appropriate.


* 97d8521 - chore: update to latest matching crate (Ronald Holshausen, Wed Jun 24 11:03:24 2020 +1000)
* a15edea - chore: try set the content type on the body if known (Ronald Holshausen, Tue Jun 23 16:53:32 2020 +1000)
* 570f405 - chore: correct version in readme (Ronald Holshausen, Wed May 27 16:38:58 2020 +1000)
* a54dfd0 - bump version to 0.6.2 (Ronald Holshausen, Wed May 27 14:43:24 2020 +1000)

# 0.6.1 - Bugfix Release

* bea787c - chore: bump matching crate version to 0.6.0 (Ronald Holshausen, Sat May 23 17:56:04 2020 +1000)
* 754a483 - chore: updated itertools to latest (Ronald Holshausen, Wed May 6 15:49:27 2020 +1000)
* a45d0c3 - fix: FFI mismatch json should have the actual values as UTF-8 string not bytes #64 (Ronald Holshausen, Thu Apr 30 11:16:25 2020 +1000)
* 411f697 - chore: correct some clippy warnings (Ronald Holshausen, Wed Apr 29 16:49:36 2020 +1000)
* f84e672 - chore: update mock server library to latest (Ronald Holshausen, Fri Apr 24 11:00:34 2020 +1000)
* 43de9c3 - chore: update matching library to latest (Ronald Holshausen, Fri Apr 24 10:20:55 2020 +1000)
* 6ff9c33 - fix: ignore flakey test (Matt Fellows, Tue Mar 3 12:14:08 2020 +1100)
* 3c590fb - bump version to 0.6.1 (Ronald Holshausen, Sun Jan 19 11:46:21 2020 +1100)

# 0.6.0 - Convert to async/await

* 9d3ad57 - chore: bump minor version of pact consumer crate (Ronald Holshausen, Sun Jan 19 11:40:27 2020 +1100)
* d457221 - chore: update dependant crates to use mock server lib 0.7.0 (Ronald Holshausen, Sun Jan 19 11:31:21 2020 +1100)
* cb4c560 - Upgrade tokio to 0.2.9 (Audun Halland, Fri Jan 10 00:13:02 2020 +0100)
* e8034bf - Remove mock server async spawning. (Audun Halland, Thu Jan 9 21:59:56 2020 +0100)
* 3dec6ff - Upgrade tokio to 0.2.6 (Audun Halland, Tue Dec 31 07:40:14 2019 +0100)
* 9dec41b - Upgrade reqwest to 0.10 (Audun Halland, Tue Dec 31 07:22:36 2019 +0100)
* ec81ed2 - pact_consumer test: Use blocking reqwest (Audun Halland, Tue Dec 17 02:27:24 2019 +0100)
* fda11e4 - Merge remote-tracking branch 'upstream/master' into async-await (Audun Halland, Tue Dec 17 02:13:58 2019 +0100)
* 5573583 - Add more doc (Audun Halland, Tue Dec 17 01:56:03 2019 +0100)
* d395d2d - pact_verifier: Upgrade reqwest to latest git alpha (Audun Halland, Tue Dec 17 00:57:16 2019 +0100)
* 298f217 - pact_matching: Upgrade reqwest to current alpha (Audun Halland, Tue Dec 17 00:36:33 2019 +0100)
* c4dea34 - pact_consumer: Upgrade blocking to 2.1, upgrade reqwest to unreleased alpha (Audun Halland, Tue Dec 17 00:16:30 2019 +0100)
* 6e4f12b - bump version to 0.5.4 (Ronald Holshausen, Sat Dec 14 18:31:17 2019 +1100)
* fee6d06 - pact_consumer: Better mock server documentation (Audun Halland, Thu Dec 12 21:44:09 2019 +0100)
* 3074059 - Refactor ValidatingMockServer into a trait, with two implementations (Audun Halland, Thu Dec 12 15:58:50 2019 +0100)
* fe72f92 - Temporarily solve a problem where a spawned server prevents the test runtime from terminating (Audun Halland, Thu Dec 12 14:14:02 2019 +0100)
* 6a43f82 - Cut down tokio features to the bone (Audun Halland, Wed Dec 11 22:15:03 2019 +0100)
* d4bdcb6 - Update ValidatingMockServer interfaces for use with tokio::test (Audun Halland, Wed Dec 11 22:01:06 2019 +0100)

# 0.5.3 - Bugfix Release

* ec1a368 - chore: update lib versions (Ronald Holshausen, Sat Dec 14 18:09:26 2019 +1100)
* 19e8ced - fix: cleanup env var and set tests to not run in parallel on CI #54 (Ronald Holshausen, Sat Dec 14 16:08:56 2019 +1100)
* b5474b4 - fix: set the path to the generated pact file #54 (Ronald Holshausen, Sat Dec 14 15:46:37 2019 +1100)
* d4dd39f - fix: repeat the test 3 times #54 (Ronald Holshausen, Sat Dec 14 15:30:01 2019 +1100)
* bc044be - fix: check the size of the merged pact file #54 (Ronald Holshausen, Sat Dec 14 15:25:33 2019 +1100)
* a660b87 - fix: correct pact merging to remove duplicates #54 (Ronald Holshausen, Sat Dec 14 15:06:30 2019 +1100)
* 51f5a3e - Update READMEs and doc to not require any "extern crate" (Audun Halland, Sun Nov 17 23:28:21 2019 +0100)
* 9ba4fc1 - Fix doc uses in pact_consumer (Audun Halland, Sun Nov 17 02:43:53 2019 +0100)
* 276fa40 - 2018ize pact_consumer (Audun Halland, Sun Nov 17 00:21:59 2019 +0100)
* 346bf5e - Update pact_consumer/README (Audun Halland, Sun Nov 17 00:04:54 2019 +0100)
* 4a7d402 - Remove macro_use from documentation (Audun Halland, Sun Nov 17 00:02:58 2019 +0100)
* 713cd6a - Explicit edition 2018 in Cargo.toml files (Audun Halland, Sat Nov 16 23:55:37 2019 +0100)
* 924452f - 2018 edition autofix "cargo fix --edition" (Audun Halland, Sat Nov 16 22:27:42 2019 +0100)
* d736b8a - bump version to 0.5.3 (Ronald Holshausen, Mon Sep 30 11:02:42 2019 +1000)

# 0.5.2 - Fix dependency versions

* b5ab246 - chore: update the pact_matching and pact_mock_server to latest versions (Ronald Holshausen, Mon Sep 30 10:41:02 2019 +1000)
* eef3d97 - feat: added some tests for publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 16:44:52 2019 +1000)
* 1110b47 - feat: implemented publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 13:53:27 2019 +1000)
* 2488ab9 - Merge branch 'master' of https://github.com/pact-foundation/pact-reference (milleniumbug, Wed Sep 18 11:32:03 2019 +0200)
* 097d045 - refactor: added a mock server ffi module and bumped the mock server minor version (Ronald Holshausen, Sat Sep 7 09:39:27 2019 +1000)
* b48ee72 - Provide public API for passing in a listener address and post (milleniumbug, Thu Sep 5 15:20:37 2019 +0200)
* f79b033 - chore: update terminal support in release scripts (Ronald Holshausen, Sat Aug 24 12:25:28 2019 +1000)
* bcc75da - bump version to 0.5.2 (Ronald Holshausen, Sat Aug 24 12:20:56 2019 +1000)

# 0.5.1 - support headers with multiple values

* da1956a - chore: bump the version of the matching lib (Ronald Holshausen, Sat Aug 24 12:06:51 2019 +1000)
* f0c0d07 - feat: support headers with multiple values (Ronald Holshausen, Sat Aug 10 17:01:10 2019 +1000)
* b595eff - bump version to 0.5.1 (Ronald Holshausen, Sat Jul 27 17:22:11 2019 +1000)

# 0.5.0 - Upgrade to non-blocking Hyper 0.12

* d842100 - chore: bump component versions to 0.5.0 (Ronald Holshausen, Sat Jul 27 15:44:51 2019 +1000)
* ee8a898 - Rewrite server matches sync from mpsc queue to Arc<Mutex<Vec>>. Avoids awkward synchronization (Audun Halland, Tue Jul 23 02:10:55 2019 +0200)
* 4df2797 - Rename API function again (Audun Halland, Mon Jul 22 23:38:11 2019 +0200)
* 7f7dcb0 - Don't expose tokio Runtime inside the libraries (Audun Halland, Mon Jul 22 02:18:52 2019 +0200)
* 522e7ba - Set runtime::Builder core_threads instead of blocking_threads (Audun Halland, Sun May 12 10:36:54 2019 +0200)
* 3277301 - No point having MockServer in an Option, as shutdown signal consumption is now encapsulated (Audun Halland, Sun May 12 10:32:51 2019 +0200)
* a0dc885 - Shut down MockServer without consuming self, by putting shutdown_tx in an Option (Audun Halland, Sun May 12 10:28:27 2019 +0200)
* 39d231d - pact_consumer async support (untested) (Audun Halland, Sun May 12 03:45:05 2019 +0200)
* f8fa0d8 - chore: Bump pact matchig version to 0.5.0 (Ronald Holshausen, Sat Jan 5 19:25:53 2019 +1100)
* 1e0c65b - fix: doc tests with Into trait fail to link with Rust beta 1.27.0 (Ronald Holshausen, Sun May 13 15:26:36 2018 +1000)
* a5588dc - feat: Allow the directory pacts are written to to be overriden in consumer tests #21 (Ronald Holshausen, Sun Apr 8 15:20:38 2018 +1000)
* b83a0f6 - bump version to 0.4.1 (Ronald Holshausen, Sat Apr 7 14:45:05 2018 +1000)

# 0.4.0 - First V3 specification release

* 398edaf - Upgrade UUID library to latest (Ronald Holshausen, Sat Apr 7 12:29:58 2018 +1000)
* 6597141 - WIP - start of implementation of applying generators to the bodies (Ronald Holshausen, Sun Mar 4 17:01:11 2018 +1100)
* 7fef36b - Merge branch 'v2-spec' into v3-spec (Ronald Holshausen, Sat Nov 4 12:49:07 2017 +1100)
* 5a83885 - bump version to 0.3.2 (Ronald Holshausen, Fri Nov 3 14:54:22 2017 +1100)
* a905bed - Cleaned up some compiler warnings (Ronald Holshausen, Sun Oct 22 12:26:09 2017 +1100)
* 940a0e3 - Reverted hyper to 0.9.x (Ronald Holshausen, Sun Oct 22 12:01:17 2017 +1100)
* fbe35d8 - Compiling after merge from v2-spec (Ronald Holshausen, Sun Oct 22 11:39:46 2017 +1100)
* 00dc75a - Bump version to 0.4.0 (Ronald Holshausen, Sun Oct 22 10:46:48 2017 +1100)
* 184127a - Merge branch 'v2-spec' into v3-spec (Ronald Holshausen, Sun Oct 22 10:32:31 2017 +1100)
* e82ee08 - Merge branch 'v2-spec' into v3-spec (Ronald Holshausen, Mon Oct 16 09:24:11 2017 +1100)
* 64ff667 - Upgraded the mock server implemenation to use Hyper 0.11.2 (Ronald Holshausen, Wed Sep 6 12:56:47 2017 +1000)
* e5a93f3 - Merge branch 'master' into v3-spec (Ronald Holshausen, Sun Aug 20 09:53:48 2017 +1000)
* 8797c6c - First successful build after merge from master (Ronald Holshausen, Sun Oct 23 11:59:55 2016 +1100)
* 639ac22 - fixes after merge in from master (Ronald Holshausen, Sun Oct 23 10:45:54 2016 +1100)
* 49e45f7 - Merge branch 'master' into v3-spec (Ronald Holshausen, Sun Oct 23 10:10:40 2016 +1100)

# 0.3.1 - Converted OptionalBody::Present to take a Vec<u8>

* 24e3f73 - Converted OptionalBody::Present to take a Vec<u8> #19 (Ronald Holshausen, Sun Oct 22 18:04:46 2017 +1100)
* 1c70982 - bump version to 0.3.1 (Ronald Holshausen, Fri Oct 20 11:46:27 2017 +1100)

# 0.3.0 - Improved Consumer DSL

* 89bebb3 - Correct the paths in the release scripts for pact_consumer (Ronald Holshausen, Fri Oct 20 11:36:05 2017 +1100)
* ac94388 - Tests are now all passing #20 (Ronald Holshausen, Thu Oct 19 15:14:25 2017 +1100)
* d990729 - Some code cleanup #20 (Ronald Holshausen, Wed Oct 18 16:32:37 2017 +1100)
* db6100e - Updated the consumer DSL to use the matching rules (compiling, but tests are failing) #20 (Ronald Holshausen, Wed Oct 18 15:48:23 2017 +1100)
* c983c63 - Bump versions to 0.3.0 (Ronald Holshausen, Wed Oct 18 13:54:46 2017 +1100)
* 44e2cf6 - Add myself to "authors" list (Eric Kidd, Wed Oct 11 11:31:08 2017 -0400)
* 1029745 - Provide more context in top-level crate docs (Eric Kidd, Wed Oct 11 11:29:30 2017 -0400)
* 28b7742 - Add a `strip_null_fields` helper (Eric Kidd, Wed Oct 11 11:21:22 2017 -0400)
* 3e3e5a7 - Change `json` helper to `json_utf8` (Eric Kidd, Wed Oct 11 10:06:15 2017 -0400)
* d53dc01 - Allow `each_like!({ "a": 1 }, min = 2)` (Eric Kidd, Wed Oct 11 09:02:07 2017 -0400)
* 8f864cb - Confirm that `^` and `$` are required (Eric Kidd, Wed Oct 11 08:50:22 2017 -0400)
* 9de566b - Rename `something_like!` and `array_like!` to match JS (Eric Kidd, Wed Oct 11 08:39:06 2017 -0400)
* 01f09be - [BUG] pact_matching: Parse JSON paths with `_` (Eric Kidd, Tue Oct 10 08:55:44 2017 -0400)
* 76b9cd7 - Add helper methods for building popular properties (Eric Kidd, Tue Oct 10 06:42:01 2017 -0400)
* f0e2522 - Add `MockServer::path` and update examples (Eric Kidd, Mon Oct 9 16:43:53 2017 -0400)
* 6d9bb6a - Add macros for `term!` and other special rules (Eric Kidd, Mon Oct 9 16:19:53 2017 -0400)
* 25ad54b - Convert builders to use `StringPattern` (Eric Kidd, Mon Oct 9 12:00:05 2017 -0400)
* 86efdc0 - Add a `get_defaulting` helper and break out utils (Eric Kidd, Mon Oct 9 11:48:22 2017 -0400)
* 12bd014 - Create a new `StringPattern` type (Eric Kidd, Mon Oct 9 11:16:31 2017 -0400)
* 137e349 - Fix outdated comment (Eric Kidd, Mon Oct 9 08:47:40 2017 -0400)
* da9cfda - Implement new, experimental syntax (API BREAKAGE) (Eric Kidd, Sun Oct 8 13:33:09 2017 -0400)
* eb5fcd6 - Fix warnings by removing unused `p-macro` (Eric Kidd, Fri Oct 6 07:56:44 2017 -0400)
* e6ad973 - Reorganize `matchables` code (Eric Kidd, Fri Oct 6 07:55:24 2017 -0400)
* d6f867b - Replace `Term` with open-ended `Matchable` trait (Eric Kidd, Fri Oct 6 06:56:02 2017 -0400)
* 23f0a26 - Create a Rust version of `Term` (Eric Kidd, Thu Oct 5 07:49:12 2017 -0400)
* 3f42e50 - Implement `JsonPattern` w/o matcher support (Eric Kidd, Wed Oct 4 13:40:09 2017 -0400)
* 182b0a4 - Add a `body_present` function that handles boilerplate (Eric Kidd, Tue Oct 3 10:42:55 2017 -0400)
* 0bd43a3 - Get rid of `hashmap!` in public APIs (Eric Kidd, Tue Oct 3 09:19:53 2017 -0400)
* 4e9f6a6 - Replace `s!` with `Into<String>` (Eric Kidd, Tue Oct 3 07:18:02 2017 -0400)
* 359f1f5 - Re-export OptionalBody (Eric Kidd, Tue Oct 3 07:17:01 2017 -0400)
* 487a0bd - pact_consumer: Move doctest to tests.rs temporarily (Eric Kidd, Tue Oct 3 06:33:54 2017 -0400)
* 06e92e5 - Refer to local libs using version+paths (Eric Kidd, Tue Oct 3 06:22:23 2017 -0400)
* 4c7c66a - Missed updating the crate versions for pact_consumer (Ronald Holshausen, Wed May 17 12:45:06 2017 +1000)
* 7afd258 - Update all the cargo manifest versions and commit the cargo lock files (Ronald Holshausen, Wed May 17 10:37:44 2017 +1000)
* be8c299 - Cleanup unused BTreeMap usages and use remote pact dependencies (Anthony Damtsis, Mon May 15 17:09:14 2017 +1000)
* a59fb98 - Migrate remaining pact modules over to serde (Anthony Damtsis, Mon May 15 16:59:04 2017 +1000)
* c988180 - bump version to 0.2.1 (Ronald Holshausen, Sun Oct 9 16:55:35 2016 +1100)

# 0.2.0 - V2 implementation

* 2eb38fc - update the consumer library versions for the V2 branch (Ronald Holshausen, Sun Oct 9 16:50:03 2016 +1100)
* e3eebbd -  update projects to use the published pact mock server library (Ronald Holshausen, Sun Oct 9 16:36:25 2016 +1100)
* 770010a - update projects to use the published pact matching lib (Ronald Holshausen, Sun Oct 9 16:25:15 2016 +1100)
* 574e072 - upadte versions for V2 branch and fix an issue with loading JSON bodies encoded as a string (Ronald Holshausen, Sun Oct 9 15:31:57 2016 +1100)
* 6d581d5 - bump version to 0.1.1 (Ronald Holshausen, Sat Oct 8 17:59:33 2016 +1100)

# 0.1.0 - V1.1 specification implementation

* dae5d42 - correct the doc link (Ronald Holshausen, Sat Oct 8 17:55:15 2016 +1100)
* 16b99b5 - V1.1 spec changes (Ronald Holshausen, Sat Oct 8 17:53:53 2016 +1100)
* 1f3f3f1 - correct the versions of the inter-dependent projects as they were causing the build to fail (Ronald Holshausen, Sat Oct 8 17:41:57 2016 +1100)
* a46dabb - update all references to V1 spec after merge (Ronald Holshausen, Sat Oct 8 16:20:51 2016 +1100)
* 548c5aa - bump version to 0.0.1 (Ronald Holshausen, Mon Sep 26 23:16:50 2016 +1000)
* d80e899 - release script needs to be executable (Ronald Holshausen, Mon Sep 26 23:14:15 2016 +1000)

# 0.0.0 - First Release
