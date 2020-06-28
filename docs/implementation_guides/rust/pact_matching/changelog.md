---
title: pact_matching
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_matching/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## 0.6.3 - Updated XML Matching

* daeaa0c - feat: update the spec test cases after implementing XML matching MkII (Ronald Holshausen, Tue Jun 23 16:09:23 2020 +1000)
* 90c175c - feat: re-implement XML matching to support elements with different children (Ronald Holshausen, Tue Jun 23 15:20:36 2020 +1000)
* 4d18e1b - bump version to 0.6.3 (Ronald Holshausen, Fri Jun 12 12:00:38 2020 +1000)
* f2c7145 - fix: correct build dependencies (Ronald Holshausen, Fri Jun 12 11:57:48 2020 +1000)

## 0.6.2 - Overhaul date/time matching

* 45fc1a0 - fix: cleanup warnings and fixed test (Ronald Holshausen, Fri Jun 12 10:51:44 2020 +1000)
* a6cbe4b - feat: support validating datetimes with timezones (Ronald Holshausen, Wed Jun 10 17:03:56 2020 +1000)
* c1b657b - feat: make default metadata public so other language impl can access it (Ronald Holshausen, Thu Jun 4 16:02:16 2020 +1000)
* e699061 - feat: add convience methods to modify headers (Ronald Holshausen, Thu Jun 4 16:01:04 2020 +1000)
* f94f25a - fix: intermediate date/time matcher JSON should use the format attribute (Ronald Holshausen, Wed May 27 14:19:34 2020 +1000)
* ae0af17 - bump version to 0.6.2 (Ronald Holshausen, Wed May 27 10:35:40 2020 +1000)

## 0.6.1 - Bugfix Release

* 6c65dab - feat: handle namespaces when matching XML (Ronald Holshausen, Mon May 25 16:23:20 2020 +1000)
* 67e2147 - fix: was incorrectly selecting the matching rule when weight was equal (Ronald Holshausen, Mon May 25 16:22:36 2020 +1000)
* 1e3516b - bump version to 0.6.1 (Ronald Holshausen, Sun May 24 11:49:20 2020 +1000)

## 0.6.0 - multi-part form post bodies

* ce94df9 - feat: cleaned up the logging of request matches (Ronald Holshausen, Sun May 24 11:17:08 2020 +1000)
* d0a54f7 - feat: implemented matching multi-part form post bodies (Ronald Holshausen, Sat May 23 17:49:48 2020 +1000)
* b0f3387 - bump version to 0.5.15 (Ronald Holshausen, Fri May 15 16:27:48 2020 +1000)

## 0.5.14 - Bugfix Release

* 61ab50f - fix: date/time matchers fallback to the old key (Ronald Holshausen, Fri May 15 11:27:27 2020 +1000)
* ddacb5d - fix: FFI datetime matcher was using incorrect field (Ronald Holshausen, Wed May 13 17:58:31 2020 +1000)
* 6af29ce - fix: improve the error message when a merge conflict occurs (Ronald Holshausen, Wed May 13 10:57:25 2020 +1000)
* ddd0881 - bump version to 0.5.14 (Ronald Holshausen, Tue May 12 12:33:30 2020 +1000)

## 0.5.13 - matching of binary payloads

* 708db47 - feat: implement matching of binary payloads (application/octet-stream) (Ronald Holshausen, Fri May 8 15:52:03 2020 +1000)
* b6b81a3 - bump version to 0.5.13 (Ronald Holshausen, Tue May 5 16:39:23 2020 +1000)

## 0.5.12 - Bugfix Release

* d85f28c - fix: mock server matching requests with headers with multiple values (Ronald Holshausen, Tue May 5 15:23:11 2020 +1000)
* a45d0c3 - fix: FFI mismatch json should have the actual values as UTF-8 string not bytes #64 (Ronald Holshausen, Thu Apr 30 11:16:25 2020 +1000)
* 6f24994 - bump version to 0.5.12 (Ronald Holshausen, Fri Apr 24 10:11:33 2020 +1000)

## 0.5.11 - Cleaned up logging and warnings

* 1ad8edd - bump version to 0.5.11 (Ronald Holshausen, Tue Apr 7 11:42:14 2020 +1000)

## 0.5.10 - Bugfix Release

