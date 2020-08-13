---
title: pact_verifier
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_verifier/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## 0.8.2 - Updated XML Matching

* df5796f - bump version to 0.8.2 (Ronald Holshausen, Sun May 24 14:02:11 2020 +1000)

## 0.8.1 - Bugfixes + update matching crate to 0.6.0

* 61ab50f - fix: date/time matchers fallback to the old key (Ronald Holshausen, Fri May 15 11:27:27 2020 +1000)
* 7616ccb - fix: broken tests after handling multiple header values (Ronald Holshausen, Tue May 5 15:45:27 2020 +1000)
* c0b67bf - Use err.to_string() rather than format!("{}", err) (Caleb Stepanian, Tue Mar 31 13:27:27 2020 -0400)
* bd10d00 - Avoid deprecated Error::description in favor of Display trait (Caleb Stepanian, Mon Mar 30 16:49:13 2020 -0400)
* c04c0af - bump version to 0.8.1 (Ronald Holshausen, Fri Mar 13 10:06:29 2020 +1100)

## 0.8.0 - Added callback handlers + Bugfixes

* 2920364 - fix: date and time matchers with JSON (Ronald Holshausen, Thu Mar 12 16:07:05 2020 +1100)
* 126b463 - fix: provider state handlers must be synchronous so they are executed for the actual request (Ronald Holshausen, Thu Mar 12 14:16:03 2020 +1100)
* 0e8bfad - fix: allow the HTTP client to be optional in the provider state executor (Ronald Holshausen, Wed Mar 11 14:47:37 2020 +1100)
* fe74376 - feat: implemented publishing provider tags with verification results #57 (Ronald Holshausen, Sun Mar 8 18:37:21 2020 +1100)
* c2b7334 - Fixed broken tests using `VerificationOptions`. (Andrew Lilley Brinker, Mon Mar 2 12:16:45 2020 -0800)
* d198d7d - Make `NullRequestFilterExecutor` unconstructable. (Andrew Lilley Brinker, Mon Mar 2 11:59:16 2020 -0800)
* a6e0c16 - Fix RequestFilterExecutor w/ verify_provider (Andrew Lilley Brinker, Mon Mar 2 11:43:59 2020 -0800)
* 639c1fd - bump version to 0.7.1 (Ronald Holshausen, Sun Jan 19 12:03:44 2020 +1100)

## 0.7.0 - Convert to async/await

* cb4c560 - Upgrade tokio to 0.2.9 (Audun Halland, Fri Jan 10 00:13:02 2020 +0100)
* e8034bf - Remove mock server async spawning. (Audun Halland, Thu Jan 9 21:59:56 2020 +0100)
* 9dec41b - Upgrade reqwest to 0.10 (Audun Halland, Tue Dec 31 07:22:36 2019 +0100)
* d24c434 - pact_verifier/pact_broker: Avoid completely unnecessary clones (Audun Halland, Tue Dec 17 02:54:45 2019 +0100)
* cd1046d - pact_verifier: Actually implement HAL client using async reqwest (Audun Halland, Tue Dec 17 01:42:57 2019 +0100)
* d395d2d - pact_verifier: Upgrade reqwest to latest git alpha (Audun Halland, Tue Dec 17 00:57:16 2019 +0100)
* 8019d6d - pact_verifier: Async mock server shutdown (Audun Halland, Thu Dec 12 21:45:16 2019 +0100)
* 3074059 - Refactor ValidatingMockServer into a trait, with two implementations (Audun Halland, Thu Dec 12 15:58:50 2019 +0100)
* fe72f92 - Temporarily solve a problem where a spawned server prevents the test runtime from terminating (Audun Halland, Thu Dec 12 14:14:02 2019 +0100)
* 23a652d - pact_verifier: Implement hyper requests for provider/state change (Audun Halland, Thu Dec 12 11:46:50 2019 +0100)
* 30b1935 - pact_verifier tests: Change to spawned mock server (Audun Halland, Thu Dec 12 11:22:49 2019 +0100)
* bceb44d - pact_verifier: convert pact broker tests to async (Audun Halland, Thu Dec 12 11:04:53 2019 +0100)
* a8866e8 - pact_verifier: Into async/await, part 1 (Audun Halland, Thu Dec 12 10:43:38 2019 +0100)
* 95e46e5 - pact_verifier: Remove extern crate from lib.rs (Audun Halland, Sun Nov 17 23:22:13 2019 +0100)
* 713cd6a - Explicit edition 2018 in Cargo.toml files (Audun Halland, Sat Nov 16 23:55:37 2019 +0100)
* 924452f - 2018 edition autofix "cargo fix --edition" (Audun Halland, Sat Nov 16 22:27:42 2019 +0100)
* d566d23 - bump version to 0.6.2 (Ronald Holshausen, Fri Sep 27 15:17:24 2019 +1000)

