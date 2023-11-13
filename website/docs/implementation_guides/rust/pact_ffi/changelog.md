---
title: pact_ffi
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_ffi/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## 0.4.10 - Bugfix Release

* c172bcb5 - feat: Add functions for Pact handle -> pointer compatibility #333 (Ronald Holshausen, Mon Nov 13 14:41:51 2023 +1100)
* 335d52dc - fix: Only specification v3 or higher support binary body's content type matching rule (tien.xuan.vo, Mon Oct 16 22:11:54 2023 +0700)

## 0.4.9 - Bugfix Release

* 9f8dde99 - fix: Nested array contains matchers where not having their values propogated to the outer matcher #324 (Ronald Holshausen, Fri Sep 22 10:18:56 2023 +1000)
* 0bbb66e3 - Merge pull request #323 from tienvx/ffi-with-multipart-file-v2 (Ronald Holshausen, Thu Sep 21 12:13:07 2023 +1000)
* b6cb715a - Merge pull request #319 from tienvx/match-string-value-using-content-type (Ronald Holshausen, Thu Sep 21 12:05:15 2023 +1000)
* e7b5cced - Merge pull request #321 from YOU54F/chore/enable_aarch64-unknown-linux-gnu (Ronald Holshausen, Thu Sep 21 08:31:57 2023 +1000)
* 53a08108 - feat: Add ffi function pactffi_with_multipart_file_v2 (tien.xuan.vo, Sat Sep 16 16:08:53 2023 +0700)
* 63b7cf9d - fix: Allow matching string values using content type matching rule (tien.xuan.vo, Mon Sep 11 18:32:24 2023 +0700)

## 0.4.8 - Bugfix Release


## 0.4.7 - Bugfix Release

* 8a22a66a - fix: correct equality error message to match compatibility-suite (Ronald Holshausen, Wed Jul 26 14:30:48 2023 +1000)
* 2e45e223 - fix: Update matching error messages to be in line with the compatibility-suite (Ronald Holshausen, Tue Jul 25 17:42:03 2023 +1000)

## 0.4.6 - Bugfix Release

* e58aa917 - fix: no need to wrap the Pact for a mock server in a mutex (mock server is already behind a mutex) as this can cause deadlocks #274 (Ronald Holshausen, Wed Jun 14 13:26:54 2023 +1000)

## 0.4.5 - Bugfix Release

* f72f8191 - feat: Implemented the remaining V1 HTTP consumer compatability suite feature (Ronald Holshausen, Thu May 18 14:12:40 2023 +1000)
* 261ecf47 - fix: Add RefUnwindSafe trait bound to all Pact and Interaction uses (Ronald Holshausen, Mon May 15 13:59:31 2023 +1000)
* 95664129 - feat: add method pactffi_given_with_params to allow a provider state to be repeated with different values (Ronald Holshausen, Tue May 2 11:41:10 2023 +1000)

## 0.4.4 - Bugfix Release

* a4192b38 - feat: add FFI function to validate a Date/Time string against a format #265 (Ronald Holshausen, Mon Apr 17 12:48:01 2023 +1000)
* 84b9d9e9 - fix: Upgrade pact models to 1.0.11 (fixes generated key for V4 Pacts) (Ronald Holshausen, Fri Apr 14 17:10:58 2023 +1000)
* 779a59f0 - fix: Upgrade pact-plugin-driver to 0.4.1 (fixes an issue introduced in 0.4.0 with shared channels to plugins) (Ronald Holshausen, Wed Apr 5 17:01:18 2023 +1000)

## 0.4.3 - Bugfix Release

* 0af00359 - fix: use a shared global tokio runtime so shared plugin connections can be used (Ronald Holshausen, Wed Apr 5 14:05:11 2023 +1000)

## 0.4.2 - Bugfix Release

