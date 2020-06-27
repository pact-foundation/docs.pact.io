---
title: Pact Mock Server FFI library
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_mock_server_ffi/README.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

This library implements exported functions using C bindings for controlling the in-process mock server for 
matching HTTP requests and generating responses from a pact file.

[Online rust docs](https://docs.rs/pact_mock_server_ffi/)

For an example of calling these functions, have a [look at the JavaScript reference](../../../javascript/README.md).

## Functions

### [init](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/fn.init.html)

Initialise the mock server library, can provide an environment variable name to use to set the log levels.

### [create_mock_server](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/fn.create_mock_server.html)

External interface to create a mock server. A pointer to the pact JSON as a C string is passed in,
as well as the port for the mock server to run on. A value of 0 for the port will result in a
port being allocated by the operating system. The port of the mock server is returned.

### [create_mock_server_for_pact](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/fn.create_mock_server_for_pact.html)

External interface to create a mock server. A [Pact handle](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/handles/struct.PactHandle.html) is passed in, as well as the port for the mock server to run on. 
A value of 0 for the port will result in a port being allocated by the operating system. The port of the mock server is returned.

### [mock_server_matched](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/fn.mock_server_matched.html)

Simple function that returns a boolean value given the port number of the mock service. This value will be true if all
the expectations of the pact that the mock server was created with have been met. It will return false if any request did
not match, an un-recognised request was received or an expected request was not received.

### [mock_server_mismatches](http://www.pact.io/reference/rust/libpact_mock_server-docs-latest/pact_mock_server/fn.mock_server_mismatches.html)

This returns all the mismatches, un-expected requests and missing requests in JSON format, given the port number of the
mock server.

**IMPORTANT NOTE:** The JSON string for the result is allocated on the rust heap, and will have to be freed once the
code using the mock server is complete. The `cleanup_mock_server` function is provided for this purpose. If the mock
server is not cleaned up properly, this will result in memory leaks as the rust heap will not be reclaimed.

### [cleanup_mock_server](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/fn.mock_server_mismatches.html)

This function will try terminate the mock server with the given port number and cleanup any memory allocated for it by
the `mock_server_mismatches` function. Returns `true`, unless a mock server with the given port number does not exist,
or the function fails in some way.

**NOTE:** Although `close()` on the listerner for the mock server is called, this does not currently work and the
listerner will continue handling requests. In this case, it will always return a 501 once the mock server has been
cleaned up.

### [write_pact_file](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/fn.write_pact_file.html)

External interface to trigger a mock server to write out its pact file. This function should
be called if all the consumer tests have passed. The directory to write the file to is passed
as the second parameter. If a NULL pointer is passed, the current working directory is used.

Returns 0 if the pact file was successfully written. Returns a positive code if the file can
not be written, or there is no mock server running on that port or the function panics.

## Pact model handles

For languages that need to build up Pact models, there are two structs that represent a handle to a Pact model 
([PactHandle](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/handles/struct.PactHandle.html) and 
[InteractionHandle](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/handles/struct.InteractionHandle.html)). These handles
will refer to Rust Pact models stored on the rust heap.

To create a new Pact model, use [new_pact](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/fn.new_pact.html) and
then you can use the following DSL support functions to build up the model.

### [new_interaction](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/fn.new_interaction.html)

Creates a new Interaction and returns a handle to it.

### [upon_receiving](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/fn.upon_receiving.html)

Sets the description for the Interaction.

### [given](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/fn.given.html)

Adds a provider state to the Interaction.

### [with_request](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/fn.with_request.html)

Configures the request method and path for the Interaction.

### [with_query_parameter](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/fn.with_query_parameter.html)

Configures a query parameter for the Interaction.

### [with_header](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/fn.with_header.html)

Configures a header for the Interaction.

### [response_status](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/fn.response_status.html)

Configures the response for the Interaction.

### [with_body](https://docs.rs/pact_mock_server_ffi/0.0.1/pact_mock_server_ffi/fn.with_body.html)

Adds the body for the interaction.

## Conan package

This library has been deployed to Bintray as a [Conan package](https://bintray.com/pact-foundation/conan/pact_mock_server_ffi%3Apact).
You can use it by adding `pact_mock_server_ffi/0.0.7@pact/beta` to your conan dependencies. 

You will need to add this repository as a conan remote first:

```console
conan remote add pact-foundation https://api.bintray.com/conan/pact-foundation/conan
```
