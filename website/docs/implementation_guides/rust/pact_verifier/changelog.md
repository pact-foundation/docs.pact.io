---
title: pact_verifier
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_verifier/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## 0.13.15 - Maintenance Release

* 577824e7 - fix: Upgrade pact_models to 1.0 and pact-plugin-driver to 0.1.15 to fix cyclic dependency issue (Ronald Holshausen, Mon Nov 7 11:14:20 2022 +1100)
* 965a1c41 - fix: Upgrade plugin driver to 0.1.13 (fixes issue loading plugin when there are multiple versions for the same plugin) (Ronald Holshausen, Wed Oct 5 17:29:37 2022 +1100)

## 0.13.14 - Maintenance Release


## 0.13.13 - Bugfix Release

* 7f51bdc6 - fix: publishing provider branch was broken when invoked via a webhook call (Ronald Holshausen, Tue Sep 6 18:15:16 2022 +1000)

## 0.13.12 - Bugfix Release

* 8663cd3f - feat: add ignore-no-pacts-error to the verifier CLI #213 (Ronald Holshausen, Wed Aug 31 15:19:31 2022 +1000)
* f8db90d2 - fix: Upgrade pact_models to 0.4.5 - fixes FFI bug with generators for request paths (Ronald Holshausen, Fri Aug 26 11:44:08 2022 +1000)
* 8ca3303b - feat: add a test to check for error result with IO error #213 (Ronald Holshausen, Fri Aug 19 16:53:17 2022 +1000)
* 43be2e83 - feat: do not output an error if no_pacts_is_error is false and no pacts were found to verify #213 (Ronald Holshausen, Fri Aug 19 16:49:19 2022 +1000)

## 0.13.11 - Maintenance Release

* 8056d7e9 - fix: get verify_provider_async to wait on the metric call (Ronald Holshausen, Thu Aug 11 16:16:18 2022 +1000)

## 0.13.10 - Support multiple protocol transports with the verifier

* 4587a430 - fix: results for sync messages were not being displayed (Ronald Holshausen, Wed Aug 3 16:14:32 2022 +1000)
* ce11a619 - feat: allow sensible defaults for interaction transports (Ronald Holshausen, Wed Aug 3 13:58:50 2022 +1000)
* 3a1449cb - feat: use the configured transport when provided (Ronald Holshausen, Wed Aug 3 13:20:17 2022 +1000)
* 8cc29482 - feat: add CLI options to provide different ports when there are different transports (Ronald Holshausen, Wed Aug 3 11:53:31 2022 +1000)

## 0.13.9 - Add option to disable color output

* 40f7bdc4 - feat: add verification option to disable ANSI escape codes in output #203 (Ronald Holshausen, Wed Jul 20 12:18:12 2022 +1000)

## 0.13.8 - Support publishing results from webhook calls

* 18118e82 - feat: add retries to the provider state change calls #197 (Ronald Holshausen, Tue Jun 7 09:10:23 2022 +1000)
* 6cae9b09 - fix: State change descriptions were not being displayed along with the interaction description (Ronald Holshausen, Mon Jun 6 17:09:44 2022 +1000)
* 1972a74a - feat: Detect Pactbroker responses from the URL content #199 (Ronald Holshausen, Mon Jun 6 14:48:06 2022 +1000)

## 0.13.7 - Maintenance Release

* f76ddd8e - feat: allow BrokerWithDynamicConfiguration to publish results (kageru, Tue May 17 11:42:14 2022 +0200)

## 0.13.6 - Maintenance Release


## 0.13.5 - Supports verification via plugins

* bc4f04df - feat: deal with verification output from plugins (Ronald Holshausen, Wed Apr 27 11:17:25 2022 +1000)
* cdf72b05 - feat: forward provider details to plugin when verifying (Ronald Holshausen, Fri Apr 22 14:12:34 2022 +1000)
* 2395143a - feat: forward verification to plugin for transports provided by the plugin (Ronald Holshausen, Fri Apr 22 12:02:05 2022 +1000)

