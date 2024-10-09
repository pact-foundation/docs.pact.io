---
title: Overview
---

[Pact JVM](https://github.com/pact-foundation/pact-jvm) is currently compliant to Pact Specification Version [4.0](https://github.com/pact-foundation/pact-specification/tree/version-4).

Head to the [README](jvm/readme) to get started with Pact on the JVM \(Java, Scala, Clojure etc.\) which tracks the latest version of Pact-JVM.

For older supported versions, 

see

- [v4.5.x README](jvm/v4.5.x/readme)
- [v4.1.x README](jvm/v4.1.x/readme)

For a Scala specific implementation, there is [Scala-Pact](scala) from the folks at ITV. This is Pact Specification Version [2.0](https://github.com/pact-foundation/pact-specification/tree/version-2) compliant and supports SBT and ScalaTest.

## Getting Started Guide

We have two workshops that walk you through an example problem from start to finish, exploring most concepts that Pact supports. It takes approximately 2 hours to complete.

- [Pact JVM + Gradle + Springboot + JUnit5 workshop](https://github.com/pact-foundation/pact-workshop-jvm-spring) 
- [Pact JVM + Maven + Springboot + JUnit5 workshop](https://github.com/pact-foundation/pact-workshop-Maven-Springboot-JUnit5) 

For example consumer & provider projects, see the [PactFlow examples](https://docs.pactflow.io/docs/examples)

- HTTP
  - [Consumer](https://github.com/pactflow/example-consumer-java-junit)
  - [Provider](https://github.com/pactflow/example-provider-springboot)
- GraphQL
  - [Consumer](https://github.com/pactflow/example-consumer-java-graphql)
  - [Provider](https://github.com/pactflow/pactflow-example-provider-java-graphql)
- XML / SOAP
  - [Consumer](https://github.com/pactflow/example-consumer-java-soap)
  - [Provider](https://github.com/pactflow/example-provider-java-soap)
- Kafka
  - [Consumer](https://github.com/pactflow/example-consumer-java-kafka)
  - [Provider](https://github.com/pactflow/example-provider-java-kafka)
- Plugins
  - [gRPC](https://github.com/pact-foundation/pact-plugins/tree/main/examples/gRPC)
  - [Protobuf](https://github.com/pact-foundation/pact-plugins/tree/main/examples/protobuf)
  - [CSV](https://github.com/pact-foundation/pact-plugins/tree/main/examples/csv)