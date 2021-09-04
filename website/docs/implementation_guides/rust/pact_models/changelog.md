---
title: pact_models
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_models/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## 0.1.3 - Bugfix Release


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
