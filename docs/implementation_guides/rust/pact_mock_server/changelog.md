---
title: 0.7.5 - Updated XML Matching
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_mock_server/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

To generate the log, run `git log --pretty='* %h - %s (%an, %ad)' TAGNAME..HEAD .` replacing TAGNAME and HEAD as appropriate.


* a15edea - chore: try set the content type on the body if known (Ronald Holshausen, Tue Jun 23 16:53:32 2020 +1000)
* b4fe61f - bump version to 0.7.5 (Ronald Holshausen, Sun May 24 11:56:22 2020 +1000)

# 0.7.4 - multi-part form post bodies

* ce94df9 - feat: cleaned up the logging of request matches (Ronald Holshausen, Sun May 24 11:17:08 2020 +1000)
* bea787c - chore: bump matching crate version to 0.6.0 (Ronald Holshausen, Sat May 23 17:56:04 2020 +1000)
* 2d11c17 - chore: set version of patch matching crate to 0.5.14 (Ronald Holshausen, Fri May 15 16:33:21 2020 +1000)
* a4b2a6a - bump version to 0.7.4 (Ronald Holshausen, Tue May 12 12:40:50 2020 +1000)

# 0.7.3 - matching of binary payloads

* 4a28e7c - chore: add debug log entry when request does not match (Ronald Holshausen, Tue May 12 11:59:02 2020 +1000)
* 708db47 - feat: implement matching of binary payloads (application/octet-stream) (Ronald Holshausen, Fri May 8 15:52:03 2020 +1000)
* 754a483 - chore: updated itertools to latest (Ronald Holshausen, Wed May 6 15:49:27 2020 +1000)
* 215eb67 - bump version to 0.7.3 (Ronald Holshausen, Tue May 5 16:53:48 2020 +1000)

# 0.7.2 - TLS suppport + bugfixes

* d85f28c - fix: mock server matching requests with headers with multiple values (Ronald Holshausen, Tue May 5 15:23:11 2020 +1000)
* da885a3 - feat: add support for TLS with the mock server #65 (Ronald Holshausen, Thu Apr 30 16:41:30 2020 +1000)
* 34103aa - bump version to 0.7.2 (Ronald Holshausen, Fri Apr 24 10:45:24 2020 +1000)

# 0.7.1 - Changes to support C++ DSL

* 43de9c3 - chore: update matching library to latest (Ronald Holshausen, Fri Apr 24 10:20:55 2020 +1000)
* 5f8d0a0 - feat: handle bodies with embedded matchers and generators (Ronald Holshausen, Thu Apr 23 12:25:05 2020 +1000)
* 734723d - chore: increase timeout for test on Appveyor (Ronald Holshausen, Fri Apr 17 09:06:55 2020 +1000)
* a0b2c7b - chore: add a wait for test on Appveyor (Ronald Holshausen, Thu Apr 16 14:42:46 2020 +1000)
* 7e89ca9 - chore: update matching crate to latest (Ronald Holshausen, Thu Apr 16 14:06:02 2020 +1000)
* 9ff6f20 - chore: cleaned up some debug logging (Ronald Holshausen, Tue Apr 7 12:10:12 2020 +1000)
* f9b690e - bump version to 0.7.1 (Ronald Holshausen, Sun Jan 19 11:30:42 2020 +1100)

# 0.7.0 - Convert to async/await