## 0.13.4 - Bugfix Release

* 73ae0ef0 - fix: Upgrade reqwest to 0.11.10 to resolve #156 (Ronald Holshausen, Wed Apr 13 13:31:55 2022 +1000)
* e93c5574 - fix: when loading plugins for Pact files, only take minor + major version into account (Ronald Holshausen, Thu Mar 24 16:50:00 2022 +1100)

## 0.13.3 - Maintenance Release

* 345b0011 - feat: support mock servers provided from plugins (Ronald Holshausen, Mon Mar 21 15:59:46 2022 +1100)

## 0.13.2 - Maintenance Release

* f52c3625 - feat: add for custom headers to the HTTP client used by the verifier #182 (Ronald Holshausen, Mon Feb 28 14:38:00 2022 +1100)
* 74bd4531 - feat: add support for custom headers with the verifier FFI calls #182 (Ronald Holshausen, Mon Feb 28 13:58:46 2022 +1100)

## 0.13.1 - Updated req/res logging for FFI calls

* 4f47ff65 - feat: log request/response bodies at debug level (Ronald Holshausen, Thu Feb 3 13:14:35 2022 +1100)

## 0.13.0 - Capture output/results from the verification process

* d0fa29dc - feat: add json output to the verifier CLI (Ronald Holshausen, Fri Jan 28 15:21:17 2022 +1100)
* bf152233 - feat: Capture all the results from the verification process (Ronald Holshausen, Fri Jan 28 11:28:38 2022 +1100)
* 5f148cdd - feat: capture all the output from the verifier (Ronald Holshausen, Thu Jan 27 16:08:02 2022 +1100)

## 0.12.4 - Bugfix Release

* c2089645 - fix: log crate version must be fixed across all crates (including plugin driver) (Ronald Holshausen, Fri Jan 14 16:10:50 2022 +1100)

## 0.12.3 - Maintenance Release


## 0.12.2 - Maintenance Release


## 0.12.1 - Maintenance Release


## 0.12.0 - Bugfix + add metrics for validation

* f8042d6b - feat: add metrics event for provider verification (Ronald Holshausen, Tue Dec 14 17:29:44 2021 +1100)

## 0.11.2 - Bugfix Release

* f4fdba3c - fix: Templated values in HAL links need to be URL encoded #166 (Ronald Holshausen, Thu Dec 2 11:22:15 2021 +1100)
* 29605ab0 - fix: support specifying matching_branch in verifications (Matt Fellows, Wed Nov 17 18:59:36 2021 +1100)
* 260deb70 - fix: support specifying matching_branch in verifications (Matt Fellows, Wed Nov 17 17:47:37 2021 +1100)
* c45faa2c - feat: support specifying matching_branch in verifications. Fixes #158 (Matt Fellows, Wed Nov 17 17:36:49 2021 +1100)
* fc5be202 - fix: update to latest driver crate (Ronald Holshausen, Tue Nov 16 16:19:02 2021 +1100)

## 0.11.1 - Update to latest models and plugin driver crates


## 0.11.0 - Pact V4 release

* d171edfd - feat: support provider branches (Matt Fellows, Wed Sep 29 22:47:21 2021 +1000)

## 0.11.0-beta.2 - Bugfix Release

* 918e5beb - fix: update to latest models and plugin driver crates (Ronald Holshausen, Tue Oct 19 17:09:48 2021 +1100)

## 0.11.0-beta.1 - Plugin support with verifying pacts

* bfa04370 - fix: display the error message when the verification can not be run due to an error (Ronald Holshausen, Tue Oct 19 11:09:21 2021 +1100)
* 42be9eb8 - feat: add FFI functions to extract logs from a verifcation run (Ronald Holshausen, Tue Sep 28 12:48:40 2021 +1000)
* df715cd5 - feat: support native TLS. Fixes #144 (Matt Fellows, Mon Sep 20 13:00:33 2021 +1000)

