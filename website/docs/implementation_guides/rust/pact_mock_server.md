---
title: Pact Mock Server library
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_mock_server/README.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

This library implements the in-process mock server for matching HTTP requests and generating responses from a pact file.
It implements the [V3 Pact specification](https://github.com/pact-foundation/pact-specification/tree/version-3)
and [V4 Pact specification](https://github.com/pact-foundation/pact-specification/tree/version-4).

[Online rust docs](https://docs.rs/pact_mock_server/latest/pact_mock_server/)

All the exported functions using C bindings for controlling the mock server are now found in the [pact_ffi module](https://github.com/pact-foundation/pact-reference/tree/master/rust/pact_ffi).

## [create_mock_server](https://docs.rs/pact_mock_server/latest/pact_mock_server/fn.create_mock_server.html)

Creates a mock server. Requires the pact JSON as a string as well as the port for the mock server to run on. A value of 
0 for the port will result in a port being allocated by the operating system. The port of the mock server is returned.

## [mock_server_matched](https://docs.rs/pact_mock_server/latest/pact_mock_server/fn.mock_server_matched.html)

Simple function that returns a boolean value given the port number of the mock service. This value will be true if all
the expectations of the pact that the mock server was created with have been met. It will return false if any request did
not match, an un-recognised request was received or an expected request was not received.

## [mock_server_mismatches](https://docs.rs/pact_mock_server/latest/pact_mock_server/fn.mock_server_mismatches.html)

This returns all the mismatches, un-expected requests and missing requests in JSON format, given the port number of the
mock server.

## [shutdown_mock_server](https://docs.rs/pact_mock_server/latest/pact_mock_server/fn.shutdown_mock_server.html)

Shuts down the mock server with the provided port. Returns a boolean value to indicate if the mock server was successfully shut down.

## [write_pact_file](https://docs.rs/pact_mock_server/latest/pact_mock_server/fn.write_pact_file.html)

Trigger a mock server to write out its pact file. This function should be called if all the consumer tests have passed. 
The directory to write the file to is passed as the second parameter. If None is passed in, the current working 
directory is used. If overwrite is true, the file will be overwritten with the contents of the current pact. Otherwise 
it will be merged with any existing pact file.

Returns Ok if the pact file was successfully written. Returns an Err if the file can not be written, or there is no 
mock server running on that port.
