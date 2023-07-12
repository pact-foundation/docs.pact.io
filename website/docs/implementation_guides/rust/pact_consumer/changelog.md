---
title: pact_consumer
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_consumer/CHANGELOG.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## 1.0.2 - Bugfixes + added crate features to disable functionality

* 6661077a - feat: Add support for disabling plugins with consumer DSL (Ronald Holshausen, Tue Jul 11 16:53:12 2023 +1000)
* 445ea1ee - fix: Header matching rules should be looked up in a case-insenstive way (Ronald Holshausen, Wed Jun 28 15:21:32 2023 +1000)
* e58aa917 - fix: no need to wrap the Pact for a mock server in a mutex (mock server is already behind a mutex) as this can cause deadlocks #274 (Ronald Holshausen, Wed Jun 14 13:26:54 2023 +1000)
* cd536170 - feat: Add builder interface for plugins to provide DSL to construct interactions (Ronald Holshausen, Wed Jun 7 15:12:15 2023 +1000)

## 1.0.1 - Bugfix Release

* 4fbd45cc - fix: Mock server errors were not being printed if the test was panicking due to a failed assertion #282 (Ronald Holshausen, Wed Jun 7 11:27:15 2023 +1000)

## 1.0.0 - Bugfixes + Update Pact models to 1.1 (breaking change)

* 6aac93bb - feat: Update message builders to support adding message metadata (Ronald Holshausen, Tue May 23 16:00:19 2023 +1000)
* 261ecf47 - fix: Add RefUnwindSafe trait bound to all Pact and Interaction uses (Ronald Holshausen, Mon May 15 13:59:31 2023 +1000)

## 0.10.8 - Bugfix Release

* 84b9d9e9 - fix: Upgrade pact models to 1.0.11 (fixes generated key for V4 Pacts) (Ronald Holshausen, Fri Apr 14 17:10:58 2023 +1000)

## 0.10.7 - Bugfix Release

* 779a59f0 - fix: Upgrade pact-plugin-driver to 0.4.1 (fixes an issue introduced in 0.4.0 with shared channels to plugins) (Ronald Holshausen, Wed Apr 5 17:01:18 2023 +1000)

## 0.10.6 - Bugfix Release

* 7bd44a0d - fix: PactBuilder drop handler was cauing plugins to be shutdown twice (Ronald Holshausen, Wed Apr 5 14:44:26 2023 +1000)
* 6aa389c9 - fix: Make using_plugin consume self so that the builder will have the same lifetime as the returned async one (Ronald Holshausen, Wed Apr 5 14:43:43 2023 +1000)
* 6f0c4b2f - feat: Upgrade pact-plugin-driver to 0.4.0 which uses a shared gRPC channel to each plugin (Ronald Holshausen, Tue Apr 4 14:32:36 2023 +1000)
* 63be53b2 - fix: allow the pact builders to set the overwrite flag (Ronald Holshausen, Mon Apr 3 14:53:36 2023 +1000)
* f8aea4fc - fix: request and response builders were incorrectly setting empty bodies from plugin contents (Ronald Holshausen, Mon Apr 3 14:52:29 2023 +1000)

## 0.10.5 - Maintenance Release

* 11c701b4 - fix: Upgrade pact_matching to 1.0.6 (fixes some issues with matching HTTP headers) (Ronald Holshausen, Wed Mar 15 14:54:54 2023 +1100)
* e96bc54e - fix: Upgrade pact_models to 1.0.9 (fixes issues with headers) (Ronald Holshausen, Wed Mar 15 14:31:00 2023 +1100)

## 0.10.4 - Bugfix Release

* 1e7331f1 - fix: Upgrade plugin driver to 0.3.1 (Ronald Holshausen, Wed Feb 8 13:28:07 2023 +1100)

## 0.10.3 - Support generators in plugins

