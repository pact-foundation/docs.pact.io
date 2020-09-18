---
title: Pact command line tools
sidebar_label: Overview
---

There are Pact implementations written in more than 10 languages (see the sidebar of this page for a full list). The Pact tests for the consumer side of an integration are usually written in the same language as the consumer itself, as they typically run as part of the consumer's unit test suite. On the provider side, the verification tests can be run using either the Pact verifications API for that language, or by running the Pact provider verifier CLI (see below). Under the hood, [many of the languages][wrapper] use the CLI themselves, and wrap native language syntax sugar around some of the features.

## Provider verifier

You can run Pact verifications against any provider, regardless of its implementation language, by using the [Pact Provider Verifier][verifier]. It is packaged as a [Docker image][docker] and a [standalone][standalone] executable (see the [Distributions](#distributions) section below). If your Pact verification tests are going to be running on Docker anyway, and you are using one of the Pact implementations that ["wrap"][wrapper] the Pact Ruby Standalone (PactJS v2, PactNet, PactPython, PactPHP, Pact Swift, Pact Go) then you will have better performance running the Pact verification Docker image, rather than installing the standalone into a Docker image.

Having a standard method of executing your Pact provider verifications can be very useful if you want to build Pact into your CI/CD pipeline in a standard way across all your languages.

## Pact Broker CLI

The Pact command line tools include a command line interface to the Pact Broker. You can read more about it [here](/pact_broker/client_cli).

## Stub Service

The pact files that are generated from your tests can be used to support other tests by using one of the stub service implementations. There is a Ruby implementation that is available in the [distributions](#distributions) listed below, and a [Rust implementation](/getting_started/stubs).

## Distributions

### Pact CLI

The Pact CLI is packaged as a [Docker image](https://hub.docker.com/r/pactfoundation/pact-cli). It contains the Ruby implementations of the provider verifier, Pact Broker CLI, mock service and stub service.

### Pact Ruby Standalone

The `pact-ruby-standalone` is an earlier packaging of the same tools that are now made available in the pact-cli Docker image. This is a good option if your builds cannot use Docker. It can be installed as a standalone executable for Linux, Mac and Windows. As it has its own version of Ruby contained within the package, you do not need to install Ruby on the machine. If you are using Mac or Linux, you do need to have bash installed however.

The package and is available [here](https://github.com/pact-foundation/pact-ruby-standalone/releases) (scroll down to the Installation section of the release notes for installation instructions).

#### Brew

You can install the pact-ruby-standalone using this [Homebrew custom repository](https://github.com/pact-foundation/homebrew-pact-ruby-standalone).

[verifier]: https://github.com/pact-foundation/pact-provider-verifier
[standalone]: https://github.com/pact-foundation/pact-ruby-standalone/releases
[docker]: https://hub.docker.com/r/pactfoundation/pact-cli
[wrapper]: /wrapper_implementations
