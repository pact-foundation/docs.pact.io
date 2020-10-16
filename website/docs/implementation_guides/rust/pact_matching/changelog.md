---
title: pact_matching
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_matching/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

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
