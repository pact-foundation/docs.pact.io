---
title: pact_matching
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_matching/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## 0.12.12 - Maintenance Release

* f8db90d2 - fix: Upgrade pact_models to 0.4.5 - fixes FFI bug with generators for request paths (Ronald Holshausen, Fri Aug 26 11:44:08 2022 +1000)

## 0.12.11 - Maintenance Release

* 65d05149 - fix: content type matcher was not being applied if content type was not octet_stream #171 (Ronald Holshausen, Wed Aug 17 16:32:43 2022 +1000)

## 0.12.10 - Maintenance Release

* 40f7bdc4 - feat: add verification option to disable ANSI escape codes in output #203 (Ronald Holshausen, Wed Jul 20 12:18:12 2022 +1000)

## 0.12.9 - Bugfix Release

* 0e3db9df - fix: comparing query paraneters where actual has less values but there is a type matcher (Ronald Holshausen, Fri Jun 10 15:17:45 2022 +1000)
* 4e9d8374 - fix: min/max type matchers were not being applied to query parameters (Ronald Holshausen, Fri Jun 10 14:17:41 2022 +1000)

## 0.12.8 - Maintenance Release


## 0.12.7 - Maintenance Release


## 0.12.6 - Maintenance Release

* cdf72b05 - feat: forward provider details to plugin when verifying (Ronald Holshausen, Fri Apr 22 14:12:34 2022 +1000)
* 2395143a - feat: forward verification to plugin for transports provided by the plugin (Ronald Holshausen, Fri Apr 22 12:02:05 2022 +1000)

## 0.12.5 - Maintenance Release

* 73ae0ef0 - fix: Upgrade reqwest to 0.11.10 to resolve #156 (Ronald Holshausen, Wed Apr 13 13:31:55 2022 +1000)

## 0.12.4 - Maintenance Release

* 345b0011 - feat: support mock servers provided from plugins (Ronald Holshausen, Mon Mar 21 15:59:46 2022 +1100)

## 0.12.3 - Maintenance Release

* 5f148cdd - feat: capture all the output from the verifier (Ronald Holshausen, Thu Jan 27 16:08:02 2022 +1100)
* 43754e6d - fix: PACT_DO_NOT_TRACK should be upper case (Ronald Holshausen, Thu Jan 27 14:34:13 2022 +1100)

## 0.12.2 - Bugfix Release

* c2089645 - fix: log crate version must be fixed across all crates (including plugin driver) (Ronald Holshausen, Fri Jan 14 16:10:50 2022 +1100)

## 0.12.1 - Bugfix Release

* dfa9f614 - fix: Values matcher should not be applied to a slice like Equality (Ronald Holshausen, Thu Dec 30 16:23:41 2021 +1100)

## 0.12.0 - Support for matching Protobuf payloads

* 1a01d111 - fix: correct the matching logic with lists and eachkey/eachvalue matchers (Ronald Holshausen, Thu Dec 30 13:34:21 2021 +1100)
* 28f562e2 - fix: Each key matching was not implemented correctly (Ronald Holshausen, Wed Dec 29 17:20:05 2021 +1100)
* 07e2a3b6 - fix: Values matchers must not cascade (Ronald Holshausen, Wed Dec 29 16:36:57 2021 +1100)
* 60764855 - fix: missing import (Ronald Holshausen, Wed Dec 29 15:50:36 2021 +1100)
* cd6fe27a - fix: map matching logic was not including the EachValue matcher (Ronald Holshausen, Wed Dec 29 15:47:09 2021 +1100)
* 41b406aa - fix: shared mime-info db not available on Windows (Ronald Holshausen, Wed Dec 29 10:13:43 2021 +1100)
* a0c9d203 - fix: detect common text types when comparing content type (Ronald Holshausen, Fri Dec 24 16:19:43 2021 +1100)
* ede663ec - fix: add matching implementations for Vec&lt;u8&;gt; and &Vec&lt;u8&;gt; (Ronald Holshausen, Fri Dec 24 15:24:48 2021 +1100)

## 0.11.5 - Maintenance Release


## 0.11.4 - Bugfix Release


## 0.11.3 - Bugfix Release

* 48d061ef - feat: add metrics publishing to matching crate (Ronald Holshausen, Tue Dec 14 16:19:59 2021 +1100)