* 5fbb0d6a - feat: Upgrade plugin driver to 0.2.2 (supports passing a test context to support generators) (Ronald Holshausen, Fri Dec 16 16:38:03 2022 +1100)

## 0.10.2 - Bugfix Release

* e91ad622 - fix: Interaction builder was not copying plugin config data to the Pact metadata (Ronald Holshausen, Mon Dec 12 13:59:36 2022 +1100)

## 0.10.1 - Support plugins generating interaction content

* 2cf5d8ad - fix: Correct test after upgrading pact_models to 1.0.2 (Ronald Holshausen, Fri Dec 9 12:59:24 2022 +1100)
* 2e5823a0 - feat: add custom-header to the old FFI args for implementations that have not moved to handles (Ronald Holshausen, Fri Nov 25 11:09:46 2022 +1100)

## 0.10.0 - Bugfix Release

* a3fa7d63 - feat: Split the builders into synch and async versions (Ronald Holshausen, Mon Nov 7 12:46:00 2022 +1100)
* 577824e7 - fix: Upgrade pact_models to 1.0 and pact-plugin-driver to 0.1.15 to fix cyclic dependency issue (Ronald Holshausen, Mon Nov 7 11:14:20 2022 +1100)
* 6ad00a5d - fix: Update onig to latest master to fix  Regex Matcher Fails On Valid Inputs #214 (Ronald Holshausen, Fri Nov 4 15:23:50 2022 +1100)
* 965a1c41 - fix: Upgrade plugin driver to 0.1.13 (fixes issue loading plugin when there are multiple versions for the same plugin) (Ronald Holshausen, Wed Oct 5 17:29:37 2022 +1100)

## 0.9.7 - Bugfix Release

* 57a8ad7d - fix: Consumer DSL needs to increment plugin access to avoid plugin shutting down when mock server starts (Ronald Holshausen, Thu Sep 8 11:54:33 2022 +1000)
* f8db90d2 - fix: Upgrade pact_models to 0.4.5 - fixes FFI bug with generators for request paths (Ronald Holshausen, Fri Aug 26 11:44:08 2022 +1000)

## 0.9.6 - Maintenance Release

* 8056d7e9 - fix: get verify_provider_async to wait on the metric call (Ronald Holshausen, Thu Aug 11 16:16:18 2022 +1000)
* 24186e90 - feat: allow the interaction transport to be set in consumer tests (Ronald Holshausen, Wed Aug 3 12:47:27 2022 +1000)

## 0.9.5 - Maintenance Release


## 0.9.4 - Maintenance Release


## 0.9.3 - Maintenance Release


## 0.9.2 - Maintenance Release

* cdf72b05 - feat: forward provider details to plugin when verifying (Ronald Holshausen, Fri Apr 22 14:12:34 2022 +1000)
* 2395143a - feat: forward verification to plugin for transports provided by the plugin (Ronald Holshausen, Fri Apr 22 12:02:05 2022 +1000)

## 0.9.1 - Bugfix Release

* 73ae0ef0 - fix: Upgrade reqwest to 0.11.10 to resolve #156 (Ronald Holshausen, Wed Apr 13 13:31:55 2022 +1000)

## 0.9.0 - Supports mock servers from plugins

* 345b0011 - feat: support mock servers provided from plugins (Ronald Holshausen, Mon Mar 21 15:59:46 2022 +1100)

## 0.8.6 - Maintenance Release


## 0.8.5 - Bugfix Release

* c2089645 - fix: log crate version must be fixed across all crates (including plugin driver) (Ronald Holshausen, Fri Jan 14 16:10:50 2022 +1100)

## 0.8.4 - Maintenance Release


## 0.8.3 - Maintenance Release


## 0.8.2 - Maintenance Release

* cba3f08e - feat: add metrics events for Pact-Rust consumer tests (Ronald Holshausen, Tue Dec 14 16:20:40 2021 +1100)
* fc5be202 - fix: update to latest driver crate (Ronald Holshausen, Tue Nov 16 16:19:02 2021 +1100)

