---
title: pact_verifier
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_verifier/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## 0.9.1 - arrayContains matcher + text/xml content type

* 2fb0c6e - fix: fix the build after refactoring the pact write function (Ronald Holshausen, Wed Oct 14 11:07:57 2020 +1100)
* 3e943b1 - fix: set content-type header in message request (Marco Dallagiacoma, Thu Oct 1 23:58:14 2020 +0200)
* 29ba743 - feat: add a mock server config struct (Ronald Holshausen, Thu Sep 24 10:30:59 2020 +1000)

## 0.9.0 - Verifying Message Pacts

* 865327d - feat: handle comparing content types correctly (Ronald Holshausen, Mon Sep 14 16:37:11 2020 +1000)
* 258cb96 - feat: cleaned up the error display a bit (Ronald Holshausen, Mon Sep 14 16:05:37 2020 +1000)
* ebee1c0 - feat: implemented matching for message metadata (Ronald Holshausen, Mon Sep 14 15:31:18 2020 +1000)
* 6cba6ad - feat: implemented basic message verification with the verifier cli (Ronald Holshausen, Mon Sep 14 13:48:27 2020 +1000)
* 7baf074 - fix: correct clippy error (Ronald Holshausen, Sun Sep 13 18:41:25 2020 +1000)

## 0.8.3 - implemented provider state generator

* d5d3679 - feat: return the values from the state change call so they can be used by the generators (Ronald Holshausen, Sun Aug 23 15:40:41 2020 +1000)
* 76f73c6 - feat: implemented provider state generator (Ronald Holshausen, Sun Aug 23 13:29:55 2020 +1000)

## 0.8.2 - Updated XML Matching


## 0.8.1 - Bugfixes + update matching crate to 0.6.0

* 61ab50f - fix: date/time matchers fallback to the old key (Ronald Holshausen, Fri May 15 11:27:27 2020 +1000)
* 7616ccb - fix: broken tests after handling multiple header values (Ronald Holshausen, Tue May 5 15:45:27 2020 +1000)

## 0.8.0 - Added callback handlers + Bugfixes

* 2920364 - fix: date and time matchers with JSON (Ronald Holshausen, Thu Mar 12 16:07:05 2020 +1100)
* 126b463 - fix: provider state handlers must be synchronous so they are executed for the actual request (Ronald Holshausen, Thu Mar 12 14:16:03 2020 +1100)
* 0e8bfad - fix: allow the HTTP client to be optional in the provider state executor (Ronald Holshausen, Wed Mar 11 14:47:37 2020 +1100)
* fe74376 - feat: implemented publishing provider tags with verification results #57 (Ronald Holshausen, Sun Mar 8 18:37:21 2020 +1100)

## 0.7.0 - Convert to async/await


## 0.6.1 - Bugfix + Oniguruma crate for regex matching

* defe890 - fix: switch to the Oniguruma crate for regex matching #46 (Ronald Holshausen, Fri Sep 27 14:35:16 2019 +1000)
* 665bbd8 - fix: return a failure if any pact verification fails #47 (Ronald Holshausen, Fri Sep 27 12:07:01 2019 +1000)
* 0c5d6c2 - fix: pact_consumer should be a dev dependency (Ronald Holshausen, Sun Sep 22 17:48:35 2019 +1000)

## 0.6.0 - Publishing verification results

* eef3d97 - feat: added some tests for publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 16:44:52 2019 +1000)
* 1110b47 - feat: implemented publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 13:53:27 2019 +1000)
* cb30a2f - feat: added the ProviderStateGenerator as a generator type (Ronald Holshausen, Sun Sep 8 16:29:46 2019 +1000)

## 0.5.1 - Use reqwest for better HTTP/S support, support headers with multiple values

* dac8ae1 - feat: support authentication when fetching pacts from a pact broker (Ronald Holshausen, Sun Aug 11 13:57:29 2019 +1000)
* e007763 - feat: support bearer tokens when fetching pacts from URLs (Ronald Holshausen, Sun Aug 11 13:21:17 2019 +1000)
* 4378110 - Merge pull request #42 from audunhalland/reqwest (Ronald Holshausen, Sun Aug 11 09:32:30 2019 +1000)
* f0c0d07 - feat: support headers with multiple values (Ronald Holshausen, Sat Aug 10 17:01:10 2019 +1000)

## 0.5.0 - Upgrade to non-blocking Hyper 0.12

* 386ab52 - fix: corrected the release scripts to check for a version parameter (Ronald Holshausen, Sun Apr 8 13:44:57 2018 +1000)

## 0.4.0 - First V3 specification release


## 0.3.0 - Backported matching rules from V3 branch



## 0.2.1 - Replace rustc_serialize with serde_json


## 0.2.0 - V2 specification implementation


## 0.1.0 - V1.1 specification implementation


## 0.0.0 - First Release
