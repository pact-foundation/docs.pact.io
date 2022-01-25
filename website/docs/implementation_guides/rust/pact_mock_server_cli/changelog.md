---
title: pact_mock_server_cli
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_mock_server_cli/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

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
