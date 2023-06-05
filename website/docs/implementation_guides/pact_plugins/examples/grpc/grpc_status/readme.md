---
title: Examples dealing with gRPC error responses
custom_edit_url: https://github.com/pact-foundation/pact-plugins/edit/main/examples/gRPC/grpc_status/README.md
---
<!-- This file has been synced from the pact-foundation/pact-plugins repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## Source Code

https://github.com/pact-foundation/pact-plugins/tree/main/examples


These examples take the [Area Calculator Example](/implementation_guides/pact_plugins/examples/grpc/area_calculator) and modify it to return an unimplemented
response for one of the shapes. There are two consumer projects (one in Java and one in Rust), and the same for the
providers. They are setup to test sending the unimplemented shape message and assert that the correct gRPC status and
message is returned.

* [Java Consumer](https://github.com/pact-foundation/pact-plugins/blob/main/consumer-jvm)
* [Rust consumer](https://github.com/pact-foundation/pact-plugins/blob/main/consumer-rust)
* [Java Provider](https://github.com/pact-foundation/pact-plugins/blob/main/provider-jvm)
* [Rust Provider](https://github.com/pact-foundation/pact-plugins/blob/main/provider-rust)
