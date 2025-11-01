---
title: pact_mock_server_cli
custom_edit_url: https://github.com/pact-foundation/pact-core-mock-server/edit/main/pact_mock_server_cli/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-core-mock-server repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## Source Code

https://github.com/pact-foundation/pact-core-mock-server/tree/main/pact_mock_server_cli


## 2.0.0 - [Feature Release]

* 1bf02075 - fix: ensure we write logs to file (Yousaf Nabi, Fri Oct 24 12:11:05 2025 +0100)
* 19b1066a - feat: allow setting of pact specification version to output on mock server creation (Yousaf Nabi, Sat Oct 18 01:57:52 2025 +0100)
* fc2925f6 - feat: cli as lib (Yousaf Nabi, Sat Sep 27 12:04:49 2025 +0100)

## 2.0.0-beta.0 - First beta with new mock server

* 833e1c71 - fix: Handling of the mock server ID (Ronald Holshausen, Tue Jul 2 15:46:23 2024 +1000)
* 36728503 - feat: Use comfy-table to show the list of mock servers (Ronald Holshausen, Tue Jul 2 15:23:55 2024 +1000)
* 96476c96 - fix: Use the same global manager for all commands (Ronald Holshausen, Tue Jul 2 13:57:33 2024 +1000)
* 82208f6e - fix: Remove unnecessary task spaning when creating a new mock server (Ronald Holshausen, Tue Jul 2 13:23:11 2024 +1000)
* 0ac8911c - fix: Incorrect function was used when feature was not enabled (Ronald Holshausen, Mon Jun 17 16:37:07 2024 +1000)
* af1cc22f - feat: Working mock server with TLS + self-signed cert (Ronald Holshausen, Mon Jun 17 16:20:58 2024 +1000)

## 1.0.6 - Maintenance Release


## 1.0.5 - Maintenance Release

* 9196efe4 - feat: verifier/mock_server clis - build for musl (Yousaf Nabi, Thu Feb 8 20:36:10 2024 +0000)

## 1.0.4 - Maintenance Release

* 36390097 - Merge pull request #371 from YOU54F/chore/renable_verifier_aarch64_linux (Ronald Holshausen, Thu Jan 25 09:59:53 2024 +1100)
* c412829f - feat: build aarch64-pc-windows-msvc target (ffi/mock_server/verifier) (Yousaf Nabi, Wed Jan 24 12:01:50 2024 +0000)
* a2ba1cd5 - fix: pin cross to 0.2.5 for glibc 2.23 (Yousaf Nabi, Wed Jan 24 11:54:22 2024 +0000)
* 944613df - fix: regression - upgrade pact_models to 1.1.16 #359 (Ronald Holshausen, Fri Jan 19 14:52:36 2024 +1100)

## 1.0.3 - Maintenance release


## 1.0.2 - Fixes a deadlock caused when getting mock server JSON

* e58aa917 - fix: no need to wrap the Pact for a mock server in a mutex (mock server is already behind a mutex) as this can cause deadlocks #274 (Ronald Holshausen, Wed Jun 14 13:26:54 2023 +1000)

## 1.0.1 - Adds aarch64 osx binary + bug fixes

* 261ecf47 - fix: Add RefUnwindSafe trait bound to all Pact and Interaction uses (Ronald Holshausen, Mon May 15 13:59:31 2023 +1000)
* 84b9d9e9 - fix: Upgrade pact models to 1.0.11 (fixes generated key for V4 Pacts) (Ronald Holshausen, Fri Apr 14 17:10:58 2023 +1000)
* a7349c74 - feat: pact_mock_server_cli aarch64 osx (Yousaf Nabi, Wed Apr 12 12:29:14 2023 +0100)

## 1.0.0 - Maintenance Release

* 11c701b4 - fix: Upgrade pact_matching to 1.0.6 (fixes some issues with matching HTTP headers) (Ronald Holshausen, Wed Mar 15 14:54:54 2023 +1100)
* e96bc54e - fix: Upgrade pact_models to 1.0.9 (fixes issues with headers) (Ronald Holshausen, Wed Mar 15 14:31:00 2023 +1100)
* 577824e7 - fix: Upgrade pact_models to 1.0 and pact-plugin-driver to 0.1.15 to fix cyclic dependency issue (Ronald Holshausen, Mon Nov 7 11:14:20 2022 +1100)
* 6ad00a5d - fix: Update onig to latest master to fix  Regex Matcher Fails On Valid Inputs #214 (Ronald Holshausen, Fri Nov 4 15:23:50 2022 +1100)
* f8db90d2 - fix: Upgrade pact_models to 0.4.5 - fixes FFI bug with generators for request paths (Ronald Holshausen, Fri Aug 26 11:44:08 2022 +1000)

## 0.7.8 - Maintenance Release

* e3bef155 - feat: Add ARM64 (aarch64) linux targets to the release build #160 (Ronald Holshausen, Mon Aug 15 16:13:22 2022 +1000)
* fcbee0c2 - fix: rust/pact_mock_server_cli/Dockerfile to reduce vulnerabilities (snyk-bot, Thu Jul 7 11:09:31 2022 +0000)
* cdf72b05 - feat: forward provider details to plugin when verifying (Ronald Holshausen, Fri Apr 22 14:12:34 2022 +1000)
* 2395143a - feat: forward verification to plugin for transports provided by the plugin (Ronald Holshausen, Fri Apr 22 12:02:05 2022 +1000)
* 73ae0ef0 - fix: Upgrade reqwest to 0.11.10 to resolve #156 (Ronald Holshausen, Wed Apr 13 13:31:55 2022 +1000)
* 345b0011 - feat: support mock servers provided from plugins (Ronald Holshausen, Mon Mar 21 15:59:46 2022 +1100)
* eb92d665 - fix: rust/pact_mock_server_cli/Dockerfile to reduce vulnerabilities (snyk-bot, Thu Mar 17 22:20:08 2022 +0000)

