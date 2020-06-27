---
title: 0.6.2 - Updated XML Matching
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_mock_server_cli/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

To generate the log, run `git log --pretty='* %h - %s (%an, %ad)' TAGNAME..HEAD .` replacing TAGNAME and HEAD as appropriate.


* 218239c - chore: update to latest matching crate (Ronald Holshausen, Wed Jun 24 10:53:35 2020 +1000)

# 0.6.1 - Updated crates

* 98d7abb - chore: update GH action to build pact_mock_server_cli (Ronald Holshausen, Wed May 27 14:55:14 2020 +1000)
* bea787c - chore: bump matching crate version to 0.6.0 (Ronald Holshausen, Sat May 23 17:56:04 2020 +1000)
* 411f697 - chore: correct some clippy warnings (Ronald Holshausen, Wed Apr 29 16:49:36 2020 +1000)
* f84e672 - chore: update mock server library to latest (Ronald Holshausen, Fri Apr 24 11:00:34 2020 +1000)
* 43de9c3 - chore: update matching library to latest (Ronald Holshausen, Fri Apr 24 10:20:55 2020 +1000)
* 1651af1 - fix: upgrade uuid crate (Ronald Holshausen, Thu Apr 23 14:56:34 2020 +1000)
* d457221 - chore: update dependant crates to use mock server lib 0.7.0 (Ronald Holshausen, Sun Jan 19 11:31:21 2020 +1100)
* 8a0c5c2 - fix: docker file needs to be able to build Oniguruma lib (Ronald Holshausen, Sat Dec 14 19:23:45 2019 +1100)
* e1a0f16 - bump version to 0.6.1 (Ronald Holshausen, Sat Dec 14 17:32:50 2019 +1100)

# 0.6.0 - Bugfix Release

* d2908af - chore: bump minor version (Ronald Holshausen, Sat Dec 14 17:15:41 2019 +1100)
* 2d95535 - pact_mock_server_cli: Remove extern crate from main.rs (Audun Halland, Sun Nov 17 23:10:10 2019 +0100)
* abc2a36 - pact_mock_server_cli: Upgrade log, simplelog (Audun Halland, Sun Nov 17 23:01:50 2019 +0100)
* 713cd6a - Explicit edition 2018 in Cargo.toml files (Audun Halland, Sat Nov 16 23:55:37 2019 +0100)
* 924452f - 2018 edition autofix "cargo fix --edition" (Audun Halland, Sat Nov 16 22:27:42 2019 +0100)
* 097d045 - refactor: added a mock server ffi module and bumped the mock server minor version (Ronald Holshausen, Sat Sep 7 09:39:27 2019 +1000)
* f79b033 - chore: update terminal support in release scripts (Ronald Holshausen, Sat Aug 24 12:25:28 2019 +1000)
* da1956a - chore: bump the version of the matching lib (Ronald Holshausen, Sat Aug 24 12:06:51 2019 +1000)
* c5e55ab - bump version to 0.5.2 (Ronald Holshausen, Sat Aug 24 11:29:20 2019 +1000)

# 0.5.1 - support headers with multiple values

* 5b22076 - fix: docker release script (Ronald Holshausen, Sat Jul 27 16:52:12 2019 +1000)
* 2e59235 - bump version to 0.5.1 (Ronald Holshausen, Sat Jul 27 16:36:51 2019 +1000)

# 0.5.0 - Upgrade to non-blocking Hyper 0.12

