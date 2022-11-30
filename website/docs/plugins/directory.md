---
id: directory
title: Pact Plugins Directory
---


## Plugin Tooling

- Download the Pact CLI tool for managing plugins
  - [Docs](https://docs.pact.io/implementation_guides/pact_plugins/cli)
  - [Releases](https://github.com/pact-foundation/pact-plugins/releases?q=pact+plugin+cli&expanded=true)

## Released Plugins

A list of available known plugins, please add your to the list.

|Name | Type   |  Language |  code | Support |
|---|---|---|---|---|
|pact-protobuf-plugin| Protobuf/gRPC  | Rust | [Code](https://github.com/pactflow/pact-protobuf-plugin)| official |

## Template Plugins

These templates come with all the boilerplate out the way, so you can concentrate on building new capabilities

| Type   |  Language |  code | workshop |
|---|---|---|---|
| Generic  | GoLang | [Code](https://github.com/pact-foundation/pact-plugin-template-golang)| [In Browser Workshop](https://killercoda.com/pactflow/scenario/create-a-plugin) |

## Demos

We have built out some demos based on a few scenario's, that you can run on your machine or in browser via our interactive tutorials.

1. [Area Calculator](https://github.com/pact-foundation/pact-plugins/tree/main/examples/gRPC/area_calculator)
   1. [Proto file](https://github.com/pact-foundation/pact-plugins/blob/main/examples/gRPC/area_calculator/proto/area_calculator.proto)
2. [Pact Plugin](https://github.com/pact-foundation/pact-plugins/tree/main/examples/protobuf)
   1. [Proto file](https://github.com/pact-foundation/pact-plugins/blob/main/proto/plugin.proto)
3. [CSV](https://github.com/pact-foundation/pact-plugins/tree/main/examples/csv)

👉 [Try out gRPC, CSV & Protobuf testing in Go, Rust & Java with Pact Plugins](https://killercoda.com/safdotdev/course/safacoda/grpc_quick_start)
  
|Type   | Scenario   | Side | Language | code |
|---|---|---|---|---|
|gRPC   |Area Calculator   | Consumer  |  Java - Gradle  | [Code](https://github.com/pact-foundation/pact-plugins/tree/main/examples/gRPC/area_calculator/consumer-jvm) |
|gRPC   |Area Calculator   | Consumer  |  Java - Maven | [Code](https://github.com/pact-foundation/pact-plugins/tree/main/examples/gRPC/area_calculator/consumer-maven)  |
|gRPC   |Area Calculator   | Consumer  |  Rust  | [Code](https://github.com/pact-foundation/pact-plugins/tree/main/examples/gRPC/area_calculator/consumer-rust)  |
|gRPC   |Area Calculator   | Consumer  |  Go  | [Code](https://github.com/pact-foundation/pact-plugins/tree/main/examples/gRPC/area_calculator/consumer-go)  |
|gRPC   |Area Calculator   | Provider  |  Java - Gradle   | [Code](https://github.com/pact-foundation/pact-plugins/tree/main/examples/gRPC/area_calculator/consumer-jvm)  |
|gRPC   |Area Calculator   | Provider  |  Go  | [Code](https://github.com/pact-foundation/pact-plugins/tree/main/examples/gRPC/area_calculator/provider-go) |
|Protobuf   |Pact Plugin   | Consumer  |  Java - Gradle  | [Code](https://github.com/pact-foundation/pact-plugins/tree/main/examples/protobuf/protobuf-consumer-jvm)  |
|Protobuf   |Pact Plugin    | Consumer  |  Java - Maven | [Code](https://github.com/pact-foundation/pact-plugins/tree/main/examples/protobuf/protobuf-consumer-maven) |
|Protobuf   |Pact Plugin    | Consumer  |  Rust  | [Code](https://github.com/pact-foundation/pact-plugins/tree/main/examples/protobuf/protobuf-consumer-rust) |
|Protobuf   |Pact Plugin    | Provider  |  Go  | [Code](https://github.com/pact-foundation/pact-plugins/tree/main/examples/protobuf/protobuf-provider)  |
|Protobuf   |Area Calculator   | Provider  |  Go  | [Code](https://github.com/pact-foundation/pact-plugins/tree/main/examples/protobuf/area_calculator_example/consumer)  |
|CSV   |Content Type   | Consumer  |  Java - Gradle  | [Code](https://github.com/pact-foundation/pact-plugins/tree/main/examples/csv/csv-consumer-jvm)  |
|CSV   |Content Type     | Consumer  |  Rust  | [Code](https://github.com/pact-foundation/pact-plugins/tree/main/examples/csv/csv-consumer-rust) |
|CSV   |Content Type     | Provider  |  Rust  | [Code](https://github.com/pact-foundation/pact-plugins/tree/main/examples/csv/csv-provider) |

## Plugin Prototypes

|Type   |  Language |  code |
|---|---|---|
| Protobuf  | Java/Gradle  | [Code](https://docs.pact.io/implementation_guides/pact_plugins/plugins/protobuf)|
| CSV  | Rust  | [Code](https://github.com/pact-foundation/pact-plugins/tree/main/plugins/csv) |
