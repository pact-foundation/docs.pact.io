---
title: pact_verifier_cli
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_verifier_cli/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## 1.3.0 - [Feature Release]

* e4af2e44 - feat: cli as lib (Yousaf Nabi, Sat Sep 27 18:38:04 2025 +0100)

## 1.2.0 - Add Exit on first error and Only run previously failed interactions CLI options


## 1.1.5 - Bugfix Release


## 1.1.4 - Bugfix Release


## 1.1.3 - Feature + Bugfix release

* c68a0eea - feat: Add environment variables for most options (Martijn Pieters, Thu May 16 17:09:43 2024 +0100)

## 1.1.2 - Maintenance Release


## 1.1.1 - Maintenance Release


## 1.1.0 - Feature + Bugfix release

* 9196efe4 - feat: verifier/mock_server clis - build for musl (Yousaf Nabi, Thu Feb 8 20:36:10 2024 +0000)

## 1.0.3 - Bugfix Release

* 36390097 - Merge pull request #371 from YOU54F/chore/renable_verifier_aarch64_linux (Ronald Holshausen, Thu Jan 25 09:59:53 2024 +1100)
* c412829f - feat: build aarch64-pc-windows-msvc target (ffi/mock_server/verifier) (Yousaf Nabi, Wed Jan 24 12:01:50 2024 +0000)
* a2ba1cd5 - fix: pin cross to 0.2.5 for glibc 2.23 (Yousaf Nabi, Wed Jan 24 11:54:22 2024 +0000)
* 944613df - fix: regression - upgrade pact_models to 1.1.16 #359 (Ronald Holshausen, Fri Jan 19 14:52:36 2024 +1100)

## 1.0.2 - Maintenance Release


## 1.0.1 - Maintenance Release


## 1.0.0 - 1.0.0 Release

* b9e034b2 - feat: Add crate feature for JUnit report output (Ronald Holshausen, Wed Jul 12 11:50:08 2023 +1000)
* 261ecf47 - fix: Add RefUnwindSafe trait bound to all Pact and Interaction uses (Ronald Holshausen, Mon May 15 13:59:31 2023 +1000)

## 0.10.6 - Bugfix Release

* 84b9d9e9 - fix: Upgrade pact models to 1.0.11 (fixes generated key for V4 Pacts) (Ronald Holshausen, Fri Apr 14 17:10:58 2023 +1000)

## 0.10.5 - Maintenance Release


## 0.10.4 - Bugfix Release

* e96bc54e - fix: Upgrade pact_models to 1.0.9 (fixes issues with headers) (Ronald Holshausen, Wed Mar 15 14:31:00 2023 +1100)

## 0.10.3 - Add option to generate a JUnit XML report file for the verification #257

* c9333f94 - feat: add option to generate JUnit XML report format for consumption by CI servers #257 (Ronald Holshausen, Thu Mar 2 10:48:56 2023 +1100)
* 46297622 - feat: add verification timing to the verifier output (Ronald Holshausen, Mon Feb 27 16:11:18 2023 +1100)

## 0.10.2 - Bugfix Release

* c368c651 - fix: Pass any custom header values on to the plugin verification call (Ronald Holshausen, Thu Feb 16 13:52:03 2023 +1100)

## 0.10.1 - Maintenance Release (supports message metadata)


## 0.10.0 - Bugfix Release

* 14e3b8ff - feat: Add short option for custom headers (Ronald Holshausen, Tue Jan 10 15:36:25 2023 +1100)
* 53a622ad - feat: Add options for compact and human formats to the verifier CLI log output (Ronald Holshausen, Mon Jan 9 18:07:19 2023 +1100)

## 0.9.20 - Add user-agent header + Support generators in plugins


## 0.9.19 - Bugfix Release


## 0.9.18 - Maintenance Release

* 577824e7 - fix: Upgrade pact_models to 1.0 and pact-plugin-driver to 0.1.15 to fix cyclic dependency issue (Ronald Holshausen, Mon Nov 7 11:14:20 2022 +1100)

## 0.9.17 - Bugfix Release


## 0.9.16 - Bugfix Release

* cdb555f8 - fix: Upgrade pact_verifier to 0.13.13 (Ronald Holshausen, Wed Sep 7 09:53:05 2022 +1000)

## 0.9.15 - Maintenance Release

* 8663cd3f - feat: add ignore-no-pacts-error to the verifier CLI #213 (Ronald Holshausen, Wed Aug 31 15:19:31 2022 +1000)
* f8db90d2 - fix: Upgrade pact_models to 0.4.5 - fixes FFI bug with generators for request paths (Ronald Holshausen, Fri Aug 26 11:44:08 2022 +1000)
* 43be2e83 - feat: do not output an error if no_pacts_is_error is false and no pacts were found to verify #213 (Ronald Holshausen, Fri Aug 19 16:49:19 2022 +1000)

