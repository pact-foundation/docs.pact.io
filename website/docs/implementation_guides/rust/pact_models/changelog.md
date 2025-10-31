---
title: pact_models
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_models/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## 1.3.7 - Support wasm32-wasip2 target


## 1.3.6 - Maintenance Release


## 1.3.5 - Maintenance Release


## 1.3.4 - Bugfix Release

* 72da979e - feat: Allow atLeast and atMost first in expression (tien.xuan.vo, Wed Jun 25 01:22:58 2025 +0700)
* de9ec164 - Merge pull request #496 from tienvx/add-test-case-for-atLeast-atMost-at-beginning (Ronald Holshausen, Thu Jun 19 09:50:28 2025 +1000)
* 262fbe8e - feat: Support fromProviderState generator in regex matching expression (tien.xuan.vo, Wed Jun 18 23:49:26 2025 +0700)

## 1.3.3 - Fix for Alpine

* 1d18d3f5 - fix: Onig crate needs default-features = false so it compiles on Alpine (Ronald Holshausen, Wed Jun 11 12:35:06 2025 +1000)

## 1.3.2 - Maintenance Release

* 82d078d9 - fix: Upgrade onig to 6.5.1 as the Match Whole String for is_match has been released (Ronald Holshausen, Wed Jun 11 10:00:52 2025 +1000)

## 1.3.1 - Supports generators with XML

* 8084b802 - fix: Handle wildcard in XML generator key (tien.xuan.vo, Fri Mar 14 22:29:27 2025 +0700)
* 3c7a7b33 - feat: Implement generators for XML (tien.xuan.vo, Mon Feb 10 22:43:08 2025 +0700)
* 4eb429de - fix: kiss_xml should be required with the XML feature (Ronald Holshausen, Tue Mar 25 16:51:39 2025 +1100)

## 1.3.0 - Support V2 matching engine

* ec67cd76 - feat: Handle min/max type matchers in XML elements (Ronald Holshausen, Tue Mar 25 11:53:17 2025 +1100)
* a8eeed06 - feat: Handle type matchers in XML elements (Ronald Holshausen, Tue Mar 25 11:11:12 2025 +1100)
* b43503a4 - feat: Handle multiple matching rules (Ronald Holshausen, Tue Mar 25 09:16:58 2025 +1100)
* 8664b516 - fix: resolving xml paths now filters nodes when an index is provided (Ronald Holshausen, Mon Mar 24 09:45:03 2025 +1100)
* 70bfc52d - feat: Added a function fetch XML node using a path (Ronald Holshausen, Tue Mar 18 14:10:21 2025 +1100)
* befe72ac - feat: Add functions to match a DocPath against an XML document (Ronald Holshausen, Tue Mar 18 11:06:59 2025 +1100)
* dc333aa9 - fix: Fix test wrong method (tien.xuan.vo, Tue Mar 18 00:54:48 2025 +0700)

## 1.2.7 - Maintenance Release

* c6346594 - fix: join_field should only replace * and not [*] parts (Ronald Holshausen, Fri Mar 14 10:38:08 2025 +1100)
* 92394a40 - feat: enhancements backported from the V2 matching engine branch (Ronald Holshausen, Fri Mar 14 10:21:40 2025 +1100)
* a63fb583 - fix: Path weight calculation did not take [*] fragments into account (Ronald Holshausen, Fri Mar 14 09:53:14 2025 +1100)
* bcf2934b - feat: add additional conversions for docpath (Ronald Holshausen, Tue Mar 11 11:26:28 2025 +1100)
* 74df5d1d - fix: Remove duplicated timezone entries from timezone_db (Ronald Holshausen, Wed Dec 11 15:45:10 2024 +1100)

## 1.2.6 - Maintenance Release

* 707752ad - feat: Support generators for form urlencoded (tien.xuan.vo, Mon Dec 2 10:10:43 2024 +0700)
* f3918b61 - Merge pull request #464 from tienvx/fix-cant-compare-each-key-each-value-matching-rules (Ronald Holshausen, Wed Nov 13 11:07:10 2024 +1100)
* 691ddae5 - fix: Fix can't compare 2 eachKey matching rules, 2 eachValue matching rules (tien.xuan.vo, Fri Sep 6 11:15:59 2024 +0700)

