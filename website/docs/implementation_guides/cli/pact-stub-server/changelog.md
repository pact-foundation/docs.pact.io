---
title: pact-stub-server
custom_edit_url: https://github.com/pact-foundation/pact-stub-server/edit/master/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-stub-server repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## Source Code

https://github.com/pact-foundation/pact-stub-server/tree/master


## 0.7.0 - [Feature Release]

* ac5344e - fix: remove pathname from release artifact shasum (Yousaf Nabi, Fri Oct 24 13:56:27 2025 +0100)
* 45e0056 - feat: add file watch mode for hot reloading pact files/dirs (Yousaf Nabi, Thu Oct 23 23:43:13 2025 +0100)
* eebe3fe - feat: update to hyper 1.x / latest tower (Yousaf Nabi, Thu Oct 23 23:35:30 2025 +0100)
* 56ccc6a - feat: cli as lib (Yousaf Nabi, Sat Sep 27 11:47:46 2025 +0100)

## 0.6.2 - Correct the insecure_tls flag with a Pact Broker

* a0fd845 - fix: Honour the insecure_tls flag when fetching Pacts from a Pact Broker #75 (Ronald Holshausen, Tue May 20 16:28:25 2025 +1000)

## 0.6.1 - Performance Improvements


## 0.6.0 - Feature Release

* 2325de3 - feat: reduce executable size (Yousaf Nabi, Thu Apr 25 19:06:53 2024 +0100)
* efa86ca - feat: linux musl static bins / windows aarch64 (Yousaf Nabi, Thu Apr 25 17:56:00 2024 +0100)

## 0.5.3 - add regex support with consumer/provider name filtering

* 2229a40 - feat: correct retrieving regex values from CLI args #54 (Ronald Holshausen, Tue Apr 11 13:55:16 2023 +1000)
* cb982da - feat: add regex support with consumer/provider name filtering #54 (Ronald Holshausen, Tue Apr 11 13:43:27 2023 +1000)

## 0.5.2 - Support linux with glibc 2.18+ and aarch64 (ARM64) binaries

* 2322656 - fix: file extension option should only be given once (Ronald Holshausen, Mon Oct 24 17:14:50 2022 +1100)
* ca3c5d0 - fix: build linux executable with Debian Stretch (supports GLibC 2.18+) #39 (Ronald Holshausen, Mon Oct 24 11:28:37 2022 +1100)

## 0.5.1 - Bugfix Release

* d864952 - fix: Upgrade pact_matching crate to 0.12.9 (fixes type matches with query parameters) #48 (Ronald Holshausen, Fri Jun 10 15:49:30 2022 +1000)

## 0.5.0 - Fixes + upgrade to V4 Pact

* baa620a - feat: add filters for consumer and provider names #46 (Ronald Holshausen, Wed Jun 8 15:21:38 2022 +1000)
* e193558 - feat: Upgrade all Pact crates to support V4 and async (Ronald Holshausen, Wed Jun 8 11:28:57 2022 +1000)
* 4150660 - fix: remove linked openssl from application binary #47 (Ronald Holshausen, Tue Jun 7 13:33:46 2022 +1000)
* 69722f2 - Merge pull request #45 from counterbeing/master (Ronald Holshausen, Mon Nov 22 15:43:53 2021 +1100)
* b24ee5a - fix: docker/Dockerfile to reduce vulnerabilities (snyk-bot, Sat Sep 4 03:57:21 2021 +0000)

## 0.4.4 - option to fetch pacts from Pact broker

* 0d7ab70 - fix: correct cargo manefest dependency version (Ronald Holshausen, Mon Jan 25 10:24:26 2021 +1100)
* a5ec95d - feat: added option to fetch pacts from Pact broker (Ronald Holshausen, Sun Jan 24 18:22:48 2021 +1100)
* 5b080b8 - fix: correct cargo manefest (Ronald Holshausen, Sun Jan 24 14:38:54 2021 +1100)

## 0.4.3 - Performance optmisation

* f9515fd - fix: tests after performance optimisation (Ronald Holshausen, Sun Jul 26 12:34:11 2020 +1000)
* 998ce51 - feat: filter interactions by method and path first (Ronald Holshausen, Sun Jul 26 12:18:50 2020 +1000)
* a48d40e - feat: re-enable HTTP keepalive and get all interactions when server starts (Ronald Holshausen, Sun Jul 26 11:50:46 2020 +1000)
* 6a2d2bf - fix: when loading files from a directory, only load json files (Ronald Holshausen, Sun Jul 26 10:24:55 2020 +1000)

## 0.4.2 - Fix concurrency issue

* 20ea51f - fix: start the hyper server on a blocking thread (Ronald Holshausen, Tue Jul 14 10:49:37 2020 +1000)
* 558baae - fix: tests after updating crates (Ronald Holshausen, Tue Jul 14 10:29:18 2020 +1000)

## 0.4.1 - Update to latest Pact matching crate