* d842100 - chore: bump component versions to 0.5.0 (Ronald Holshausen, Sat Jul 27 15:44:51 2019 +1000)
* 2826bb0 - Make pact_mock_server_cli use ServerManager (Audun Halland, Tue Jul 23 01:40:46 2019 +0200)
* 4df2797 - Rename API function again (Audun Halland, Mon Jul 22 23:38:11 2019 +0200)
* f8fa0d8 - chore: Bump pact matchig version to 0.5.0 (Ronald Holshausen, Sat Jan 5 19:25:53 2019 +1100)
* 074569a - feat: Add a parameter for the server key to the start command #26 (Ronald Holshausen, Sun Apr 8 18:24:36 2018 +1000)
* 40ad75b - feat: Add a command to shut the master mock server down #26 (Ronald Holshausen, Sun Apr 8 18:15:08 2018 +1000)
* e5af1b0 - fix: global options no longer incorrectly display a warning about being provided twice #27 (Ronald Holshausen, Sun Apr 8 16:11:41 2018 +1000)
* 3c33294 - fix: Only print errors in the CLI to STDERR #28 (Ronald Holshausen, Sun Apr 8 15:57:56 2018 +1000)
* 386ab52 - fix: corrected the release scripts to check for a version parameter (Ronald Holshausen, Sun Apr 8 13:44:57 2018 +1000)
* 6c2d6c8 - chore: added docker release scripts for the CLIs (Ronald Holshausen, Sun Apr 8 13:44:18 2018 +1000)
* a45d5f8 - fix: corrected the docker build for the mock server cli #14 (Ronald Holshausen, Sun Apr 8 12:52:53 2018 +1000)
* 6343607 - fix: CLI was reporting incorrect pact specification version (Ronald Holshausen, Sun Apr 8 12:36:56 2018 +1000)
* 9ea039f - bump version to 0.4.1 (Ronald Holshausen, Sat Apr 7 14:55:59 2018 +1000)

# 0.4.0 - First V3 specification release

* 398edaf - Upgrade UUID library to latest (Ronald Holshausen, Sat Apr 7 12:29:58 2018 +1000)
* 7fef36b - Merge branch 'v2-spec' into v3-spec (Ronald Holshausen, Sat Nov 4 12:49:07 2017 +1100)
* a306b12 - bump version to 0.3.2 (Ronald Holshausen, Fri Nov 3 14:07:07 2017 +1100)
* 940a0e3 - Reverted hyper to 0.9.x (Ronald Holshausen, Sun Oct 22 12:01:17 2017 +1100)
* fbe35d8 - Compiling after merge from v2-spec (Ronald Holshausen, Sun Oct 22 11:39:46 2017 +1100)
* 00dc75a - Bump version to 0.4.0 (Ronald Holshausen, Sun Oct 22 10:46:48 2017 +1100)
* 184127a - Merge branch 'v2-spec' into v3-spec (Ronald Holshausen, Sun Oct 22 10:32:31 2017 +1100)
* e82ee08 - Merge branch 'v2-spec' into v3-spec (Ronald Holshausen, Mon Oct 16 09:24:11 2017 +1100)
* 64ff667 - Upgraded the mock server implemenation to use Hyper 0.11.2 (Ronald Holshausen, Wed Sep 6 12:56:47 2017 +1000)
* e5a93f3 - Merge branch 'master' into v3-spec (Ronald Holshausen, Sun Aug 20 09:53:48 2017 +1000)
* 639ac22 - fixes after merge in from master (Ronald Holshausen, Sun Oct 23 10:45:54 2016 +1100)
* 49e45f7 - Merge branch 'master' into v3-spec (Ronald Holshausen, Sun Oct 23 10:10:40 2016 +1100)
* a7533dc - updated the mockserver lib and cli to generate V3 pacts (Ronald Holshausen, Thu Aug 4 22:13:20 2016 +1000)
* 539eb48 - updated all the readmes and cargo manefests for v3 (Ronald Holshausen, Tue Jul 19 15:46:18 2016 +1000)

# 0.3.1 - Bugfixes plus changes for running with docker

* cdf01f3 - Add a docker file for the pact mock server cli (Ronald Holshausen, Fri Nov 3 11:51:01 2017 +1100)
* a56b6a6 - Change the column heading to verification state in the mock server list output #24 (Ronald Holshausen, Sun Oct 22 15:15:30 2017 +1100)
* 814fe12 - Modify AssafKatz3's implementation to scan for next available port from a base port number #15 (Ronald Holshausen, Sun Oct 22 14:40:13 2017 +1100)
* 37abe19 - Pulled in changes from https://github.com/AssafKatz3/pact-reference.git #14 (Assaf Katz, Mon Sep 25 12:28:17 2017 +0300)
* 9cda328 - bump version to 0.3.1 (Ronald Holshausen, Fri Oct 20 11:01:04 2017 +1100)

