---
title: 0.7.0 - Updated XML Matching
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_verifier_cli/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

To generate the log, run `git log --pretty='* %h - %s (%an, %ad)' TAGNAME..HEAD .` replacing TAGNAME and HEAD as appropriate.


* 62b0bda - chore: update to latest matching library (Ronald Holshausen, Wed Jun 24 12:17:04 2020 +1000)
* bea787c - chore: bump matching crate version to 0.6.0 (Ronald Holshausen, Sat May 23 17:56:04 2020 +1000)
* 76250b5 - chore: correct some clippy warnings (Ronald Holshausen, Wed Apr 29 17:53:40 2020 +1000)
* 43de9c3 - chore: update matching library to latest (Ronald Holshausen, Fri Apr 24 10:20:55 2020 +1000)
* bd10d00 - Avoid deprecated Error::description in favor of Display trait (Caleb Stepanian, Mon Mar 30 16:49:13 2020 -0400)
* 1cf0199 - refactor: moved state change code to a handler (Ronald Holshausen, Wed Mar 11 14:37:07 2020 +1100)
* 70e6648 - chore: converted verifier to use Reqwest (Ronald Holshausen, Mon Mar 9 12:20:14 2020 +1100)
* fe74376 - feat: implemented publishing provider tags with verification results #57 (Ronald Holshausen, Sun Mar 8 18:37:21 2020 +1100)
* a6e0c16 - Fix RequestFilterExecutor w/ verify_provider (Andrew Lilley Brinker, Mon Mar 2 11:43:59 2020 -0800)
* d944a60 - chore: added callback executors so test code can called during verification (Ronald Holshausen, Sun Feb 23 18:43:49 2020 +1100)
* f238ca1 - Make pact_verifier_cli actually runnable by using tokio::main (Audun Halland, Sun Jan 19 10:12:17 2020 +0100)
* 70a33dd - chore: bump minor version of pact_verifier (Ronald Holshausen, Sun Jan 19 11:51:36 2020 +1100)
* cb4c560 - Upgrade tokio to 0.2.9 (Audun Halland, Fri Jan 10 00:13:02 2020 +0100)
* deaf4b3 - pact_verifier_cli: Increase type length limit for big generated future type (Audun Halland, Tue Dec 17 01:53:24 2019 +0100)
* 87d787f - pact_verifier_cli: Block on async function from pact_verifier (Audun Halland, Thu Dec 12 11:15:44 2019 +0100)
* c168d0b - pact_verifier_cli: Remove extern crate from main.rs (Audun Halland, Sun Nov 17 23:25:17 2019 +0100)
* 713cd6a - Explicit edition 2018 in Cargo.toml files (Audun Halland, Sat Nov 16 23:55:37 2019 +0100)
* 9f3ad74 - fix: docker build now requires libclang system library (Ronald Holshausen, Fri Sep 27 17:14:05 2019 +1000)
* 834a60b - bump version to 0.6.2 (Ronald Holshausen, Fri Sep 27 15:37:03 2019 +1000)

# 0.6.1 - Bugfix + Oniguruma crate for regex matching

* e32350e - chore: use the latest matching lib (Ronald Holshausen, Fri Sep 27 15:22:12 2019 +1000)
* 0cc03db - bump version to 0.6.1 (Ronald Holshausen, Sun Sep 22 18:13:48 2019 +1000)

# 0.6.0 - Publishing verification results

* 0e1da1b - chore: bump minor version (Ronald Holshausen, Sun Sep 22 17:59:51 2019 +1000)
* 2e07d77 - chore: set the version of the pact matching crate (Ronald Holshausen, Sun Sep 22 17:24:02 2019 +1000)
* 1110b47 - feat: implemented publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 13:53:27 2019 +1000)
* 7b5a404 - bump version to 0.5.2 (Ronald Holshausen, Sat Aug 24 13:00:10 2019 +1000)

# 0.5.1 - Use reqwest for better HTTP/S support, support headers with multiple values

* f79b033 - chore: update terminal support in release scripts (Ronald Holshausen, Sat Aug 24 12:25:28 2019 +1000)
* b8019ba - chore: bump the version of the matching lib (Ronald Holshausen, Sat Aug 24 12:22:35 2019 +1000)
* dac8ae1 - feat: support authentication when fetching pacts from a pact broker (Ronald Holshausen, Sun Aug 11 13:57:29 2019 +1000)
* e007763 - feat: support bearer tokens when fetching pacts from URLs (Ronald Holshausen, Sun Aug 11 13:21:17 2019 +1000)
* f947d43 - chore: upgrade the logging crates (Ronald Holshausen, Sun Aug 11 12:05:14 2019 +1000)
* 0dd10e6 - fix: docker release script (Ronald Holshausen, Sat Jul 27 18:02:11 2019 +1000)
* aa336e6 - bump version to 0.5.1 (Ronald Holshausen, Sat Jul 27 17:48:41 2019 +1000)

# 0.5.0 - Upgrade to non-blocking Hyper 0.12