* cf452f5 - chore: bump minor version (Ronald Holshausen, Sun Jan 19 11:18:03 2020 +1100)
* 2b85b71 - chore: dump pact matching crate to 0.5.8 (Ronald Holshausen, Sun Jan 19 11:15:07 2020 +1100)
* cb4c560 - Upgrade tokio to 0.2.9 (Audun Halland, Fri Jan 10 00:13:02 2020 +0100)
* 3dec6ff - Upgrade tokio to 0.2.6 (Audun Halland, Tue Dec 31 07:40:14 2019 +0100)
* 6747a98 - pact_mock_server: Try to fix windows test fail by awaiting the server shutdown (Audun Halland, Thu Dec 19 23:39:07 2019 +0100)
* fda11e4 - Merge remote-tracking branch 'upstream/master' into async-await (Audun Halland, Tue Dec 17 02:13:58 2019 +0100)
* 65a4452 - chore: set min matching lib version to 0.5.7 (Ronald Holshausen, Sat Dec 14 17:09:03 2019 +1100)
* b6dda08 - bump version to 0.6.3 (Ronald Holshausen, Sat Dec 14 17:07:50 2019 +1100)
* 23a652d - pact_verifier: Implement hyper requests for provider/state change (Audun Halland, Thu Dec 12 11:46:50 2019 +0100)
* 6a43f82 - Cut down tokio features to the bone (Audun Halland, Wed Dec 11 22:15:03 2019 +0100)
* 353cb5b - pact_mock_server: Use std future trait instead of futures-rs (Audun Halland, Wed Dec 11 21:56:05 2019 +0100)
* 2136306 - pact_mock_server: Pass all tests (Audun Halland, Wed Dec 11 01:08:24 2019 +0100)
* 6699bc8 - pact_mock_server: Make it all compile with async/await (Audun Halland, Wed Dec 11 00:32:49 2019 +0100)
* 42f72f2 - mock_server: Convert hyper_server to async await. Use 4 space indent (Audun Halland, Wed Dec 11 00:13:15 2019 +0100)

# 0.6.2 - Rust 2018 edition

* 8bfeb0b - pact_mock_server: Remove extern crate from lib.rs (Audun Halland, Sun Nov 17 22:53:52 2019 +0100)
* 713cd6a - Explicit edition 2018 in Cargo.toml files (Audun Halland, Sat Nov 16 23:55:37 2019 +0100)
* 924452f - 2018 edition autofix "cargo fix --edition" (Audun Halland, Sat Nov 16 22:27:42 2019 +0100)
* 99fdde2 - bump version to 0.6.2 (Ronald Holshausen, Sat Sep 28 14:19:43 2019 +1000)

# 0.6.1 - Bugfix Release

* 37d89dd - chore: use the latest matching lib (Ronald Holshausen, Sat Sep 28 14:04:55 2019 +1000)
* eef3d97 - feat: added some tests for publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 16:44:52 2019 +1000)
* 1110b47 - feat: implemented publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 13:53:27 2019 +1000)
* 2488ab9 - Merge branch 'master' of https://github.com/pact-foundation/pact-reference (milleniumbug, Wed Sep 18 11:32:03 2019 +0200)
* cb30a2f - feat: added the ProviderStateGenerator as a generator type (Ronald Holshausen, Sun Sep 8 16:29:46 2019 +1000)
* bdcf655 - bump version to 0.6.1 (Ronald Holshausen, Sat Sep 7 12:29:06 2019 +1000)
* adf1a97 - fix: correct the release script (Ronald Holshausen, Sat Sep 7 12:28:22 2019 +1000)
* b48ee72 - Provide public API for passing in a listener address and post (milleniumbug, Thu Sep 5 15:20:37 2019 +0200)

# 0.6.0 - moved the ffi functions into the ffi module

* e4355d5 - refactor: removed the ffi suffix from the exported functions (Ronald Holshausen, Sat Sep 7 10:36:19 2019 +1000)
* 9abde6c - refactor: moved the ffi functions into the ffi module (Ronald Holshausen, Sat Sep 7 10:16:54 2019 +1000)
* 097d045 - refactor: added a mock server ffi module and bumped the mock server minor version (Ronald Holshausen, Sat Sep 7 09:39:27 2019 +1000)
* 3adf21d - bump version to 0.5.2 (Ronald Holshausen, Sun Aug 11 15:03:24 2019 +1000)

# 0.5.1 - support headers with multiple values

* 1971e2a - chore: remove the p-macro crate (Ronald Holshausen, Sun Aug 11 14:51:24 2019 +1000)
* 63c180f - chore: set the version of the matching lib top 0.5.3 (Ronald Holshausen, Sun Aug 11 14:48:03 2019 +1000)
* b5c7842 - fix: corrected some spelling (Ronald Holshausen, Sun Aug 11 14:31:42 2019 +1000)
* 152682e - chore: cleanup crates and warnings (Ronald Holshausen, Sun Aug 11 14:28:02 2019 +1000)
* f0c0d07 - feat: support headers with multiple values (Ronald Holshausen, Sat Aug 10 17:01:10 2019 +1000)
* 2057f2c - fix: correct the release scripts (Ronald Holshausen, Sat Jul 27 16:07:13 2019 +1000)
* ba7f7e1 - bump version to 0.5.1 (Ronald Holshausen, Sat Jul 27 15:59:52 2019 +1000)