## 1.2.5 - Maintenance Release

* c6aff26f - feat: Add join_index to DocPath (Ronald Holshausen, Fri Nov 1 17:03:10 2024 +1100)

## 1.2.4 - Bugfix Release


## 1.2.3 - Support for provider state injected values in plugins

* 033a50ab - feat: Update the matching rule expression parser to support values from provider states (Ronald Holshausen, Fri Aug 2 10:06:52 2024 +1000)
* 77814aef - fix(pact_models):  fix: when writing pact specs in V2 format, header matchers must be pluralised #449 (Ronald Holshausen, Wed Jul 31 15:08:00 2024 +1000)

## 1.2.2 - Maintenance Release


## 1.2.1 - Bugfix Release

* ab80cd2b - fix: merge pact duplicates with diff desc/same prov state fix: merge message / sync pacts with no provider state (Yousaf Nabi, Sat Jun 8 23:48:30 2024 +0100)

## 1.2.0 - Support query parameters with no values

* e12cb9f0 - Merge pull request #410 from kageru/fix-user-agent-headers (Ronald Holshausen, Tue Apr 23 09:43:11 2024 +1000)
* 4e1fca98 - feat: Add extra test cases for query generation (Ronald Holshausen, Mon Apr 22 11:28:02 2024 +1000)
* c3128a6d - feat: Support optional query parameter values (where there is only a name) (Ronald Holshausen, Mon Apr 22 10:36:05 2024 +1000)

## 1.1.18 - Maintenance Release

* 7222cd27 - fix: Min and Max type matchers were not able to parse their integration form (Ronald Holshausen, Wed Feb 7 09:45:45 2024 +1100)

## 1.1.17 - Bugfix Release

* 57e8d092 - fix: Implemented missing atLeast and atMost options with matching rule definitions (Ronald Holshausen, Sat Jan 20 13:29:30 2024 +1100)
* e9f7c06f - fix:  Regex generator panics if the regex has any anchors #311 (Ronald Holshausen, Fri Jan 19 19:33:50 2024 +1100)

## 1.1.16 - Bugfix Release

* 0f5f563f - fix: regression - prevous matching rules change broke specification tests #359 (Ronald Holshausen, Fri Jan 19 14:41:37 2024 +1100)

## 1.1.15 - Bugfix Release

* 1d9034aa - fix: regression - generators must support query parameters in q[]= form #359 (Ronald Holshausen, Fri Jan 19 14:03:23 2024 +1100)
* 01903998 - fix: regression - matching rules must support query parameters in q[]= form #359 (Ronald Holshausen, Fri Jan 19 13:03:21 2024 +1100)
* 512ed87b - fix: Error where interactions failed to load where being silently ignored #359 (Ronald Holshausen, Fri Jan 19 12:49:01 2024 +1100)
* ab1d496f - fix: Add set-cookie header to the list of single value headers #353 (Ronald Holshausen, Wed Jan 17 13:46:49 2024 +1100)

## 1.1.14 - Bugfix Release

* d94c7827 - fix: Support V2 matching rule header/query paths in encoded format #355 (Ronald Holshausen, Tue Jan 16 09:19:21 2024 +1100)

## 1.1.13 - Bugfix Release

* 6e5504cd - fix: matching rules and generators for headers could be written to JSON form incorrectly #355 (Ronald Holshausen, Tue Jan 16 03:44:20 2024 +1100)

## 1.1.12 - Bugfix Release

* 07a1e7c2 - fix: Fallback to always generate a value to fix 'Could not generate a random TYPE from null' (tien.xuan.vo, Wed Nov 8 08:12:29 2023 +0700)
* 3af7357f - feat: Force generators works regardless of value's type (tien.xuan.vo, Fri Nov 3 09:58:17 2023 +0700)

## 1.1.11 - Maintenance Release


## 1.1.10 - Bugfix Release