* d842100 - chore: bump component versions to 0.5.0 (Ronald Holshausen, Sat Jul 27 15:44:51 2019 +1000)
* 47ab6d0 - Upgrade tokio to 0.1.22 everywhere (Audun Halland, Mon Jul 22 23:47:09 2019 +0200)
* 2f8a997 - Compile everything (except the commented-out tests) (Audun Halland, Thu May 2 00:41:56 2019 +0200)
* f8fa0d8 - chore: Bump pact matchig version to 0.5.0 (Ronald Holshausen, Sat Jan 5 19:25:53 2019 +1100)
* 3c33294 - fix: Only print errors in the CLI to STDERR #28 (Ronald Holshausen, Sun Apr 8 15:57:56 2018 +1000)
* 386ab52 - fix: corrected the release scripts to check for a version parameter (Ronald Holshausen, Sun Apr 8 13:44:57 2018 +1000)
* 6c2d6c8 - chore: added docker release scripts for the CLIs (Ronald Holshausen, Sun Apr 8 13:44:18 2018 +1000)
* 9d24b7e - fix: corrected the docker build for the verifier cli #14 (Ronald Holshausen, Sun Apr 8 13:39:29 2018 +1000)
* 4b8fb64 - fix: verification CLI was reporting incorrect pact specification version (Ronald Holshausen, Sun Apr 8 13:12:45 2018 +1000)
* fb8ecf5 - bump version to 0.4.1 (Ronald Holshausen, Sat Apr 7 15:23:33 2018 +1000)

# 0.4.0 - First V3 specification release

* 6597141 - WIP - start of implementation of applying generators to the bodies (Ronald Holshausen, Sun Mar 4 17:01:11 2018 +1100)
* f63f339 - replaced use of try macro with ? (Ronald Holshausen, Tue Nov 7 16:31:39 2017 +1100)
* 7fef36b - Merge branch 'v2-spec' into v3-spec (Ronald Holshausen, Sat Nov 4 12:49:07 2017 +1100)
* 5c05f18 - Added docker file for pact verifier (Ronald Holshausen, Fri Nov 3 16:20:02 2017 +1100)
* 6a0548c - Correct release scripts (Ronald Holshausen, Fri Nov 3 15:51:52 2017 +1100)
* 9f20613 - bump version to 0.3.1 (Ronald Holshausen, Fri Nov 3 15:51:27 2017 +1100)
* 91a5673 - Correct the release script (Ronald Holshausen, Fri Nov 3 15:42:48 2017 +1100)
* 00dc75a - Bump version to 0.4.0 (Ronald Holshausen, Sun Oct 22 10:46:48 2017 +1100)
* 184127a - Merge branch 'v2-spec' into v3-spec (Ronald Holshausen, Sun Oct 22 10:32:31 2017 +1100)
* e82ee08 - Merge branch 'v2-spec' into v3-spec (Ronald Holshausen, Mon Oct 16 09:24:11 2017 +1100)
* 64ff667 - Upgraded the mock server implemenation to use Hyper 0.11.2 (Ronald Holshausen, Wed Sep 6 12:56:47 2017 +1000)
* e5a93f3 - Merge branch 'master' into v3-spec (Ronald Holshausen, Sun Aug 20 09:53:48 2017 +1000)
* 639ac22 - fixes after merge in from master (Ronald Holshausen, Sun Oct 23 10:45:54 2016 +1100)
* 49e45f7 - Merge branch 'master' into v3-spec (Ronald Holshausen, Sun Oct 23 10:10:40 2016 +1100)
* 539eb48 - updated all the readmes and cargo manefests for v3 (Ronald Holshausen, Tue Jul 19 15:46:18 2016 +1000)

# 0.3.0 - Backported matching rules from V3 branch

* b2ad496 - Updated the verifier cli dep modules (Ronald Holshausen, Fri Nov 3 15:14:57 2017 +1100)
* ac94388 - Tests are now all passing #20 (Ronald Holshausen, Thu Oct 19 15:14:25 2017 +1100)
* c983c63 - Bump versions to 0.3.0 (Ronald Holshausen, Wed Oct 18 13:54:46 2017 +1100)
* 06e92e5 - Refer to local libs using version+paths (Eric Kidd, Tue Oct 3 06:22:23 2017 -0400)
* 7afd258 - Update all the cargo manifest versions and commit the cargo lock files (Ronald Holshausen, Wed May 17 10:37:44 2017 +1000)
* be8c299 - Cleanup unused BTreeMap usages and use remote pact dependencies (Anthony Damtsis, Mon May 15 17:09:14 2017 +1000)
* a59fb98 - Migrate remaining pact modules over to serde (Anthony Damtsis, Mon May 15 16:59:04 2017 +1000)
* d5e6ce0 - bump version to 0.2.1 (Ronald Holshausen, Sun Oct 9 17:20:25 2016 +1100)

# 0.2.0 - V2 specification implementation

* 38027f8 - updated the pact_verifier_cli to V2 (Ronald Holshausen, Sun Oct 9 17:12:35 2016 +1100)
* 770010a - update projects to use the published pact matching lib (Ronald Holshausen, Sun Oct 9 16:25:15 2016 +1100)
* 574e072 - upadte versions for V2 branch and fix an issue with loading JSON bodies encoded as a string (Ronald Holshausen, Sun Oct 9 15:31:57 2016 +1100)
* b0bebb7 - bump version to 0.1.1 (Ronald Holshausen, Sun Oct 9 11:27:41 2016 +1100)

# 0.1.0 - V1.1 specification implementation

* ea1ef54 - Updated dependencies and version for release of pact_verifier_cli (Ronald Holshausen, Sun Oct 9 10:56:34 2016 +1100)
* 1f3f3f1 - correct the versions of the inter-dependent projects as they were causing the build to fail (Ronald Holshausen, Sat Oct 8 17:41:57 2016 +1100)
* a46dabb - update all references to V1 spec after merge (Ronald Holshausen, Sat Oct 8 16:20:51 2016 +1100)
* b6df52f - bump version to 0.0.1 (Ronald Holshausen, Tue Sep 27 22:27:26 2016 +1000)

# 0.0.0 - First Release