# 0.5.0 - Upgrade to non-blocking Hyper 0.12

* d842100 - chore: bump component versions to 0.5.0 (Ronald Holshausen, Sat Jul 27 15:44:51 2019 +1000)
* a7c674a - fix: remove duplicated line (Ronald Holshausen, Sat Jul 27 15:41:00 2019 +1000)
* ee8a898 - Rewrite server matches sync from mpsc queue to Arc<Mutex<Vec>>. Avoids awkward synchronization (Audun Halland, Tue Jul 23 02:10:55 2019 +0200)
* 5ea7815 - Merge remote-tracking branch 'upstream/master' into hyper_upgrade_merge (Audun Halland, Tue Jul 23 01:46:51 2019 +0200)
* 2826bb0 - Make pact_mock_server_cli use ServerManager (Audun Halland, Tue Jul 23 01:40:46 2019 +0200)
* 47ab6d0 - Upgrade tokio to 0.1.22 everywhere (Audun Halland, Mon Jul 22 23:47:09 2019 +0200)
* 4df2797 - Rename API function again (Audun Halland, Mon Jul 22 23:38:11 2019 +0200)
* 7f7dcb0 - Don't expose tokio Runtime inside the libraries (Audun Halland, Mon Jul 22 02:18:52 2019 +0200)
* 2230be9 - bump version to 0.4.2 (Ronald Holshausen, Sun Jun 30 16:23:22 2019 +1000)
* 0223d31 - Remove warning about unused macros in production code (Audun Halland, Sun May 12 10:57:35 2019 +0200)
* 0e83d41 - Comment the use of PACT_FILE_MUTEX (Audun Halland, Sun May 12 10:55:55 2019 +0200)
* 9c1d5a3 - Fix missing documentation (Audun Halland, Sun May 12 10:48:58 2019 +0200)
* 522e7ba - Set runtime::Builder core_threads instead of blocking_threads (Audun Halland, Sun May 12 10:36:54 2019 +0200)
* a0dc885 - Shut down MockServer without consuming self, by putting shutdown_tx in an Option (Audun Halland, Sun May 12 10:28:27 2019 +0200)
* 16cc6b6 - Run pact_verifier tests in async mode + pact write lock (Audun Halland, Sun May 12 04:05:08 2019 +0200)
* 39d231d - pact_consumer async support (untested) (Audun Halland, Sun May 12 03:45:05 2019 +0200)
* 2b34371 - Refactor MockServer; move to separate file (Audun Halland, Sun May 12 02:51:22 2019 +0200)
* cd2ef48 - Rename server.rs to hyper_server.rs (Audun Halland, Sun May 12 02:04:00 2019 +0200)
* ab1ff4d - Remove unused import (Audun Halland, Sun May 12 01:44:24 2019 +0200)
* 9e34c33 - Make the old tests in tests.rs work (Audun Halland, Sun May 12 01:42:22 2019 +0200)
* 32b52cd - Manager should not block waiting for match requests. (Audun Halland, Sun May 12 01:19:10 2019 +0200)
* 71dc054 - A failing test for mock server on current_thread runtime (Audun Halland, Sat May 11 22:57:12 2019 +0200)
* 56768ff - Move pact_mock_server_async into pact_mock_server, making it the official implementation (Audun Halland, Sat May 11 22:04:38 2019 +0200)

# 0.4.1 - pact matchig version to 0.5.0

* 61a6b7f - chore: updated release script (Ronald Holshausen, Sun Jun 30 16:15:49 2019 +1000)
* f8fa0d8 - chore: Bump pact matchig version to 0.5.0 (Ronald Holshausen, Sat Jan 5 19:25:53 2019 +1100)
* 386ab52 - fix: corrected the release scripts to check for a version parameter (Ronald Holshausen, Sun Apr 8 13:44:57 2018 +1000)
* 736a6a4 - bump version to 0.4.1 (Ronald Holshausen, Sat Apr 7 14:29:37 2018 +1000)

# 0.4.0 - First V3 specification release

