---
title: pact_ffi
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_ffi/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## 0.3.0 - Support mock servers from plugins

* 5cd2ae5a - feat: add pactffi_create_mock_server_for_transport function (Ronald Holshausen, Fri May 20 16:09:36 2022 +1000)

## 0.2.6 - Maintenance Release

* cdf72b05 - feat: forward provider details to plugin when verifying (Ronald Holshausen, Fri Apr 22 14:12:34 2022 +1000)
* 2395143a - feat: forward verification to plugin for transports provided by the plugin (Ronald Holshausen, Fri Apr 22 12:02:05 2022 +1000)

## 0.2.5 - Maintenance Release

* 73ae0ef0 - fix: Upgrade reqwest to 0.11.10 to resolve #156 (Ronald Holshausen, Wed Apr 13 13:31:55 2022 +1000)
* 345b0011 - feat: support mock servers provided from plugins (Ronald Holshausen, Mon Mar 21 15:59:46 2022 +1100)

## 0.2.4 - Bugfix Release

* 13f7c36f - fix: xml response matching rules (Matt Fellows, Wed Mar 9 17:07:56 2022 +1100)
* 16fbe7cf - feat: add musl target to the release build #185 (Ronald Holshausen, Fri Mar 4 16:23:39 2022 +1100)
* f52c3625 - feat: add for custom headers to the HTTP client used by the verifier #182 (Ronald Holshausen, Mon Feb 28 14:38:00 2022 +1100)
* 74bd4531 - feat: add support for custom headers with the verifier FFI calls #182 (Ronald Holshausen, Mon Feb 28 13:58:46 2022 +1100)

## 0.2.3 - Support Custom headers + Date-Time expression parser

* 16fbe7cf - feat: add musl target to the release build #185 (Ronald Holshausen, Fri Mar 4 16:23:39 2022 +1100)
* f52c3625 - feat: add for custom headers to the HTTP client used by the verifier #182 (Ronald Holshausen, Mon Feb 28 14:38:00 2022 +1100)
* 74bd4531 - feat: add support for custom headers with the verifier FFI calls #182 (Ronald Holshausen, Mon Feb 28 13:58:46 2022 +1100)

## 0.2.2 - Bugfix Release


## 0.2.1 - add option to strip ANSI control codes from verifier output


## 0.2.0 - Bugfixes + FFI functions to return the verifier output and results

* 5ecf70a7 - feat: enable ANSI console output on Windows (Ronald Holshausen, Mon Jan 31 11:02:03 2022 +1100)
* c676e821 - feat: add FFI functions to return the verifier output and results (Ronald Holshausen, Fri Jan 28 15:40:17 2022 +1100)
* bf152233 - feat: Capture all the results from the verification process (Ronald Holshausen, Fri Jan 28 11:28:38 2022 +1100)
* 5f148cdd - feat: capture all the output from the verifier (Ronald Holshausen, Thu Jan 27 16:08:02 2022 +1100)
* f5aa34ea - Merge pull request #175 from pact-foundation/feat/fix-provider-timeout-value-validation (Ronald Holshausen, Thu Jan 27 13:41:56 2022 +1100)
* c58a2fb7 - Merge pull request #174 from adamrodger/feat/provider-name (Ronald Holshausen, Thu Jan 27 13:39:26 2022 +1100)
* 0ef3fb98 - fix: provider request timeout should be > 16bit integers. Fixes https://github.com/pact-foundation/pact-js/issues/761 (Matt Fellows, Wed Jan 26 22:12:35 2022 +1100)

## 0.1.6 - Maintenance Release

* 63ab0d2d - fix: generators in process_object (Matt Fellows, Sat Jan 15 23:21:34 2022 +1100)
* c2089645 - fix: log crate version must be fixed across all crates (including plugin driver) (Ronald Holshausen, Fri Jan 14 16:10:50 2022 +1100)

## 0.1.5 - Maintenance Release

