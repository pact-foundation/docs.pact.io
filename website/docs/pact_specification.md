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
| Pact-rust | | | | | |
| Pact-ruby | | | | | |
| Pact-jvm | | | | | |
| Pact-js | | | | | |
| Pact-net | | | | | |
| Pact-python | | | | | |
| Pact-php | | | | | |
| Pact-go | | | | | |
| Pact-C++ | | | | | |
| Pact-scala | | | | | |
| Pact-swift | | | | | |

## Migration guides

In order to faciliate the move to from v2 to v3 specification, in the respective client libraries, migration guides have been written to help to transition across.

### v2 to v3

- [Pact-JS](https://github.com/pact-foundation/pact-js/blob/master/docs/migrations/9-10.md)
- [Pact-Net](https://github.com/pact-foundation/pact-net/blob/master/docs/upgrading-to-4.md)
- [Pact-Go](https://github.com/pact-foundation/pact-go/blob/2.x.x/MIGRATION.md)