## 0.9.14 - Support aarch64 Linux binary

* e3bef155 - feat: Add ARM64 (aarch64) linux targets to the release build #160 (Ronald Holshausen, Mon Aug 15 16:13:22 2022 +1000)

## 0.9.13 - add CLI options to provide different ports when there are different transports

* 3a1449cb - feat: use the configured transport when provided (Ronald Holshausen, Wed Aug 3 13:20:17 2022 +1000)
* 8cc29482 - feat: add CLI options to provide different ports when there are different transports (Ronald Holshausen, Wed Aug 3 11:53:31 2022 +1000)

## 0.9.12 - add --no-color option to verfier CLI

* 701c93a6 - Merge pull request #204 from pact-foundation/snyk-fix-e3dc7fb516c9ab76c1050c65ab20c6fb (Ronald Holshausen, Tue Jul 19 22:47:31 2022 -0400)
* 4530dbde - feat: add --no-color option to verfier CLI #203 (Ronald Holshausen, Wed Jul 20 12:45:20 2022 +1000)
* c7f68871 - fix: rust/pact_verifier_cli/Dockerfile to reduce vulnerabilities (snyk-bot, Wed Jul 6 23:50:14 2022 +0000)

## 0.9.11 - Bug fixes + Support publishing results from webhook calls

* 18118e82 - feat: add retries to the provider state change calls #197 (Ronald Holshausen, Tue Jun 7 09:10:23 2022 +1000)
* 6cae9b09 - fix: State change descriptions were not being displayed along with the interaction description (Ronald Holshausen, Mon Jun 6 17:09:44 2022 +1000)

## 0.9.10 - Supports verification via plugins

* 8d58ea34 - fix: lock the pact crate versions so that updates do not break CLI install #189 (Ronald Holshausen, Wed Apr 27 16:01:54 2022 +1000)
* cdf72b05 - feat: forward provider details to plugin when verifying (Ronald Holshausen, Fri Apr 22 14:12:34 2022 +1000)
* 2395143a - feat: forward verification to plugin for transports provided by the plugin (Ronald Holshausen, Fri Apr 22 12:02:05 2022 +1000)

## 0.9.9 - Bugfix Release

* 73ae0ef0 - fix: Upgrade reqwest to 0.11.10 to resolve #156 (Ronald Holshausen, Wed Apr 13 13:31:55 2022 +1000)
* 345b0011 - feat: support mock servers provided from plugins (Ronald Holshausen, Mon Mar 21 15:59:46 2022 +1100)
* f709528d - fix: rust/pact_verifier_cli/Dockerfile to reduce vulnerabilities (snyk-bot, Thu Mar 17 22:19:46 2022 +0000)

## 0.9.8 - Custom headers + Date-Time expression parser

* 79324802 - feat: add support for custom headers via the verifier CLI #182 (Ronald Holshausen, Mon Feb 28 15:22:47 2022 +1100)
* 74bd4531 - feat: add support for custom headers with the verifier FFI calls #182 (Ronald Holshausen, Mon Feb 28 13:58:46 2022 +1100)

## 0.9.7 - Bugfixes + added JSON report option

* 5ecf70a7 - feat: enable ANSI console output on Windows (Ronald Holshausen, Mon Jan 31 11:02:03 2022 +1100)
* d0fa29dc - feat: add json output to the verifier CLI (Ronald Holshausen, Fri Jan 28 15:21:17 2022 +1100)
* bf152233 - feat: Capture all the results from the verification process (Ronald Holshausen, Fri Jan 28 11:28:38 2022 +1100)
* 5f148cdd - feat: capture all the output from the verifier (Ronald Holshausen, Thu Jan 27 16:08:02 2022 +1100)
* f5aa34ea - Merge pull request #175 from pact-foundation/feat/fix-provider-timeout-value-validation (Ronald Holshausen, Thu Jan 27 13:41:56 2022 +1100)
* 0ef3fb98 - fix: provider request timeout should be > 16bit integers. Fixes https://github.com/pact-foundation/pact-js/issues/761 (Matt Fellows, Wed Jan 26 22:12:35 2022 +1100)

## 0.9.6 - Maintenance Release

* c2089645 - fix: log crate version must be fixed across all crates (including plugin driver) (Ronald Holshausen, Fri Jan 14 16:10:50 2022 +1100)

## 0.9.5 - Bugfix Release


## 0.9.5 - Bugfix Release

* c97f5d1a - fix: shutdown the tokio reactor correctly when there is an error (Ronald Holshausen, Wed Dec 15 16:28:37 2021 +1100)

## 0.9.4 - Bugfix Release

