---
title: 3. gRPC
---


The Pact [Plugin Driver](https://github.com/pact-foundation/pact-plugins/blob/main/docs/plugin-driver-design.md) communicates to plugins using protobufs over gRPC.

gRPC was chosen because it is a high performance RPC framework - keeping our tests fast! - and there is strong typing support and codegen for it.

Teaching gRPC and Protobufs is beyond the scope of this tutorial, and we have provided some links at the bottom of this step for further reading.

*NOTE: you won't need an understanding of gRPC for this tutorial.*

## The Plugin API

In gRPC, you can define your API and types in a single `proto` definition.

The Plugin API canonical reference can be found here 👉 https://github.com/pact-foundation/pact-plugins/blob/main/proto/plugin.proto.

To create a plugin, you must create a server that implements the relevant RPC methods for the type of plugin you are creating.

## Creating a gRPC server implementation

Once you have your protobuf definitions, you can generate types for your server code using the `protoc`  command.

Each language is different. In Golang, it might look like this:

```sh
protoc --go_out=. --go_opt=paths=source_relative \
		--go-grpc_out=. --go-grpc_opt=paths=source_relative \
		io_pact_plugin/pact_plugin.proto
```

Never fear however, we will use a template project to avoid having to write much of this boilerplate!

## Further Reading

* https://grpc.io/
* https://dev.to/drminnaar/grpc-guide-25mo
* https://dev.to/techschoolguru/series/7311
* https://github.com/techschool/pcbook-go