## 0.8.1 - Add plugin support to FFI functions


## 0.8.0 - Pact V4 release

* 75dd211c - feat: update readme with plugin example (Ronald Holshausen, Thu Oct 21 11:53:52 2021 +1100)
* be6c02b1 - feat: update readme with sync req/res message examples (Ronald Holshausen, Thu Oct 21 11:18:41 2021 +1100)
* e6610312 - feat: update readme with sync req/res message examples (Ronald Holshausen, Thu Oct 21 11:15:05 2021 +1100)
* 3b7aee5f - feat: update tests and docs with sync req/res message examples (Ronald Holshausen, Thu Oct 21 10:28:08 2021 +1100)
* 1427aa33 - feat: update tests and docs with message examples (Ronald Holshausen, Wed Oct 20 16:49:29 2021 +1100)

## 0.8.0-beta.3 - Bugfix Release

* df67b723 - fix: async message builder was not setting the pact plugin config correctly (Ronald Holshausen, Tue Oct 19 17:44:35 2021 +1100)
* 918e5beb - fix: update to latest models and plugin driver crates (Ronald Holshausen, Tue Oct 19 17:09:48 2021 +1100)

## 0.8.0-beta.2 - Support matching synchronous request/response messages


## 0.8.0-beta.1 - Support consumer tests with synchronous messages (Protobuf)

* d0bfb8a8 - feat: Support consumer tests with synchronous messages (Ronald Holshausen, Tue Oct 12 15:51:08 2021 +1100)
* 35ff0993 - feat: record the version of the lib that created the pact in the metadata (Ronald Holshausen, Tue Oct 12 14:52:43 2021 +1100)

## 0.8.0-beta.0 - Plugin support with consumer tests

* 9fd9e652 - feat: do no write empty comments + added consumer version to metadata (Ronald Holshausen, Thu Sep 30 17:40:56 2021 +1000)
* df715cd5 - feat: support native TLS. Fixes #144 (Matt Fellows, Mon Sep 20 13:00:33 2021 +1000)
* ee498dce - feat: consumer builders need to populate the interaction config from the plugins (Ronald Holshausen, Thu Sep 9 08:49:54 2021 +1000)
* 8bcd1c7e - fix: min/max type matchers must not apply the limits when cascading (Ronald Holshausen, Sun Aug 8 15:50:40 2021 +1000)
* 084ab46b - feat: Copied pact_mockserver_ffi to pact_ffi (Ronald Holshausen, Sat Jul 10 16:24:29 2021 +1000)
* be604cce - feat: add date-time matcher to consumer DSL (Ronald Holshausen, Wed Jun 2 15:19:06 2021 +1000)
* b4e26844 - fix: reqwest is dyn linked to openssl by default, which causes a SIGSEGV on alpine linux (Ronald Holshausen, Tue Jun 1 14:21:31 2021 +1000)

## 0.7.8 - Bugfixes + support native TLS certs

* df715cd5 - feat: support native TLS. Fixes #144 (Matt Fellows, Mon Sep 20 13:00:33 2021 +1000)
* 8bcd1c7e - fix: min/max type matchers must not apply the limits when cascading (Ronald Holshausen, Sun Aug 8 15:50:40 2021 +1000)

## 0.7.7 - Bugfix Release

* 084ab46b - feat: Copied pact_mockserver_ffi to pact_ffi (Ronald Holshausen, Sat Jul 10 16:24:29 2021 +1000)
* be604cce - feat: add date-time matcher to consumer DSL (Ronald Holshausen, Wed Jun 2 15:19:06 2021 +1000)
* b4e26844 - fix: reqwest is dyn linked to openssl by default, which causes a SIGSEGV on alpine linux (Ronald Holshausen, Tue Jun 1 14:21:31 2021 +1000)

