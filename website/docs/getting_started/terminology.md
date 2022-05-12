---
title: Terminology
---

## Service Consumer

For HTTP: An application that initiates a HTTP request to another application \(the service _provider_\). Note that this does not depend on the way the data flows - whether it is a `GET` or a `PUT` / `POST` / `PATCH`, the _consumer_ is the initiator of the HTTP request.

For messages: An application which reads a message or data structure that has been created by another application.

## Service Provider

For HTTP: A server that responds to an HTTP request from another application \(the service consumer\). A service provider may have one or more HTTP endpoints, and should be thought of as the "deployable unit" - endpoints that get deployed together should be considered part of the same provider.

For messages: An application that creates a message or data structure for another application to read.

## Mock Service Provider

Used by tests in the consumer project to mock out the actual service provider, meaning that integration-like tests can be run without requiring the actual service provider to be available.

## Interaction

A request and response pair. A pact consists of a collection of _interactions_.

## Pact file

A file containing the JSON serialised interactions \(requests and responses\) that were defined in the consumer tests. This is the _Contract_. A Pact defines:

* the consumer name
* the provider name
* a collection of interactions
* the pact specification version \(see below\)

## Pact verification

For HTTP: To verify a _Pact contract_, the requests contained in a _pact file_ are replayed against the provider code, and the responses returned are checked to ensure they match those expected in the pact file.

For messages: A piece of code on the provider is executed to cause a message for a given description to be generated, and the generated message is checked to ensure it matches that expected in the pact file.

## Provider state

A name describing a “_state_” \(like a fixture\) that the provider should be in when a given request is replayed against it - e.g. “when user John Doe exists” or “when user John Doe has a bank account”. These allow the same endpoint to be tested under different scenarios.

A provider state name is specified when writing the consumer specs, then, when the pact verification is set up in the provider the same name will be used to identify the set up code block that should be run before the request is executed. The provider state set up code is written by the provider team.

## Pact specification

The [Pact Specification](https://github.com/pact-foundation/pact-specification) is a document that governs the structure of the actual generated Pact files to allow for interoperability between languages \(consider, for example, a JavaScript consumer connecting to a Scala JVM-based provider\) , using semantic versioning to indicate breaking changes.

Each language implementation of Pact needs to implement the rules of this specification, and advertise which version\(s\) are supported, corresponding closely to which features are available.

The current version of the specification is [3.0](https://github.com/pact-foundation/pact-specification/tree/version-3) for the JVM implementation, and [2.0](https://github.com/pact-foundation/pact-specification/tree/version-2) for all others.

## Pact Broker

The [Pact Broker](/pact_broker) is a permanently running, externally hosted service with an API and UI that allows contract testing to be integrated into a CI/CD pipeline. Like the Pact clients, the Pact Broker is an open source project.

## Pactflow

[Pactflow](https://pactflow.io/?utm_source=ossdocs&utm_campaign=terminology) is a commercial offering of the Pact Broker which adds features required to use Pact at scale.

## The Matrix

The Matrix is a table that shows the compatibility status of each consumer version and provider version, as determined by the contract verification results. It is a feature of the Pact Broker and Pactflow.

## Can-I-Deploy 

[Can-i-deploy](/pact_broker/can_i_deploy) is a command line tool that uses the Matrix to determine whether an application version is "safe" to deploy to a particular environment. To do this, it checks that there is a successful verification result between the application being deployed and the currently deployed version of each of the integrated applications in that environment. Can-i-deploy is a feature of the Pact Broker and Pactflow.