* b52f095 - fix: V3 path matcher JSON format was incorrect (Ronald Holshausen, Tue Apr 7 11:14:25 2020 +1000)
* a9d512f - bump version to 0.5.10 (Ronald Holshausen, Fri Mar 13 09:39:43 2020 +1100)

## 0.5.9 - Bugfixes + Date/Time matchers with JSON

* e0f23a2 - feat: exposes time/date utils for language implementations (Ronald Holshausen, Thu Mar 12 17:01:44 2020 +1100)
* 2920364 - fix: date and time matchers with JSON (Ronald Holshausen, Thu Mar 12 16:07:05 2020 +1100)
* db74b68 - Merge pull request #61 from mitre/v3_provider_states (Ronald Holshausen, Mon Mar 9 13:37:03 2020 +1100)
* 627c4ad - At least partially correct broken Serialize/Deserialize for Message. (Andrew Lilley Brinker, Tue Mar 3 08:06:52 2020 -0800)
* 162f52d - Fixed three broken tests. (Andrew Lilley Brinker, Tue Mar 3 07:15:44 2020 -0800)
* d87a2c3 - Made `Message` understand `providerStates`. (Andrew Lilley Brinker, Mon Mar 2 08:38:56 2020 -0800)
* d594dbb - Fix broken documentation link for provider_states. (Andrew Lilley Brinker, Mon Mar 2 08:21:40 2020 -0800)
* 6187cfa - bump version to 0.5.9 (Ronald Holshausen, Sun Jan 19 11:11:09 2020 +1100)

## 0.5.8 - Upgrade reqwest to 0.10

* 9dec41b - Upgrade reqwest to 0.10 (Audun Halland, Tue Dec 31 07:22:36 2019 +0100)
* fda11e4 - Merge remote-tracking branch 'upstream/master' into async-await (Audun Halland, Tue Dec 17 02:13:58 2019 +0100)
* d395d2d - pact_verifier: Upgrade reqwest to latest git alpha (Audun Halland, Tue Dec 17 00:57:16 2019 +0100)
* 298f217 - pact_matching: Upgrade reqwest to current alpha (Audun Halland, Tue Dec 17 00:36:33 2019 +0100)
* d28d97d - bump version to 0.5.8 (Ronald Holshausen, Sat Dec 14 16:57:02 2019 +1100)

## 0.5.7 - Bugfix Release

* a660b87 - fix: correct pact merging to remove duplicates #54 (Ronald Holshausen, Sat Dec 14 15:06:30 2019 +1100)
* 51f5a3e - Update READMEs and doc to not require any "extern crate" (Audun Halland, Sun Nov 17 23:28:21 2019 +0100)
* bc1515a - pact_matching: Upgrade lazy_static to get rid of warning msg (Audun Halland, Sun Nov 17 22:47:30 2019 +0100)
* e0bb698 - pact_matching: Remove test extern crate from lib.rs (Audun Halland, Sun Nov 17 22:43:45 2019 +0100)
* c16574d - pact_matching: Remove prod extern crate from lib.rs (Audun Halland, Sun Nov 17 22:32:35 2019 +0100)
* 85efd07 - pact_matching: use maplit::* explicitly (Audun Halland, Sun Nov 17 22:17:53 2019 +0100)
* 382f304 - pact_matching: Upgrade log to 0.4 - for scoped macro (Audun Halland, Sun Nov 17 22:12:55 2019 +0100)
* fcadd7f - pact_matching: Remove extern crate serde_json (Audun Halland, Sun Nov 17 21:57:39 2019 +0100)
* 713cd6a - Explicit edition 2018 in Cargo.toml files (Audun Halland, Sat Nov 16 23:55:37 2019 +0100)
* 924452f - 2018 edition autofix "cargo fix --edition" (Audun Halland, Sat Nov 16 22:27:42 2019 +0100)
* 8523e69 - bump version to 0.5.7 (Ronald Holshausen, Sun Nov 10 10:30:20 2019 +1100)

## 0.5.6 - Bugfix Release

* a0dc946 - fix: store matching rules in a set to avoid duplicates (Ronald Holshausen, Sun Nov 10 10:08:34 2019 +1100)
* 66c328e - feat: add colons to the allowed path characters (Ronald Holshausen, Sun Oct 27 17:13:14 2019 +1100)
* 869af94 - bump version to 0.5.6 (Ronald Holshausen, Fri Sep 27 14:57:05 2019 +1000)

## 0.5.5 - Oniguruma crate for regex matching