## 0.6.1 - Bugfix + Oniguruma crate for regex matching

* defe890 - fix: switch to the Oniguruma crate for regex matching #46 (Ronald Holshausen, Fri Sep 27 14:35:16 2019 +1000)
* 665bbd8 - fix: return a failure if any pact verification fails #47 (Ronald Holshausen, Fri Sep 27 12:07:01 2019 +1000)
* 48f998d - bump version to 0.6.1 (Ronald Holshausen, Sun Sep 22 17:56:20 2019 +1000)
* 0c5d6c2 - fix: pact_consumer should be a dev dependency (Ronald Holshausen, Sun Sep 22 17:48:35 2019 +1000)

## 0.6.0 - Publishing verification results

* eef3d97 - feat: added some tests for publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 16:44:52 2019 +1000)
* 1110b47 - feat: implemented publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 13:53:27 2019 +1000)
* cb30a2f - feat: added the ProviderStateGenerator as a generator type (Ronald Holshausen, Sun Sep 8 16:29:46 2019 +1000)
* 1e17ca8 - bump version to 0.5.2 (Ronald Holshausen, Sat Aug 24 12:39:55 2019 +1000)

## 0.5.1 - Use reqwest for better HTTP/S support, support headers with multiple values

* dac8ae1 - feat: support authentication when fetching pacts from a pact broker (Ronald Holshausen, Sun Aug 11 13:57:29 2019 +1000)
* e007763 - feat: support bearer tokens when fetching pacts from URLs (Ronald Holshausen, Sun Aug 11 13:21:17 2019 +1000)
* 4378110 - Merge pull request #42 from audunhalland/reqwest (Ronald Holshausen, Sun Aug 11 09:32:30 2019 +1000)
* 75c9b3a - Fix hal+json matching (Audun Halland, Sat Aug 10 14:30:17 2019 +0200)
* f0c0d07 - feat: support headers with multiple values (Ronald Holshausen, Sat Aug 10 17:01:10 2019 +1000)
* 9310f78 - Error messages are a bit different using reqwest: Fix tests (Audun Halland, Mon Jul 29 01:48:03 2019 +0200)
* 58b8c3c - Remove unused import (Audun Halland, Sun Jul 28 18:34:20 2019 +0200)
* 9fd6458 - Print errors using Display trait (Audun Halland, Sun Jul 28 18:33:47 2019 +0200)
* 19f11f7 - Avoid unnecessary clone (Audun Halland, Sun Jul 28 16:39:12 2019 +0200)
* 8717cdd - Fix for json_content_type with charset (Audun Halland, Sun Jul 28 16:17:37 2019 +0200)
* aa1b714 - Switch pact_broker/HAL client to use reqwest instead of hyper directly (Audun Halland, Sun Jul 28 15:48:31 2019 +0200)
* 8b9648c - bump version to 0.5.1 (Ronald Holshausen, Sat Jul 27 17:29:57 2019 +1000)

## 0.5.0 - Upgrade to non-blocking Hyper 0.12

