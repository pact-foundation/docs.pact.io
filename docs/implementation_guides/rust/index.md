---
title: Reference implementation in Rust for the Pact Specification
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/README.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

[![Build Status](https://travis-ci.org/pact-foundation/pact-reference.svg?branch=master)](https://travis-ci.org/pact-foundation/pact-reference) [![Windows Build status](https://ci.appveyor.com/api/projects/status/bqlb7ny924lsu6yi?svg=true)](https://ci.appveyor.com/project/pact-foundation/pact-reference)

This is the project for a reference implementation of Pact in Rust. It implements the [V3 Pact specification](https://github.com/pact-foundation/pact-specification/tree/version-3).

For a version of this project that implements the [V1 Pact specification](https://github.com/pact-foundation/pact-specification/tree/version-1),
have a look at the [V1 Branch](https://github.com/pact-foundation/pact-reference/tree/v1-spec). For [V1.1 Pact specification](https://github.com/pact-foundation/pact-specification/tree/version-1.1),
have a look at the [V1.1 Branch](https://github.com/pact-foundation/pact-reference/tree/v1.1-spec). For [V2 Pact specification](https://github.com/pact-foundation/pact-specification/tree/version-2),
have a look at the [V2 Branch](https://github.com/pact-foundation/pact-reference/tree/v2-spec)

There are 5 main modules to this implementation:

## [pact_matching](pact_matching)

This is a library that provides the Pact models and functions for matching requests and responses, as well as reading
and writing pact files.

## [pact_mock_server](pact_mock_server)

This is a library that provides an in-process mock server for Pact client tests. It uses the [pact_matching](pact_matching)
library.

## [pact_mock_server_ffi](pact_mock_server_ffi)

This is a library that implements exported functions using C bindings for controlling the in-process mock server from
non-rust languages.

## [pact_mock_server_cli](pact_mock_server_cli)

This module provides a command line executable that provides a standalone pact mock server and commands for controlling
the mock servers. It uses the [libpact_mock_server](pact_mock_server) and [libpact_matching](pact_matching)
libraries.

## [pact_consumer](pact_consumer)

This is a library that provides the Pact consumer test support and DSL.

## [pact_verifier](pact_verifier)

This library provides support for verifying a provider against pact files.

## [pact_verifier_cli](pact_verifier_cli)

Command line excutable that uses the [pact_verifier](pact_verifier) to be able to verify a running provider against
pact files.
