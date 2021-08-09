---
title: Changelog
custom_edit_url: https://github.com/pact-foundation/pact-go/edit/master/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-go repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->


## Versions

### v1.6.4 (09 August 2021)
  * [01b8e81](https://github.com/pact-foundation/pact-go/commit/01b8e81) - fix: fixed linter errors in dsl/pact (antklim, Fri Jul 30 17:27:18 2021 +1000)
  * [5a5ef03](https://github.com/pact-foundation/pact-go/commit/5a5ef03) - fix: fixed linter errors in client/service_manager (antklim, Fri Jul 30 17:17:37 2021 +1000)
  * [72a05bf](https://github.com/pact-foundation/pact-go/commit/72a05bf) - fix: fixing linter errors in client/service_manager (antklim, Fri Jul 30 17:14:16 2021 +1000)
  * [60ddda1](https://github.com/pact-foundation/pact-go/commit/60ddda1) - fix: fixed linter errors in dsl/client (antklim, Fri Jul 30 17:09:11 2021 +1000)
  * [d88f9c3](https://github.com/pact-foundation/pact-go/commit/d88f9c3) - fix: fixing linter errors in dsl/client (antklim, Fri Jul 30 17:06:45 2021 +1000)
  * [4f57f48](https://github.com/pact-foundation/pact-go/commit/4f57f48) - fix: fixing linter error in dsl/pact (antklim, Fri Jul 30 16:57:38 2021 +1000)
  * [6bc61f4](https://github.com/pact-foundation/pact-go/commit/6bc61f4) - fix: fixing linter in dsl and client packages (antklim, Fri Jul 30 12:56:10 2021 +1000)
  * [1ccc97e](https://github.com/pact-foundation/pact-go/commit/1ccc97e) - fix: fixed linter errors in test files (antklim, Fri Jul 30 12:09:44 2021 +1000)

### v1.6.3 (09 August 2021)
  * [de0bb5e](https://github.com/pact-foundation/pact-go/commit/de0bb5e) - feat: support release and environment consumer version selectors (antklim, Thu Jul 29 17:57:40 2021 +1000)

### v1.5.3 (03 July 2021)
  * [5903b70](https://github.com/pact-foundation/pact-go/commit/5903b70) - fix: handle verification response correctly (bbmokus, Fri Jul 2 16:49:11 2021 +0200)
  * [bc10b4b](https://github.com/pact-foundation/pact-go/commit/bc10b4b) - fix: Dockerfile to reduce vulnerabilities (snyk-bot, Wed Mar 31 06:18:39 2021 +0000)

### v1.5.2 (25 March 2021)
  * [a461ee3](https://github.com/pact-foundation/pact-go/commit/a461ee3) - fix: pass PactLogDir to verifier binary. Fixes #156 (Matt Fellows, Thu Mar 25 13:14:45 2021 +1100)

### v1.5.1 (09 October 2020)
  * [65822cd](https://github.com/pact-foundation/pact-go/commit/65822cd) - fix: misleading error message in certain verification scenarios (Matt Fellows, Fri Oct 9 23:59:37 2020 +1100)

### v1.5.0 (08 October 2020)
  * [d3abbd8](https://github.com/pact-foundation/pact-go/commit/d3abbd8) - feat: allow setting of ProviderTags on VerifyMessageRequest (James Halsall, Tue Sep 15 08:57:24 2020 +0100)

### v1.4.4 (14 August 2020)
  * [a0227bb](https://github.com/pact-foundation/pact-go/commit/a0227bb) - fix: make tests fail on non-zero status (Matt Fellows, Fri Aug 7 14:37:42 2020 +1000)
  * [a7d9596](https://github.com/pact-foundation/pact-go/commit/a7d9596) - fix: timeout in integration test (Matt Fellows, Fri Aug 7 14:18:24 2020 +1000)
  * [4fe810d](https://github.com/pact-foundation/pact-go/commit/4fe810d) - fix: race in v2 client (Matt Fellows, Sun Aug 2 16:51:43 2020 +1000)
  * [2ea979c](https://github.com/pact-foundation/pact-go/commit/2ea979c) - fix: increase max size of pact output buffer (Cody Tatman, Thu Aug 6 18:11:26 2020 -0700)
  * [1c18257](https://github.com/pact-foundation/pact-go/commit/1c18257) - fix: address various misspellings (Ben Wells, Fri Jul 17 12:55:33 2020 +0100)
  * [146de2c](https://github.com/pact-foundation/pact-go/commit/146de2c) - fix: handle JSON tags correctly (Jonathan Nowak, Tue Jun 30 07:28:00 2020 +0200)
  * [18398ce](https://github.com/pact-foundation/pact-go/commit/18398ce) - feat: update to standalone 1.86.0 and support new verifier options: --log-level and --log-dir (Matt Fellows, Sat Jun 27 14:21:33 2020 +1000)

### v1.4.3 (09 June 2020)

### v1.4.2 (09 June 2020)
  * [41c3c52](https://github.com/pact-foundation/pact-go/commit/41c3c52) - fix: use stderr scanner on captureing stderr (Shin'ya UEOKA, Mon Jun 8 23:07:01 2020 +0000)

### v1.4.1 (22 May 2020)
  * [0dfbb4b](https://github.com/pact-foundation/pact-go/commit/0dfbb4b) - fix: remove deadlock for large provider tests (Matt Fellows, Thu May 21 22:06:06 2020 +1000)

### v1.4.0 (04 May 2020)
  * [ac9f226](https://github.com/pact-foundation/pact-go/commit/ac9f226) - fix: pass arguments to the provider verifier (Matt Fellows, Mon May 4 11:16:29 2020 +1000)

### v1.3.0 (09 April 2020)
  * [50b56b7](https://github.com/pact-foundation/pact-go/commit/50b56b7) - feat: add support for wip pacts (Matt Fellows, Thu Apr 9 10:18:06 2020 +1000)

### v1.2.0 (18 March 2020)
  * [fa558a6](https://github.com/pact-foundation/pact-go/commit/fa558a6) - fix: missing err check for http proxy (Matt Fellows, Fri Mar 6 16:52:58 2020 +1100)
  * [3310f72](https://github.com/pact-foundation/pact-go/commit/3310f72) - fix: broken consumer selector test (Matt Fellows, Fri Mar 6 15:19:34 2020 +1100)
  * [8d96456](https://github.com/pact-foundation/pact-go/commit/8d96456) - fix: update self-signed certificates to expire in 10 years (Matt Fellows, Mon Feb 24 15:21:03 2020 +1100)
  * [9a0fdf3](https://github.com/pact-foundation/pact-go/commit/9a0fdf3) - feat: pending pacts + selectors (Matt Fellows, Wed Jan 22 17:28:19 2020 +1100)
  * [aa4db89](https://github.com/pact-foundation/pact-go/commit/aa4db89) - fix: cleanup pact tests (Matt Fellows, Wed Feb 12 14:27:25 2020 +1100)
  * [2060e2c](https://github.com/pact-foundation/pact-go/commit/2060e2c) - fix: remove pending/selectors from pact examples (Matt Fellows, Wed Feb 12 13:53:50 2020 +1100)
  * [cdc7464](https://github.com/pact-foundation/pact-go/commit/cdc7464) - feat: add consumer version selectors (Matt Fellows, Wed Feb 5 11:25:37 2020 +1100)

### v1.1.0 (22 January 2020)

### v1.0.4 (01 November 2019)
  * [faab07c](https://github.com/pact-foundation/pact-go/commit/faab07c) - fix: os package missing in Publish. Fixes #121 (Matt Fellows, Fri Nov 1 08:32:17 2019 +1100)
  * [d844d45](https://github.com/pact-foundation/pact-go/commit/d844d45) - fix: test suite should fail if non-zero exit code (Matt Fellows, Fri Nov 1 08:31:25 2019 +1100)

### v1.0.3 (30 October 2019)

### v1.0.2 (24 October 2019)
  * [7851c37](https://github.com/pact-foundation/pact-go/commit/7851c37) - fix: add TRACE log level to ensure output is filtered (Matt Fellows, Thu Oct 24 16:33:45 2019 +1100)

### v1.0.1 (24 October 2019)
  * [2a4dcc8](https://github.com/pact-foundation/pact-go/commit/2a4dcc8) - fix: remove double escaping for regex matcher. Fixes #119 (Matt Fellows, Wed Oct 23 22:11:16 2019 +1100)
  * [cb2a377](https://github.com/pact-foundation/pact-go/commit/cb2a377) - fix: fail if ProviderVersion not provided but BrokerURL is supplied (Matt Fellows, Fri Oct 18 16:02:12 2019 +1100)

### v1.0.0 (18 October 2019)
  * [fce9b0c](https://github.com/pact-foundation/pact-go/commit/fce9b0c) - fix: clear out mock service interactions on verification failure. Fixes #108 (Matt Fellows, Sat Aug 17 23:21:51 2019 +1000)
  * [dba4481](https://github.com/pact-foundation/pact-go/commit/dba4481) - fix: pact broker is backwards compatible. Fixes #114 (Matt Fellows, Mon Jul 8 08:36:13 2019 +1000)
  * [e2362ea](https://github.com/pact-foundation/pact-go/commit/e2362ea) - fix: pass pact-file-write-mode to CLI #71 (Matt Fellows, Wed Mar 21 10:31:00 2018 +1100)

### v1.0.0-beta.8 (15 October 2019)
  * [fce9b0c](https://github.com/pact-foundation/pact-go/commit/fce9b0c) - fix: clear out mock service interactions on verification failure. Fixes #108 (Matt Fellows, Sat Aug 17 23:21:51 2019 +1000)
  * [dba4481](https://github.com/pact-foundation/pact-go/commit/dba4481) - fix: pact broker is backwards compatible. Fixes #114 (Matt Fellows, Mon Jul 8 08:36:13 2019 +1000)
  * [e2362ea](https://github.com/pact-foundation/pact-go/commit/e2362ea) - fix: pass pact-file-write-mode to CLI #71 (Matt Fellows, Wed Mar 21 10:31:00 2018 +1100)

### v1.0.0-beta.7 (08 July 2019)
  * [dba4481](https://github.com/pact-foundation/pact-go/commit/dba4481) - fix: pact broker is backwards compatible. Fixes #114 (Matt Fellows, Mon Jul 8 08:36:13 2019 +1000)
  * [e2362ea](https://github.com/pact-foundation/pact-go/commit/e2362ea) - fix: pass pact-file-write-mode to CLI #71 (Matt Fellows, Wed Mar 21 10:31:00 2018 +1100)

### v1.0.0-beta.6 (28 May 2019)
  * [e2362ea](https://github.com/pact-foundation/pact-go/commit/e2362ea) - fix: pass pact-file-write-mode to CLI #71 (Matt Fellows, Wed Mar 21 10:31:00 2018 +1100)

### v1.0.0-beta.5 (22 May 2019)
  * [e2362ea](https://github.com/pact-foundation/pact-go/commit/e2362ea) - fix: pass pact-file-write-mode to CLI #71 (Matt Fellows, Wed Mar 21 10:31:00 2018 +1100)

### v1.0.0-beta.4 (17 March 2019)
  * [e2362ea](https://github.com/pact-foundation/pact-go/commit/e2362ea) - fix: pass pact-file-write-mode to CLI #71 (Matt Fellows, Wed Mar 21 10:31:00 2018 +1100)

### v1.0.0-beta.3 (26 November 2018)
  * [e2362ea](https://github.com/pact-foundation/pact-go/commit/e2362ea) - fix: pass pact-file-write-mode to CLI #71 (Matt Fellows, Wed Mar 21 10:31:00 2018 +1100)

### v1.0.0-beta.2 (01 August 2018)
  * [e2362ea](https://github.com/pact-foundation/pact-go/commit/e2362ea) - fix: pass pact-file-write-mode to CLI #71 (Matt Fellows, Wed Mar 21 10:31:00 2018 +1100)

### v1.0.0-beta.1 (13 July 2018)
  * [e2362ea](https://github.com/pact-foundation/pact-go/commit/e2362ea) - fix: pass pact-file-write-mode to CLI #71 (Matt Fellows, Wed Mar 21 10:31:00 2018 +1100)

### v1.0.0-beta.1 (20 May 2018)
  * [eba2758](https://github.com/pact-foundation/pact-go/commit/eba2758) - fix: pass pact-file-write-mode to CLI #71 (Matt Fellows, Wed Mar 21 10:31:00 2018 +1100)

### v0.0.11 (10 December 2017)

### v0.0.10 (12 November 2017)

### v0.0.9 (12 November 2017)
  * [2201fe3](https://github.com/pact-foundation/pact-go/commit/2201fe3) - fix: make createSimplePact portable on windows (Matt Fellows, Sun Aug 6 18:58:13 2017 +1000)
  * [1836355](https://github.com/pact-foundation/pact-go/commit/1836355) - fix: added extra mock service args (Matt Fellows, Sun Aug 6 18:44:02 2017 +1000)
  * [29e4bc9](https://github.com/pact-foundation/pact-go/commit/29e4bc9) - fix: don't expect specific FS error (not portable) (Matt Fellows, Sun Aug 6 18:31:35 2017 +1000)
  * [07f2f99](https://github.com/pact-foundation/pact-go/commit/07f2f99) - fix: don't expect specific FS error (not portable) (Matt Fellows, Sun Aug 6 18:27:48 2017 +1000)

### 0.0.8 (15th July 2017)

  * [cf10aa6](https://github.com/pact-foundation/pact-go/commit/cf10aa6) - fix: allow test within pact.Verify() to fail build (Matt Fellows, Wed Jun 21 00:02:44 2017 +1000)

### 0.0.7 (20th May 2017)


### 0.0.6 (12th May 2017)


### 0.0.5 (10th May 2017)


### 0.0.4 (2nd May 2017)

  * [d214c54](https://github.com/pact-foundation/pact-go/commit/d214c54) - fix: increased timeout to reduce likelihood of intermittent failure #11 (Matt Fellows, Tue Feb 21 21:42:36 2017 +1100)

### 0.0.3 (30 April 2017)

  * [d214c54](https://github.com/pact-foundation/pact-go/commit/d214c54) - fix: increased timeout to reduce likelihood of intermittent failure #11 (Matt Fellows, Tue Feb 21 21:42:36 2017 +1100)

### 0.0.2 (1 July 2016)


### 0.0.1 (7 June 2016)