# 0.3.0 - Backported the matching rules from the V3 branch

* c8595cc - Correct the paths in the release scripts for pact_mock_server_cli (Ronald Holshausen, Fri Oct 20 10:48:03 2017 +1100)
* ac94388 - Tests are now all passing #20 (Ronald Holshausen, Thu Oct 19 15:14:25 2017 +1100)
* c983c63 - Bump versions to 0.3.0 (Ronald Holshausen, Wed Oct 18 13:54:46 2017 +1100)
* 06e92e5 - Refer to local libs using version+paths (Eric Kidd, Tue Oct 3 06:22:23 2017 -0400)
* 7afd258 - Update all the cargo manifest versions and commit the cargo lock files (Ronald Holshausen, Wed May 17 10:37:44 2017 +1000)
* be8c299 - Cleanup unused BTreeMap usages and use remote pact dependencies (Anthony Damtsis, Mon May 15 17:09:14 2017 +1000)
* a59fb98 - Migrate remaining pact modules over to serde (Anthony Damtsis, Mon May 15 16:59:04 2017 +1000)
* c5f9c27 - bump version to 0.2.4 (Ronald Holshausen, Sun Apr 23 17:39:49 2017 +1000)

# 0.2.3 - Bugfix Release

* 224ad98 - Change no-console-log to no-term-log and use a simple logger if it is set #6 (Ronald Holshausen, Sun Apr 23 17:19:53 2017 +1000)
* cec2358 - bump version to 0.2.3 (Ronald Holshausen, Fri Apr 21 14:33:13 2017 +1000)

# 0.2.2 - Bugfix Release

* 53074cf - Merge branch 'v1.1-spec' into v2-spec (Ronald Holshausen, Fri Apr 21 14:17:05 2017 +1000)
* 01fa713 - bump version to 0.1.3 (Ronald Holshausen, Fri Apr 21 14:08:58 2017 +1000)
* e4b59e5 - update changelog for release 0.1.2 (Ronald Holshausen, Fri Apr 21 14:05:14 2017 +1000)
* 07b1827 - Merge branch 'v1-spec' into v1.1-spec (Ronald Holshausen, Fri Apr 21 13:39:50 2017 +1000)
* da4e32f - bump version to 0.0.3 (Ronald Holshausen, Fri Apr 21 13:31:18 2017 +1000)
* 9b4b5fb - update changelog for release 0.0.2 (Ronald Holshausen, Fri Apr 21 13:27:54 2017 +1000)
* 2276cd0 - upgraded simple log crate and added cli options to disable file or console logging #6 (Ronald Holshausen, Fri Apr 21 13:15:27 2017 +1000)
* ea5cec8 - bump version to 0.2.2 (Ronald Holshausen, Sun Oct 9 16:43:59 2016 +1100)
* 0b83b06 - correct the displayed help for the pact_mock_server_cli (Ronald Holshausen, Sat Oct 8 17:29:19 2016 +1100)

# 0.1.2 - Bugfix Release

* 07b1827 - Merge branch 'v1-spec' into v1.1-spec (Ronald Holshausen, Fri Apr 21 13:39:50 2017 +1000)
* da4e32f - bump version to 0.0.3 (Ronald Holshausen, Fri Apr 21 13:31:18 2017 +1000)
* 9b4b5fb - update changelog for release 0.0.2 (Ronald Holshausen, Fri Apr 21 13:27:54 2017 +1000)
* 2276cd0 - upgraded simple log crate and added cli options to disable file or console logging #6 (Ronald Holshausen, Fri Apr 21 13:15:27 2017 +1000)
* 91d1216 - bump version to 0.1.2 (Ronald Holshausen, Sat Oct 8 17:49:20 2016 +1100)
* 0b83b06 - correct the displayed help for the pact_mock_server_cli (Ronald Holshausen, Sat Oct 8 17:29:19 2016 +1100)

# 0.0.2 - Bugfix Release