* 6f0c4b2f - feat: Upgrade pact-plugin-driver to 0.4.0 which uses a shared gRPC channel to each plugin (Ronald Holshausen, Tue Apr 4 14:32:36 2023 +1000)
* 11c701b4 - fix: Upgrade pact_matching to 1.0.6 (fixes some issues with matching HTTP headers) (Ronald Holshausen, Wed Mar 15 14:54:54 2023 +1100)
* e96bc54e - fix: Upgrade pact_models to 1.0.9 (fixes issues with headers) (Ronald Holshausen, Wed Mar 15 14:31:00 2023 +1100)
* c9333f94 - feat: add option to generate JUnit XML report format for consumption by CI servers #257 (Ronald Holshausen, Thu Mar 2 10:48:56 2023 +1100)

## 0.4.1 - Maintenance Release

* c368c651 - fix: Pass any custom header values on to the plugin verification call (Ronald Holshausen, Thu Feb 16 13:52:03 2023 +1100)
* 1e7331f1 - fix: Upgrade plugin driver to 0.3.1 (Ronald Holshausen, Wed Feb 8 13:28:07 2023 +1100)

## 0.4.0 - Add FFI functions for plugin authors to parse Pact JSON and get matching rules and generators + bugfixes

* 3760c2b3 - fix: matcher_from_integration_json in mockserver/bodies.rs doesn't support all MatchingRules #247 (Ronald Holshausen, Wed Jan 11 13:58:33 2023 +1100)
* 34a67cb9 - fix: when loading pacts from a dir, filter by the provider name #233 (Ronald Holshausen, Wed Jan 4 18:12:28 2023 +1100)

## 0.3.19 - Fix for V3 Message ignores the interaction ID when loaded from a Pact Broker


## 0.3.18 - Bugfixes + Support generators in plugins

* dece8df7 - Merge pull request #235 from leonasa/feat/allow-non-deafult-json-content-type (Ronald Holshausen, Mon Dec 19 13:19:29 2022 +1100)
* 61e4d69d - fix: cbindgen fails in latest nightly rust (Ronald Holshausen, Mon Dec 19 12:48:31 2022 +1100)
* 4b1ba4a2 - fix: cbindgen fails in latest nightly rust (Ronald Holshausen, Mon Dec 19 12:07:43 2022 +1100)
* 5fbb0d6a - feat: Upgrade plugin driver to 0.2.2 (supports passing a test context to support generators) (Ronald Holshausen, Fri Dec 16 16:38:03 2022 +1100)
* 5251fcf5 - fix: error caused an internal mutex to be poisoned (Ronald Holshausen, Fri Dec 16 16:34:19 2022 +1100)
* c1ccb62f - feat: allow non deafult json content-type (Leonardo Santana, Mon Dec 12 15:26:22 2022 -0500)

## 0.3.17 - Bugfix Release


## 0.3.16 - Support for plugin authors


## 0.3.15 - Bugfix + FFI functions to support plugin authors

* 2e5823a0 - feat: add custom-header to the old FFI args for implementations that have not moved to handles (Ronald Holshausen, Fri Nov 25 11:09:46 2022 +1100)
* 570e33c1 - feat: add FFI function to return generator JSON (Ronald Holshausen, Mon Nov 14 14:53:11 2022 +1100)
* 7a2686e0 - feat: add function to get matching rule as JSON (Ronald Holshausen, Mon Nov 14 13:35:46 2022 +1100)
* cfc565e3 - feat: add docs on the matching rule IDs (Ronald Holshausen, Mon Nov 14 12:08:26 2022 +1100)
* 18e1e113 - feat: add an iterator over the matching rules from a matching definition expression (Ronald Holshausen, Mon Nov 14 12:02:41 2022 +1100)
* e21d3454 - feat: add FFI function to parse JSON to a Pact model (Ronald Holshausen, Fri Nov 11 17:00:36 2022 +1100)
* b7c010eb - feat: add generator FFI functions (Ronald Holshausen, Fri Nov 11 14:54:39 2022 +1100)
* f7b561ee - feat: add FFI function to get the generator from a matching definition (Ronald Holshausen, Fri Nov 11 11:16:58 2022 +1100)
* 768a132b - feat: add FFI function to parse a matching definition expression (Ronald Holshausen, Thu Nov 10 18:18:39 2022 +1100)