## 0.11.2 - Upgrade to latest models and plugins crates

* fc5be202 - fix: update to latest driver crate (Ronald Holshausen, Tue Nov 16 16:19:02 2021 +1100)

## 0.11.1 - Updated to latest models crate


## 0.11.0 - Pact V4 release


## 0.11.0-beta.4 - Bugfix Release

* 918e5beb - fix: update to latest models and plugin driver crates (Ronald Holshausen, Tue Oct 19 17:09:48 2021 +1100)

## 0.11.0-beta.3 - Support matching synchronous request/response messages


## 0.11.0-beta.2 - synchronous messages with plugins

* d0bfb8a8 - feat: Support consumer tests with synchronous messages (Ronald Holshausen, Tue Oct 12 15:51:08 2021 +1100)

## 0.11.0-beta.1 - Plugin support (driver version 0.0.3)


## 0.11.0-beta.0 - Plugin support + nontEmpty and semver matchers

* c0bdd359 - fix: PluginData configuration is optional (Ronald Holshausen, Thu Sep 2 15:37:01 2021 +1000)

## 0.10.3 - Upgrade treemagic => upgrade nom => upgrade memchr


## 0.10.2 - upgrade nom to 7.0


## 0.10.1 - Bugfix Release

* 8bcd1c7e - fix: min/max type matchers must not apply the limits when cascading (Ronald Holshausen, Sun Aug 8 15:50:40 2021 +1000)

## 0.10.0 - Final version after extracting models

* 31873ee3 - feat: added validation of provider state JSON (Ronald Holshausen, Wed Jul 14 15:44:20 2021 +1000)
* 82a2d5df - feat: added verification of req/res interaction (Ronald Holshausen, Mon Jul 12 16:57:04 2021 +1000)

## 0.9.4 - Moved structs to models crate + bugfixes and enhancements

* e2151800 - feat: support generating UUIDs with different formats #121 (Ronald Holshausen, Sun Jul 11 12:36:23 2021 +1000)
* 33f9a823 - feat: support complex data structures in message metadata (Matt Fellows, Mon Jul 5 23:38:52 2021 +1000)
* a835e684 - feat: support message metadata in verifications (Matt Fellows, Sun Jul 4 21:02:35 2021 +1000)
* 80e3c4e7 - fix: retain the data type for simple expressions #116 (Ronald Holshausen, Sun Jul 4 13:02:43 2021 +1000)
* e21db699 - fix: Keep the original value when injecting from a provider state value so data type is retained #116 (Ronald Holshausen, Sat Jul 3 18:01:34 2021 +1000)

## 0.9.3 - Refactor + Bugfixes

* a44cbbee - fix: verifier was returning a mismatch when the expected body is empty #113 (Ronald Holshausen, Sat Jun 5 15:07:22 2021 +1000)
* 4e328d93 - feat: implement verification for RequestResponsePact, Consumer, Provider (Ronald Holshausen, Thu Jun 3 16:59:23 2021 +1000)
* 2f678213 - feat: initial prototype of a pact file verifier (Ronald Holshausen, Thu Jun 3 14:56:16 2021 +1000)
* 17beef62 - feat: support accumulating log entries per running mock server (Ronald Holshausen, Mon May 31 15:09:20 2021 +1000)

## 0.9.2 - Bugfixes + V4 changes (Status code matcher + Pending flag)

* 59e23f4 - fix: message pact needed matchingrules + generators (Matt Fellows, Sat May 29 15:16:32 2021 +1000)
* 81eed06 - fix: add zip file for binary test (Matt Fellows, Thu May 27 22:55:40 2021 +1000)
* cf679bd - fix: message pact feature test (Matt Fellows, Thu May 27 21:33:24 2021 +1000)
* 84d79a1 - fix: message pact feature test (Matt Fellows, Thu May 27 21:05:38 2021 +1000)
* a7e5778 - fix: broken message test (Matt Fellows, Thu May 27 15:36:31 2021 +1000)
* 0c9391d - Merge pull request #101 from pact-foundation/feat/ffi-consumer-message-pact (Matt Fellows, Thu May 27 12:57:58 2021 +1000)
* 810106d - Merge pull request #100 from pact-foundation/feat/more-consumer-ffi-matchers (Ronald Holshausen, Thu May 27 11:17:53 2021 +1000)
* ffbcaf5 - feat: Added header_from_provider_state and path_from_provider_state (Rob Caiger, Mon May 24 13:54:16 2021 +0100)
* 5024e17 - feat: allow messages to have binary payloads (Matt Fellows, Sat May 22 21:50:57 2021 +1000)
* 413e9a5 - feat: initial consumer FFI based message pact (Matt Fellows, Tue May 18 23:37:49 2021 +1000)
* 066d7a9 - Revert "feat: support a dummy matcher" (Matt Fellows, Mon May 17 10:47:40 2021 +1000)
* 5167cfb - fix: broken test for v2 path matcher (Matt Fellows, Sun May 16 14:29:50 2021 +1000)
* a33718a - fix: serialise v2 path matcher correctly for FFI (Matt Fellows, Sun May 16 14:10:14 2021 +1000)
* f56ae24 - feat: support a dummy matcher (Matt Fellows, Sun May 16 14:05:08 2021 +1000)