* defe890 - fix: switch to the Oniguruma crate for regex matching #46 (Ronald Holshausen, Fri Sep 27 14:35:16 2019 +1000)
* 19bf916 - bump version to 0.5.5 (Ronald Holshausen, Sun Sep 22 17:11:00 2019 +1000)

## 0.5.4 - Refactor for publishing verification results

* eef3d97 - feat: added some tests for publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 16:44:52 2019 +1000)
* 1110b47 - feat: implemented publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 13:53:27 2019 +1000)
* cb30a2f - feat: added the ProviderStateGenerator as a generator type (Ronald Holshausen, Sun Sep 8 16:29:46 2019 +1000)
* 8932ef6 - feat: support an integration format for matchers for language integration (Ronald Holshausen, Sun Aug 25 11:36:23 2019 +1000)
* 6899663 - bump version to 0.5.4 (Ronald Holshausen, Sun Aug 11 14:41:09 2019 +1000)

## 0.5.3 - support bearer tokens

* dac8ae1 - feat: support authentication when fetching pacts from a pact broker (Ronald Holshausen, Sun Aug 11 13:57:29 2019 +1000)
* e007763 - feat: support bearer tokens when fetching pacts from URLs (Ronald Holshausen, Sun Aug 11 13:21:17 2019 +1000)
* 8009184 - bump version to 0.5.3 (Ronald Holshausen, Sun Aug 11 09:46:21 2019 +1000)

## 0.5.2 - Support headers with multiple values

* 0c5f718 - feat: support matchers on plain text bodies #43 (Ronald Holshausen, Sat Aug 10 17:54:26 2019 +1000)
* f0c0d07 - feat: support headers with multiple values (Ronald Holshausen, Sat Aug 10 17:01:10 2019 +1000)
* 699f48f - bump version to 0.5.2 (Ronald Holshausen, Sat Jun 29 19:34:44 2019 +1000)
* 0fe57d9 - fix: release script (Ronald Holshausen, Sat Jun 29 19:28:46 2019 +1000)

## 0.5.1 - Bugfix Release

* 91da912 - fix: correct overflow of max value for random int generator #39 (Ronald Holshausen, Sat Jun 29 18:43:56 2019 +1000)
* 4ccd09d - bump version to 0.5.1 (Ronald Holshausen, Sat Jan 5 19:42:58 2019 +1100)

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
* 009b176 - bump version to 0.4.6 (Ronald Holshausen, Sat Sep 8 14:41:35 2018 +1000)

## 0.4.5 - feat: added convenience header methods to HttpPart

* ead1af2 - feat: added convenience header methods to HttpPart (Ronald Holshausen, Sat Sep 8 14:29:59 2018 +1000)
* 129333f - bump version to 0.4.5 (Ronald Holshausen, Sat Aug 11 15:21:01 2018 +1000)

## 0.4.4 - Bugfix Release

* 97abce4 - fix: support matching rules affected by Pact-JVM defect 743 (Ronald Holshausen, Sat Aug 11 15:07:41 2018 +1000)
* f9d091e - bump version to 0.4.4 (Ronald Holshausen, Sat Jun 30 17:14:16 2018 +1000)

## 0.4.3 - Bugfix Release

* 1184203 - fix: Allow dashes in path expressions for headers like Content-Type (Ronald Holshausen, Sat Jun 30 17:03:08 2018 +1000)
* 995139b - Revert "fix: query and header paths should be escaped" (Ronald Holshausen, Sat Jun 30 16:56:05 2018 +1000)
* 74e9116 - bump version to 0.4.3 (Ronald Holshausen, Sat Jun 30 16:40:17 2018 +1000)

## 0.4.2 - Bugfix Release

* d6fbed4 - fix: query and header paths should be escaped (Ronald Holshausen, Sat Jun 30 16:22:56 2018 +1000)
* 948e620 - fix: parse the V3 keys as path expressions for query and header matchers (Ronald Holshausen, Sat Jun 30 15:22:51 2018 +1000)
* c3898b9 - bump version to 0.4.2 (Ronald Holshausen, Sun May 13 14:24:54 2018 +1000)

## 0.4.1 - implemented some missing matchers (include, null, integer, decimal, number)

