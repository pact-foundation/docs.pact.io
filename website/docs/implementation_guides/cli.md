---
title: Pact CLI
sidebar_label: Overview
---

There are Pact implementations written in more than 10 languages (see the sidebar of this page for a full list). The Pact tests for the consumer side of an integration are usually written in the same language as the consumer itself, as they typically run as part of the consumer's unit test suite. On the provider side, the verification tests can be run using either the Pact verifications API for that language, or by running the Pact provider verifier CLI (see below). Under the hood, [many of the languages][wrapper] use the CLI themselves, and wrap native language syntax sugar around some of the features.

## Provider verifier

You can run Pact verifications against any provider, regardless of its implementation language, by using the [Pact Provider Verifier][verifier]. It is packaged as a [Docker image][docker] and a [standalone][standalone] executable. If your Pact verification tests are going to be running on Docker anyway, and you are using one of the Pact implementations that ["wrap"][wrapper] the Pact Ruby Standalone (PactJS v2, PactNet, PactPython, PactPHP, Pact Swift, Pact Go) then you will have better performance running the Pact verification Docker image, rather than installing the standalone into a Docker image.

Having a standard method of executing your Pact provider verifications can be very useful if you want to build Pact into your CI/CD pipeline in a standard way across all your languages.

## Pact Broker CLI

The Pact CLI includes a command line interface to the Pact Broker. You can read more about it [here](/pact_broker/client_cli).


[verifier]: https://github.com/pact-foundation/pact-provider-verifier
[standalone]: https://github.com/pact-foundation/pact-ruby-standalone/releases
[docker]: https://hub.docker.com/r/pactfoundation/pact-cli
[wrapper]: /wrapper_implementations
