---
title: Example Maven provider project
custom_edit_url: https://github.com/pact-foundation/pact-plugins/edit/main/examples/gRPC/area_calculator/provider-maven/README.md
---
<!-- This file has been synced from the pact-foundation/pact-plugins repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## Source Code

https://github.com/pact-foundation/pact-plugins/tree/main/examples


This example project has a server implementation in Kotlin for the area calculator service call:

```protobuf
  rpc calculate (ShapeMessage) returns (AreaResponse) {}
```

The Maven Protobuf plugin is used to generate the gRPC classes for the calculate service call and the [Kotlin Server
class](https://github.com/pact-foundation/pact-plugins/blob/main/server/src/main/kotlin/io/pact/example/grpc/provider/Server.kt) implements the calculate method.

## gRPC plugin

To run the test in this project, it requires the gRPC plugin to be installed. See the [documentation on that plugin](https://github.com/pactflow/pact-protobuf-plugin#installation).

## Pact verification test

There is a [Pact verification test](https://github.com/pact-foundation/pact-plugins/blob/main/server/src/test/java/io/pact/example/grpc/provider/PactVerificationTest.java) 
written in Java and JUint 5 that can verify the Kotlin server using a Pact file from one of the consumer projects.

In order to run the test, you must copy the pact files, from the consumer directory

```sh
mkdir -p src/test/resources/pacts
cp ../consumer-maven/target/pacts/*.json src/test/resources/pacts
```

You can then run the provider tests with

```sh
mvn test
```