## 0.10.13 - support native TLS certs

* 42be9eb8 - feat: add FFI functions to extract logs from a verifcation run (Ronald Holshausen, Tue Sep 28 12:48:40 2021 +1000)
* df715cd5 - feat: support native TLS. Fixes #144 (Matt Fellows, Mon Sep 20 13:00:33 2021 +1000)
* 05f4c3de - feat: add verifier ffi function set verification options (tienvx, Wed Sep 8 23:48:13 2021 +0700)

## 0.11.0-beta.0 - Support for plugins when verifying pacts

* 05f4c3de - feat: add verifier ffi function set verification options (tienvx, Wed Sep 8 23:48:13 2021 +0700)

## 0.10.12 - Maintenance Release


## 0.10.11 - Bugfix Release

* c274ca1a - fix: use the pacts for verification endpoint if the conusmer selectors are specified #133 (Ronald Holshausen, Sun Aug 22 11:51:22 2021 +1000)

## 0.10.10 - Bugfix Release

* b5a7b779 - feat: support new selectors (Matt Fellows, Mon Aug 9 13:27:33 2021 +1000)
* 8bcd1c7e - fix: min/max type matchers must not apply the limits when cascading (Ronald Holshausen, Sun Aug 8 15:50:40 2021 +1000)

## 0.10.9 - Moved structs to models crate + bugfixes and enhancements

* 33f9a823 - feat: support complex data structures in message metadata (Matt Fellows, Mon Jul 5 23:38:52 2021 +1000)
* a835e684 - feat: support message metadata in verifications (Matt Fellows, Sun Jul 4 21:02:35 2021 +1000)

## 0.10.8 - Refactor + Bugfixes

* e9930740 - fix: state change URLs should not end with a slash #110 (Ronald Holshausen, Sat Jun 5 15:48:48 2021 +1000)
* b4e26844 - fix: reqwest is dyn linked to openssl by default, which causes a SIGSEGV on alpine linux (Ronald Holshausen, Tue Jun 1 14:21:31 2021 +1000)

## 0.10.7 - V4 featues + bugfixes

* 905118e - Merge pull request #109 from tonynguyenit18/fix/unmatched-expected-and-response-headers-with-multiple-value (Ronald Holshausen, Sun May 30 10:19:51 2021 +1000)
* eef6b08 - fix: correct headers attribute with multiple values might not be matched (Tony Nguyen, Sat May 29 20:55:35 2021 +0700)
* af6721a - feat: rename callback_timeout to request_timeout, and support timeouts for all http requests during verification (Matt Fellows, Thu May 27 09:04:05 2021 +1000)

## 0.10.6 - Bugfix Release

* 63fcf49 - feat: enable consumer code to use the new Value matcher (Matt Fellows, Wed Apr 7 14:01:00 +1000)

## 0.10.5 - Bugfix Release

* 89240d8 - Merge pull request #95 from pact-foundation/fix/params-missing-on-provider-state-change (Ronald Holshausen, Sun Mar 14 17:20:01 2021 +1100)
* 17682dc - fix: add missing params to provider state change executor (Matt Fellows, Sat Mar 13 08:37:46 2021 +1100)
* 656201c - feat: add exponental deplay the pact broker client retries #94 (Ronald Holshausen, Sun Mar 14 14:16:57 2021 +1100)
* e38634e - feat: add retry to the pact broker client post and put #94 (Ronald Holshausen, Sun Mar 14 14:12:26 2021 +1100)
* 8541751 - feat: add retry to the pact broker client fetch #94 (Ronald Holshausen, Sun Mar 14 13:04:20 2021 +1100)

## 0.10.5 - pw

