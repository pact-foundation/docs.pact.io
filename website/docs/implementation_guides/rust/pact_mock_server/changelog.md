---
title: pact_mock_server
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_mock_server/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## 1.2.5 - Maintenance Release

* 95cbe5a9 - fix: Upgrade pact-plugin-driver to 0.5.1 (Ronald Holshausen, Wed Jan 31 19:56:04 2024 +1100)

## 1.2.4 - Maintenance Release

* 944613df - fix: regression - upgrade pact_models to 1.1.16 #359 (Ronald Holshausen, Fri Jan 19 14:52:36 2024 +1100)

## 1.2.3 - Maintenance Release


## 1.2.2 - Bugfix Release


## 1.2.1 - Bugfix Release

* 445ea1ee - fix: Header matching rules should be looked up in a case-insenstive way (Ronald Holshausen, Wed Jun 28 15:21:32 2023 +1000)

## 1.2.0 - Fixes a deadlock with mock server JSON results

* e58aa917 - fix: no need to wrap the Pact for a mock server in a mutex (mock server is already behind a mutex) as this can cause deadlocks #274 (Ronald Holshausen, Wed Jun 14 13:26:54 2023 +1000)
* 37673fac - fix: correct tests after upgrading pact_models (Ronald Holshausen, Mon May 29 15:13:44 2023 +1000)

## 1.1.0 - Update Pact models to 1.1 (breaking change)

* 261ecf47 - fix: Add RefUnwindSafe trait bound to all Pact and Interaction uses (Ronald Holshausen, Mon May 15 13:59:31 2023 +1000)

## 1.0.2 - Bugfix Release

* 84b9d9e9 - fix: Upgrade pact models to 1.0.11 (fixes generated key for V4 Pacts) (Ronald Holshausen, Fri Apr 14 17:10:58 2023 +1000)
* 779a59f0 - fix: Upgrade pact-plugin-driver to 0.4.1 (fixes an issue introduced in 0.4.0 with shared channels to plugins) (Ronald Holshausen, Wed Apr 5 17:01:18 2023 +1000)

## 1.0.1 - Bugfix Release

* 30dad6d4 - fix: mock servers were shutting plugins down twice when shutting down (Ronald Holshausen, Tue Apr 4 15:15:13 2023 +1000)
* 6f0c4b2f - feat: Upgrade pact-plugin-driver to 0.4.0 which uses a shared gRPC channel to each plugin (Ronald Holshausen, Tue Apr 4 14:32:36 2023 +1000)
* 11c701b4 - fix: Upgrade pact_matching to 1.0.6 (fixes some issues with matching HTTP headers) (Ronald Holshausen, Wed Mar 15 14:54:54 2023 +1100)
* e96bc54e - fix: Upgrade pact_models to 1.0.9 (fixes issues with headers) (Ronald Holshausen, Wed Mar 15 14:31:00 2023 +1100)

## 1.0.0 - Maintenance Release

* 1e7331f1 - fix: Upgrade plugin driver to 0.3.1 (Ronald Holshausen, Wed Feb 8 13:28:07 2023 +1100)

## 0.9.7 - Support generators in plugins

* 5fbb0d6a - feat: Upgrade plugin driver to 0.2.2 (supports passing a test context to support generators) (Ronald Holshausen, Fri Dec 16 16:38:03 2022 +1100)

## 0.9.6 - Support plugins generating interaction content


## 0.9.5 - Maintenance Release


## 0.9.4 - Bugfix Release

* 577824e7 - fix: Upgrade pact_models to 1.0 and pact-plugin-driver to 0.1.15 to fix cyclic dependency issue (Ronald Holshausen, Mon Nov 7 11:14:20 2022 +1100)
* 6ad00a5d - fix: Update onig to latest master to fix  Regex Matcher Fails On Valid Inputs #214 (Ronald Holshausen, Fri Nov 4 15:23:50 2022 +1100)
* 965a1c41 - fix: Upgrade plugin driver to 0.1.13 (fixes issue loading plugin when there are multiple versions for the same plugin) (Ronald Holshausen, Wed Oct 5 17:29:37 2022 +1100)
* 57a8ad7d - fix: Consumer DSL needs to increment plugin access to avoid plugin shutting down when mock server starts (Ronald Holshausen, Thu Sep 8 11:54:33 2022 +1000)
* f8db90d2 - fix: Upgrade pact_models to 0.4.5 - fixes FFI bug with generators for request paths (Ronald Holshausen, Fri Aug 26 11:44:08 2022 +1000)

## 0.9.3 - Maintenance Release


## 0.9.2 - Maintenance Release

* 78c05f29 - feat: add metric call when the mock server is shutdown via FFI function (Ronald Holshausen, Thu Aug 11 17:50:29 2022 +1000)

## 0.9.1 - Bugfix Release


## 0.9.0 - support for mock servers from plugin

* 4f198f10 - feat: support for mock servers from plugins (Ronald Holshausen, Fri May 20 15:59:49 2022 +1000)