## 0.9.1 - V4 features


## 0.9.0 - Extracted some models to pact_models + V4 spec updates


## 0.8.14 - Bugfix Release

* 75c2c1a - fix: upgrade to tree_magic_mini 2.0.0 because they pulled 1.0.0 from crates.io and now builds fail (Matt Fellows, Wed Apr 7 12:53:26 2021 +1000)

## 0.8.13 - V4 features (message refactor)

* 86f8140 - fix: missing $ in macro (Ronald Holshausen, Sun Mar 7 18:48:09 2021 +1100)

## 0.8.12 - Values matcher - match values, ignoring keys

* bc84a4d - feat: implemented matching values ignoring keys (Ronald Holshausen, Fri Mar 5 10:52:01 2021 +1100)

## 0.8.11 - file locking with exp backoff

* 6f13f49 - feat: implemented non-blocking write file locking with exp backoff (Ronald Holshausen, Wed Feb 10 14:50:38 2021 +1100)
* f34629e - feat: implemented non-blockng read file locking with exp backoff (Ronald Holshausen, Wed Feb 10 14:27:31 2021 +1100)
* 7f054e8 - fix: correctly assemble UTF-8 percent encoded query parameters (Ronald Holshausen, Tue Feb 9 14:02:04 2021 +1100)

## 0.8.10 - use a file system lock when merging pact files

* 9976e80 - feat: added read locks and a mutex guard to reading and writing pacts (Ronald Holshausen, Mon Feb 8 11:58:52 2021 +1100)
* 61e16ed - feat: use a file system lock when merging pact files (Ronald Holshausen, Sun Feb 7 17:00:29 2021 +1100)

## 0.8.9 - Fixes + thread safe support functions

* c8f7091 - feat: made pact broker module public so it can be used by other crates (Ronald Holshausen, Sun Jan 24 18:24:30 2021 +1100)
* a35150b - feat: extracted the JSON -> Pact logic into a public function (Ronald Holshausen, Sun Jan 24 10:16:33 2021 +1100)
* ae95e0c - fix: apply generators to the request in the same manor as the response (Ronald Holshausen, Mon Jan 18 17:25:38 2021 +1100)

## 0.8.8 - Bugfixes + updated dependencies

* 56ce20a - fix: MockServerURL generator was using the incorrect field (Ronald Holshausen, Sun Jan 10 15:54:18 2021 +1100)
* 2bcf8fa - Merge pull request #88 from audunhalland/upgrade-http (Ronald Holshausen, Sun Jan 10 10:33:50 2021 +1100)

## 0.8.7 - Updated dependencies


## 0.8.6 - support generators associated with array contains matcher variants

* 5556b32 - feat: added test for array contains as a generator (Ronald Holshausen, Wed Dec 30 13:47:31 2020 +1100)
* 1ed95ae - feat: implemented using ArrayContains as a generator for JSON (Ronald Holshausen, Tue Dec 29 17:52:25 2020 +1100)
* 42f0a39 - fix: use Vec instead of HashSet to maintain order of matching rules on OSX (Ronald Holshausen, Tue Dec 29 13:22:57 2020 +1100)
* c8ad6d4 - fix: matchers in Pact file can have a different order on OSX (Ronald Holshausen, Tue Dec 29 12:49:19 2020 +1100)
* 09513de - feat: add verifiedBy to the verified results (Ronald Holshausen, Tue Dec 29 12:05:07 2020 +1100)

