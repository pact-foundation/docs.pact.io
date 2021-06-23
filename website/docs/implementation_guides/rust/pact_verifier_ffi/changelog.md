---
title: pact_verifier_ffi
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_verifier_ffi/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## 0.0.5 - Bugfix Release

* 12e51704 - fix: linux verifier ffi shasum path was incorrect. Fixes #114 (Matt Fellows, Mon Jun 7 09:25:14 2021 +1000)
* e8d6d844 - fix: pact_verifier_cli was printing the version from the FFI crate (Ronald Holshausen, Sat Jun 5 14:43:38 2021 +1000)

## 0.0.4 - FFI enhancements

* a3f272b - Merge pull request #104 from pact-foundation/feat/consumer-version-selectors (Matt Fellows, Thu May 27 13:16:46 2021 +1000)
* f4a7d52 - fix: consumer version selectors (Matt Fellows, Thu May 27 09:04:20 2021 +1000)
* af6721a - feat: rename callback_timeout to request_timeout, and support timeouts for all http requests during verification (Matt Fellows, Thu May 27 09:04:05 2021 +1000)
* 755333f - feat: support callback timeout option on verifier (Matt Fellows, Wed May 26 19:07:47 2021 +1000)
* 2649696 - feat: support env vars for filters (Matt Fellows, Wed May 26 19:07:05 2021 +1000)
* 904ca31 - feat: enable consumer version selectors (Matt Fellows, Wed May 26 19:05:29 2021 +1000)
* 61c9d0b - feat: return error code 4 when verifier receives invalid args (Matt Fellows, Wed May 26 15:09:09 2021 +1000)

## 0.0.3 - Bugfix Release

* f4881db - feat: set non-hard coded install name on Mac dylib (Matt Fellows, Wed Feb 24 14:29:52 2021 +1100)

## 0.0.2 - add callback timeout option for verifcation callbacks

* 4afa86a - fix: add callback timeout option for verifcation callbacks (Ronald Holshausen, Sat Feb 6 12:27:32 2021 +1100)
* c8f7091 - feat: made pact broker module public so it can be used by other crates (Ronald Holshausen, Sun Jan 24 18:24:30 2021 +1100)

## 0.0.1 - Updated dependencies


## 0.0.0 - Initial release

