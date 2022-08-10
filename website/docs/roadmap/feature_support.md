---
title: Feature support
---

There are multiple implementations of Pact, and while we try to keep feature parity between them, some implementations are ahead of others in terms of feature support.

| Feature                                                                | Pact-JVM | Pact JS ^    | Pact Ruby \# | Pact NET ^   | Pact Go ^    | Pact PHP \# | Pact Python \# | Pact Swift ^ |
| :--------------------------------------------------------------------- | :------- | :------------ | :----------- | :------------ | :------------ | :---------- | :------------- | :------------ |
| HTTP pacts                                                             | Y        | Y             | Y            | Y             | Y             | Y           | Y              | Y             |
| Asychronous message pacts                                              | Y        | Y             |              | Y             | Y             | Y           | Y              |               |
| Regular expression matching                                            | Y        | Y             | Y            | Y             | Y             | Y           | Y              | Y             |
| Type based matching \("like"\)                                         | Y        | Y             | Y            | Y             | Y             | Y           | Y              | Y             |
| Flexible array length \("each like"\)                                  | Y        | Y             | Y            | Y             | Y             | Y           | Y              | Y             |
| Verify a pact that uses the Pact specification v3 format               | Y        | Y             | Y            | Y             | Y             | Y           | Y              | Y             |
| Pact specification v3 matchers                                         | Y        | Y             |              | Y             | Y             |             |                | Y             |
| Pact specification v3 generators                                       | Y        | Y             |              | Y             | Y             |             |                | Y             |
| Multiple provider states \(pact creation\)                             | Y        | Y             |              |               | Y             |             |                | Y             |
| Multiple provider states \(pact verification\)                         | Y        | Y             | Y            | Y             | Y             | Y           | Y              | Y             |
| Publish pacts to Pact Broker                                           | Y        | Y             | Y            | Y             | Y             | \*          | \*             | \*            |
| Tag consumer version in Pact Broker when publishing pact               | Y        | Y             | Y            | \*            | \*            | \*          | \*             | \*            |
| Dynamically fetch pacts for provider from Pact Broker for verification | Y        | Y             | Y            | Y             | Y             | Y           | Y              | \*            |
| Dynamically fetch pacts for provider with specified tags               | Y        | Y             | Y            | Y             | Y             | Y           | Y              | \*            |
| Automatically tag consumer/provider with name of git branch            |          | \*            | Y            | \*            | \*            | \*          | \*             | \*            |
| Use 'pacts for verification' Pact Broker API                           | Y        | Y             | Y            | Y             | Y             | Y           | Y              | N             |
| Pending pacts                                                          | Y        | Y             | Y            | Y             | Y             | Y           | Y              | N             |
| WIP pacts                                                              | Y        | Y             | Y            | Y             | Y             | Y           | Y              | N             |
| JSON test results output                                               | Y        |               | Y            |               | Y             | \*          | \*             | \*            |
| XML test results output                                                | N        |               | Y            |               | Y             | \*          | \*             | \*            |
| Markdown test results output                                           | Y        |               |              |               |               |             |                |               |
| Run a single interaction when verifying a pact                         | Y        | Y             | Y            | \*            | Y             | \*          | \*             | \*            |
| Injecting values from provider state callbacks                         | Y        | Y             |              |               | Y             |             |                |               |
| Date/Time expressions with generators                                  | Y        | Y             |              |               | Y             |             |                |               |

| Feature                                                                | pact4s | Pact Rust | Pact C++ |
| :--------------------------------------------------------------------- | :--------- | :-------- | :------- |
| HTTP pacts                                                             | Y          | Y         | Y        |
| Asychronous message pacts                                              |            | N(1)      | N        |
| Regular expression matching                                            | Y          | Y         | Y        |
| Type based matching \("like"\)                                         | Y          | Y         | Y        |
| Flexible array length \("each like"\)                                  | Y          | Y         | Y        |
| Verify a pact that uses the Pact specification v3 format               | ?          | Y         | N        |
| Pact specification v3 matchers                                         | ?          | Y         | Y        |
| Pact specification v3 generators                                       |            | Y         | Y        |
| Multiple provider states \(pact creation\)                             | ?          | Y         | Y        |
| Multiple provider states \(pact verification\)                         | ?          | Y         | N        |
| Publish pacts to Pact Broker                                           | ?          | N         | N        |
| Tag consumer version in Pact Broker when publishing pact               | ?          | N         | N        |
| Dynamically fetch pacts for provider from Pact Broker for verification | ?          | Y         | N        |
| Dynamically fetch pacts for provider with specified tags               | ?          | Y         | N        |
| Automatically tag consumer/provider with name of git branch            |            | N         | N        |
| Use 'pacts for verification' Pact Broker API                           | N          | N         | N        |
| Pending pacts                                                          | N          | N         | N        |
| WIP pacts                                                              | N          | N         | N        |
| JSON test results output                                               |            | N         | N        |
| XML test results output                                                |            | N         | N        |
| Markdown test results output                                           |            | N         | N        |
| Run a single interaction when verifying a pact                         | ?          | N         | N        |
| Injecting values from provider state callbacks                         |            | N         | N        |
| Date/Time expressions with generators                                  |            | N         | N        |

`#` - these implementations wrap the shared "pact-ruby-standalone" "shared core"

`^` - these implementations wrap the rust shared core

`*` - the feature is available in the underlying shared implementation but may not have been exposed in the native "wrapper" code yet. If you are interested in this feature, but cannot see any documentation for it in your implementation, please raise an issue in the relevant repository.

`(1)` - base support for the feature is implemented, but it is not used by anything.

<sup>1</sup> - A beta version of the package is available with the selected feature.