## 0.8.5 - Bugfix Release

* 5058a2d - feat: include the mockserver URL and port in the verification context (Ronald Holshausen, Fri Nov 20 16:43:10 2020 +1100)
* 09b197d - feat: add a mock server URL generator (Ronald Holshausen, Fri Nov 20 13:24:09 2020 +1100)
* 118daa1 - feat: when merging pact files, upcast to the higher spec version (Ronald Holshausen, Thu Nov 19 18:09:13 2020 +1100)
* 6995298 - fix: make application/xml equivalent to text/xml (Ronald Holshausen, Thu Nov 19 14:33:58 2020 +1100)
* 88eff15 - fix: when matching bodies, use any content type header matcher (Ronald Holshausen, Thu Nov 19 14:19:08 2020 +1100)

## 0.8.4 - Support provider state injected values

* 850282d - fix: times with millisecond precision less 3 caused chronos to panic (Ronald Holshausen, Tue Nov 17 16:29:47 2020 +1100)
* baf3693 - fix: when displaying diff, if actual body was empty a panic resulted (Ronald Holshausen, Tue Nov 17 16:29:12 2020 +1100)
* 13ce2f2 - fix: introduce GeneratorTestMode and restrict provider state generator to the provider side (Ronald Holshausen, Mon Nov 16 15:00:01 2020 +1100)

## 0.8.3 - Bugfix Release

* 8dccd1a - Merge pull request #79 from pact-foundation/feat/pacts-for-verification (Ronald Holshausen, Wed Nov 11 09:43:37 2020 +1100)
* 6633575 - fix: ported matching logic fixes from Pact-JVM (Ronald Holshausen, Mon Nov 2 18:20:22 2020 +1100)

## 0.8.2 - Bugfix Release

* 3acf437 - fix: when merging pacts, it helps to use the new interations in the merged pact, not the old ones #77 (Ronald Holshausen, Sat Oct 17 18:17:57 2020 +1100)

## 0.8.1 - Bugfix Release

* d24cfe3 - fix: matching binary data was broken after refactor (Ronald Holshausen, Fri Oct 16 16:05:26 2020 +1100)

## 0.8.0 - V4 models + arrayContains matcher

* c686ce0 - fix: arrayContains matcher JSON was missing match attribute (Ronald Holshausen, Thu Oct 15 15:55:50 2020 +1100)
* f090323 - feat: updated integration JSON to handle array contains matcher (Ronald Holshausen, Thu Oct 15 15:31:47 2020 +1100)
* 7110ab1 - feat: array contains working with Siren example (Ronald Holshausen, Thu Oct 15 11:47:01 2020 +1100)
* d79beb4 - feat: basic array contains matcher working (Ronald Holshausen, Wed Oct 14 17:04:08 2020 +1100)
* 03f43d4 - feat: initail implementation of array contains matcher (Ronald Holshausen, Wed Oct 14 14:43:05 2020 +1100)
* cbc7812 - fix: clippy erros (Ronald Holshausen, Wed Oct 14 11:39:37 2020 +1100)
* 831ba3d - fix: implement display for Interaction and Message (Ronald Holshausen, Wed Oct 14 10:09:32 2020 +1100)
* 013fbaf - feat: implemented writing pact for V4 pacts (Ronald Holshausen, Tue Oct 13 18:56:03 2020 +1100)
* a151bcc - fix: Charsets in headers should be compared ignoring case (Ronald Holshausen, Tue Oct 13 14:12:15 2020 +1100)
* dd2ffa7 - feat: support text/xml as an XML content type (Ronald Holshausen, Thu Oct 8 15:49:23 2020 +1100)
* d0d7380 - feat: enabled some more tests for V4 models (Ronald Holshausen, Wed Oct 7 14:38:07 2020 +1100)
* 5d8f744 - feat: loading V4 pact tests passing (Ronald Holshausen, Wed Oct 7 13:51:13 2020 +1100)
* 511272a - feat: got V4 Synchronous/HTTP pact loading (Ronald Holshausen, Wed Oct 7 12:56:48 2020 +1100)
* 7be8de6 - feat: Implemented V4 interactions + loading from JSON (Ronald Holshausen, Tue Oct 6 17:16:40 2020 +1100)
* b2725dd - feat: added V4 interaction types (Ronald Holshausen, Tue Oct 6 12:03:03 2020 +1100)
* 7232e89 - feat: Add initial V4 models and example pact files (Ronald Holshausen, Tue Oct 6 09:13:21 2020 +1100)
* cbb6e20 - fix: generators to_json was only writing the first one for bodies, headers and queries (Ronald Holshausen, Sun Oct 4 12:52:24 2020 +1100)

