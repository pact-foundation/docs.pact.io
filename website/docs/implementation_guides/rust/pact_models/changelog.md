---
title: pact_models
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_models/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## 1.0.5 - Bugfix Release

* b5ab945a - fix: Add UnwindSafe trait bound to all Pact and Interaction trait methods so they can be used in a FFI context (Ronald Holshausen, Tue Feb 28 15:19:04 2023 +1100)
* 1c45b63c - fix: add a test to reflect behaviour as per V4 spec (Ronald Holshausen, Mon Jan 30 15:22:02 2023 +1100)
* ba24b0a8 - fix: correct parsing of JSON encoded bodies as per V4 spec (Ronald Holshausen, Mon Jan 30 15:19:38 2023 +1100)

## 1.0.4 - Bugfix Release

* 155dae40 - fix: Support RequestResponsePact loading from V4 formatted JSON #246 (Ronald Holshausen, Wed Jan 11 12:32:01 2023 +1100)
* 4c04cb65 - fix: sort the header and query parameter keys when writing the pact #246 (Ronald Holshausen, Wed Jan 11 10:39:36 2023 +1100)

## 1.0.3 - Bugfix Release

* 64d500b0 - fix: Message pact was not loading the IDs from the Pact Broker #239 (Ronald Holshausen, Thu Dec 22 14:24:26 2022 +1100)

## 1.0.2 - Bugfix Release

* f84adc7a - fix: Metadata was missing from the generator categories (Ronald Holshausen, Fri Dec 9 11:00:34 2022 +1100)

## 1.0.1 - Maintenance Release

* e21d3454 - feat: add FFI function to parse JSON to a Pact model (Ronald Holshausen, Fri Nov 11 17:00:36 2022 +1100)

## 1.0.0 - Maintenance Release

* f91dc00d - fix: try loosen dependencies to fix dependency cycle issue (Ronald Holshausen, Mon Nov 7 10:15:19 2022 +1100)

## 0.4.6 - Maintenance Release

* 6ad00a5d - fix: Update onig to latest master to fix  Regex Matcher Fails On Valid Inputs #214 (Ronald Holshausen, Fri Nov 4 15:23:50 2022 +1100)

## 0.4.5 - Bugfix Release


## 0.4.4 - Updated dependencies


## 0.4.3 - Bugfix Release

* 74a36a1b - fix: Matching rule parser was not handling decimal values correctly (Ronald Holshausen, Wed Aug 17 13:19:58 2022 +1000)

## 0.4.2 - Maintenance Release

* 2ca2fe49 - fix: add function to display binary data in a meaningful way (Ronald Holshausen, Mon Aug 1 17:39:34 2022 +1000)
* 1972a74a - feat: Detect Pactbroker responses from the URL content #199 (Ronald Holshausen, Mon Jun 6 14:48:06 2022 +1000)

## 0.4.1 - switch pact_models to use tracing crate


## 0.4.0 - Updated V4 model interfaces

* 6de6c229 - feat: Add functions to calc unique key to V4 interaction trait (Ronald Holshausen, Fri Apr 22 12:00:57 2022 +1000)
* 7e3e2e18 - feat: add method to V4Pact to find an interaction by ID (Ronald Holshausen, Thu Apr 21 12:25:09 2022 +1000)

## 0.3.3 - Bugfix Release

* 73ae0ef0 - fix: Upgrade reqwest to 0.11.10 to resolve #156 (Ronald Holshausen, Wed Apr 13 13:31:55 2022 +1000)
* 345b0011 - feat: support mock servers provided from plugins (Ronald Holshausen, Mon Mar 21 15:59:46 2022 +1100)
* daa2c101 - feat: add mutable iteraction over Pact interactions (Ronald Holshausen, Fri Mar 18 16:55:34 2022 +1100)
* 01ac989b - fix: was missing setter to set the transport with V4 interactions (Ronald Holshausen, Fri Mar 18 16:04:00 2022 +1100)
* 7fd87eb9 - feat: store the transport with V4 interactions to support mockservers from plugins (Ronald Holshausen, Fri Mar 18 14:30:20 2022 +1100)

## 0.3.2 - Maintenance Release

* 01ac989b - fix: was missing setter to set the transport with V4 interactions (Ronald Holshausen, Fri Mar 18 16:04:00 2022 +1100)

## 0.3.1 - Plugin Support

* 7fd87eb9 - feat: store the transport with V4 interactions to support mockservers from plugins (Ronald Holshausen, Fri Mar 18 14:30:20 2022 +1100)

