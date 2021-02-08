---
title: pact_mock_server_ffi
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_mock_server_ffi/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## 0.0.15 - use a file system lock when merging pact files

* 9976e80 - feat: added read locks and a mutex guard to reading and writing pacts (Ronald Holshausen, Mon Feb 8 11:58:52 2021 +1100)

## 0.0.14 - Updated dependencies


## 0.0.13 - Cleanup outdated crates


## 0.0.12 - Supports generators associated with array contains matcher variants

* 51eef86 - fix: return version of the mock server via FFI without heap allocation #80 (Ronald Holshausen, Wed Dec 30 14:55:08 2020 +1100)
* 638059d - feat: return version of the mock server via FFI (Matt Fellows, Mon Nov 30 18:06:55 2020 +1100)

## 0.0.11 - Bugfix Release


## 0.0.10 - arrayContains matcher + text/xml content type

* f090323 - feat: updated integration JSON to handle array contains matcher (Ronald Holshausen, Thu Oct 15 15:31:47 2020 +1100)

## 0.0.9 - CORS pre-flight support

* 29ba743 - feat: add a mock server config struct (Ronald Holshausen, Thu Sep 24 10:30:59 2020 +1000)

## 0.0.9 - CORS pre-flight support

* 29ba743 - feat: add a mock server config struct (Ronald Holshausen, Thu Sep 24 10:30:59 2020 +1000)

## 0.0.8 - Supports TLS CA certs + better content type handling

* 6cba6ad - feat: implemented basic message verification with the verifier cli (Ronald Holshausen, Mon Sep 14 13:48:27 2020 +1000)
* 2f16b34 - feat: add function to retrieve the TLS CA cert (Matt Fellows, Sun Aug 9 00:18:22 2020 +1000)
* 5316030 - feat: added a struct for handling content types (Ronald Holshausen, Sun Jun 28 13:31:22 2020 +1000)

## 0.0.7 - Updated XML Matching and Date/Time parsing

* 45fc1a0 - fix: cleanup warnings and fixed test (Ronald Holshausen, Fri Jun 12 10:51:44 2020 +1000)
* 4996c0f - feat: make body processing functions public so other language impl can use them (Ronald Holshausen, Thu Jun 4 16:02:55 2020 +1000)

## 0.0.6 - Refactor


## 0.0.5 - matching multipart form posts

* dac517b - feat: implemented FFI support for matching multipart form posts (Ronald Holshausen, Sun May 24 11:17:58 2020 +1000)

## 0.0.4 - Bugfix Release

* c93e364 - fix: correct the backing array list for query parameters from FFI call (Ronald Holshausen, Wed May 13 11:52:55 2020 +1000)
* 9c84713 - fix: correct the backing arary list for headers from FFI call (Ronald Holshausen, Tue May 12 16:45:38 2020 +1000)

## 0.0.3 - matching of binary payloads + fixes handling provider state parameters

* 3a12b6f - fix: incorrectly handling provider state parameters from FFI call (Ronald Holshausen, Fri May 8 16:31:45 2020 +1000)
* 708db47 - feat: implement matching of binary payloads (application/octet-stream) (Ronald Holshausen, Fri May 8 15:52:03 2020 +1000)
* 136c61b - feat: update FFI to support provider states with parameters (Ronald Holshausen, Wed May 6 15:50:10 2020 +1000)

## 0.0.2 - Bugfix Release

* 75c965e - fix: correct issue with headers/query with multiple values (Ronald Holshausen, Tue May 5 12:53:28 2020 +1000)
* 2eba288 - fix: update conan test packages to use updated API (Ronald Holshausen, Tue May 5 12:52:28 2020 +1000)
* 2679653 - fix: for failing integration test (Ronald Holshausen, Fri May 1 16:16:30 2020 +1000)
* 9b1c192 - fix: use a single result enum #66 (Ronald Holshausen, Fri May 1 15:42:27 2020 +1000)
* da885a3 - feat: add support for TLS with the mock server #65 (Ronald Holshausen, Thu Apr 30 16:41:30 2020 +1000)
* a45d0c3 - fix: FFI mismatch json should have the actual values as UTF-8 string not bytes #64 (Ronald Holshausen, Thu Apr 30 11:16:25 2020 +1000)
* b30fd2d - feat: add support functions for regular expressions for foreign DSLs (Ronald Holshausen, Tue Apr 28 17:33:48 2020 +1000)
* 4287f0e - fix: correct the windows lib name in conan package (Ronald Holshausen, Mon Apr 27 14:18:01 2020 +1000)
* c1015d5 - fix: correct the windows lib name in conan package (Ronald Holshausen, Mon Apr 27 14:02:44 2020 +1000)
* a0d701e - fix: Macos on conan package (Ronald Holshausen, Fri Apr 24 15:23:53 2020 +1000)
* bb1e35e - fix: Windows URL on conan package (Ronald Holshausen, Fri Apr 24 15:00:24 2020 +1000)
* a13c0fc - fix: Add OSX to the conan package (Ronald Holshausen, Fri Apr 24 14:46:49 2020 +1000)

## 0.0.1 - Changes to support C++ DSL

* 5f8d0a0 - feat: handle bodies with embedded matchers and generators (Ronald Holshausen, Thu Apr 23 12:25:05 2020 +1000)
* 0613180 - feat: add FFI function to create mock server from Pact handle (Ronald Holshausen, Wed Apr 22 17:01:34 2020 +1000)
* fc17d30 - feat: implemented FFI methods for query parameters, headers and bodies (Ronald Holshausen, Wed Apr 22 13:03:52 2020 +1000)
* 9ec8817 - feat: added interaction handle (Ronald Holshausen, Fri Apr 17 18:28:11 2020 +1000)
* d357ad2 - feat: create conan package for linking with C++ projects (Ronald Holshausen, Thu Apr 16 18:00:24 2020 +1000)

## 0.0.0 - First Release