## 0.7.1 - CORS pre-flight + fixes

* 2e662a6 - feat: handle CORS pre-flight requests in the mock server (Ronald Holshausen, Wed Sep 23 17:59:32 2020 +1000)
* d8ceb74 - fix: don't clone a double reference (clippy error) (Ronald Holshausen, Sun Sep 20 15:12:11 2020 +1000)
* 042bed0 - fix: random decimal generator now includes a decimal point in the generated values (Ronald Holshausen, Sun Sep 20 11:18:28 2020 +1000)
* cd9d41c - fix: strip off anchors before generating a value from a regex (Ronald Holshausen, Fri Sep 18 15:38:38 2020 +1000)
* 9389c0a - fix: don't unwrap a result when generating random string from regex (Ronald Holshausen, Fri Sep 18 15:24:42 2020 +1000)
* a5f17a5 - fix: UUID generator should return hyphenated values (Ronald Holshausen, Thu Sep 17 10:06:52 2020 +1000)

## 0.7.0 - Message pacts and matching messages

* 865327d - feat: handle comparing content types correctly (Ronald Holshausen, Mon Sep 14 16:37:11 2020 +1000)
* ebee1c0 - feat: implemented matching for message metadata (Ronald Holshausen, Mon Sep 14 15:31:18 2020 +1000)
* 6cba6ad - feat: implemented basic message verification with the verifier cli (Ronald Holshausen, Mon Sep 14 13:48:27 2020 +1000)
* cc42fbc - feat: add MessagePact (Pact with Messages instead of Interactions) (Caleb Stepanian, Sun Aug 16 15:25:01 2020 -0400)

## 0.6.5 - implemented provider state generator

* b130cd2 - feat: add tests for serialising Generator::ProviderStateGenerator (Ronald Holshausen, Sun Aug 23 13:53:41 2020 +1000)
* 76f73c6 - feat: implemented provider state generator (Ronald Holshausen, Sun Aug 23 13:29:55 2020 +1000)

## 0.6.4 - Refactor to return the most relevant response from the mock server

* da53bac - fix: return the most relevant response from the mock server #69 (Ronald Holshausen, Tue Jul 21 16:10:54 2020 +1000)
* 5316030 - feat: added a struct for handling content types (Ronald Holshausen, Sun Jun 28 13:31:22 2020 +1000)

## 0.6.3 - Updated XML Matching

* daeaa0c - feat: update the spec test cases after implementing XML matching MkII (Ronald Holshausen, Tue Jun 23 16:09:23 2020 +1000)
* 90c175c - feat: re-implement XML matching to support elements with different children (Ronald Holshausen, Tue Jun 23 15:20:36 2020 +1000)
* f2c7145 - fix: correct build dependencies (Ronald Holshausen, Fri Jun 12 11:57:48 2020 +1000)

## 0.6.2 - Overhaul date/time matching

* 45fc1a0 - fix: cleanup warnings and fixed test (Ronald Holshausen, Fri Jun 12 10:51:44 2020 +1000)
* a6cbe4b - feat: support validating datetimes with timezones (Ronald Holshausen, Wed Jun 10 17:03:56 2020 +1000)
* c1b657b - feat: make default metadata public so other language impl can access it (Ronald Holshausen, Thu Jun 4 16:02:16 2020 +1000)
* e699061 - feat: add convience methods to modify headers (Ronald Holshausen, Thu Jun 4 16:01:04 2020 +1000)
* f94f25a - fix: intermediate date/time matcher JSON should use the format attribute (Ronald Holshausen, Wed May 27 14:19:34 2020 +1000)

## 0.6.1 - Bugfix Release

* 6c65dab - feat: handle namespaces when matching XML (Ronald Holshausen, Mon May 25 16:23:20 2020 +1000)
* 67e2147 - fix: was incorrectly selecting the matching rule when weight was equal (Ronald Holshausen, Mon May 25 16:22:36 2020 +1000)