* a03fc5f0 - fix: V3 message binary content was not being base64 decoded correctly when loaded from a Pact file (Ronald Holshausen, Fri Aug 4 15:41:38 2023 +1000)

## 1.1.9 - Bugfix Release

* 2e45e223 - fix: Update matching error messages to be in line with the compatibility-suite (Ronald Holshausen, Tue Jul 25 17:42:03 2023 +1000)

## 1.1.8 - Bugfix Release


## 1.1.7 - Bugfix Release

* 7dd89384 - feat: Add application/x-www-form-urlencoded to the known content types (Ronald Holshausen, Wed Jul 5 16:58:21 2023 +1000)
* f6ba3b2a - fix: When writing V4 format, correct the content type set on the body (Ronald Holshausen, Wed Jul 5 16:57:40 2023 +1000)
* 52d6bfab - feat: Add method to DocPath to return a lower-case copy of the path (Ronald Holshausen, Wed Jun 28 15:20:39 2023 +1000)

## 1.1.6 - Bugfix Release

* 727ea824 - fix: Support string escape sequences in matching definitions #283 (Ronald Holshausen, Wed Jun 21 14:55:42 2023 +1000)

## 1.1.5 - Add crate features for date/time and XML support


## 1.1.4 - Bugfix Release

* 9d3205a0 - fix: Support fraction of seconds with more then 3 digits #279 (Ronald Holshausen, Wed May 31 14:40:41 2023 +1000)

## 1.1.3 - Bugfix Release

* 743b1823 - fix: MockServerURL generator was fetching the incorrect field from the test context (Ronald Holshausen, Mon May 29 14:58:19 2023 +1000)

## 1.1.2 - Removed auto-generated keys and updates all trait methods so they can be used in an FFI context

* f8f0e773 - fix: Add RefUnwindSafe trait bound to all Pact and Interaction trait methods so they can be used in an FFI context (Ronald Holshausen, Mon May 15 12:37:16 2023 +1000)
* cf55b3c5 - fix: do not auto-generate the interaction key if not set #264 (Ronald Holshausen, Mon May 8 11:10:20 2023 +1000)
* 5eed834a - feat: Update date validation to check for leap years (Ronald Holshausen, Tue May 2 14:22:10 2023 +1000)

## 1.0.13 - Maintenance Release


## 1.0.12 - Fixes hash function for generators


## 1.0.11 - Bugfix Release

* 867936d6 - fix: V4 models were not including the key in the implementation of equals (Ronald Holshausen, Fri Apr 14 11:16:34 2023 +1000)

## 1.0.10 - Bugfix Release

* 6f70f30a - fix: exclude headers from the pact conflict check (Ronald Holshausen, Wed Mar 15 15:23:19 2023 +1100)

## 1.0.9 - Bugfix Release

* 97684ade - fix: Correctly deal with headers when the value is a string (Ronald Holshausen, Wed Mar 15 14:12:24 2023 +1100)

## 1.0.8 - Bugfix Release


## 1.0.7 - Bugfix Release


## 1.0.6 - Maintenance Release

* f04a3273 - feat: add a simple header parser to pact_models #259 (Ronald Holshausen, Tue Mar 14 16:38:54 2023 +1100)
* 80ec8f1a - Revert "fix: Add UnwindSafe trait bound to all Pact and Interaction trait methods so they can be used in a FFI context" (Ronald Holshausen, Tue Feb 28 16:46:43 2023 +1100)
* 3b82429f - Revert "fix: Bumping minor version as the last change broke everything using the traits" (Ronald Holshausen, Tue Feb 28 16:46:09 2023 +1100)
* 5c802419 - Revert "fix: UnwindSafe trait bound was missing on the read/write functions" (Ronald Holshausen, Tue Feb 28 16:45:31 2023 +1100)
* 019a7ea1 - fix: UnwindSafe trait bound was missing on the read/write functions (Ronald Holshausen, Tue Feb 28 16:28:29 2023 +1100)
* 5e0307cb - fix: Bumping minor version as the last change broke everything using the traits (Ronald Holshausen, Tue Feb 28 16:06:45 2023 +1100)
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