* b060bbb - feat: implemented some missing matchers (include, null, integer, decimal, number) (Ronald Holshausen, Sun May 13 13:46:23 2018 +1000)
* 0aa161d - test: Added a test to confirm that binary bodies are persisted in base64 format #19 (Ronald Holshausen, Sun Apr 8 14:27:19 2018 +1000)
* b68c893 - fix: pact specification key in the metadata should be camelcase #3 (Ronald Holshausen, Sun Apr 8 12:05:39 2018 +1000)
* 10eb623 - bump version to 0.4.1 (Ronald Holshausen, Sat Apr 7 14:08:52 2018 +1000)

## 0.4.0 - First V3 specification release

* e5322f1 - code cleanup in prep of release (Ronald Holshausen, Sat Apr 7 13:58:55 2018 +1000)
* d90af09 - Implemented decimal, hexadecimal and string generators (Ronald Holshausen, Fri Mar 9 16:48:46 2018 +1100)
* bc077ec - Completed the implementation of applying generators to JSON bodies (Ronald Holshausen, Fri Mar 9 15:44:11 2018 +1100)
* 5e824ba - Implemented applying a generator based on a key to a JSON document (Ronald Holshausen, Fri Mar 9 15:05:08 2018 +1100)
* 35eb4d1 - Simplify updating the json document by using the Serde pointer functions (Ronald Holshausen, Mon Mar 5 14:24:47 2018 +1100)
* d688d59 - Removed use of RefCell (Ronald Holshausen, Mon Mar 5 10:44:02 2018 +1100)
* 691b14c - Merge branch 'master' into v3-spec (Ronald Holshausen, Sun Mar 4 17:10:14 2018 +1100)
* 6597141 - WIP - start of implementation of applying generators to the bodies (Ronald Holshausen, Sun Mar 4 17:01:11 2018 +1100)
* a2d3a27 - fix json matcher so root value strings and key value pairs are both valid (Samuel McKendrick, Mon Feb 12 15:29:58 2018 +0100)
* a76bb5a - Cleaned up all the compiler warnings (Ronald Holshausen, Sun Nov 19 11:29:47 2017 +1100)
* efb17a1 - When there is no content type, default to text/plain (Ronald Holshausen, Sun Nov 19 10:58:17 2017 +1100)
* ec89fcd - Implemented generators being applied to query parameters (Ronald Holshausen, Tue Nov 7 17:23:21 2017 +1100)
* c4d424b - Wired in the generated request/response into the mock server and verifier (Ronald Holshausen, Tue Nov 7 16:27:01 2017 +1100)
* 308fe4d - Implemented writing the generators to the pact JSON (Ronald Holshausen, Tue Nov 7 16:09:51 2017 +1100)
* 051ecb7 - Implemented parsing the generators from the Pact JSON (Ronald Holshausen, Tue Nov 7 14:08:58 2017 +1100)
* 13558d6 - Basic generators working (Ronald Holshausen, Tue Nov 7 10:56:55 2017 +1100)
* 7fef36b - Merge branch 'v2-spec' into v3-spec (Ronald Holshausen, Sat Nov 4 12:49:07 2017 +1100)
* 7fb7a34 - bump version to 0.3.2 (Ronald Holshausen, Fri Nov 3 12:12:31 2017 +1100)
* a905bed - Cleaned up some compiler warnings (Ronald Holshausen, Sun Oct 22 12:26:09 2017 +1100)
* 940a0e3 - Reverted hyper to 0.9.x (Ronald Holshausen, Sun Oct 22 12:01:17 2017 +1100)
* fbe35d8 - Compiling after merge from v2-spec (Ronald Holshausen, Sun Oct 22 11:39:46 2017 +1100)
* 00dc75a - Bump version to 0.4.0 (Ronald Holshausen, Sun Oct 22 10:46:48 2017 +1100)
* 184127a - Merge branch 'v2-spec' into v3-spec (Ronald Holshausen, Sun Oct 22 10:32:31 2017 +1100)
* e82ee08 - Merge branch 'v2-spec' into v3-spec (Ronald Holshausen, Mon Oct 16 09:24:11 2017 +1100)
* 64ff667 - Upgraded the mock server implemenation to use Hyper 0.11.2 (Ronald Holshausen, Wed Sep 6 12:56:47 2017 +1000)
* 1d7ed25 - Upgraded all crates to the latest versions (Ronald Holshausen, Sun Aug 20 16:21:15 2017 +1000)
* 8f72bd4 - Cleaned up all imports and documentation after merge from master (Ronald Holshausen, Sun Aug 20 11:52:39 2017 +1000)
* ab667ca - pact_matching build passing after merge from master (Ronald Holshausen, Sun Aug 20 11:36:22 2017 +1000)
* 362753a - pact_matching compiling after merge from master (Ronald Holshausen, Sun Aug 20 10:55:29 2017 +1000)
* e5a93f3 - Merge branch 'master' into v3-spec (Ronald Holshausen, Sun Aug 20 09:53:48 2017 +1000)
* b56d11c - add enum values for V4 spec (Ronald Holshausen, Sun Aug 20 09:15:07 2017 +1000)
* b4e0e2a - re-enabled all the specification test cases (Ronald Holshausen, Sun Nov 13 16:23:45 2016 +1100)
* 9541a96 - Implemented matching with V3 format matchers (Ronald Holshausen, Sun Nov 13 16:01:33 2016 +1100)
* 2ed6b00 - Implemented serialisation of v3 format matchers to json (Ronald Holshausen, Sat Nov 12 19:37:25 2016 +1100)
* 6f322c1 - Implemented matching rule lookup for a rule category (Ronald Holshausen, Sat Nov 12 16:10:50 2016 +1100)
* 278978b - Load the old V2 format matchers into matching rules structure (Ronald Holshausen, Mon Oct 31 17:23:56 2016 +1100)
* c7119c0 - replaced matcher collection with a matching rules struct and implemented loading V3 format rules (Ronald Holshausen, Mon Oct 31 16:41:03 2016 +1100)
* 8797c6c - First successful build after merge from master (Ronald Holshausen, Sun Oct 23 11:59:55 2016 +1100)
* 639ac22 - fixes after merge in from master (Ronald Holshausen, Sun Oct 23 10:45:54 2016 +1100)
* 7361688 - moved missing files after merge from master (Ronald Holshausen, Sun Oct 23 10:19:31 2016 +1100)
* 49e45f7 - Merge branch 'master' into v3-spec (Ronald Holshausen, Sun Oct 23 10:10:40 2016 +1100)