## 0.6.0 - multi-part form post bodies

* ce94df9 - feat: cleaned up the logging of request matches (Ronald Holshausen, Sun May 24 11:17:08 2020 +1000)
* d0a54f7 - feat: implemented matching multi-part form post bodies (Ronald Holshausen, Sat May 23 17:49:48 2020 +1000)

## 0.5.14 - Bugfix Release

* 61ab50f - fix: date/time matchers fallback to the old key (Ronald Holshausen, Fri May 15 11:27:27 2020 +1000)
* ddacb5d - fix: FFI datetime matcher was using incorrect field (Ronald Holshausen, Wed May 13 17:58:31 2020 +1000)
* 6af29ce - fix: improve the error message when a merge conflict occurs (Ronald Holshausen, Wed May 13 10:57:25 2020 +1000)

## 0.5.13 - matching of binary payloads

* 708db47 - feat: implement matching of binary payloads (application/octet-stream) (Ronald Holshausen, Fri May 8 15:52:03 2020 +1000)

## 0.5.12 - Bugfix Release

* d85f28c - fix: mock server matching requests with headers with multiple values (Ronald Holshausen, Tue May 5 15:23:11 2020 +1000)
* a45d0c3 - fix: FFI mismatch json should have the actual values as UTF-8 string not bytes #64 (Ronald Holshausen, Thu Apr 30 11:16:25 2020 +1000)

## 0.5.11 - Cleaned up logging and warnings


## 0.5.10 - Bugfix Release

* b52f095 - fix: V3 path matcher JSON format was incorrect (Ronald Holshausen, Tue Apr 7 11:14:25 2020 +1000)

## 0.5.9 - Bugfixes + Date/Time matchers with JSON

* e0f23a2 - feat: exposes time/date utils for language implementations (Ronald Holshausen, Thu Mar 12 17:01:44 2020 +1100)
* 2920364 - fix: date and time matchers with JSON (Ronald Holshausen, Thu Mar 12 16:07:05 2020 +1100)
* db74b68 - Merge pull request #61 from mitre/v3_provider_states (Ronald Holshausen, Mon Mar 9 13:37:03 2020 +1100)

## 0.5.8 - Upgrade reqwest to 0.10


## 0.5.7 - Bugfix Release

* a660b87 - fix: correct pact merging to remove duplicates #54 (Ronald Holshausen, Sat Dec 14 15:06:30 2019 +1100)

## 0.5.6 - Bugfix Release

* a0dc946 - fix: store matching rules in a set to avoid duplicates (Ronald Holshausen, Sun Nov 10 10:08:34 2019 +1100)
* 66c328e - feat: add colons to the allowed path characters (Ronald Holshausen, Sun Oct 27 17:13:14 2019 +1100)

## 0.5.5 - Oniguruma crate for regex matching

* defe890 - fix: switch to the Oniguruma crate for regex matching #46 (Ronald Holshausen, Fri Sep 27 14:35:16 2019 +1000)

## 0.5.4 - Refactor for publishing verification results

* eef3d97 - feat: added some tests for publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 16:44:52 2019 +1000)
* 1110b47 - feat: implemented publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 13:53:27 2019 +1000)
* cb30a2f - feat: added the ProviderStateGenerator as a generator type (Ronald Holshausen, Sun Sep 8 16:29:46 2019 +1000)
* 8932ef6 - feat: support an integration format for matchers for language integration (Ronald Holshausen, Sun Aug 25 11:36:23 2019 +1000)

## 0.5.3 - support bearer tokens

* dac8ae1 - feat: support authentication when fetching pacts from a pact broker (Ronald Holshausen, Sun Aug 11 13:57:29 2019 +1000)
* e007763 - feat: support bearer tokens when fetching pacts from URLs (Ronald Holshausen, Sun Aug 11 13:21:17 2019 +1000)

## 0.5.2 - Support headers with multiple values

* 0c5f718 - feat: support matchers on plain text bodies #43 (Ronald Holshausen, Sat Aug 10 17:54:26 2019 +1000)
* f0c0d07 - feat: support headers with multiple values (Ronald Holshausen, Sat Aug 10 17:01:10 2019 +1000)
* 0fe57d9 - fix: release script (Ronald Holshausen, Sat Jun 29 19:28:46 2019 +1000)

