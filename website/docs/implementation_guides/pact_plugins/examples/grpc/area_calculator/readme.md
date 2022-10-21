---
title: Area Calculator Example
custom_edit_url: https://github.com/pact-foundation/pact-plugins/edit/main/examples/gRPC/area_calculator/README.md
---
<!-- This file has been synced from the pact-foundation/pact-plugins repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## Source Code

https://github.com/pact-foundation/pact-plugins/tree/main/examples


This is a simple gRPC example that can receive a shape via gRPC, and return the area for the shape. See the [proto file](https://github.com/pact-foundation/pact-plugins/blob/main/proto/area_calculator.proto)
for more details.

The proto file has a single service method which these examples will be testing:

```protobuf
  rpc calculate (ShapeMessage) returns (AreaResponse) {}
```

## Java/JUnit 5 consumer

The example [JVM consumer project](https://github.com/pact-foundation/pact-plugins/blob/main/consumer-jvm) contains a simple consumer in Java generated from Gradle and a JUnit 5 consumer test.

## Rust consumer

The example [Rust consumer project](https://github.com/pact-foundation/pact-plugins/blob/main/consumer-rust) contains a simple consumer generated with Prost and a Rust consumer test.

## Kotlin Provider and Java/JUnit 5 test

The [provider project](https://github.com/pact-foundation/pact-plugins/blob/main/provider-jvm) contains a Kotlin server and a Java/JUnit 5 test to verify the Pact file from the consumer projects.
It can also be verified using the Rust verifier CLI.
