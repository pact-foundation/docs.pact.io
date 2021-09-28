---
title: pact_consumer
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_consumer/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## 0.7.8 - Bugfixes + support native TLS certs

* df715cd5 - feat: support native TLS. Fixes #144 (Matt Fellows, Mon Sep 20 13:00:33 2021 +1000)
* 8bcd1c7e - fix: min/max type matchers must not apply the limits when cascading (Ronald Holshausen, Sun Aug 8 15:50:40 2021 +1000)
* 084ab46b - feat: Copied pact_mockserver_ffi to pact_ffi (Ronald Holshausen, Sat Jul 10 16:24:29 2021 +1000)
* be604cce - feat: add date-time matcher to consumer DSL (Ronald Holshausen, Wed Jun 2 15:19:06 2021 +1000)
* b4e26844 - fix: reqwest is dyn linked to openssl by default, which causes a SIGSEGV on alpine linux (Ronald Holshausen, Tue Jun 1 14:21:31 2021 +1000)

## 0.7.7 - Bugfix Release

* 084ab46b - feat: Copied pact_mockserver_ffi to pact_ffi (Ronald Holshausen, Sat Jul 10 16:24:29 2021 +1000)
* be604cce - feat: add date-time matcher to consumer DSL (Ronald Holshausen, Wed Jun 2 15:19:06 2021 +1000)
* b4e26844 - fix: reqwest is dyn linked to openssl by default, which causes a SIGSEGV on alpine linux (Ronald Holshausen, Tue Jun 1 14:21:31 2021 +1000)

## 0.7.6 - V4 features + DSL enhancements

* ffbcaf5 - feat: Added header_from_provider_state and path_from_provider_state (Rob Caiger, Mon May 24 13:54:16 2021 +0100)

## 0.7.5 - mock server metrics

* 5a529fd - feat: add ability of mock server to expose metrics #94 (Ronald Holshausen, Sun Mar 14 11:41:16 2021 +1100)

## 0.7.4 - Use a file system lock when merging pact files

* 9976e80 - feat: added read locks and a mutex guard to reading and writing pacts (Ronald Holshausen, Mon Feb 8 11:58:52 2021 +1100)

## 0.7.3 - Updated dependencies


## 0.7.2 - Upgrade Tokio to 1.0


## 0.7.1 - support generators associated with array contains matcher variants

* beb1c03 - fix: cleanup compiler warning (Ronald Holshausen, Thu Dec 31 14:41:09 2020 +1100)

## 0.7.0 - Update to latest matching and mock server crates

* 13976f5 - fix: failing pact_consumer build (Ronald Holshausen, Thu Oct 15 12:00:09 2020 +1100)
* 2fb0c6e - fix: fix the build after refactoring the pact write function (Ronald Holshausen, Wed Oct 14 11:07:57 2020 +1100)
* 29ba743 - feat: add a mock server config struct (Ronald Holshausen, Thu Sep 24 10:30:59 2020 +1000)

## 0.6.2 - Updated XML Matching


## 0.6.1 - Bugfix Release

* a45d0c3 - fix: FFI mismatch json should have the actual values as UTF-8 string not bytes #64 (Ronald Holshausen, Thu Apr 30 11:16:25 2020 +1000)
* 6ff9c33 - fix: ignore flakey test (Matt Fellows, Tue Mar 3 12:14:08 2020 +1100)

## 0.6.0 - Convert to async/await


## 0.5.3 - Bugfix Release

* 19e8ced - fix: cleanup env var and set tests to not run in parallel on CI #54 (Ronald Holshausen, Sat Dec 14 16:08:56 2019 +1100)
* b5474b4 - fix: set the path to the generated pact file #54 (Ronald Holshausen, Sat Dec 14 15:46:37 2019 +1100)
* d4dd39f - fix: repeat the test 3 times #54 (Ronald Holshausen, Sat Dec 14 15:30:01 2019 +1100)
* bc044be - fix: check the size of the merged pact file #54 (Ronald Holshausen, Sat Dec 14 15:25:33 2019 +1100)
* a660b87 - fix: correct pact merging to remove duplicates #54 (Ronald Holshausen, Sat Dec 14 15:06:30 2019 +1100)

## 0.5.2 - Fix dependency versions

* eef3d97 - feat: added some tests for publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 16:44:52 2019 +1000)
* 1110b47 - feat: implemented publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 13:53:27 2019 +1000)

## 0.5.1 - support headers with multiple values

* f0c0d07 - feat: support headers with multiple values (Ronald Holshausen, Sat Aug 10 17:01:10 2019 +1000)

## 0.5.0 - Upgrade to non-blocking Hyper 0.12

* 1e0c65b - fix: doc tests with Into trait fail to link with Rust beta 1.27.0 (Ronald Holshausen, Sun May 13 15:26:36 2018 +1000)
* a5588dc - feat: Allow the directory pacts are written to to be overriden in consumer tests #21 (Ronald Holshausen, Sun Apr 8 15:20:38 2018 +1000)

## 0.4.0 - First V3 specification release


## 0.3.1 - Converted OptionalBody::Present to take a Vec&lt;u8&;gt;


## 0.3.0 - Improved Consumer DSL


## 0.2.0 - V2 implementation


## 0.1.0 - V1.1 specification implementation


## 0.0.0 - First Release