## 0.5.1 - Bugfix Release

* 91da912 - fix: correct overflow of max value for random int generator #39 (Ronald Holshausen, Sat Jun 29 18:43:56 2019 +1000)

## 0.5.0 - Regex, Date and Time matching and generators

* 4f471de - feat: implemented generating values from regex (Ronald Holshausen, Sat Jan 5 18:46:48 2019 +1100)
* 73bc70e - feat: implemented generators for dates and times #33 (Ronald Holshausen, Sat Jan 5 17:10:56 2019 +1100)
* e72fb9e - feat: cleanup date matching #33 (Ronald Holshausen, Sat Jan 5 14:31:50 2019 +1100)
* 8b9b043 - feat: implemeted general timezone patterns in date matching #33 (Ronald Holshausen, Sat Jan 5 14:23:21 2019 +1100)
* 45e1ee1 - feat: implemeted RFC 822 and ISO 8601 timezones in date matching #33 (Ronald Holshausen, Fri Jan 4 15:19:09 2019 +1100)
* 2978a00 - feat: implemeted time in date matching #33 (Ronald Holshausen, Fri Jan 4 14:08:06 2019 +1100)
* 5d890a5 - feat: implemeted day of week in date matching #33 (Ronald Holshausen, Fri Jan 4 13:31:59 2019 +1100)
* 33f4054 - feat: implemeted simple date matching #33 (Ronald Holshausen, Fri Jan 4 11:16:16 2019 +1100)
* ce57f17 - feat: implemented formatted display for request and response (Ronald Holshausen, Tue Jan 1 11:52:58 2019 +1100)
* 433d9c5 - fix: handle path expressions that start with an underscore (Ronald Holshausen, Tue Jan 1 10:51:43 2019 +1100)

## 0.4.5 - feat: added convenience header methods to HttpPart

* ead1af2 - feat: added convenience header methods to HttpPart (Ronald Holshausen, Sat Sep 8 14:29:59 2018 +1000)

## 0.4.4 - Bugfix Release

* 97abce4 - fix: support matching rules affected by Pact-JVM defect 743 (Ronald Holshausen, Sat Aug 11 15:07:41 2018 +1000)

## 0.4.3 - Bugfix Release

* 1184203 - fix: Allow dashes in path expressions for headers like Content-Type (Ronald Holshausen, Sat Jun 30 17:03:08 2018 +1000)
* 995139b - Revert "fix: query and header paths should be escaped" (Ronald Holshausen, Sat Jun 30 16:56:05 2018 +1000)

## 0.4.2 - Bugfix Release

* d6fbed4 - fix: query and header paths should be escaped (Ronald Holshausen, Sat Jun 30 16:22:56 2018 +1000)
* 948e620 - fix: parse the V3 keys as path expressions for query and header matchers (Ronald Holshausen, Sat Jun 30 15:22:51 2018 +1000)

## 0.4.1 - implemented some missing matchers (include, null, integer, decimal, number)

* b060bbb - feat: implemented some missing matchers (include, null, integer, decimal, number) (Ronald Holshausen, Sun May 13 13:46:23 2018 +1000)
* b68c893 - fix: pact specification key in the metadata should be camelcase #3 (Ronald Holshausen, Sun Apr 8 12:05:39 2018 +1000)

## 0.4.0 - First V3 specification release


## 0.3.1 - Converted OptionalBody::Present to take a Vec&lt;u8&;gt;


## 0.3.0 - Backported matching rules from V3 branch


## 0.2.2 - Bugfix Release

* 3399f7c - Merge pull request #13 from adamtsis/remove-deprecated-json-lib (Ronald Holshausen, Tue May 16 15:56:22 2017 +1000)
* 142d550 - Merge pull request #12 from adamtsis/remove-deprecated-json-lib (Ronald Holshausen, Mon May 8 16:13:30 2017 +1000)
* 7982137 - Merge pull request #11 from adamtsis/camel-case-specification (Ronald Holshausen, Mon May 1 13:49:09 2017 +1000)

## 0.2.1 - Changes required for verifying V2 pacts


## 0.1.1 - Changes required for verifying V1.1 pacts


## 0.1.0 - V1.1 Specification Implementation


## 0.0.2 - Fixes required for verifying pacts


## 0.0.1 - Second Feature Release


## 0.0.0 - First Release
