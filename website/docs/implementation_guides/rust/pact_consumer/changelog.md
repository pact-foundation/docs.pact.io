---
title: pact_consumer
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_consumer/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

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
