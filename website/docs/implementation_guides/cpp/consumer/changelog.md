---
title: Consumer DSL Changelog
custom_edit_url: https://github.com/pact-foundation/pact-cplusplus/edit/master/consumer/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-cplusplus repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->


## 0.1.0 - Update to new pact_ffi lib and JFrog conan repositry

* 433fc19 - fix: Update to new pact_ffi lib and JFrog conan repositry (Ronald Holshausen, Mon Jul 12 11:05:14 2021 +1000)
* acb4e08 - fix: Fixed errors in consumer.cpp (Talank Baral, Fri Jul 9 14:39:48 2021 +0545)
* 1a00b53 - bump version to 0.0.7 (Ronald Holshausen, Tue Jan 12 16:07:34 2021 +1100)

## 0.0.6 - Fix release pipeline

* 08d45ce - bump version to 0.0.6 (Ronald Holshausen, Tue Jan 12 15:28:03 2021 +1100)

## 0.0.5 - support for MockServerURL generator in consumer DSL

* b66a905 - fix: try link test binary to ntdll on windows (Ronald Holshausen, Tue Jan 12 14:53:23 2021 +1100)
* e665719 - feat: add support for MockServerURL generator in consumer DSL (Ronald Holshausen, Tue Jan 12 14:36:13 2021 +1100)
* 1e4547d - feat: update to the latest pact_mock_server_ffi lib (Ronald Holshausen, Tue Jan 12 14:35:38 2021 +1100)
* e5004f9 - bump version to 0.0.5 (Ronald Holshausen, Fri Oct 30 15:49:26 2020 +1100)

## 0.0.4 - Array contains matcher

* 6840446 - feat: add support for array contains matcher (Ronald Holshausen, Fri Oct 30 15:35:33 2020 +1100)
* f68942c - bump version to 0.0.4 (Ronald Holshausen, Mon Sep 28 13:37:18 2020 +1000)

## 0.0.3 - Fixes from upstream pact_mock_server_ffi lib

* d140320 - fix: made min and max for type matcher optionals (Ronald Holshausen, Mon Jun 29 14:14:51 2020 +1000)
* b1df88c - fix: ConstrainedArrayLike should set the examples to the minimum (Ronald Holshausen, Mon Jun 29 13:30:09 2020 +1000)
* aa2ed2c - fix: missing const on Like function (Ronald Holshausen, Mon Jun 29 13:20:35 2020 +1000)
* e94a36b - bump version to 0.0.3 (Ronald Holshausen, Sun May 24 12:41:59 2020 +1000)

## 0.0.2 - Code cleanup + support multipart form posts with binary files

* 9bfdf17 - feat: support multipart form posts with binary files (Ronald Holshausen, Sun May 24 12:33:04 2020 +1000)
* e29e8f9 - bump version to 0.0.2 (Ronald Holshausen, Fri May 15 17:05:39 2020 +1000)

## 0.0.1 - Bugfixes + Updated Matcher DSL

* 95c8f51 - fix: URL matcher (Ronald Holshausen, Fri May 15 16:16:00 2020 +1000)
* e6107c1 - fix: accedentially committed local conan file (Ronald Holshausen, Fri May 15 15:13:02 2020 +1000)
* 2cf0636 - fix: for failing test (Ronald Holshausen, Fri May 15 14:31:49 2020 +1000)
* 639ea47 - feat: implement support for all the remaining matchers (Ronald Holshausen, Fri May 15 14:03:23 2020 +1000)
* 4b6bd0d - feat: implemented JSON DSL from feedback from Aligntech (Ronald Holshausen, Wed May 13 18:02:08 2020 +1000)
* e44dac4 - fix: tests on Windows (Ronald Holshausen, Tue May 12 16:08:27 2020 +1000)
* 3d8b5fc - feat: support matching binary payloads (Ronald Holshausen, Tue May 12 13:54:10 2020 +1000)
* c1db530 - fix: Google test matches regex does not work on Windows (Ronald Holshausen, Tue May 5 18:14:19 2020 +1000)
* 405ef68 - fix: remove traling slash from mock server URL (Ronald Holshausen, Tue May 5 17:50:23 2020 +1000)
* d5043f8 - Revert "fix: revert create mock server call (updated API unreleased)" (Ronald Holshausen, Tue May 5 16:18:16 2020 +1000)
* cba14f1 - fix: revert create mock server call (updated API unreleased) (Ronald Holshausen, Tue May 5 16:10:42 2020 +1000)
* c3f802c - fix: add test with multiple header values (Ronald Holshausen, Tue May 5 15:32:06 2020 +1000)
* f312e92 - feat: added decimal and regular expression matching to consumer DSL (Ronald Holshausen, Tue May 5 11:50:37 2020 +1000)
* 2b4be55 - Revert "Revert "bump version to 0.0.1"" (Ronald Holshausen, Tue Apr 28 15:03:46 2020 +1000)

## 0.0.0 - First release

* e2b3212 - fix: the conan recipe needs all the requires (Ronald Holshausen, Mon Apr 27 16:52:15 2020 +1000)
* d421e41 - feat: add conan package for DSL (Ronald Holshausen, Mon Apr 27 16:24:53 2020 +1000)
* 070997b - fix: can not pass references to closures with Visual C++ (Ronald Holshausen, Mon Apr 27 15:42:19 2020 +1000)
* d933412 - fix: extra libs are needed in Windows (Ronald Holshausen, Mon Apr 27 14:05:30 2020 +1000)
* e222347 - fix: need to convert back from UTF-16 on Windows (Ronald Holshausen, Mon Apr 27 10:23:55 2020 +1000)
* a8f69be - fix: need to convert strings to string_t type on Windows (Ronald Holshausen, Mon Apr 27 10:01:12 2020 +1000)
* 8866aef - Revert "fix: remove the microsoft platform string mmacros" (Ronald Holshausen, Mon Apr 27 09:59:03 2020 +1000)
* 751f498 - fix: remove the microsoft platform string mmacros (Ronald Holshausen, Mon Apr 27 09:44:50 2020 +1000)
* 10bda25 - fix: compiler error on Windows (Ronald Holshausen, Mon Apr 27 09:39:32 2020 +1000)
* bafa9fc - fix: changes needed for Windows and OSX (Ronald Holshausen, Fri Apr 24 17:35:05 2020 +1000)
* dc64e89 - fix: removed logging library as it was not compiling on CI (Ronald Holshausen, Fri Apr 24 17:13:58 2020 +1000)
* e58f8f2 - feat: working consumer test (Ronald Holshausen, Thu Apr 23 16:07:52 2020 +1000)
* 497be33 - feat: got todo app matchers working (Ronald Holshausen, Thu Apr 23 12:16:39 2020 +1000)
* 7d01bc0 - feat: got a basic consumer test working (Ronald Holshausen, Wed Apr 22 17:03:08 2020 +1000)
* 6723f8d - feat: implemented basic support for JSON bodies (Ronald Holshausen, Wed Apr 22 13:06:32 2020 +1000)
* 6729c10 - feat: implemented interaction handles for consumer DSL (Ronald Holshausen, Fri Apr 17 18:29:56 2020 +1000)