## 0.8.11 - Maintenance Release


## 0.8.10 - Maintenance Release

* cdf72b05 - feat: forward provider details to plugin when verifying (Ronald Holshausen, Fri Apr 22 14:12:34 2022 +1000)
* 2395143a - feat: forward verification to plugin for transports provided by the plugin (Ronald Holshausen, Fri Apr 22 12:02:05 2022 +1000)

## 0.8.9 - Maintenance Release

* 73ae0ef0 - fix: Upgrade reqwest to 0.11.10 to resolve #156 (Ronald Holshausen, Wed Apr 13 13:31:55 2022 +1000)

## 0.8.8 - Maintenance Release

* 345b0011 - feat: support mock servers provided from plugins (Ronald Holshausen, Mon Mar 21 15:59:46 2022 +1100)

## 0.8.7 - Maintenance Release


## 0.8.6 - Bugfix Release

* c2089645 - fix: log crate version must be fixed across all crates (including plugin driver) (Ronald Holshausen, Fri Jan 14 16:10:50 2022 +1100)

## 0.8.5 - Maintenance Release


## 0.8.4 - Maintenance Release


## 0.8.3 - Maintenance Release


## 0.8.2 - Support setting pact spec version on the mock servers

* 5d4a09c6 - feat: store the pact specification version with the mock server (Ronald Holshausen, Wed Nov 17 14:46:56 2021 +1100)
* fc5be202 - fix: update to latest driver crate (Ronald Holshausen, Tue Nov 16 16:19:02 2021 +1100)

## 0.8.1 - Support for using plugins via FFI


## 0.8.0 - Pact V4 release


## 0.8.0-beta.4 - Bugfix Release

* 918e5beb - fix: update to latest models and plugin driver crates (Ronald Holshausen, Tue Oct 19 17:09:48 2021 +1100)

## 0.8.0-beta.3 - Support matching synchronous request/response messages


## 0.8.0-beta.2 - Support synchronous messages

* d0bfb8a8 - feat: Support consumer tests with synchronous messages (Ronald Holshausen, Tue Oct 12 15:51:08 2021 +1100)
* 35ff0993 - feat: record the version of the lib that created the pact in the metadata (Ronald Holshausen, Tue Oct 12 14:52:43 2021 +1100)

## 0.8.0-beta.1 - Fixes from master + Plugin support (driver version 0.0.3)

* df715cd5 - feat: support native TLS. Fixes #144 (Matt Fellows, Mon Sep 20 13:00:33 2021 +1000)

## 0.7.21 - support native TLS certs

* df715cd5 - feat: support native TLS. Fixes #144 (Matt Fellows, Mon Sep 20 13:00:33 2021 +1000)

## 0.8.0-beta.0 - Support for plugins with mock server


## 0.7.20 - Refactor


## 0.7.19 - Refactor: Moved structs to models crate


## 0.7.18 - accumulating log entries + bugfix

* b4e26844 - fix: reqwest is dyn linked to openssl by default, which causes a SIGSEGV on alpine linux (Ronald Holshausen, Tue Jun 1 14:21:31 2021 +1000)
* 17beef62 - feat: support accumulating log entries per running mock server (Ronald Holshausen, Mon May 31 15:09:20 2021 +1000)

## 0.7.17 - V4 features + bugfixes/enhancements

* e588bb2 - fix: clippy violation: using `clone` on a double-reference (Ronald Holshausen, Sat Apr 24 12:52:58 2021 +1000)

## 0.7.16 - Bugfix Release

* 5a529fd - feat: add ability of mock server to expose metrics #94 (Ronald Holshausen, Sun Mar 14 11:41:16 2021 +1100)
* 7f054e8 - fix: correctly assemble UTF-8 percent encoded query parameters (Ronald Holshausen, Tue Feb 9 14:02:04 2021 +1100)

## 0.7.15 - use a file system lock when merging pact files

* 9976e80 - feat: added read locks and a mutex guard to reading and writing pacts (Ronald Holshausen, Mon Feb 8 11:58:52 2021 +1100)
* 61e16ed - feat: use a file system lock when merging pact files (Ronald Holshausen, Sun Feb 7 17:00:29 2021 +1100)

## 0.7.14 - Updated dependencies


## 0.7.13 - Upgrade Tokio to 1.0


## 0.7.12 - Mockserver URL and array contains generators

* 5058a2d - feat: include the mockserver URL and port in the verification context (Ronald Holshausen, Fri Nov 20 16:43:10 2020 +1100)
* 118daa1 - feat: when merging pact files, upcast to the higher spec version (Ronald Holshausen, Thu Nov 19 18:09:13 2020 +1100)

## 0.7.11 - Support provider state injected values

* 13ce2f2 - fix: introduce GeneratorTestMode and restrict provider state generator to the provider side (Ronald Holshausen, Mon Nov 16 15:00:01 2020 +1100)

## 0.7.10 - Bugfix Release

* 326d02d - fix: jsdom does not support access-control-allow-headers: * for CORS pre-flight responses (Ronald Holshausen, Fri Oct 30 11:54:03 2020 +1100)