* 47ab6d0 - Upgrade tokio to 0.1.22 everywhere (Audun Halland, Mon Jul 22 23:47:09 2019 +0200)
* 4df2797 - Rename API function again (Audun Halland, Mon Jul 22 23:38:11 2019 +0200)
* 7f7dcb0 - Don't expose tokio Runtime inside the libraries (Audun Halland, Mon Jul 22 02:18:52 2019 +0200)
* 16cc6b6 - Run pact_verifier tests in async mode + pact write lock (Audun Halland, Sun May 12 04:05:08 2019 +0200)
* fd1296f - Use Runtime explicitly in tests (Audun Halland, Thu May 2 23:48:50 2019 +0200)
* e2a544c - Fix another warning (Audun Halland, Thu May 2 22:07:10 2019 +0200)
* f831a3f - Fix a couple of warnings (Audun Halland, Thu May 2 22:06:13 2019 +0200)
* ac1c678 - Don't use tokio runtime in provider_client. Only expose futures. (Audun Halland, Thu May 2 21:58:47 2019 +0200)
* 684c292 - Improve provider client errors (Audun Halland, Thu May 2 21:52:37 2019 +0200)
* b5accd6 - Move a function (Audun Halland, Thu May 2 18:32:35 2019 +0200)
* c4d98cb - Fix all tests (Audun Halland, Thu May 2 17:32:31 2019 +0200)
* 4831483 - A join_urls function (Audun Halland, Thu May 2 10:56:46 2019 +0200)
* 1b443a5 - Remove unused test commits (Audun Halland, Thu May 2 08:05:25 2019 +0200)
* 5d8c6fa - Uncomment and compile all tests (Audun Halland, Thu May 2 01:19:28 2019 +0200)
* 2f8a997 - Compile everything (except the commented-out tests) (Audun Halland, Thu May 2 00:41:56 2019 +0200)
* fb3a859 - Temporary fixes; temporarily comment out some tests until code compiles (Audun Halland, Tue Apr 30 12:52:42 2019 +0200)
* f2ae258 - Convert provider_client to async hyper (Audun Halland, Tue Apr 30 02:21:17 2019 +0200)
* 84f4969 - Add tokio Runtime param to pact_verifier lib (Audun Halland, Sat Apr 27 23:58:38 2019 +0200)
* c060f29 - Fix all compile errors in provider_client.rs (Audun Halland, Sat Apr 27 23:50:43 2019 +0200)
* 61c5481 - Work on making the state change async (Audun Halland, Sat Apr 27 22:02:35 2019 +0200)
* 692577b - More work on futures (Audun Halland, Sat Apr 27 21:53:27 2019 +0200)
* a32ec67 - Hyper 0.12: Work in progress (Audun Halland, Sat Apr 27 18:15:50 2019 +0200)
* 386ab52 - fix: corrected the release scripts to check for a version parameter (Ronald Holshausen, Sun Apr 8 13:44:57 2018 +1000)
* b5e0666 - bump version to 0.4.1 (Ronald Holshausen, Sat Apr 7 15:02:43 2018 +1000)

## 0.4.0 - First V3 specification release

* f63f339 - replaced use of try macro with ? (Ronald Holshausen, Tue Nov 7 16:31:39 2017 +1100)
* c4d424b - Wired in the generated request/response into the mock server and verifier (Ronald Holshausen, Tue Nov 7 16:27:01 2017 +1100)
* 13558d6 - Basic generators working (Ronald Holshausen, Tue Nov 7 10:56:55 2017 +1100)
* 7fef36b - Merge branch 'v2-spec' into v3-spec (Ronald Holshausen, Sat Nov 4 12:49:07 2017 +1100)
* 5c8b79b - Correct the changelog and linux release script (Ronald Holshausen, Fri Nov 3 15:12:39 2017 +1100)
* 9575ee8 - bump version to 0.3.1 (Ronald Holshausen, Fri Nov 3 15:03:20 2017 +1100)
* fbe35d8 - Compiling after merge from v2-spec (Ronald Holshausen, Sun Oct 22 11:39:46 2017 +1100)
* 00dc75a - Bump version to 0.4.0 (Ronald Holshausen, Sun Oct 22 10:46:48 2017 +1100)
* e82ee08 - Merge branch 'v2-spec' into v3-spec (Ronald Holshausen, Mon Oct 16 09:24:11 2017 +1100)
* 64ff667 - Upgraded the mock server implemenation to use Hyper 0.11.2 (Ronald Holshausen, Wed Sep 6 12:56:47 2017 +1000)
* e5a93f3 - Merge branch 'master' into v3-spec (Ronald Holshausen, Sun Aug 20 09:53:48 2017 +1000)
* fafb23a - update the verifier to support the new V3 format matchers (Ronald Holshausen, Sun Nov 13 16:49:29 2016 +1100)
* 8765729 - Updated the verifier to handle provider state parameters (Ronald Holshausen, Sun Oct 23 12:10:12 2016 +1100)
* 8797c6c - First successful build after merge from master (Ronald Holshausen, Sun Oct 23 11:59:55 2016 +1100)
* 639ac22 - fixes after merge in from master (Ronald Holshausen, Sun Oct 23 10:45:54 2016 +1100)
* 49e45f7 - Merge branch 'master' into v3-spec (Ronald Holshausen, Sun Oct 23 10:10:40 2016 +1100)
* 9d286b0 - add rlib crate type back (Ronald Holshausen, Wed Aug 24 21:13:51 2016 +1000)
* 5a7a65e - Merge branch 'master' into v3-spec (Ronald Holshausen, Wed Aug 24 21:02:23 2016 +1000)
* 539eb48 - updated all the readmes and cargo manefests for v3 (Ronald Holshausen, Tue Jul 19 15:46:18 2016 +1000)