* 00a00461 - fix: add a small delay at the end of validation to allow async tasks to finish (Ronald Holshausen, Wed Dec 15 15:37:30 2021 +1100)

## 0.9.3 - Add metrics for provider verification

* f8042d6b - feat: add metrics event for provider verification (Ronald Holshausen, Tue Dec 14 17:29:44 2021 +1100)

## 0.9.2 - Bugfix Release


## 0.9.1 - Fix for branches and consumer version selectors

* df23ba3d - fix: allow multiple consumer version selectors (Matt Fellows, Mon Nov 15 14:28:04 2021 +1100)
* 0af18303 - fix: add missing provider-branch to verifier CLI (Ronald Holshausen, Mon Nov 8 11:40:05 2021 +1100)

## 0.9.0 - Pact V4 release


## 0.9.0-beta.0 - Pact Plugins Support

* 918e5beb - fix: update to latest models and plugin driver crates (Ronald Holshausen, Tue Oct 19 17:09:48 2021 +1100)

## 0.8.8 - support native TLS certs

* df715cd5 - feat: support native TLS. Fixes #144 (Matt Fellows, Mon Sep 20 13:00:33 2021 +1000)

## 0.8.7 - Bugfix Release


## 0.8.6 - Bugfix Release

* 0d5ec68a - feat: copied verfier_ffi crate to pact_ffi (Ronald Holshausen, Sat Jul 10 16:54:28 2021 +1000)
* a835e684 - feat: support message metadata in verifications (Matt Fellows, Sun Jul 4 21:02:35 2021 +1000)
* e8d6d844 - fix: pact_verifier_cli was printing the version from the FFI crate (Ronald Holshausen, Sat Jun 5 14:43:38 2021 +1000)
* 2f678213 - feat: initial prototype of a pact file verifier (Ronald Holshausen, Thu Jun 3 14:56:16 2021 +1000)

## 0.8.5 - V4 features + updated Tokio to 1.0

* 2ebeef9 - fix: pact_verifier_cli needs to use Tokio 0.2 (Ronald Holshausen, Tue Jan 5 16:24:29 2021 +1100)

## 0.8.4 - TLS support + FFI support

* 484b747 - fix: verify interaction was blocking the thread (Ronald Holshausen, Mon Jan 4 17:12:38 2021 +1100)
* 6cec6c7 - feat: allow https scheme and ability to disable ssl verification (Matt Fellows, Thu Dec 31 12:10:57 2020 +1100)

## 0.8.3 - Bugfix Release


## 0.8.2 - Support Pacts for Verification API


## 0.8.1 - arrayContains matcher + text/xml content type


## 0.8.0 - Supports verifying Message Pacts


## 0.7.1 - implemented provider state generator


## 0.7.0 - Updated XML Matching

* fe74376 - feat: implemented publishing provider tags with verification results #57 (Ronald Holshausen, Sun Mar 8 18:37:21 2020 +1100)
* 9f3ad74 - fix: docker build now requires libclang system library (Ronald Holshausen, Fri Sep 27 17:14:05 2019 +1000)

## 0.6.1 - Bugfix + Oniguruma crate for regex matching


## 0.6.0 - Publishing verification results

* 1110b47 - feat: implemented publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 13:53:27 2019 +1000)

## 0.5.1 - Use reqwest for better HTTP/S support, support headers with multiple values

* dac8ae1 - feat: support authentication when fetching pacts from a pact broker (Ronald Holshausen, Sun Aug 11 13:57:29 2019 +1000)
* e007763 - feat: support bearer tokens when fetching pacts from URLs (Ronald Holshausen, Sun Aug 11 13:21:17 2019 +1000)
* 0dd10e6 - fix: docker release script (Ronald Holshausen, Sat Jul 27 18:02:11 2019 +1000)

## 0.5.0 - Upgrade to non-blocking Hyper 0.12

* 3c33294 - fix: Only print errors in the CLI to STDERR #28 (Ronald Holshausen, Sun Apr 8 15:57:56 2018 +1000)
* 386ab52 - fix: corrected the release scripts to check for a version parameter (Ronald Holshausen, Sun Apr 8 13:44:57 2018 +1000)
* 9d24b7e - fix: corrected the docker build for the verifier cli #14 (Ronald Holshausen, Sun Apr 8 13:39:29 2018 +1000)
* 4b8fb64 - fix: verification CLI was reporting incorrect pact specification version (Ronald Holshausen, Sun Apr 8 13:12:45 2018 +1000)

## 0.4.0 - First V3 specification release


## 0.3.0 - Backported matching rules from V3 branch


## 0.2.0 - V2 specification implementation


## 0.1.0 - V1.1 specification implementation


## 0.0.0 - First Release