## 0.7.9 - arrayContains matcher

* 2fb0c6e - fix: fix the build after refactoring the pact write function (Ronald Holshausen, Wed Oct 14 11:07:57 2020 +1100)
* 44e7414 - fix: access-control-allow-methods header was duplicated (Ronald Holshausen, Thu Oct 1 15:29:14 2020 +1000)
* d3c5cf2 - feat: add all the CORS headers (Ronald Holshausen, Wed Sep 30 13:19:31 2020 +1000)

## 0.7.8 - CORS pre-flight requests

* 7e68e4c - feat: enable CORS behaviour based on the mock server config (Ronald Holshausen, Mon Sep 28 11:42:23 2020 +1000)
* 29ba743 - feat: add a mock server config struct (Ronald Holshausen, Thu Sep 24 10:30:59 2020 +1000)
* 2e662a6 - feat: handle CORS pre-flight requests in the mock server (Ronald Holshausen, Wed Sep 23 17:59:32 2020 +1000)

## 0.7.7 - Updated to latest pact matching crate

* 6cba6ad - feat: implemented basic message verification with the verifier cli (Ronald Holshausen, Mon Sep 14 13:48:27 2020 +1000)

## 0.7.6 - Implemented provider state generator

* da53bac - fix: return the most relevant response from the mock server #69 (Ronald Holshausen, Tue Jul 21 16:10:54 2020 +1000)
* 420f5e2 - Merge pull request #70 from pact-foundation/fix/v2-pacts (Ronald Holshausen, Tue Jul 21 09:46:05 2020 +1000)
* d7632cb - fix: write_pact_file was always serialising a v3 pact even if the spec version was set to 2 (Matt Fellows, Tue Jul 21 09:42:30 2020 +1000)

## 0.7.5 - Updated XML Matching


## 0.7.4 - multi-part form post bodies

* ce94df9 - feat: cleaned up the logging of request matches (Ronald Holshausen, Sun May 24 11:17:08 2020 +1000)

## 0.7.3 - matching of binary payloads

* 708db47 - feat: implement matching of binary payloads (application/octet-stream) (Ronald Holshausen, Fri May 8 15:52:03 2020 +1000)

## 0.7.2 - TLS suppport + bugfixes

* d85f28c - fix: mock server matching requests with headers with multiple values (Ronald Holshausen, Tue May 5 15:23:11 2020 +1000)
* da885a3 - feat: add support for TLS with the mock server #65 (Ronald Holshausen, Thu Apr 30 16:41:30 2020 +1000)

## 0.7.1 - Changes to support C++ DSL

* 5f8d0a0 - feat: handle bodies with embedded matchers and generators (Ronald Holshausen, Thu Apr 23 12:25:05 2020 +1000)

## 0.7.0 - Convert to async/await


## 0.6.2 - Rust 2018 edition


## 0.6.1 - Bugfix Release

* eef3d97 - feat: added some tests for publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 16:44:52 2019 +1000)
* 1110b47 - feat: implemented publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 13:53:27 2019 +1000)
* cb30a2f - feat: added the ProviderStateGenerator as a generator type (Ronald Holshausen, Sun Sep 8 16:29:46 2019 +1000)
* adf1a97 - fix: correct the release script (Ronald Holshausen, Sat Sep 7 12:28:22 2019 +1000)

## 0.6.0 - moved the ffi functions into the ffi module


## 0.5.1 - support headers with multiple values

* b5c7842 - fix: corrected some spelling (Ronald Holshausen, Sun Aug 11 14:31:42 2019 +1000)
* f0c0d07 - feat: support headers with multiple values (Ronald Holshausen, Sat Aug 10 17:01:10 2019 +1000)
* 2057f2c - fix: correct the release scripts (Ronald Holshausen, Sat Jul 27 16:07:13 2019 +1000)

## 0.5.0 - Upgrade to non-blocking Hyper 0.12

* a7c674a - fix: remove duplicated line (Ronald Holshausen, Sat Jul 27 15:41:00 2019 +1000)

## 0.4.1 - pact matchig version to 0.5.0

* 386ab52 - fix: corrected the release scripts to check for a version parameter (Ronald Holshausen, Sun Apr 8 13:44:57 2018 +1000)

## 0.4.0 - First V3 specification release

* 3d01d6e - Merge pull request #31 from andrewspinks/master (Ronald Holshausen, Sun Mar 4 14:18:21 2018 +1100)

## 0.3.1 - Bugfixes plus changes for running with docker


## 0.3.0 - Backported matching rules from V3 branch


## 0.2.2 - Bugfix Release


## 0.2.1 - Changes required for verifying V2 pacts


## 0.1.1 - Changes required for verifying V1.1 pacts


## 0.2.0 - V2 specification implementation


## 0.1.0 - V1.1 Specification Implementation


## 0.0.2 - Fixes required for verifing pacts


## 0.0.1 - Feature Release


## 0.0.0 - First Release