## 0.3.1 - Converted OptionalBody::Present to take a Vec<u8>

* 24e3f73 - Converted OptionalBody::Present to take a Vec<u8> #19 (Ronald Holshausen, Sun Oct 22 18:04:46 2017 +1100)
* cd564ac - Added cargo update after to release script after bumping the version (Ronald Holshausen, Fri Oct 20 09:34:57 2017 +1100)
* c345796 - Fix the release script as docs are no longer generated by build (Ronald Holshausen, Fri Oct 20 09:22:19 2017 +1100)
* c507222 - Correct the version in the readme (Ronald Holshausen, Fri Oct 20 09:21:55 2017 +1100)
* aa5cc66 - bump version to 0.3.1 (Ronald Holshausen, Fri Oct 20 09:11:35 2017 +1100)

## 0.3.0 - Backported matching rules from V3 branch

* ac94388 - Tests are now all passing #20 (Ronald Holshausen, Thu Oct 19 15:14:25 2017 +1100)
* d990729 - Some code cleanup #20 (Ronald Holshausen, Wed Oct 18 16:32:37 2017 +1100)
* db6100e - Updated the consumer DSL to use the matching rules (compiling, but tests are failing) #20 (Ronald Holshausen, Wed Oct 18 15:48:23 2017 +1100)
* 161d69d - Added a test to confirm the min/max matchers are writing their values in the correct form #20 (Ronald Holshausen, Wed Oct 18 14:19:34 2017 +1100)
* c983c63 - Bump versions to 0.3.0 (Ronald Holshausen, Wed Oct 18 13:54:46 2017 +1100)
* 941d0de - Backported the matching rules from the V3 branch #20 (Ronald Holshausen, Mon Oct 31 16:41:03 2016 +1100)
* 01f09be - [BUG] pact_matching: Parse JSON paths with `_` (Eric Kidd, Tue Oct 10 08:55:44 2017 -0400)
* d6f867b - Replace `Term` with open-ended `Matchable` trait (Eric Kidd, Fri Oct 6 06:56:02 2017 -0400)
* 3f42e50 - Implement `JsonPattern` w/o matcher support (Eric Kidd, Wed Oct 4 13:40:09 2017 -0400)
* 06e92e5 - Refer to local libs using version+paths (Eric Kidd, Tue Oct 3 06:22:23 2017 -0400)
* 691c9e6 - Fetch test JSON paths in a more reliable fashion (Eric Kidd, Mon Oct 2 07:20:48 2017 -0400)
* 7afd258 - Update all the cargo manifest versions and commit the cargo lock files (Ronald Holshausen, Wed May 17 10:37:44 2017 +1000)
* bb278d3 - bump version to 0.2.3 (Anthony Damtsis, Tue May 16 17:09:58 2017 +1000)