* 2276cd0 - upgraded simple log crate and added cli options to disable file or console logging #6 (Ronald Holshausen, Fri Apr 21 13:15:27 2017 +1000)
* 0b83b06 - correct the displayed help for the pact_mock_server_cli (Ronald Holshausen, Sat Oct 8 17:29:19 2016 +1100)
* 04d9e5f - update the docs for the pact consumer library (Ronald Holshausen, Mon Sep 26 23:06:19 2016 +1000)
* 40c9e02 - exclude IntelliJ files from publishing (Ronald Holshausen, Mon Sep 26 21:22:35 2016 +1000)
* c1d97a0 - correct the repository paths in the cargo manifests (Ronald Holshausen, Tue Jun 28 14:52:46 2016 +1000)
* 91d6d62 - removed the v1 from the project path, will use a git branch instead (Ronald Holshausen, Mon Jun 27 22:09:32 2016 +1000)

# 0.2.1 - Changes required for verifying V2 pacts

* e3eebbd -  update projects to use the published pact mock server library (Ronald Holshausen, Sun Oct 9 16:36:25 2016 +1100)
* 770010a - update projects to use the published pact matching lib (Ronald Holshausen, Sun Oct 9 16:25:15 2016 +1100)
* a21973a - Get the build passing after merge from V1.1 branch (Ronald Holshausen, Sun Oct 9 13:47:09 2016 +1100)
* 341607c - Merge branch 'v1.1-spec' into v2-spec (Ronald Holshausen, Sun Oct 9 12:10:12 2016 +1100)
* 91d1216 - bump version to 0.1.2 (Ronald Holshausen, Sat Oct 8 17:49:20 2016 +1100)
* 0d324a8 - bump version to 0.2.1 (Ronald Holshausen, Wed Jul 13 14:26:40 2016 +1000)
* 377b372 - update changelog for release 0.2.0 (Ronald Holshausen, Wed Jul 13 14:22:15 2016 +1000)
* 7ed156e - updated project for the V2 spec release (Ronald Holshausen, Wed Jul 13 14:19:12 2016 +1000)
* 22b0bb9 - fix for failing build (Ronald Holshausen, Tue Jul 12 16:59:56 2016 +1000)
* 534e7a1 - updated readmes and bump versions for the V2 implementation (Ronald Holshausen, Wed Jun 29 10:38:32 2016 +1000)

# 0.1.1 - Changes required for verifying V1.1 pacts

* 28928ef - correct the displayed help for the pact_mock_server_cli (Ronald Holshausen, Sat Oct 8 17:29:19 2016 +1100)
* 3ca2df8 - update dependencies (Ronald Holshausen, Sat Oct 8 17:22:48 2016 +1100)
* a46dabb - update all references to V1 spec after merge (Ronald Holshausen, Sat Oct 8 16:20:51 2016 +1100)
* 1d6d4f8 - Merge branch 'v1-spec' into v1.1-spec (Ronald Holshausen, Sat Oct 8 15:44:25 2016 +1100)
* 04d9e5f - update the docs for the pact consumer library (Ronald Holshausen, Mon Sep 26 23:06:19 2016 +1000)
* 40c9e02 - exclude IntelliJ files from publishing (Ronald Holshausen, Mon Sep 26 21:22:35 2016 +1000)
* efe036c - bump version to 0.1.1 (Ronald Holshausen, Tue Jun 28 21:54:59 2016 +1000)
* c1d97a0 - correct the repository paths in the cargo manifests (Ronald Holshausen, Tue Jun 28 14:52:46 2016 +1000)

# 0.2.0 - V2 Specification Implementation

* 7ed156e - updated project for the V2 spec release (Ronald Holshausen, Wed Jul 13 14:19:12 2016 +1000)
* 22b0bb9 - fix for failing build (Ronald Holshausen, Tue Jul 12 16:59:56 2016 +1000)
* 534e7a1 - updated readmes and bump versions for the V2 implementation (Ronald Holshausen, Wed Jun 29 10:38:32 2016 +1000)
* efe036c - bump version to 0.1.1 (Ronald Holshausen, Tue Jun 28 21:54:59 2016 +1000)