## 0.3.0 - Backported matching rules from V3 branch

* 3c09f5b - Update the dependent modules for the verifier (Ronald Holshausen, Fri Nov 3 14:42:09 2017 +1100)
* 8c50392 - update changelog for release 0.3.0 (Ronald Holshausen, Fri Nov 3 14:27:40 2017 +1100)
* 24e3f73 - Converted OptionalBody::Present to take a Vec/<u8/> #19 (Ronald Holshausen, Sun Oct 22 18:04:46 2017 +1100)
* d990729 - Some code cleanup #20 (Ronald Holshausen, Wed Oct 18 16:32:37 2017 +1100)
* c983c63 - Bump versions to 0.3.0 (Ronald Holshausen, Wed Oct 18 13:54:46 2017 +1100)
* da9cfda - Implement new, experimental syntax (API BREAKAGE) (Eric Kidd, Sun Oct 8 13:33:09 2017 -0400)
* 06e92e5 - Refer to local libs using version+paths (Eric Kidd, Tue Oct 3 06:22:23 2017 -0400)
* 7afd258 - Update all the cargo manifest versions and commit the cargo lock files (Ronald Holshausen, Wed May 17 10:37:44 2017 +1000)
* 665aea1 - make release script executable (Ronald Holshausen, Wed May 17 10:30:31 2017 +1000)
* 17d6e98 - bump version to 0.2.2 (Ronald Holshausen, Wed May 17 10:23:34 2017 +1000)


## 0.2.1 - Replace rustc_serialize with serde_json

* a1f78f9 - Move linux specific bits out of the release script (Ronald Holshausen, Wed May 17 10:18:37 2017 +1000)
* efe4ca7 - Cleanup unused imports and unreachable pattern warning messages (Anthony Damtsis, Tue May 16 10:31:29 2017 +1000)
* be8c299 - Cleanup unused BTreeMap usages and use remote pact dependencies (Anthony Damtsis, Mon May 15 17:09:14 2017 +1000)
* a59fb98 - Migrate remaining pact modules over to serde (Anthony Damtsis, Mon May 15 16:59:04 2017 +1000)
* 3ca29d6 - bump version to 0.2.1 (Ronald Holshausen, Sun Oct 9 17:06:35 2016 +1100)

## 0.2.0 - V2 specification implementation

* 91f5315 - update the references to the spec in the verifier library to V2 (Ronald Holshausen, Sun Oct 9 16:59:45 2016 +1100)
* e2f88b8 - update the verifier library to use the published consumer library (Ronald Holshausen, Sun Oct 9 16:57:34 2016 +1100)
* 770010a - update projects to use the published pact matching lib (Ronald Holshausen, Sun Oct 9 16:25:15 2016 +1100)
* 574e072 - upadte versions for V2 branch and fix an issue with loading JSON bodies encoded as a string (Ronald Holshausen, Sun Oct 9 15:31:57 2016 +1100)
* dabe425 - bump version to 0.1.1 (Ronald Holshausen, Sun Oct 9 10:40:39 2016 +1100)

## 0.1.0 - V1.1 specification implementation

* 7b66941 - Update the deps for pact verifier library (Ronald Holshausen, Sun Oct 9 10:32:47 2016 +1100)
* 1f3f3f1 - correct the versions of the inter-dependent projects as they were causing the build to fail (Ronald Holshausen, Sat Oct 8 17:41:57 2016 +1100)
* a46dabb - update all references to V1 spec after merge (Ronald Holshausen, Sat Oct 8 16:20:51 2016 +1100)
* 1246784 - correct the verifier library release script (Ronald Holshausen, Tue Sep 27 20:57:13 2016 +1000)
* f0ce08a - bump version to 0.0.1 (Ronald Holshausen, Tue Sep 27 20:43:34 2016 +1000)

## 0.0.0 - First Release