## 0.7.6 - V4 features + DSL enhancements

* ffbcaf5 - feat: Added header_from_provider_state and path_from_provider_state (Rob Caiger, Mon May 24 13:54:16 2021 +0100)

## 0.7.5 - mock server metrics

* 5a529fd - feat: add ability of mock server to expose metrics #94 (Ronald Holshausen, Sun Mar 14 11:41:16 2021 +1100)

## 0.7.4 - Use a file system lock when merging pact files

* 9976e80 - feat: added read locks and a mutex guard to reading and writing pacts (Ronald Holshausen, Mon Feb 8 11:58:52 2021 +1100)

## 0.7.3 - Updated dependencies


## 0.7.2 - Upgrade Tokio to 1.0


## 0.7.1 - support generators associated with array contains matcher variants

* beb1c03 - fix: cleanup compiler warning (Ronald Holshausen, Thu Dec 31 14:41:09 2020 +1100)

## 0.7.0 - Update to latest matching and mock server crates

* 13976f5 - fix: failing pact_consumer build (Ronald Holshausen, Thu Oct 15 12:00:09 2020 +1100)
* 2fb0c6e - fix: fix the build after refactoring the pact write function (Ronald Holshausen, Wed Oct 14 11:07:57 2020 +1100)
* 29ba743 - feat: add a mock server config struct (Ronald Holshausen, Thu Sep 24 10:30:59 2020 +1000)

## 0.6.2 - Updated XML Matching


## 0.6.1 - Bugfix Release

* a45d0c3 - fix: FFI mismatch json should have the actual values as UTF-8 string not bytes #64 (Ronald Holshausen, Thu Apr 30 11:16:25 2020 +1000)
* 6ff9c33 - fix: ignore flakey test (Matt Fellows, Tue Mar 3 12:14:08 2020 +1100)

## 0.6.0 - Convert to async/await


## 0.5.3 - Bugfix Release

* 19e8ced - fix: cleanup env var and set tests to not run in parallel on CI #54 (Ronald Holshausen, Sat Dec 14 16:08:56 2019 +1100)
* b5474b4 - fix: set the path to the generated pact file #54 (Ronald Holshausen, Sat Dec 14 15:46:37 2019 +1100)
* d4dd39f - fix: repeat the test 3 times #54 (Ronald Holshausen, Sat Dec 14 15:30:01 2019 +1100)
* bc044be - fix: check the size of the merged pact file #54 (Ronald Holshausen, Sat Dec 14 15:25:33 2019 +1100)
* a660b87 - fix: correct pact merging to remove duplicates #54 (Ronald Holshausen, Sat Dec 14 15:06:30 2019 +1100)

## 0.5.2 - Fix dependency versions

* eef3d97 - feat: added some tests for publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 16:44:52 2019 +1000)
* 1110b47 - feat: implemented publishing verification results to the pact broker #44 (Ronald Holshausen, Sun Sep 22 13:53:27 2019 +1000)

## 0.5.1 - support headers with multiple values

* f0c0d07 - feat: support headers with multiple values (Ronald Holshausen, Sat Aug 10 17:01:10 2019 +1000)

## 0.5.0 - Upgrade to non-blocking Hyper 0.12

* 1e0c65b - fix: doc tests with Into trait fail to link with Rust beta 1.27.0 (Ronald Holshausen, Sun May 13 15:26:36 2018 +1000)
* a5588dc - feat: Allow the directory pacts are written to to be overriden in consumer tests #21 (Ronald Holshausen, Sun Apr 8 15:20:38 2018 +1000)

## 0.4.0 - First V3 specification release


## 0.3.1 - Converted OptionalBody::Present to take a Vec&lt;u8&;gt;


## 0.3.0 - Improved Consumer DSL


## 0.2.0 - V2 implementation


## 0.1.0 - V1.1 specification implementation


## 0.0.0 - First Release