# 0.1.0 - V1.1 Specification Implementation

* f91bb6e - use the published versions of the matching and mock server libraries (Ronald Holshausen, Tue Jun 28 21:38:21 2016 +1000)
* 140526d - Implement V1.1 matching (Ronald Holshausen, Tue Jun 28 15:58:35 2016 +1000)
* 4224875 - update readmes and bump versions for V1.1 implementation (Ronald Holshausen, Tue Jun 28 15:05:39 2016 +1000)
* 91d6d62 - removed the v1 from the project path, will use a git branch instead (Ronald Holshausen, Mon Jun 27 22:09:32 2016 +1000)

# 0.0.1 - Feature Release

* 18c009b - added changelog (Ronald Holshausen, Mon Jun 27 19:42:26 2016 +1000)
* 78126ab - no point publishing the rust docs as pact_mock_server_cli is not a library (Ronald Holshausen, Mon Jun 27 19:38:56 2016 +1000)
* 8867836 - correct the release script (Ronald Holshausen, Mon Jun 27 19:36:46 2016 +1000)
* aa2d2dd - added release script for pact_mock_server_cli (Ronald Holshausen, Mon Jun 27 17:20:38 2016 +1000)
* 2a78f40 - updated the README for the pact_mock_server_cli (Ronald Holshausen, Mon Jun 27 17:01:16 2016 +1000)
* 3f77f3f - update pact_mock_server_cli to depend on libpact_mock_server from crates.io (Ronald Holshausen, Mon Jun 27 15:50:15 2016 +1000)
* 3b6bf66 - fix the project deps for the travis build (Ronald Holshausen, Mon Jun 27 14:46:19 2016 +1000)
* f7d9960 - implemented the shutdown mock server command (Ronald Holshausen, Sun Jun 26 15:05:40 2016 +1000)
* f91b9fd - compile against the published webmachine crate (Ronald Holshausen, Sun Jun 26 13:14:34 2016 +1000)
* b7635b8 - correctly handle the status codes from the master mock server (Ronald Holshausen, Sun Jun 26 10:49:47 2016 +1000)
* 6234bbd - implemented delete on the master server to shut a mock server down (Ronald Holshausen, Sat Jun 25 16:59:39 2016 +1000)
* ec23a8b - use a Hyper Handler instead of a closure as it is easier to be thread safe (Ronald Holshausen, Fri Jun 24 16:30:28 2016 +1000)
* dd850bc - Got POST to main resource working with webmachine (Ronald Holshausen, Thu Jun 23 13:01:25 2016 +1000)
* b5b41ee - got GET to main resource working with webmachine (Ronald Holshausen, Thu Jun 23 11:30:10 2016 +1000)
* 079fdd4 - correct the webmachine-rust reference (Ronald Holshausen, Thu Jun 16 19:35:39 2016 +1000)
* 4c60f07 - replace rustful with webmachine (Ronald Holshausen, Thu Jun 16 17:31:11 2016 +1000)
* 44daccc - add an optional port number to start the mock server with (Ronald Holshausen, Wed Jun 15 12:40:51 2016 +1000)
* 0cfc690 - add the webmachine project as a dependency (Ronald Holshausen, Thu Jun 9 22:26:16 2016 +1000)
* 7dc4b52 - implemented merging of pact files when writing (Ronald Holshausen, Thu Jun 9 17:34:02 2016 +1000)
* 34fd827 - implement a write_pact exported function to the mock server library (Ronald Holshausen, Thu Jun 9 12:15:01 2016 +1000)
* dcde5dc - add a newline at the end of the help for people with crazy terminal settings (Ronald Holshausen, Thu Jun 9 11:12:16 2016 +1000)
* 511d7a1 - bump version of pact mock server cli (Ronald Holshausen, Wed Jun 8 20:27:53 2016 +1000)
* 5157386 - add rustdoc comment to the cli main file (Ronald Holshausen, Wed Jun 8 20:01:12 2016 +1000)


# 0.0.0 - First Release