* 1cafd00a - fix: drop(from_raw(ptr))` if you intend to drop the `CString` (Ronald Holshausen, Tue Jan 4 10:39:16 2022 +1100)
* fe22ae3a - fix: expected opaque type, found enum `Result` (Ronald Holshausen, Tue Jan 4 10:26:22 2022 +1100)
* 213d1459 - fix: add a small delay after loading plugins via FFI to resolve a race condition (Ronald Holshausen, Tue Jan 4 09:56:33 2022 +1100)

## 0.1.4 - Maintenance Release

* f8042d6b - feat: add metrics event for provider verification (Ronald Holshausen, Tue Dec 14 17:29:44 2021 +1100)

## 0.1.3 - Bugfix Release

* d43b1847 - Merge pull request #164 from tienvx/feat-filter-info (Ronald Holshausen, Fri Nov 19 11:38:41 2021 +1100)
* 41e69a22 - feat: allow set filter info (tienvx, Thu Nov 18 08:56:36 2021 +0700)
* 7c561f2a - feat: allow set consumer version selectors (tienvx, Thu Nov 18 00:12:31 2021 +0700)
* 260deb70 - fix: support specifying matching_branch in verifications (Matt Fellows, Wed Nov 17 17:47:37 2021 +1100)

## 0.1.2 - Bugfix Release

* 5d4a09c6 - feat: store the pact specification version with the mock server (Ronald Holshausen, Wed Nov 17 14:46:56 2021 +1100)
* 675506e1 - feat: add pactffi_pact_handle_write_file which knows about the spec version (Ronald Holshausen, Wed Nov 17 13:58:45 2021 +1100)
* aff4d301 - fix: FFI always detects + stores JSON bodies as plain text (Matt Fellows, Tue Nov 16 23:02:12 2021 +1100)
* fc5be202 - fix: update to latest driver crate (Ronald Holshausen, Tue Nov 16 16:19:02 2021 +1100)
* e4a445ba - fix: race condition when shutting down plugin via FFI (Ronald Holshausen, Tue Nov 16 16:01:18 2021 +1100)

## 0.1.1 - Support V4 synchronous messages + protobuf plugin

* df23ba3d - fix: allow multiple consumer version selectors (Matt Fellows, Mon Nov 15 14:28:04 2021 +1100)

## 0.1.0 - Pact V4 release

* 59e21413 - feat: Pact V4 release (Ronald Holshausen, Thu Nov 4 16:54:56 2021 +1100)
* 918e5beb - fix: update to latest models and plugin driver crates (Ronald Holshausen, Tue Oct 19 17:09:48 2021 +1100)
* bfa04370 - fix: display the error message when the verification can not be run due to an error (Ronald Holshausen, Tue Oct 19 11:09:21 2021 +1100)
* 35ff0993 - feat: record the version of the lib that created the pact in the metadata (Ronald Holshausen, Tue Oct 12 14:52:43 2021 +1100)
* 2e86c48d - Merge pull request #154 from pact-foundation/feat/xml-matchers (Matt Fellows, Tue Oct 5 16:39:18 2021 +1100)
* 9a2049c2 - feat: support XML bodies in FFI interface (Matt Fellows, Thu Sep 30 22:08:01 2021 +1000)
* d171edfd - feat: support provider branches (Matt Fellows, Wed Sep 29 22:47:21 2021 +1000)

## 0.0.3 - support native TLS certs + updated verifier FFI functions

* 42be9eb8 - feat: add FFI functions to extract logs from a verifcation run (Ronald Holshausen, Tue Sep 28 12:48:40 2021 +1000)
* ab89152e - Merge pull request #150 from tienvx/make-state-change-url-optional (Ronald Holshausen, Tue Sep 21 09:20:54 2021 +1000)
* df715cd5 - feat: support native TLS. Fixes #144 (Matt Fellows, Mon Sep 20 13:00:33 2021 +1000)
* 339a9504 - feat: make state change url optional (tienvx, Mon Sep 20 12:13:29 2021 +0700)
* dab70272 - feat: add verifier ffi function set consumer filters (tienvx, Tue Sep 14 23:47:14 2021 +0700)
* 36f7e477 - fix: fix missing last tag (tienvx, Tue Sep 14 23:51:02 2021 +0700)
* 05f4c3de - feat: add verifier ffi function set verification options (tienvx, Wed Sep 8 23:48:13 2021 +0700)
* b8e51313 - Merge pull request #137 from tienvx/ffi-function-update-provider-state (Ronald Holshausen, Sat Sep 4 13:04:50 2021 +1000)

## 0.0.2 - Bugfix Release

* c274ca1a - fix: use the pacts for verification endpoint if the conusmer selectors are specified #133 (Ronald Holshausen, Sun Aug 22 11:51:22 2021 +1000)

## 0.0.1 - M1 architecture support + Bugfixes

* b5a7b779 - feat: support new selectors (Matt Fellows, Mon Aug 9 13:27:33 2021 +1000)
* 8bcd1c7e - fix: min/max type matchers must not apply the limits when cascading (Ronald Holshausen, Sun Aug 8 15:50:40 2021 +1000)
* 6d1ff318 - fix: conan packages for pact_ffi (Ronald Holshausen, Mon Jul 12 09:23:48 2021 +1000)

## 0.0.0 - Initial Release