* 398edaf - Upgrade UUID library to latest (Ronald Holshausen, Sat Apr 7 12:29:58 2018 +1000)
* 691b14c - Merge branch 'master' into v3-spec (Ronald Holshausen, Sun Mar 4 17:10:14 2018 +1100)
* 6597141 - WIP - start of implementation of applying generators to the bodies (Ronald Holshausen, Sun Mar 4 17:01:11 2018 +1100)
* 3d01d6e - Merge pull request #31 from andrewspinks/master (Ronald Holshausen, Sun Mar 4 14:18:21 2018 +1100)
* 542b7a3 - Add release script for building an apple universal binary (required for iOS). (Andrew Spinks, Wed Dec 13 11:24:53 2017 +0900)
* 41f1729 - Return a String instead of a serde_json value (Eduard Litau, Mon Dec 4 23:32:19 2017 +0100)
* a76bb5a - Cleaned up all the compiler warnings (Ronald Holshausen, Sun Nov 19 11:29:47 2017 +1100)
* efb17a1 - When there is no content type, default to text/plain (Ronald Holshausen, Sun Nov 19 10:58:17 2017 +1100)
* c4d424b - Wired in the generated request/response into the mock server and verifier (Ronald Holshausen, Tue Nov 7 16:27:01 2017 +1100)
* 13558d6 - Basic generators working (Ronald Holshausen, Tue Nov 7 10:56:55 2017 +1100)
* 7fef36b - Merge branch 'v2-spec' into v3-spec (Ronald Holshausen, Sat Nov 4 12:49:07 2017 +1100)
* ed20d42 - bump version to 0.3.2 (Ronald Holshausen, Fri Nov 3 12:24:46 2017 +1100)
* a905bed - Cleaned up some compiler warnings (Ronald Holshausen, Sun Oct 22 12:26:09 2017 +1100)
* 940a0e3 - Reverted hyper to 0.9.x (Ronald Holshausen, Sun Oct 22 12:01:17 2017 +1100)
* 00dc75a - Bump version to 0.4.0 (Ronald Holshausen, Sun Oct 22 10:46:48 2017 +1100)
* 184127a - Merge branch 'v2-spec' into v3-spec (Ronald Holshausen, Sun Oct 22 10:32:31 2017 +1100)
* e82ee08 - Merge branch 'v2-spec' into v3-spec (Ronald Holshausen, Mon Oct 16 09:24:11 2017 +1100)
* 64ff667 - Upgraded the mock server implemenation to use Hyper 0.11.2 (Ronald Holshausen, Wed Sep 6 12:56:47 2017 +1000)
* e5a93f3 - Merge branch 'master' into v3-spec (Ronald Holshausen, Sun Aug 20 09:53:48 2017 +1000)
* bb46822 - update the mock server to support the V3 format matchers (Ronald Holshausen, Sun Nov 13 16:44:30 2016 +1100)
* 8797c6c - First successful build after merge from master (Ronald Holshausen, Sun Oct 23 11:59:55 2016 +1100)
* 639ac22 - fixes after merge in from master (Ronald Holshausen, Sun Oct 23 10:45:54 2016 +1100)
* 7361688 - moved missing files after merge from master (Ronald Holshausen, Sun Oct 23 10:19:31 2016 +1100)
* 49e45f7 - Merge branch 'master' into v3-spec (Ronald Holshausen, Sun Oct 23 10:10:40 2016 +1100)

# 0.3.1 - Bugfixes plus changes for running with docker

* 5606c0c - Refactored the remaining exported functions into an exported rust one and a FFI one (Ronald Holshausen, Wed Nov 1 11:06:48 2017 +1100)
* dab7fb9 - Renamed the exported functions and refactored what the create_mock_server was doing into a new function (Ronald Holshausen, Wed Nov 1 09:30:07 2017 +1100)
* 24e3f73 - Converted OptionalBody::Present to take a Vec<u8> #19 (Ronald Holshausen, Sun Oct 22 18:04:46 2017 +1100)
* a56b6a6 - Change the column heading to verification state in the mock server list output #24 (Ronald Holshausen, Sun Oct 22 15:15:30 2017 +1100)
* 814fe12 - Modify AssafKatz3's implementation to scan for next available port from a base port number #15 (Ronald Holshausen, Sun Oct 22 14:40:13 2017 +1100)
* 37abe19 - Pulled in changes from https://github.com/AssafKatz3/pact-reference.git #14 (Assaf Katz, Mon Sep 25 12:28:17 2017 +0300)
* c8595cc - Correct the paths in the release scripts for pact_mock_server_cli (Ronald Holshausen, Fri Oct 20 10:48:03 2017 +1100)
* e11bff6 - Correct the paths in the release script after changing to cargo workspace (Ronald Holshausen, Fri Oct 20 10:33:44 2017 +1100)
* 654e875 - bump version to 0.3.1 (Ronald Holshausen, Fri Oct 20 09:50:46 2017 +1100)

