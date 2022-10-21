---
title: Protobuf JVM Consumer Example
custom_edit_url: https://github.com/pact-foundation/pact-plugins/edit/main/examples/protobuf/protobuf-consumer-jvm/README.md
---
<!-- This file has been synced from the pact-foundation/pact-plugins repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## Source Code

https://github.com/pact-foundation/pact-plugins/tree/main/examples


This example demonstrate using the prototype Protobuf plugin to support matching Protobuf messages.

The [proto file](https://github.com/pact-foundation/pact-plugins/blob/main/proto/plugin.proto) for the plugin interface is used for these tests.

The consumer has two tests, one for the simple InitPluginResponse message and one for the more complex
InteractionResponse message.

## Running the consumer tests

Before the consumer tests can be run, the Protobuf plugin needs to be built and installed into `$HOME/.pact/plugins`.
See [the plugins docs](https://github.com/pact-foundation/pact-plugins/blob/main/plugins/protobuf/README.md) for instructions.

The tests are run using Gradle, so just run `./gradlew check` and if the tests pass, a pact file will be 
created in the `build/pacts` directory.