* 89240d8 - Merge pull request #95 from pact-foundation/fix/params-missing-on-provider-state-change (Ronald Holshausen, Sun Mar 14 17:20:01 2021 +1100)
* 17682dc - fix: add missing params to provider state change executor (Matt Fellows, Sat Mar 13 08:37:46 2021 +1100)
* 656201c - feat: add exponental deplay the pact broker client retries #94 (Ronald Holshausen, Sun Mar 14 14:16:57 2021 +1100)
* e38634e - feat: add retry to the pact broker client post and put #94 (Ronald Holshausen, Sun Mar 14 14:12:26 2021 +1100)
* 8541751 - feat: add retry to the pact broker client fetch #94 (Ronald Holshausen, Sun Mar 14 13:04:20 2021 +1100)

## 0.10.5 - Bugfix Release

* 89240d8 - Merge pull request #95 from pact-foundation/fix/params-missing-on-provider-state-change (Ronald Holshausen, Sun Mar 14 17:20:01 2021 +1100)
* 17682dc - fix: add missing params to provider state change executor (Matt Fellows, Sat Mar 13 08:37:46 2021 +1100)
* 656201c - feat: add exponental deplay the pact broker client retries #94 (Ronald Holshausen, Sun Mar 14 14:16:57 2021 +1100)
* e38634e - feat: add retry to the pact broker client post and put #94 (Ronald Holshausen, Sun Mar 14 14:12:26 2021 +1100)
* 8541751 - feat: add retry to the pact broker client fetch #94 (Ronald Holshausen, Sun Mar 14 13:04:20 2021 +1100)

## 0.10.4 - add final newline to verifier output

* 8c2152e - fix: add final newline to verifier output (Jest will overwrite it with the test name) (Ronald Holshausen, Tue Feb 9 14:15:19 2021 +1100)

## 0.10.3 - Fixes + add callback timeout option for verifcation callbacks

* 4afa86a - fix: add callback timeout option for verifcation callbacks (Ronald Holshausen, Sat Feb 6 12:27:32 2021 +1100)
* 74bd53f - fix: include test results for successful interactions when publishing verification results #92 (Ronald Holshausen, Mon Feb 1 11:24:33 2021 +1100)
* a27ce14 - fix: in callback executors, pass self by value to avoid lifetime issues (Ronald Holshausen, Tue Jan 26 18:41:06 2021 +1100)
* e5b1f93 - fix: clippy error (Ronald Holshausen, Mon Jan 25 10:26:58 2021 +1100)

## 0.10.2 - made pact broker module public so it can be used by other crates

* c8f7091 - feat: made pact broker module public so it can be used by other crates (Ronald Holshausen, Sun Jan 24 18:24:30 2021 +1100)

## 0.10.1 - Updated dependencies


## 0.10.0 - TLS support via FFI + non-blocking verify interaction

* 39c3816 - fix: using `clone` on a double-reference (Ronald Holshausen, Mon Jan 4 17:32:50 2021 +1100)
* 484b747 - fix: verify interaction was blocking the thread (Ronald Holshausen, Mon Jan 4 17:12:38 2021 +1100)
* 6cec6c7 - feat: allow https scheme and ability to disable ssl verification (Matt Fellows, Thu Dec 31 12:10:57 2020 +1100)

## 0.9.5 - Supports generators associated with array contains matcher variants

* 09513de - feat: add verifiedBy to the verified results (Ronald Holshausen, Tue Dec 29 12:05:07 2020 +1100)

## 0.9.4 - Bugfix Release

* d481bc1 - fix: pacts for verification unmarshal fails if 'pending' attr is not returned in response (Matt Fellows, Sun Nov 22 22:31:31 2020 +1100)
* 5058a2d - feat: include the mockserver URL and port in the verification context (Ronald Holshausen, Fri Nov 20 16:43:10 2020 +1100)

## 0.9.3 - Support provider state injected values

* 850282d - fix: times with millisecond precision less 3 caused chronos to panic (Ronald Holshausen, Tue Nov 17 16:29:47 2020 +1100)
* 13ce2f2 - fix: introduce GeneratorTestMode and restrict provider state generator to the provider side (Ronald Holshausen, Mon Nov 16 15:00:01 2020 +1100)

## 0.9.2 - Support Pacts for Verification API


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