# 0.3.0 - Backported matching rules from V3 branch

* aff5b6c - Added cargo update after to release script after bumping the version (Ronald Holshausen, Fri Oct 20 09:41:09 2017 +1100)
* d990729 - Some code cleanup #20 (Ronald Holshausen, Wed Oct 18 16:32:37 2017 +1100)
* c983c63 - Bump versions to 0.3.0 (Ronald Holshausen, Wed Oct 18 13:54:46 2017 +1100)
* 941d0de - Backported the matching rules from the V3 branch #20 (Ronald Holshausen, Mon Oct 31 16:41:03 2016 +1100)
* 06e92e5 - Refer to local libs using version+paths (Eric Kidd, Tue Oct 3 06:22:23 2017 -0400)
* 7afd258 - Update all the cargo manifest versions and commit the cargo lock files (Ronald Holshausen, Wed May 17 10:37:44 2017 +1000)
* 0f22f14 - bump version to 0.2.3 (Ronald Holshausen, Wed May 17 09:57:56 2017 +1000)
* 7d93682 - Move linux specific bits out of the release script (Ronald Holshausen, Wed May 17 09:56:31 2017 +1000)
* adc1505 - Move linux specific bits out of the release script (Ronald Holshausen, Wed May 17 08:50:12 2017 +1000)

# 0.2.2 - Bugfix Release

* be8c299 - Cleanup unused BTreeMap usages and use remote pact dependencies (Anthony Damtsis, Mon May 15 17:09:14 2017 +1000)
* a59fb98 - Migrate remaining pact modules over to serde (Anthony Damtsis, Mon May 15 16:59:04 2017 +1000)
* 84867ac - bump version to 0.2.2 (Ronald Holshausen, Sun Oct 9 16:31:07 2016 +1100)

# 0.2.1 - Changes required for verifying V2 pacts

* 770010a - update projects to use the published pact matching lib (Ronald Holshausen, Sun Oct 9 16:25:15 2016 +1100)
* 574e072 - upadte versions for V2 branch and fix an issue with loading JSON bodies encoded as a string (Ronald Holshausen, Sun Oct 9 15:31:57 2016 +1100)
* a21973a - Get the build passing after merge from V1.1 branch (Ronald Holshausen, Sun Oct 9 13:47:09 2016 +1100)
* 341607c - Merge branch 'v1.1-spec' into v2-spec (Ronald Holshausen, Sun Oct 9 12:10:12 2016 +1100)
* 797c9b9 - correct the URLs to the repos (Ronald Holshausen, Sat Oct 8 17:10:56 2016 +1100)
* ca29349 - bump version to 0.1.2 (Ronald Holshausen, Sat Oct 8 17:09:57 2016 +1100)

# 0.1.1 - Changes required for verifying V1.1 pacts

* a54abd7 - update the dependencies (Ronald Holshausen, Sat Oct 8 17:01:35 2016 +1100)
* a46dabb - update all references to V1 spec after merge (Ronald Holshausen, Sat Oct 8 16:20:51 2016 +1100)
* 63ae7e4 - get project compiling after merge from V1 branch (Ronald Holshausen, Sat Oct 8 15:53:22 2016 +1100)
* 1d6d4f8 - Merge branch 'v1-spec' into v1.1-spec (Ronald Holshausen, Sat Oct 8 15:44:25 2016 +1100)
* 04d9e5f - update the docs for the pact consumer library (Ronald Holshausen, Mon Sep 26 23:06:19 2016 +1000)
* 7dd04e6 - update the release scripts to point the docs to docs.rs (Ronald Holshausen, Mon Sep 26 21:49:35 2016 +1000)
* d8ef338 - bump version to 0.0.3 (Ronald Holshausen, Mon Sep 26 21:48:37 2016 +1000)

# 0.2.0 - V2 specification implementation

* ea9644d - added some V2 matcher tests (Ronald Holshausen, Wed Jul 13 13:35:24 2016 +1000)
* 0e75490 - link to 0.2.0 of the matching library and updated the rust docs (Ronald Holshausen, Tue Jul 12 14:10:02 2016 +1000)
* 534e7a1 - updated readmes and bump versions for the V2 implementation (Ronald Holshausen, Wed Jun 29 10:38:32 2016 +1000)
* f235684 - bump version to 0.1.1 (Ronald Holshausen, Tue Jun 28 21:25:58 2016 +1000)