## 0.2.2 - Bugfix Release

* 3399f7c - Merge pull request #13 from adamtsis/remove-deprecated-json-lib (Ronald Holshausen, Tue May 16 15:56:22 2017 +1000)
* efe4ca7 - Cleanup unused imports and unreachable pattern warning messages (Anthony Damtsis, Tue May 16 10:31:29 2017 +1000)
* a59fb98 - Migrate remaining pact modules over to serde (Anthony Damtsis, Mon May 15 16:59:04 2017 +1000)
* 142d550 - Merge pull request #12 from adamtsis/remove-deprecated-json-lib (Ronald Holshausen, Mon May 8 16:13:30 2017 +1000)
* ff1b676 - Change spec test generator template to use serde library (Anthony Damtsis, Mon May 8 12:23:28 2017 +1000)
* cdecc71 - Simplify json handling logic when running comparisons (Anthony Damtsis, Fri May 5 15:48:17 2017 +1000)
* f725ddc - Remove commented crate (Anthony Damtsis, Fri May 5 15:39:27 2017 +1000)
* bd6fa9b - Fixed remaining serialisation bugs with writing pact files (Anthony Damtsis, Fri May 5 15:27:59 2017 +1000)
* d1bd5ef - Changed type parameter to be a Hashmap when deserialising payload body (Anthony Damtsis, Fri May 5 14:09:54 2017 +1000)
* 83a8b7e - Fix incorrectly deserialised json objects in tests (Anthony Damtsis, Fri May 5 13:23:03 2017 +1000)
* 21cb633 - Compiles now - lots of test failures to work through (Anthony Damtsis, Fri May 5 13:27:36 2017 +1000)
* 1e8531b - Begun work to replace rustc_serialize - work in progress (Anthony Damtsis, Mon May 1 14:52:08 2017 +1000)
* 7982137 - Merge pull request #11 from adamtsis/camel-case-specification (Ronald Holshausen, Mon May 1 13:49:09 2017 +1000)
* 9a29085 - Supports camel case format pact specifications (Anthony Damtsis, Thu Apr 27 15:03:15 2017 +1000)
* 4dabb31 - Simplify call to HeaderMismatch destructure (Anthony Damtsis, Wed Apr 26 20:48:32 2017 +1000)
* 381a85e - Explicitly clone the borrowed header reference (Anthony Damtsis, Wed Apr 26 18:25:04 2017 +1000)
* 755ada8 - Fixed compiler warning messages (Anthony Damtsis, Wed Apr 26 18:12:55 2017 +1000)
* a2847c6 - Replace .to_string() refs with s!() macro (Anthony Damtsis, Wed Apr 26 17:28:19 2017 +1000)
* c9eff21 - Support optional header parameters for 'accept' and 'content-type' (Anthony Damtsis, Wed Apr 26 15:36:08 2017 +1000)
* 26f91a5 - Ensure mismatch for HeaderMismatch is consistent for EqualityMatcher (Anthony Damtsis, Wed Apr 26 15:32:30 2017 +1000)
* a501309 - bump version to 0.2.2 (Ronald Holshausen, Sun Oct 9 16:14:45 2016 +1100)
* 227b61b - correct the doc URL in the cargo manifest (Ronald Holshausen, Sun Oct 9 16:13:27 2016 +1100)
* 5233cfa - correct updating the documentation URL in the release script (Ronald Holshausen, Sun Oct 9 16:08:33 2016 +1100)

## 0.2.1 - Changes required for verifying V2 pacts

* 574e072 - upadte versions for V2 branch and fix an issue with loading JSON bodies encoded as a string (Ronald Holshausen, Sun Oct 9 15:31:57 2016 +1100)
* a21973a - Get the build passing after merge from V1.1 branch (Ronald Holshausen, Sun Oct 9 13:47:09 2016 +1100)
* 341607c - Merge branch 'v1.1-spec' into v2-spec (Ronald Holshausen, Sun Oct 9 12:10:12 2016 +1100)
* 797c9b9 - correct the URLs to the repos (Ronald Holshausen, Sat Oct 8 17:10:56 2016 +1100)
* b7e038e - bump version to 0.1.2 (Ronald Holshausen, Sat Oct 8 16:54:52 2016 +1100)

