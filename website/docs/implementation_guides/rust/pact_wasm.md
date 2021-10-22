---
title: Pact WASM bindings
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_wasm/README.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

Provides a WASM binary that includes the Pact models.

## Building for use on websites

The project is built using `wasm-pack`. To build a package that can be used on a website:

```commandline
$ wasm-pack build -t web --release
```

This will create a pkg directory with all the files needed to load from a webpage.