## 0.3.0 - Ported the date-time expressions from Pact-JVM

* 0aa55cfe - feat: wired the date-time expression parsers into the generators (Ronald Holshausen, Thu Mar 3 18:01:46 2022 +1100)
* 98b887f0 - feat: Implemented date-time expression parser (from Pact-JVM) (Ronald Holshausen, Thu Mar 3 16:34:42 2022 +1100)
* 318037a7 - feat: Implemented time part in date-time expressions (Ronald Holshausen, Thu Mar 3 16:05:01 2022 +1100)
* 66442251 - feat: Implement the base part of time expressions (Ronald Holshausen, Thu Mar 3 13:09:03 2022 +1100)
* b8ea7240 - feat: Implemented date expression parser (from Pact-JVM) (Ronald Holshausen, Tue Mar 1 14:46:57 2022 +1100)
* 2927e979 - feat: ported the date manipulation functions from Pact-JVM #180 (Ronald Holshausen, Thu Feb 17 16:14:52 2022 +1100)

## 0.2.7 - Bugfix Release

* c2089645 - fix: log crate version must be fixed across all crates (including plugin driver) (Ronald Holshausen, Fri Jan 14 16:10:50 2022 +1100)
* 7b23378f - feat: some matching rules should not cascade (Ronald Holshausen, Thu Dec 30 13:32:04 2021 +1100)

## 0.2.6 - Bugfix Release

* 7b2e8538 - fix: DocPath join needs to detect numeric values (Ronald Holshausen, Wed Dec 29 13:23:47 2021 +1100)
* 41a52319 - fix: values_matcher_defined should include EachValue matcher (Ronald Holshausen, Wed Dec 29 09:48:02 2021 +1100)
* b7f967e0 - fix: `match` arms have incompatible types (Ronald Holshausen, Thu Dec 23 17:48:20 2021 +1100)
* 39338c46 - fix: Some matching rules do not have associated configuration (Ronald Holshausen, Thu Dec 23 14:02:50 2021 +1100)

## 0.2.5 - Bugfix Release

* e1e0b43e - fix: matching definition parser was incorrectly merging multiple definitions (Ronald Holshausen, Thu Dec 23 11:48:09 2021 +1100)

## 0.2.4 - Maintenance Release

* b5fd82e5 - feat: add method to DocPath to return the parent path (Ronald Holshausen, Wed Dec 22 18:06:43 2021 +1100)
* a3f74711 - fix: Docpath join was escaping * (Ronald Holshausen, Wed Dec 22 17:23:12 2021 +1100)

## 0.2.3 - Maintenance Release

* 481762f0 - feat: add function to detect if a string is a matching definition (Ronald Holshausen, Tue Dec 21 13:06:31 2021 +1100)
* c707a8c0 - feat: add a method to join a value onto a doc path (Ronald Holshausen, Thu Dec 16 16:03:27 2021 +1100)

## 0.2.2 - Fixes to the matching rule parser

* 3207cb49 - feat: implement each key and aech value matching rule definitions (Ronald Holshausen, Wed Nov 24 14:28:42 2021 +1100)
* d3234684 - feat: update matcher defintions to support references (Ronald Holshausen, Tue Nov 23 16:13:49 2021 +1100)
* 682df9e4 - feat: update matcher defintions to include the semver matcher (Ronald Holshausen, Tue Nov 23 14:24:02 2021 +1100)
* 20a275fb - feat: Improve the error message format for matching rule definitions (Ronald Holshausen, Mon Nov 22 15:21:57 2021 +1100)
* a859d0e1 - fix: make sure metadata entries are correctly encoded when downgrading a pact (Ronald Holshausen, Wed Nov 17 16:54:15 2021 +1100)

## 0.2.1 - Update V4 models to support FFI + plugins

* 15b8f08f - feat: add functions to return mutable references to the V4 model trait (Ronald Holshausen, Tue Nov 16 10:03:03 2021 +1100)
* fa83806c - feat: add mutable methods to Pact model traits (Ronald Holshausen, Tue Nov 9 16:04:16 2021 +1100)

## 0.2.0 - Pact V4 + Plugins release


## 0.2.0-beta.6 - Bugfix Release

* 48a6be5f - fix: EachValue was outputting the wrong JSON (Ronald Holshausen, Tue Oct 19 16:35:17 2021 +1100)