* 9fad496 - feat: update to latest pact matching crate (Ronald Holshausen, Fri Jun 12 13:03:50 2020 +1000)
* 729674c - feat: add option to include empty provider states when using a filter #34 (Ronald Holshausen, Fri Jun 12 11:42:41 2020 +1000)

## 0.4.0 - Upgrade hyper to 0.13 and Rust async/await

* 772fb19 - fix: GCC is not available for i686 targets on Appveyor (Ronald Holshausen, Sat Jan 18 12:55:37 2020 +1100)

## 0.3.2 - CORS referer option

* d69aa92 - feat: update readme with new cors flag #32 (Ronald Holshausen, Sat Jan 18 12:34:28 2020 +1100)
* e1865fb - feat: add option to set cors origin to the referer header #32 (Ronald Holshausen, Sat Jan 18 12:24:04 2020 +1100)

## 0.3.1 - bearer tokens and headers with multiple values

* a93f256 - feat: add support for bearer tokens (Ronald Holshausen, Sun Aug 11 11:07:19 2019 +1000)
* be2a3f4 - fix: support headers with multiple values #31 (Ronald Holshausen, Sun Aug 11 10:26:21 2019 +1000)

## 0.3.0 - Bugfix Release

* e741007 - fix: upgrade to latest pact matching library (Ronald Holshausen, Sat Jun 29 19:43:12 2019 +1000)
* 990587b - fix: panic if provider_state_header_name is not given (Ronald Holshausen, Sat Jun 29 17:44:31 2019 +1000)

## 0.3.0 - Provider state as request header parameter


## 0.2.2 - Disabling TLS cert validation and filtering by provider state

* df12a27 - feat: add a filter by provider state #19 (Ronald Holshausen, Sun Mar 3 16:21:42 2019 +1100)
* 7d0bc26 - feat: updated readme about flag to disable TLS cert validation #27 (Ronald Holshausen, Sun Mar 3 15:11:27 2019 +1100)
* 849c10a - feat: added a flag to disable TLS cert validation #27 (Ronald Holshausen, Sun Mar 3 15:04:36 2019 +1100)
* 50298e6 - fix: make warning message more explicit about what it is doing #24 (Ronald Holshausen, Sat Mar 2 12:27:18 2019 +1100)

## 0.2.1 - Bugfix Release

* f5870d5 - fix: upgraded pact matching to 0.5.0 and corrected logging #22 #21 #20 (Ronald Holshausen, Sun Jan 6 15:17:23 2019 +1100)

## 0.2.0 - Bugfix Release

* 0699283 - fix: Use a chain of futures so reading the body does not block the event loop #18 #16 (Ronald Holshausen, Mon Nov 5 15:39:49 2018 +1100)

## 0.1.1 - Bugfix Release

* 7e1e64e - fix: only add a cors origin header if there is not one #15 (Ronald Holshausen, Sat Sep 8 15:37:32 2018 +1000)
* 6f110ed - fix: add some tests around content type header #14 (Ronald Holshausen, Sat Sep 8 15:25:37 2018 +1000)
* 180f30d - fix: remove static content type header #14 (Ronald Holshausen, Sat Sep 8 14:50:26 2018 +1000)

## 0.1.0 - Support for loading pacts from HTTPS

* 8da3496 - feat: bump minor version (Ronald Holshausen, Sat Aug 25 21:02:26 2018 +1000)
* 1f2855e - feat: implemented support for fetching pacts using HTTPS #13 (Ronald Holshausen, Sat Aug 25 20:58:32 2018 +1000)

## 0.0.10 - Bugfix Release

* 7f17c68 - fix: update to pact-matching 0.4.4 (Ronald Holshausen, Sat Aug 11 15:25:07 2018 +1000)

## 0.0.9 - Bugfix Release

* 4b66646 - fix: upgrade the pact matching to support query parameters with path expressions #11 (Ronald Holshausen, Sat Jun 30 17:19:39 2018 +1000)

## 0.0.8 - Upgrade to V3 spec + bugfixes

* 4f1a3fe - fix: for PUT, POST and PATCH requests, return the first response if there is no body #10 (Ronald Holshausen, Sun May 13 15:02:45 2018 +1000)
* f3ffc83 - fix: for PUT, POST and PATCH requests, also check the body of the request #10 (Ronald Holshausen, Sun May 13 14:51:29 2018 +1000)
* ef8ec2c - Merge pull request #7 from stones/fix/cors-content-type-headers (Ronald Holshausen, Mon Nov 13 15:15:25 2017 +1100)
* 406bdd0 - Merge pull request #6 from stepan-leibo/patch-1 (Ronald Holshausen, Mon Nov 13 15:14:20 2017 +1100)

## 0.0.7 - Bugfix Release


## 0.0.6 - Updated pact_matching to latest version


## 0.0.5 - Additional CORS headers


## 0.0.4 - Corrected CORS request method


## 0.0.3 - Add option to auto-respond to CORS pre-flight requests


## 0.0.2 - Bugfix Release


## 0.0.1 - return the closest matching interaction, based on the body and headers


## 0.0.0 - First Release


##