## 0.3.14 - Bugfix Release

* 577824e7 - fix: Upgrade pact_models to 1.0 and pact-plugin-driver to 0.1.15 to fix cyclic dependency issue (Ronald Holshausen, Mon Nov 7 11:14:20 2022 +1100)
* 6ad00a5d - fix: Update onig to latest master to fix  Regex Matcher Fails On Valid Inputs #214 (Ronald Holshausen, Fri Nov 4 15:23:50 2022 +1100)
* d976db0c - fix: panicked at 'called  on a  value' when FFI LevelFilter == Off #226 (Ronald Holshausen, Fri Nov 4 13:47:20 2022 +1100)
* 9dad5d2a - fix: ffi.pactffi_logger_attach_sink causes seg fault if log directory doesn't exist #226 (Ronald Holshausen, Fri Nov 4 12:26:15 2022 +1100)

## 0.3.13 - Bugfix Release

* eb505b7f - Merge pull request #221 from pact-foundation/feat/multiple-transports-in-ffi (Matt Fellows, Wed Oct 12 10:11:15 2022 +1100)
* 965a1c41 - fix: Upgrade plugin driver to 0.1.13 (fixes issue loading plugin when there are multiple versions for the same plugin) (Ronald Holshausen, Wed Oct 5 17:29:37 2022 +1100)

## 0.3.12 - Bugfix Release


## 0.3.11 - Bugfix Release

* cdb555f8 - fix: Upgrade pact_verifier to 0.13.13 (Ronald Holshausen, Wed Sep 7 09:53:05 2022 +1000)

## 0.3.10 - Add option to not fail verification if no Pacts are found

* f8db90d2 - fix: Upgrade pact_models to 0.4.5 - fixes FFI bug with generators for request paths (Ronald Holshausen, Fri Aug 26 11:44:08 2022 +1000)

## 0.3.9 - Bugfix Release

* f8db90d2 - fix: Upgrade pact_models to 0.4.5 - fixes FFI bug with generators for request paths (Ronald Holshausen, Fri Aug 26 11:44:08 2022 +1000)

## 0.3.8 - Support FFI libs on Ubuntu 18.04


## 0.3.7 - Bugfix Release

* 65d05149 - fix: content type matcher was not being applied if content type was not octet_stream #171 (Ronald Holshausen, Wed Aug 17 16:32:43 2022 +1000)

## 0.3.6 - Maintenance Release

* e3bef155 - feat: Add ARM64 (aarch64) linux targets to the release build #160 (Ronald Holshausen, Mon Aug 15 16:13:22 2022 +1000)
* 78c05f29 - feat: add metric call when the mock server is shutdown via FFI function (Ronald Holshausen, Thu Aug 11 17:50:29 2022 +1000)
* 3a1449cb - feat: use the configured transport when provided (Ronald Holshausen, Wed Aug 3 13:20:17 2022 +1000)
* 8cc29482 - feat: add CLI options to provide different ports when there are different transports (Ronald Holshausen, Wed Aug 3 11:53:31 2022 +1000)

## 0.3.5 - Support message interactions with FFI body functions

* 8f112ad0 - feat: add FFI function to set a message contents as binary (Ronald Holshausen, Wed Jul 27 15:15:41 2022 +1000)
* cf40b7de - feat: add FFI function to set a message contents (Ronald Holshausen, Wed Jul 27 14:52:41 2022 +1000)

## 0.3.4 - Bugfix Release

* 40f7bdc4 - feat: add verification option to disable ANSI escape codes in output #203 (Ronald Holshausen, Wed Jul 20 12:18:12 2022 +1000)

## 0.3.3 - Bug fixes + Support publishing results from webhook calls

* 18118e82 - feat: add retries to the provider state change calls #197 (Ronald Holshausen, Tue Jun 7 09:10:23 2022 +1000)

## 0.3.2 - Bugfix Release


## 0.3.1 - Bugfix Release


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
