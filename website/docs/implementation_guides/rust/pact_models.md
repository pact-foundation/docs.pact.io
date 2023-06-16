---
title: Pact Models
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_models/README.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

This library provides the core models for dealing with Pact files. It supports the
[V3 pact specification](https://github.com/pact-foundation/pact-specification/tree/version-3) and
[V4 pact specification](https://github.com/pact-foundation/pact-specification/tree/version-4).

[Online rust docs](https://docs.rs/pact_models/)

## Reading and writing Pact files

The `Pact` struct has methods to read and write pact JSON files. It supports all the specification
versions up to V4, but will convert a V1, V1.1 and V2 spec file to a V3 format.

## Crate features

All features are enabled by default

* `datetime`: Enables support of date and time expressions and generators. This will add the
`chronos` crate as a dependency.
* `xml`: Enables support for parsing XML documents. This feature will add the `sxd-document`
crate as a dependency.