## 0.7.7 - Maintenance Release

* c2089645 - fix: log crate version must be fixed across all crates (including plugin driver) (Ronald Holshausen, Fri Jan 14 16:10:50 2022 +1100)
* 5d4a09c6 - feat: store the pact specification version with the mock server (Ronald Holshausen, Wed Nov 17 14:46:56 2021 +1100)
* 918e5beb - fix: update to latest models and plugin driver crates (Ronald Holshausen, Tue Oct 19 17:09:48 2021 +1100)

## 0.7.6 - support native TLS certs

* df715cd5 - feat: support native TLS. Fixes #144 (Matt Fellows, Mon Sep 20 13:00:33 2021 +1000)

## 0.7.5 - Bugfix Release

* b4e26844 - fix: reqwest is dyn linked to openssl by default, which causes a SIGSEGV on alpine linux (Ronald Holshausen, Tue Jun 1 14:21:31 2021 +1000)

## 0.7.4 - Upgraded crates + V4 features

* 728465d - fix: clippy violation - caused a compiler error (Ronald Holshausen, Sat Apr 24 13:07:32 2021 +1000)
* 9976e80 - feat: added read locks and a mutex guard to reading and writing pacts (Ronald Holshausen, Mon Feb 8 11:58:52 2021 +1100)
* 4afa86a - fix: add callback timeout option for verifcation callbacks (Ronald Holshausen, Sat Feb 6 12:27:32 2021 +1100)

## 0.7.3 - Add TLS (self-signed) option

* 773b4b1 - fix: pinning version of webmachine until reqwest is updated (Ronald Holshausen, Tue Jan 5 12:41:05 2021 +1100)
* 76f052b - feat: add self-signed tls option to mockserver cli (to test TLS with Tokio 1.0) (Ronald Holshausen, Tue Jan 5 11:39:53 2021 +1100)

## 0.7.2 - support generators associated with array contains matcher variants


## 0.7.1 - arrayContains matcher + text/xml content type

* 2fb0c6e - fix: fix the build after refactoring the pact write function (Ronald Holshausen, Wed Oct 14 11:07:57 2020 +1100)
* 7232e89 - feat: Add initial V4 models and example pact files (Ronald Holshausen, Tue Oct 6 09:13:21 2020 +1100)

## 0.7.0 - Async changes (using Hyper 0.13) + CORS pre-flight support

* 7e68e4c - feat: enable CORS behaviour based on the mock server config (Ronald Holshausen, Mon Sep 28 11:42:23 2020 +1000)
* 29ba743 - feat: add a mock server config struct (Ronald Holshausen, Thu Sep 24 10:30:59 2020 +1000)
* 2e662a6 - feat: handle CORS pre-flight requests in the mock server (Ronald Holshausen, Wed Sep 23 17:59:32 2020 +1000)

## 0.6.2 - Updated XML Matching


## 0.6.1 - Updated crates

* 1651af1 - fix: upgrade uuid crate (Ronald Holshausen, Thu Apr 23 14:56:34 2020 +1000)
* 8a0c5c2 - fix: docker file needs to be able to build Oniguruma lib (Ronald Holshausen, Sat Dec 14 19:23:45 2019 +1100)

## 0.6.0 - Bugfix Release


## 0.5.1 - support headers with multiple values

* 5b22076 - fix: docker release script (Ronald Holshausen, Sat Jul 27 16:52:12 2019 +1000)

## 0.5.0 - Upgrade to non-blocking Hyper 0.12

* 074569a - feat: Add a parameter for the server key to the start command #26 (Ronald Holshausen, Sun Apr 8 18:24:36 2018 +1000)
* 40ad75b - feat: Add a command to shut the master mock server down #26 (Ronald Holshausen, Sun Apr 8 18:15:08 2018 +1000)
* e5af1b0 - fix: global options no longer incorrectly display a warning about being provided twice #27 (Ronald Holshausen, Sun Apr 8 16:11:41 2018 +1000)
* 3c33294 - fix: Only print errors in the CLI to STDERR #28 (Ronald Holshausen, Sun Apr 8 15:57:56 2018 +1000)
* 386ab52 - fix: corrected the release scripts to check for a version parameter (Ronald Holshausen, Sun Apr 8 13:44:57 2018 +1000)
* a45d5f8 - fix: corrected the docker build for the mock server cli #14 (Ronald Holshausen, Sun Apr 8 12:52:53 2018 +1000)
* 6343607 - fix: CLI was reporting incorrect pact specification version (Ronald Holshausen, Sun Apr 8 12:36:56 2018 +1000)

## 0.4.0 - First V3 specification release


## 0.3.1 - Bugfixes plus changes for running with docker


## 0.3.0 - Backported the matching rules from the V3 branch


## 0.2.3 - Bugfix Release


## 0.2.2 - Bugfix Release


## 0.1.2 - Bugfix Release


## 0.0.2 - Bugfix Release


## 0.2.1 - Changes required for verifying V2 pacts


## 0.1.1 - Changes required for verifying V1.1 pacts


## 0.2.0 - V2 Specification Implementation


## 0.1.0 - V1.1 Specification Implementation


## 0.0.1 - Feature Release



## 0.0.0 - First Release