## 0.1.1 - Changes required for verifying V1.1 pacts

* 373f82d - regenerated the specification tests (Ronald Holshausen, Sat Oct 8 16:50:38 2016 +1100)
* 388a19f - update references (Ronald Holshausen, Sat Oct 8 16:46:11 2016 +1100)
* a46dabb - update all references to V1 spec after merge (Ronald Holshausen, Sat Oct 8 16:20:51 2016 +1100)
* 63ae7e4 - get project compiling after merge from V1 branch (Ronald Holshausen, Sat Oct 8 15:53:22 2016 +1100)
* 1d6d4f8 - Merge branch 'v1-spec' into v1.1-spec (Ronald Holshausen, Sat Oct 8 15:44:25 2016 +1100)
* 04d9e5f - update the docs for the pact consumer library (Ronald Holshausen, Mon Sep 26 23:06:19 2016 +1000)
* 7dd04e6 - update the release scripts to point the docs to docs.rs (Ronald Holshausen, Mon Sep 26 21:49:35 2016 +1000)
* d7c859c - bump version to 0.0.3 (Ronald Holshausen, Mon Sep 26 20:55:12 2016 +1000)
* 02421d5 - exclude IntelliJ files from packaging (Ronald Holshausen, Mon Sep 26 20:46:47 2016 +1000)

## 0.1.0 - V1.1 Specification Implementation

* 140526d - Implement V1.1 matching (Ronald Holshausen, Tue Jun 28 15:58:35 2016 +1000)
* 4224875 - update readmes and bump versions for V1.1 implementation (Ronald Holshausen, Tue Jun 28 15:05:39 2016 +1000)
* b5dc6d2 - added some additional pact loading tests (Ronald Holshausen, Tue Jun 28 14:35:48 2016 +1000)
* 44ec659 - in prep for supporting other spec versions, take the version into account when parsing a pact file (Ronald Holshausen, Tue Jun 28 11:40:07 2016 +1000)
* 91d6d62 - removed the v1 from the project path, will use a git branch instead (Ronald Holshausen, Mon Jun 27 22:09:32 2016 +1000)

## 0.0.2 - Fixes required for verifying pacts

* 429ef78 - Implemented handling state change requests in the pact verifier (Ronald Holshausen, Sun Sep 25 15:55:18 2016 +1000)
* cc1e359 - implemented rudimentary diff output on json bodies (Ronald Holshausen, Sun Sep 25 13:43:45 2016 +1000)
* cd367e6 - Use a regex to detect the content type to handle extended types (e.g application/hal+json) (Ronald Holshausen, Sat Sep 24 17:14:16 2016 +1000)
* 0d69675 - Implemented pact test where there are no pacts in the pact broker (Ronald Holshausen, Sun Sep 18 17:41:51 2016 +1000)
* bc3405c - implemented handling templated HAL URLs (Ronald Holshausen, Sun Sep 18 13:58:54 2016 +1000)
* c3a8a30 - renamed the pact_matching and pact_mock_server directories (Ronald Holshausen, Sun Sep 18 11:07:32 2016 +1000)

## 0.0.1 - Second Feature Release

* 25bf4d0 - added changelog (Ronald Holshausen, Sun Jun 26 15:20:23 2016 +1000)
* 4c60f07 - replace rustful with webmachine (Ronald Holshausen, Thu Jun 16 17:31:11 2016 +1000)
* 7dc4b52 - implemented merging of pact files when writing (Ronald Holshausen, Thu Jun 9 17:34:02 2016 +1000)
* 801f24c - update the github readmes to point to the published rust docs (Ronald Holshausen, Wed Jun 8 10:42:30 2016 +1000)
* ecc4018 - add example pact files for testing (Ronald Holshausen, Wed Jun 8 09:36:35 2016 +1000)
* bbf6fbb - make test not be dependent on the library version (Ronald Holshausen, Wed Jun 1 17:23:02 2016 +1000)
* 937360d - Oops, test generates a pact with the version in the metadata (Ronald Holshausen, Wed Jun 1 17:07:29 2016 +1000)
* e957983 - bump libpact_matching version (Ronald Holshausen, Wed Jun 1 17:00:41 2016 +1000)

## 0.0.0 - First Release
