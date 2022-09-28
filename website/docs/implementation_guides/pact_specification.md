---
title: Pact Specification
---

## Introduction

"Pact" is an implementation of "consumer driven contract" testing that allows mocking of responses in the consumer codebase, and verification of the interactions in the provider codebase. The initial implementation was written in Ruby for Rack apps, however a consumer and provider may be implemented in different programming languages, so the "mocking" and the "verifying" steps would be best supported by libraries in their respective project's native languages. Given that the pact file is written in JSON, it should be straightforward to implement a pact library in any language, however, to get the best experience and most reliability of out mixing pact libraries, the matching logic for the requests and responses needs to be identical. There is little confidence to be gained in having your pacts "pass" if the logic used to verify a "pass" is inconsistent between implementations.

To support consistency of matching logic, the [Pact-specification](https://github.com/pact-foundation/pact-specification) has been developed as a benchmark that all pact libraries can check themselves against if they want to ensure consistency with other pact libraries.

## Pact Specificaton Philosophy

The Pact matching rules follow Postel's Law.

Be as strict as we reasonably can with what we send out (requests).

We should know and be able to control exactly what a consumer is sending out. Information should not be allowed to "leak" silently.

Be as loose as we reasonably can with what we accept (responses).

A provider should be able to send extra information that this particular consumer does not care about, without breaking this consumer.

When writing the matching rules, err on the side of being more strict now, because it will break fewer things to be looser later, than to get stricter later.

_Note:_ One implications of this philosophy is that you cannot verify, using pact, that a key or a header will not be present in a response. You can only verify what is.

## Specification Documentation

- [JSON schemas](https://bitbucket.org/atlassian/pact-json-schema) - Currently for v1 / v2

- [Version 1](https://github.com/pact-foundation/pact-specification/tree/version-1) - A spec that describes the existing matching in the ruby implementation, and provides test cases for implementations in other languages to ensure that matching is consistent.

- [Version 1.1](https://github.com/pact-foundation/pact-specification/tree/version-1.1) - Updated specification shared between Ruby, JVM and .Net versions.

- [Version 2](https://github.com/pact-foundation/pact-specification/tree/version-2) - Introduces non-language specific regular expression and type matching.

- [Version 3](https://github.com/pact-foundation/pact-specification/tree/version-3) - Introduces pact format for message queues and corrects some issues with V2.

- [Version 4](https://github.com/pact-foundation/pact-specification/tree/version-4) - RFC [#71](https://github.com/pact-foundation/pact-specification/issues/71).

## Implementation Support

| Implementation | v1 | v1.1 | v2 | v3 | v4 |
| --- | --- | --- | --- | --- | --- |
| [Pact-rust](https://github.com/pact-foundation/pact-reference/blob/master/rust/README.md#pact-rust) | | | | X | X |
| [Pact-jvm](https://github.com/pact-foundation/pact-jvm#supported-jdk-and-specification-versions) | | | 0 |X| X|
| [Pact-ruby](https://github.com/pact-foundation/pact-ruby#current-pact-specification-version)| || X | | |
| [Pact-js](https://github.com/pact-foundation/pact-js#compatibility) | | | X | X | |
| [Pact-net](https://github.com/pact-foundation/pact-net#compatibility) | | | X | X | |
| [Pact-python](https://github.com/pact-foundation/pact-python#pact-python) | | | X | | |
| [Pact-php](https://github.com/pact-foundation/pact-php#specifications) | | | X | | |
| [Pact-go](https://github.com/pact-foundation/pact-go/tree/2.x.x#compatibility) | | | X | 1 | |
| [Pact-C++](https://github.com/pact-foundation/pact-cplusplus/tree/master/consumer) | | | X | | |
| scala ([scala-pact](https://github.com/ITV/scala-pact#latest-version-is-440)) | | | X | | |
| scala ([pact4s](https://github.com/jbwheatley/pact4s#getting-started)) | | | | X | 1 |
| swift ([pact-consumer-swift](https://github.com/DiUS/pact-consumer-swift)) | | | X | | |
| swift ([pact-swift](https://github.com/surpher/PactSwift)) | | | | X | |

X - Implemented and actively supported
1 - Implemented in beta
0 - Implemented and not actively supported

> All new Pact implementations should wrap the Rust implementation using FFI calls, to allow us to roll out new features quickly and consistently across our 10+ Pact languages.
>
> Support is appreciated if you wish to contribute in migrating a language from the Ruby to Rust core, or wish to create a new language implementation

## Migration guides

In order to faciliate the move to from v2 to v3 specification, in the respective client libraries, migration guides have been written to help to transition across.

###  General notes

- A migration between pact specifications, for existing published contracts, will trigger a rule [`content_that_affects_verification_results`](https://github.com/pact-foundation/pact_broker/blob/d1fd60bb52a64b555d9e3df92c432474fec4fb68/lib/pact_broker/pacts/content.rb#L99) causing a `contract_content_changed` / `contract_requiring_verification_published` [event type](https://docs.pact.io/pact_broker/advanced_topics/api_docs/webhooks#event-types) as the generated matcher rules may have changed between specifications.

### v2 to v3

- [Pact-JS](https://github.com/pact-foundation/pact-js/blob/master/docs/migrations/9-10.md)
- [Pact-Net](https://github.com/pact-foundation/pact-net/blob/master/docs/upgrading-to-4.md)
- [Pact-Go](https://github.com/pact-foundation/pact-go/blob/2.x.x/MIGRATION.md)
