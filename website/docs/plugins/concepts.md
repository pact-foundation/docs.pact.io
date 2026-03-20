---
title: How plugins work
---

The Pact Plugin Framework extends Pact beyond HTTP and asynchronous messages to support any transport or content type your architecture requires. This page explains the conceptual model behind plugins — what they are, how they integrate with the Pact core, and when it makes sense to build or use one.

## Why plugins exist

Pact was originally designed around RESTful HTTP interactions. Over time, three forces pushed against that constraint:

1. **New transports** — gRPC, WebSockets, MQTT, and event streaming platforms require different interaction models than HTTP.
2. **New content types** — Protobuf, Avro, and GraphQL cannot be described using the standard JSON-based matching rules.
3. **The maintainability problem** — Adding native support for each new protocol in every Pact client library (JavaScript, Java, Go, Python, etc.) is slow, and puts a heavy burden on core maintainers.

The plugin framework solves all three. Rather than building each capability into the core, it defines a standard interface that external plugins can implement. Any new protocol, transport, or content type can be supported without waiting for core maintainers to build it, and without each language library needing its own implementation.

## The three interaction types

Pact has three interaction models. Plugins can extend any of them:

| Interaction type | Description | Examples |
|---|---|---|
| **Synchronous/HTTP** | The consumer sends a request; the provider returns a response. | REST, GraphQL over HTTP |
| **Asynchronous/Messages** | One-way events. Producer publishes; consumer reads. | SNS, SQS, Kafka, AMQP |
| **Synchronous/Messages** | Bidirectional or streaming. | gRPC (streaming), WebSockets |

A plugin can add support for a new _transport_ (how messages are sent) or a new _content type_ (how message bodies are serialised and matched).

## System actors and how they fit together

When a Pact test runs with a plugin, the following actors interact:

```
Your test code
  └─> Test framework (Jest, JUnit, Go test, ...)
        └─> Pact client library (pact-js, pact-jvm, pact-go, ...)
              └─> Pact Core (Rust FFI) or Java Plugin Driver
                    └─> Plugin Driver
                          └─> Plugin process
                                └─> System under test
```

1. **Your test code** defines the expected interaction using the Pact DSL.
2. **The Pact client library** passes the interaction definition to the Pact Core.
3. **The Pact Core** (a shared Rust library, accessed via FFI) manages the test lifecycle and delegates to the Plugin Driver for plugin-capable interactions.
4. **The Plugin Driver** discovers, starts, and manages the plugin process.
5. **The Plugin process** is an external binary that handles the protocol-specific work:
   - For transport plugins: serves as the mock server during consumer tests and sends verification requests to the provider.
   - For content plugins: serialises, deserialises, and applies matching rules to the message body.
6. **The pact file** is updated to record the plugin name and version, the interaction type, and any protocol-specific metadata the plugin needs.

Plugins run as separate processes. They communicate with the Pact Core over gRPC using the Pact Plugin Protocol. This isolation means a plugin crash cannot crash the test runner.

## Two types of plugins

### Transport plugins

A transport plugin provides support for a new network protocol. It takes over the roles normally handled by Pact's built-in HTTP engine:

- During **consumer testing**: acts as the mock server, serving responses the consumer expects.
- During **provider verification**: sends the recorded interactions to the real provider and compares the responses.

Example: the Protobuf/gRPC plugin provides a mock gRPC server for consumer tests and a gRPC verification client for provider tests.

### Content matcher plugins

A content matcher plugin provides support for a new data serialisation format. It handles:

- **Serialisation and deserialisation** of the body into a comparable form.
- **Matching rules** specific to the format (e.g. Protobuf field paths, Avro schema types).
- **Generators** for producing dynamic test values in the format.

Content matcher plugins are typically combined with a standard transport (e.g. Protobuf over HTTP, Avro over Kafka).

## How the pact file records plugin interactions

When a plugin is used, the pact file includes additional metadata that the provider verification step needs:

```json
{
  "interactions": [
    {
      "description": "a product event",
      "type": "Asynchronous/Messages",
      "contents": { ... },
      "pluginConfiguration": {
        "contentType": "application/protobuf",
        "descriptorKey": "ProductEvent"
      }
    }
  ],
  "metadata": {
    "pactSpecification": { "version": "4.0" },
    "plugins": [
      { "name": "protobuf", "version": "0.3.15" }
    ]
  }
}
```

The `plugins` metadata entry tells the verifier which plugin to load before replaying the interaction. If the required plugin is not installed, verification will fail with a clear error.

## When to use a plugin vs when to build one

**Use an existing plugin** if one already exists for your protocol. Check the [Plugin Directory](/plugins/directory) first. Installing a plugin takes a few minutes; building one takes significantly longer.

**Build a plugin** if:
- No plugin exists for your protocol or content type.
- You need private or proprietary protocol support.
- You want to add a new Pact capability without waiting for a core maintainer to implement it.

**You do not need a plugin** for most common use cases:
- Standard REST/HTTP → use core Pact with HTTP interactions.
- JSON over Kafka/SNS/SQS → use core Pact with async message interactions.
- GraphQL over HTTP → use a content matcher plugin or handle as a standard HTTP POST.

## What plugins cannot do

Plugins operate within the Pact interaction model. They cannot:

- Change how Pact tracks versions, publishes pacts, or records verification results.
- Replace the Pact Broker or the can-i-deploy workflow.
- Test business logic on the provider — verification still only checks the response matches the consumer's recorded expectation.

## Next steps

- See available plugins in the [Plugin Directory](/plugins/directory).
- Try an existing plugin with the [Plugin Quick Start](/plugins/quick_start).
- Build your own with the [Create a Plugin workshop](/plugins/workshops/create-a-plugin/intro).
- Read the plugin design documents in [Pact Docs](/implementation_guides/pact_plugins) for the full technical specification.