# 0.1.0 - V1.1 Specification Implementation

* 1e7ab5a - use the V1.1 matching library (Ronald Holshausen, Tue Jun 28 21:17:01 2016 +1000)
* 140526d - Implement V1.1 matching (Ronald Holshausen, Tue Jun 28 15:58:35 2016 +1000)
* 4224875 - update readmes and bump versions for V1.1 implementation (Ronald Holshausen, Tue Jun 28 15:05:39 2016 +1000)
* 91d6d62 - removed the v1 from the project path, will use a git branch instead (Ronald Holshausen, Mon Jun 27 22:09:32 2016 +1000)

# 0.0.2 - Fixes required for verifing pacts

* a0954f9 - prepare for release (Ronald Holshausen, Mon Sep 26 21:32:05 2016 +1000)
* 40c9e02 - exclude IntelliJ files from publishing (Ronald Holshausen, Mon Sep 26 21:22:35 2016 +1000)
* c3a8a30 - renamed the pact_matching and pact_mock_server directories (Ronald Holshausen, Sun Sep 18 11:07:32 2016 +1000)

# 0.0.1 - Feature Release

* 21ca473 - add changelog to libpact_mock_server (Ronald Holshausen, Mon Jun 27 14:59:49 2016 +1000)
* 60077b4 - release script needs to be executable (Ronald Holshausen, Mon Jun 27 14:54:14 2016 +1000)
* 6712635 - added release script for libpact_mock_server (Ronald Holshausen, Mon Jun 27 14:10:20 2016 +1000)
* 0f7965a - updated README for libpact_mock_server (Ronald Holshausen, Mon Jun 27 13:36:37 2016 +1000)
* 518e14a - If the mock server has been shutdown, return a 401 Not Implemented (Ronald Holshausen, Sun Jun 26 11:04:58 2016 +1000)
* 6234bbd - implemented delete on the master server to shut a mock server down (Ronald Holshausen, Sat Jun 25 16:59:39 2016 +1000)
* 4c60f07 - replace rustful with webmachine (Ronald Holshausen, Thu Jun 16 17:31:11 2016 +1000)
* 44daccc - add an optional port number to start the mock server with (Ronald Holshausen, Wed Jun 15 12:40:51 2016 +1000)
* 60bbae5 - handle the result from setting up the logger framework (Ronald Holshausen, Fri Jun 10 11:21:10 2016 +1000)
* 4b8a98a - upgrade hyper to latest version in the mock server library (Ronald Holshausen, Thu Jun 9 21:50:22 2016 +1000)
* b769277 - also add static library as an artifact (Ronald Holshausen, Thu Jun 9 21:22:26 2016 +1000)
* 1c0c7cd - remove rustful from the mock server library (Ronald Holshausen, Thu Jun 9 21:09:32 2016 +1000)
* 7dc4b52 - implemented merging of pact files when writing (Ronald Holshausen, Thu Jun 9 17:34:02 2016 +1000)
* 34fd827 - implement a write_pact exported function to the mock server library (Ronald Holshausen, Thu Jun 9 12:15:01 2016 +1000)
* 769f840 - update the mock server cli readme (Ronald Holshausen, Wed Jun 8 16:05:56 2016 +1000)
* 5f99bb3 - links in readmes are relative to the file they are in (Ronald Holshausen, Wed Jun 8 11:58:05 2016 +1000)
* 0178f8b - change the link to the javascript examples (Ronald Holshausen, Wed Jun 8 11:55:32 2016 +1000)
* 2ba2a08 - correct the link to the javascript examples (Ronald Holshausen, Wed Jun 8 11:46:32 2016 +1000)
* e0130c5 - small tweaks to the libpact_mock_server library readme (Ronald Holshausen, Wed Jun 8 10:46:08 2016 +1000)
* 801f24c - update the github readmes to point to the published rust docs (Ronald Holshausen, Wed Jun 8 10:42:30 2016 +1000)
* 1577eeb - bump the version of libpact_mock_server (Ronald Holshausen, Wed Jun 1 21:59:48 2016 +1000)

# 0.0.0 - First Release
