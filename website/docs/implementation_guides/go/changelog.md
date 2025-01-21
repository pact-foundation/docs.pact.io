---
title: Changelog
custom_edit_url: https://github.com/pact-foundation/pact-go/edit/master/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-go repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->


## Versions

### v2.1.0 (21 Jan 2025)

### v2.0.10 (21 Jan 2025)
  * [393ca79](https://github.com/pact-foundation/pact-go/commit/393ca79) - fix: update pact-ffi to v0.4.26 (Yousaf Nabi, Tue Jan 21 11:15:00 2025 +0000)

### v2.0.9 (21 Jan 2025)
  * [a82eff8](https://github.com/pact-foundation/pact-go/commit/a82eff8) - fix: ensure sync messages write metadata to both req & res (Yousaf Nabi, Fri Oct 25 17:28:23 2024 +0100)

### v2.0.8 (04 Sept 2024)
  * [2d6b6b1](https://github.com/pact-foundation/pact-go/commit/2d6b6b1) - fix: bump libpact_ffi to 0.4.23 (Yousaf Nabi, Wed Sep 4 14:12:24 2024 +0100)

### v2.0.7 (31 July 2024)
  * [f21750c](https://github.com/pact-foundation/pact-go/commit/f21750c) - fix: update pact-ffi to 0.4.22 (Yousaf Nabi, Thu Jul 18 18:32:45 2024 +0100)

### v2.0.6 (15 July 2024)
  * [4d46c69](https://github.com/pact-foundation/pact-go/commit/4d46c69) - Merge pull request #445 from lbcjbb/fix-crash (Matt Fellows, Mon Jul 15 10:08:43 2024 +1000)
  * [778a111](https://github.com/pact-foundation/pact-go/commit/778a111) - Merge pull request #431 from yoelb/patch-1 (Matt Fellows, Mon Jul 15 09:34:57 2024 +1000)
  * [ac7f9cf](https://github.com/pact-foundation/pact-go/commit/ac7f9cf) - fix: don't use defer in loop (Jean-Baptiste Bronisz, Fri Jul 12 11:07:27 2024 +0200)
  * [a396cac](https://github.com/pact-foundation/pact-go/commit/a396cac) - Merge pull request #442 from pact-foundation/docs/cgo_requirement (Matt Fellows, Fri Jul 5 09:31:19 2024 +1000)
  * [fd44da5](https://github.com/pact-foundation/pact-go/commit/fd44da5) - Merge pull request #439 from YOU54F/ci/macos_runners (Yousaf Nabi, Thu Jul 4 12:24:23 2024 +0100)
  * [bd71f19](https://github.com/pact-foundation/pact-go/commit/bd71f19) - Merge pull request #430 from pact-foundation/deps/Dockerfile (Yousaf Nabi, Thu Jul 4 12:11:22 2024 +0100)
  * [f3b61a7](https://github.com/pact-foundation/pact-go/commit/f3b61a7) - Merge pull request #436 from YOU54F/examples/run_locally (Matt Fellows, Thu Jul 4 14:10:56 2024 +1000)
  * [cd75a5e](https://github.com/pact-foundation/pact-go/commit/cd75a5e) - Merge pull request #435 from YOU54F/fix/zombie_plugin_processes (Matt Fellows, Thu Jul 4 14:09:26 2024 +1000)
  * [43d1bda](https://github.com/pact-foundation/pact-go/commit/43d1bda) - Merge pull request #438 from YOU54F/chore/quiet_logs (Matt Fellows, Thu Jul 4 14:08:04 2024 +1000)
  * [fa87e40](https://github.com/pact-foundation/pact-go/commit/fa87e40) - Merge pull request #440 from YOU54F/fix/pact_ffi_headers (Matt Fellows, Thu Jul 4 14:07:47 2024 +1000)
  * [d05fd3e](https://github.com/pact-foundation/pact-go/commit/d05fd3e) - fix: Dockerfile to reduce vulnerabilities (#441) (Matt Fellows, Thu Jul 4 14:05:36 2024 +1000)
  * [9f99245](https://github.com/pact-foundation/pact-go/commit/9f99245) - fix: ensure deferred plugin cleanup for all functions that use them (Yousaf Nabi, Wed Jul 3 21:44:00 2024 +0100)
  * [abd1815](https://github.com/pact-foundation/pact-go/commit/abd1815) - fix: install signal handlers should occur after plugins started (Yousaf Nabi, Wed Jul 3 21:15:07 2024 +0100)
  * [c80e188](https://github.com/pact-foundation/pact-go/commit/c80e188) - fix: plugin verification panics due to missing SA_ONSTACK signal (#432) (Yousaf Nabi, Wed Jul 3 00:48:25 2024 +0100)
  * [061aaf9](https://github.com/pact-foundation/pact-go/commit/061aaf9) - Merge pull request #420 from pact-foundation/dependabot/go_modules/google.golang.org/grpc-1.64.0 (Yousaf Nabi, Tue Jun 25 18:28:14 2024 +0100)
  * [4c2079f](https://github.com/pact-foundation/pact-go/commit/4c2079f) - Merge pull request #429 from pact-foundation/fix/macos_binary_rename (Yousaf Nabi, Mon Jun 24 16:11:16 2024 +0100)
  * [ef7883c](https://github.com/pact-foundation/pact-go/commit/ef7883c) - fix: rename macos binaries due to naming change in v0.4.21 libpact_ffi (Yousaf Nabi, Mon Jun 24 15:58:24 2024 +0100)
  * [b6bb0e5](https://github.com/pact-foundation/pact-go/commit/b6bb0e5) - Merge pull request #428 from pact-foundation/fix/update-pact-ffi-0.4.21 (Yousaf Nabi, Mon Jun 24 15:18:46 2024 +0100)
  * [cde0605](https://github.com/pact-foundation/pact-go/commit/cde0605) - fix: update pact-ffi to 0.4.21 (Yousaf Nabi, Mon Jun 24 14:47:56 2024 +0100)
  * [8289281](https://github.com/pact-foundation/pact-go/commit/8289281) - Merge pull request #418 from pact-foundation/dependabot/github_actions/golangci/golangci-lint-action-6 (Yousaf Nabi, Mon Jun 17 22:06:41 2024 +0100)
  * [a97b820](https://github.com/pact-foundation/pact-go/commit/a97b820) - Merge pull request #421 from pact-foundation/dependabot/go_modules/github.com/hashicorp/go-version-1.7.0 (Yousaf Nabi, Mon Jun 17 21:57:24 2024 +0100)
  * [1802b26](https://github.com/pact-foundation/pact-go/commit/1802b26) - Merge pull request #424 from pact-foundation/dependabot/go_modules/github.com/spf13/cobra-1.8.1 (Yousaf Nabi, Mon Jun 17 21:57:16 2024 +0100)
  * [f1db795](https://github.com/pact-foundation/pact-go/commit/f1db795) - Merge pull request #423 from pact-foundation/dependabot/github_actions/goreleaser/goreleaser-action-6 (Yousaf Nabi, Mon Jun 17 21:46:29 2024 +0100)
  * [ee740af](https://github.com/pact-foundation/pact-go/commit/ee740af) - Merge pull request #419 from pact-foundation/snyk-fix-938cc0572a34db4e15a9b0cfdcd4046a (Yousaf Nabi, Mon Jun 17 21:46:15 2024 +0100)
  * [a3e1410](https://github.com/pact-foundation/pact-go/commit/a3e1410) - Merge pull request #425 from pact-foundation/dependabot/go_modules/google.golang.org/protobuf-1.34.2 (Yousaf Nabi, Mon Jun 17 21:45:32 2024 +0100)
  * [8a9bc48](https://github.com/pact-foundation/pact-go/commit/8a9bc48) - fix: use the same signature for the same function (#402) (#422) (Masanori Matsumoto, Thu May 30 09:48:57 2024 +0900)
  * [0df1b8a](https://github.com/pact-foundation/pact-go/commit/0df1b8a) - fix: Dockerfile to reduce vulnerabilities (snyk-bot, Wed May 15 05:07:00 2024 +0000)
  * [01c155f](https://github.com/pact-foundation/pact-go/commit/01c155f) - Merge pull request #417 from pact-foundation/chore/upgrade-to-pact-ffi-0-4-20 (Yousaf Nabi, Thu May 9 12:58:48 2024 +0100)
  * [8fc38b7](https://github.com/pact-foundation/pact-go/commit/8fc38b7) - fix: update pact-ffi to 0.4.20 (YOU54F, Thu May 9 09:57:32 2024 +0000)
  * [46bff1e](https://github.com/pact-foundation/pact-go/commit/46bff1e) - Merge pull request #414 from pact-foundation/dependabot/go_modules/github.com/linkedin/goavro/v2-2.13.0 (Yousaf Nabi, Tue May 7 18:58:27 2024 +0100)
  * [3d62405](https://github.com/pact-foundation/pact-go/commit/3d62405) - Merge pull request #413 from pact-foundation/dependabot/go_modules/google.golang.org/protobuf-1.34.1 (Yousaf Nabi, Tue May 7 18:58:20 2024 +0100)
  * [3a112a1](https://github.com/pact-foundation/pact-go/commit/3a112a1) - Merge pull request #412 from pact-foundation/chore/upgrade-to-pact-ffi-0-4-19 (Yousaf Nabi, Tue May 7 18:58:09 2024 +0100)
  * [56cf87f](https://github.com/pact-foundation/pact-go/commit/56cf87f) - fix: update pact-ffi to 0.4.19 (YOU54F, Tue Apr 30 15:52:46 2024 +0000)

### v2.0.5 (07 May 2024)
  * [9d36011](https://github.com/pact-foundation/pact-go/commit/9d36011) - Merge pull request #411 from pact-foundation/dependabot/github_actions/golangci/golangci-lint-action-5 (Yousaf Nabi, Tue Apr 30 17:11:14 2024 +0100)
  * [2ac35ec](https://github.com/pact-foundation/pact-go/commit/2ac35ec) - Merge pull request #410 from pact-foundation/dependabot/github_actions/actions/upload-artifact-4 (Yousaf Nabi, Tue Apr 30 17:04:03 2024 +0100)
  * [7b985d6](https://github.com/pact-foundation/pact-go/commit/7b985d6) - fix: Dockerfile to reduce vulnerabilities (#401) (Matt Fellows, Tue Apr 23 15:38:35 2024 +1000)

### v2.0.4 (13 February 2024)
  * [f893818](https://github.com/pact-foundation/pact-go/commit/f893818) - feat: add native lib path function (#376) (Armin Becher, Tue Feb 13 05:27:44 2024 +0100)
  * [59a586d](https://github.com/pact-foundation/pact-go/commit/59a586d) - fix: allow empty responses in sync messages (#386) (Stanislav Vodetskyi, Mon Feb 12 20:26:57 2024 -0800)
  * [f04022c](https://github.com/pact-foundation/pact-go/commit/f04022c) - Merge pull request #384 from pact-foundation/chore/upgrade-to-pact-ffi-0-4-16 (Yousaf Nabi, Mon Feb 12 13:20:41 2024 +0000)
  * [7129ef0](https://github.com/pact-foundation/pact-go/commit/7129ef0) - fix: update pact-ffi to 0.4.16 (YOU54F, Mon Feb 12 12:55:05 2024 +0000)

### v2.0.3 (08 February 2024)
  * [48a916c](https://github.com/pact-foundation/pact-go/commit/48a916c) - fix: upgrade to latest ffi 0.4.15 (Matt Fellows, Wed Feb 7 16:24:06 2024 +1100)
  * [c1f2dfe](https://github.com/pact-foundation/pact-go/commit/c1f2dfe) - Merge pull request #379 from pact-foundation/ci/ffi_upgrade (Yousaf Nabi, Thu Feb 1 11:50:17 2024 +0000)
  * [7acfdce](https://github.com/pact-foundation/pact-go/commit/7acfdce) - Merge pull request #368 from pact-foundation/dependabot/go_modules/golang.org/x/crypto-0.17.0 (Yousaf Nabi, Fri Jan 19 12:29:28 2024 +0000)
  * [5b5c3f5](https://github.com/pact-foundation/pact-go/commit/5b5c3f5) - Merge pull request #370 from pact-foundation/snyk-fix-a298edb362c0da43c59ca7a8d7ae9f30 (Yousaf Nabi, Fri Jan 19 12:23:29 2024 +0000)
  * [db518cf](https://github.com/pact-foundation/pact-go/commit/db518cf) - Merge pull request #362 from pact-foundation/dependabot/go_modules/github.com/spf13/afero-1.11.0 (Yousaf Nabi, Fri Jan 19 12:21:51 2024 +0000)
  * [45797e8](https://github.com/pact-foundation/pact-go/commit/45797e8) - Merge pull request #363 from pact-foundation/dependabot/github_actions/actions/setup-java-4 (Yousaf Nabi, Fri Jan 19 12:19:47 2024 +0000)
  * [76f1dff](https://github.com/pact-foundation/pact-go/commit/76f1dff) - Merge pull request #373 from pact-foundation/dependabot/go_modules/google.golang.org/grpc-1.60.1 (Yousaf Nabi, Fri Jan 19 12:19:34 2024 +0000)
  * [120b3be](https://github.com/pact-foundation/pact-go/commit/120b3be) - Merge pull request #353 from pact-foundation/dependabot/go_modules/golang.org/x/net-0.17.0 (Yousaf Nabi, Fri Jan 19 12:12:11 2024 +0000)
  * [8a631f4](https://github.com/pact-foundation/pact-go/commit/8a631f4) - Merge pull request #355 from pact-foundation/dependabot/go_modules/github.com/hashicorp/go-getter-1.7.3 (Yousaf Nabi, Fri Jan 19 12:12:03 2024 +0000)
  * [3a5e6de](https://github.com/pact-foundation/pact-go/commit/3a5e6de) - Merge pull request #360 from pact-foundation/dependabot/go_modules/github.com/spf13/cobra-1.8.0 (Yousaf Nabi, Fri Jan 19 12:11:56 2024 +0000)
  * [6d11af6](https://github.com/pact-foundation/pact-go/commit/6d11af6) - Merge pull request #365 from pact-foundation/dependabot/github_actions/actions/setup-go-5 (Yousaf Nabi, Fri Jan 19 12:11:44 2024 +0000)
  * [250ab07](https://github.com/pact-foundation/pact-go/commit/250ab07) - Merge pull request #372 from pact-foundation/ci/tests (Yousaf Nabi, Fri Jan 19 11:56:11 2024 +0000)
  * [86cde8e](https://github.com/pact-foundation/pact-go/commit/86cde8e) - Merge pull request #361 from stan-is-hate/patch-1 (Yousaf Nabi, Fri Jan 19 11:54:17 2024 +0000)
  * [067ef3c](https://github.com/pact-foundation/pact-go/commit/067ef3c) - Merge pull request #371 from pact-foundation/deps/golanglint-ci-1.55 (Matt Fellows, Fri Jan 19 13:25:25 2024 +1100)
  * [eb8658b](https://github.com/pact-foundation/pact-go/commit/eb8658b) - Merge pull request #352 from pact-foundation/chore/golint_deprecations (Yousaf Nabi, Thu Jan 18 21:14:10 2024 +0000)
  * [aa3c52e](https://github.com/pact-foundation/pact-go/commit/aa3c52e) - fix: Dockerfile to reduce vulnerabilities (snyk-bot, Wed Jan 10 20:03:03 2024 +0000)
  * [781c59a](https://github.com/pact-foundation/pact-go/commit/781c59a) - Merge pull request #341 from stan-confluent/no-color-output (Matt Fellows, Wed Oct 18 09:27:15 2023 +1100)
  * [927d51a](https://github.com/pact-foundation/pact-go/commit/927d51a) - feat: allow disabling coloured output in Verifier (Stanislav Vodetskyi, Mon Sep 18 14:53:47 2023 -0700)

### v2.0.2 (03 October 2023)
  * [5cef32c](https://github.com/pact-foundation/pact-go/commit/5cef32c) - fix: set install_name to absolute path for libpact_ffi.dylib (#345) (Stanislav Vodetskyi, Mon Oct 2 15:03:18 2023 -0700)
  * [03ceb24](https://github.com/pact-foundation/pact-go/commit/03ceb24) - fix: Dockerfile to reduce vulnerabilities (snyk-bot, Thu Aug 3 05:41:57 2023 +0000)
  * [1f66368](https://github.com/pact-foundation/pact-go/commit/1f66368) - feat: add an Avro example (Matt Fellows, Wed Jul 12 09:26:31 2023 +1000)
  * [66463c8](https://github.com/pact-foundation/pact-go/commit/66463c8) - fix: Dockerfile to reduce vulnerabilities (snyk-bot, Wed Jul 12 19:12:14 2023 +0000)

### v2.0.1 (13 July 2023)
  * [646c3eb](https://github.com/pact-foundation/pact-go/commit/646c3eb) - fix: don't fail install if musl check fails (Matt Fellows, Thu Jul 13 10:26:53 2023 +1000)

### v2.0.0 (10 July 2023)


### v2.0.0-beta.23 (10 July 2023)


### v2.0.0-beta.22 (08 June 2023)


### v2.0.0-beta.21 (06 June 2023)


### v2.0.0-beta.20 (01 June 2023)


### v2.0.0-beta.19 (22 May 2023)


### v2.0.0-beta.18 (14 March 2023)


### v2.0.0-beta.17 (28 November 2022)


### v2.0.0-beta.15 (16 November 2022)


### v2.0.0-beta.14 (28 June 2022)

### v2.0.0-beta.13 (28 June 2022)


### v2.0.0-beta.12 (28 June 2022)
  * [60aaec1](https://github.com/pact-foundation/pact-go/commit/60aaec1) - fix: rename problematic generic plugin.proto. Fixes https://github.com/pact-foundation/pact-plugins/issues/4 (Matt Fellows, Tue Jun 28 22:08:49 2022 +1000)
  * [13081bf](https://github.com/pact-foundation/pact-go/commit/13081bf) - feat: support plugin provider verifier (with grpc example) (Matt Fellows, Tue Jun 28 13:33:39 2022 +1000)
  * [d373fdc](https://github.com/pact-foundation/pact-go/commit/d373fdc) - feat: grpc consumer example (Matt Fellows, Tue Jun 28 12:40:54 2022 +1000)
  * [1202555](https://github.com/pact-foundation/pact-go/commit/1202555) - feat: further refactoring with better type state setup (Matt Fellows, Mon Jun 27 23:11:25 2022 +1000)
  * [45b9311](https://github.com/pact-foundation/pact-go/commit/45b9311) - feat: improve installation by storing lib metadata locally (Matt Fellows, Mon Jun 6 19:59:20 2022 +1000)
  * [a05c1bc](https://github.com/pact-foundation/pact-go/commit/a05c1bc) - feat: add support for gRPC mock server (Ronald Holshausen, Tue May 24 15:38:10 2022 +1000)
  * [445d91b](https://github.com/pact-foundation/pact-go/commit/445d91b) - feat: initial plugin API in core (Matt Fellows, Sun Mar 20 12:30:36 2022 +1100)


### v2.0.0-beta.11 (20 May 2022)

  * [686f649](https://github.com/pact-foundation/pact-go/commit/686f649) - feat: support M1 silicon (Matt Fellows, Fri May 20 22:30:35 2022 +1000)

### v2.0.0-beta.10 (05 February 2022)

  * [cac3cf0](https://github.com/pact-foundation/pact-go/commit/cac3cf0) - feat: support matching branch selector (Matt Fellows, Wed Nov 17 17:31:30 2021 +1100)
  
### v2.0.0-beta.9 (17 November 2021)

  * [5a48fa6](https://github.com/pact-foundation/pact-go/commit/5a48fa6) - feat: upgrade to ffi 0.1.2, w\ support for branches. Fixes #180 (Matt Fellows, Wed Nov 17 17:19:03 2021 +1100)
  * [965f535](https://github.com/pact-foundation/pact-go/commit/965f535) - fix: support new header format for message metadata verification (Matt Fellows, Mon Nov 15 13:36:36 2021 +1100)
  * [90519ac](https://github.com/pact-foundation/pact-go/commit/90519ac) - feat: support provider branch. Fixes #180 (Matt Fellows, Tue Nov 9 08:36:43 2021 +1100)
  * [2be2cde](https://github.com/pact-foundation/pact-go/commit/2be2cde) - Merge pull request #187 from dabfleming/fix-ld-warning (Matt Fellows, Fri Oct 15 22:19:31 2021 +1100)
  * [a1e0f84](https://github.com/pact-foundation/pact-go/commit/a1e0f84) - Merge pull request #186 from dabfleming/docs-fix (Matt Fellows, Fri Oct 15 22:17:53 2021 +1100)
  * [d4cca08](https://github.com/pact-foundation/pact-go/commit/d4cca08) - fix: linker warning (David Fleming, Thu Oct 14 16:31:58 2021 -0400)

### v2.0.0-beta.8 (14 October 2021)

  * [b4d460b](https://github.com/pact-foundation/pact-go/commit/b4d460b) - fix: v3 provider state without parameters not correctly handled (Matt Fellows, Thu Oct 14 20:45:30 2021 +1100)

### v2.0.0-beta.7 (14 October 2021)

  * [f857347](https://github.com/pact-foundation/pact-go/commit/f857347) - fix: v3 provider state without parameters not correctly handled (Matt Fellows, Thu Oct 14 16:45:30 2021 +1100)
  * [40cbc80](https://github.com/pact-foundation/pact-go/commit/40cbc80) - feat: update consumer version selectors (Matt Fellows, Mon Aug 9 13:00:35 2021 +1000)

### v2.0.0-beta.2 (27 July 2021)
  * [7c6a10d](https://github.com/pact-foundation/pact-go/commit/7c6a10d) - fix: remove trailing slash from pact setup path (Matt Fellows, Sun Jul 4 11:39:34 2021 +1000)
  * [758ded2](https://github.com/pact-foundation/pact-go/commit/758ded2) - fix: tidy up header mismatch formatting (Matt Fellows, Mon Jun 21 23:50:46 2021 +1000)
  * [26b32fd](https://github.com/pact-foundation/pact-go/commit/26b32fd) - fix: pact mock server was overwriting the pact each time (Matt Fellows, Mon Jun 21 20:24:32 2021 +1000)
  * [ec79f2a](https://github.com/pact-foundation/pact-go/commit/ec79f2a) - feat: improve consumer error reporting (Matt Fellows, Mon Jun 21 14:33:18 2021 +1000)
  * [cdaa611](https://github.com/pact-foundation/pact-go/commit/cdaa611) - fix: reset mock server state between tests (Matt Fellows, Sun Jun 20 10:34:21 2021 +1000)
  * [8ebc234](https://github.com/pact-foundation/pact-go/commit/8ebc234) - fix: json omitempty struct tag attribute broke pact struct tags (Matt Fellows, Sat Jun 19 15:16:30 2021 +1000)
  * [c2f5f83](https://github.com/pact-foundation/pact-go/commit/c2f5f83) - feat: add all in one interface back into consumer package for simpler migrations (Matt Fellows, Tue Jun 8 22:22:27 2021 +1000)
  * [4525047](https://github.com/pact-foundation/pact-go/commit/4525047) - fix: pact found bug in pact example tests (Matt Fellows, Mon Jun 7 22:16:39 2021 +1000)
  * [e241249](https://github.com/pact-foundation/pact-go/commit/e241249) - fix: methods on response builder were sent to request (Matt Fellows, Mon Jun 7 18:14:48 2021 +1000)
  * [ae91fc3](https://github.com/pact-foundation/pact-go/commit/ae91fc3) - feat: allow WithHeaders to simplify bulk header addition (Matt Fellows, Mon Jun 7 17:57:42 2021 +1000)
  * [c2b16eb](https://github.com/pact-foundation/pact-go/commit/c2b16eb) - feat: release package under /v2 module version (Matt Fellows, Sun Jun 6 23:51:53 2021 +1000)
  * [b272229](https://github.com/pact-foundation/pact-go/commit/b272229) - feat: add sugar interface to dot import for nicer DSL usage (Matt Fellows, Sun Jun 6 21:32:10 2021 +1000)
  * [bf9b83b](https://github.com/pact-foundation/pact-go/commit/bf9b83b) - feat: panic a test if they attempt to use a matcher with a higher spec (Matt Fellows, Sun May 30 23:48:34 2021 +1000)
  * [de379ad](https://github.com/pact-foundation/pact-go/commit/de379ad) - feat: add experimental log packages to ffi interface (Matt Fellows, Sun May 30 22:48:50 2021 +1000)
  * [05c3ca4](https://github.com/pact-foundation/pact-go/commit/05c3ca4) - fix: remove old v2 pact tests from build (Matt Fellows, Sun May 30 13:18:07 2021 +1000)
  * [69eaf4f](https://github.com/pact-foundation/pact-go/commit/69eaf4f) - fix: require stdint.h for linux (Matt Fellows, Sun May 30 12:47:58 2021 +1000)
  * [31fb98c](https://github.com/pact-foundation/pact-go/commit/31fb98c) - feat: new experimental v3 api for http and messages (Matt Fellows, Sat May 29 15:20:52 2021 +1000)
  * [3797399](https://github.com/pact-foundation/pact-go/commit/3797399) - fix: satisfy checker interface in native lib (Matt Fellows, Sun May 23 23:17:43 2021 +1000)
  * [8e5acba](https://github.com/pact-foundation/pact-go/commit/8e5acba) - feat: support adding metadata to the output pacts via FFI (Matt Fellows, Sun May 23 14:42:04 2021 +1000)
  * [afcd3d7](https://github.com/pact-foundation/pact-go/commit/afcd3d7) - fix: eachKeyLike struct naming (Matt Fellows, Wed May 19 22:39:40 2021 +1000)
  * [2a5b24b](https://github.com/pact-foundation/pact-go/commit/2a5b24b) - feat: add v3 matchers (Matt Fellows, Mon May 17 13:17:09 2021 +1000)
  * [0d024d4](https://github.com/pact-foundation/pact-go/commit/0d024d4) - fix: make installer test more resilient (Matt Fellows, Sun Apr 11 22:52:03 2021 +1000)
  * [a5670a8](https://github.com/pact-foundation/pact-go/commit/a5670a8) - feat: allow messages to return provider states callback values (Matt Fellows, Sun Apr 11 22:44:16 2021 +1000)
  * [bb17299](https://github.com/pact-foundation/pact-go/commit/bb17299) - feat: add ability to check version in test, and upgrade if necessary (Matt Fellows, Sun Mar 14 22:51:28 2021 +1100)
  * [5c95dc0](https://github.com/pact-foundation/pact-go/commit/5c95dc0) - feat: allow force install of the lib (Matt Fellows, Sun Mar 14 16:51:48 2021 +1100)
  * [e97cd2d](https://github.com/pact-foundation/pact-go/commit/e97cd2d) - fix: value from provider state needed explicit content-type header (Matt Fellows, Sat Mar 13 21:16:11 2021 +1100)
  * [6ffeb4e](https://github.com/pact-foundation/pact-go/commit/6ffeb4e) - feat: enable setup/teardown in states, fix issue where params aren't passed through (Matt Fellows, Sat Mar 13 13:35:19 2021 +1100)
  * [424f7cc](https://github.com/pact-foundation/pact-go/commit/424f7cc) - fix: update install path name for OSX (Matt Fellows, Sat Mar 13 08:17:51 2021 +1100)
  * [ecccfe4](https://github.com/pact-foundation/pact-go/commit/ecccfe4) - feat: automatically set install_name for OSX libs (Matt Fellows, Sat Feb 27 22:37:56 2021 +1100)
  * [bcb3e9a](https://github.com/pact-foundation/pact-go/commit/bcb3e9a) - feat: add lib installer to CLI command (Matt Fellows, Mon Feb 22 23:53:39 2021 +1100)
  * [502f7f5](https://github.com/pact-foundation/pact-go/commit/502f7f5) - fix: misleading error message in certain verification scenarios (Matt Fellows, Fri Oct 9 23:59:37 2020 +1100)
  * [7587781](https://github.com/pact-foundation/pact-go/commit/7587781) - feat: add time related generators (Matt Fellows, Mon Aug 24 20:50:54 2020 +1000)
  * [2b0b5d6](https://github.com/pact-foundation/pact-go/commit/2b0b5d6) - feat: add new v3 matchers (Matt Fellows, Sun Aug 23 15:28:59 2020 +1000)
  * [1269271](https://github.com/pact-foundation/pact-go/commit/1269271) - feat: create V2/V3 specific matcher types, enforce types at the pact specification output (no v3 types in v2 spec output) (Matt Fellows, Sat Aug 22 22:24:42 2020 +1000)
  * [f2a921c](https://github.com/pact-foundation/pact-go/commit/f2a921c) - feat: add query string serialisation to v2 (Matt Fellows, Sat Aug 22 14:39:14 2020 +1000)
  * [07c7fc9](https://github.com/pact-foundation/pact-go/commit/07c7fc9) - feat: refactor log package, rename consumer entry point to HTTPMockProvider, add dynamic host into execute test method (Matt Fellows, Sun Aug 9 22:22:54 2020 +1000)
  * [46c639c](https://github.com/pact-foundation/pact-go/commit/46c639c) - fix: make tests fail on non-zero status (Matt Fellows, Fri Aug 7 14:38:06 2020 +1000)
  * [0702b90](https://github.com/pact-foundation/pact-go/commit/0702b90) - fix: increase max size of pact output buffer (Cody Tatman, Thu Aug 6 18:11:26 2020 -0700)
  * [1a55bd7](https://github.com/pact-foundation/pact-go/commit/1a55bd7) - fix: race in v2 client (Matt Fellows, Sun Aug 2 16:51:43 2020 +1000)

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