## 0.2.0-beta.5 - matching synchronous request/response messages


## 0.2.0-beta.4 - Enhancements for plugins

* a52db737 - feat: record the version of the lib that created the pact in the metadata (Ronald Holshausen, Tue Oct 12 14:55:42 2021 +1100)
* 35ff0993 - feat: record the version of the lib that created the pact in the metadata (Ronald Holshausen, Tue Oct 12 14:52:43 2021 +1100)
* 407cc2e5 - fix: notEmpty matching rule defintion should be applied to any primitive value (Ronald Holshausen, Thu Oct 7 14:08:02 2021 +1100)

## 0.2.0-beta.3 - Fixes from master + Updated matching rule definitions

* 9fd9e652 - feat: do no write empty comments + added consumer version to metadata (Ronald Holshausen, Thu Sep 30 17:40:56 2021 +1000)
* df715cd5 - feat: support native TLS. Fixes #144 (Matt Fellows, Mon Sep 20 13:00:33 2021 +1000)

## 0.1.4 - WASM support + native TLS certs

* df715cd5 - feat: support native TLS. Fixes #144 (Matt Fellows, Mon Sep 20 13:00:33 2021 +1000)
* 067ded8f - feat: expose Pact models via WASM (Ronald Holshausen, Sun Sep 5 11:55:26 2021 +1000)

## 0.2.0-beta.2 - Support for getting interaction markup from plugins

* 067ded8f - feat: expose Pact models via WASM (Ronald Holshausen, Sun Sep 5 11:55:26 2021 +1000)

## 0.1.3 - Bugfix Release


## 0.2.0-beta.1 - Support for plugins

* c0bdd359 - fix: PluginData configuration is optional (Ronald Holshausen, Thu Sep 2 15:37:01 2021 +1000)

## 0.2.0-beta.0 - Beta version supporting Pact plugins


## 0.1.2 - upgrade nom to 7.0

* c274ca1a - fix: use the pacts for verification endpoint if the conusmer selectors are specified #133 (Ronald Holshausen, Sun Aug 22 11:51:22 2021 +1000)

## 0.1.1 - Bugfix Release

* 8bcd1c7e - fix: min/max type matchers must not apply the limits when cascading (Ronald Holshausen, Sun Aug 8 15:50:40 2021 +1000)
* 4ca3e02b - Merge pull request #129 from mitre/docpath (Ronald Holshausen, Thu Aug 5 12:16:56 2021 +1000)

## 0.1.0 - Final Version

* 31873ee3 - feat: added validation of provider state JSON (Ronald Holshausen, Wed Jul 14 15:44:20 2021 +1000)

## 0.0.5 - Moved structs to models crate + bugfixes and enhancements

* e2151800 - feat: support generating UUIDs with different formats #121 (Ronald Holshausen, Sun Jul 11 12:36:23 2021 +1000)
* 80e3c4e7 - fix: retain the data type for simple expressions #116 (Ronald Holshausen, Sun Jul 4 13:02:43 2021 +1000)
* b1a4c8cb - fix: failing tests #116 (Ronald Holshausen, Sun Jul 4 11:28:20 2021 +1000)
* e21db699 - fix: Keep the original value when injecting from a provider state value so data type is retained #116 (Ronald Holshausen, Sat Jul 3 18:01:34 2021 +1000)
* 8b075d38 - fix: FFI function was exposing a struct from the models crate (Ronald Holshausen, Sun Jun 27 11:30:55 2021 +1000)

## 0.0.4 - Refactor + Bugfixes

* b0ac7141 - feat: support graphql as a JSON content type (Ronald Holshausen, Sat Jun 5 15:14:06 2021 +1000)
* a44cbbee - fix: verifier was returning a mismatch when the expected body is empty #113 (Ronald Holshausen, Sat Jun 5 15:07:22 2021 +1000)
* 4e328d93 - feat: implement verification for RequestResponsePact, Consumer, Provider (Ronald Holshausen, Thu Jun 3 16:59:23 2021 +1000)
* 2f678213 - feat: initial prototype of a pact file verifier (Ronald Holshausen, Thu Jun 3 14:56:16 2021 +1000)

## 0.0.3 - Moved provider state models


## 0.0.2 - FFI support

* 6af4d3f - feat: allow ffi bindings to set spec version (Matt Fellows, Sun May 2 22:41:41 2021 +1000)

## 0.0.1 - Refactor: moved content type and body code from pact_matching


## 0.0.0 - First Release
