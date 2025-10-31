---
title: Pact FFI
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_ffi/README.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

This crate provides a Foreign Function Interface (FFI) to the Pact-Rust crates,
with the intent of enabling Pact's core matching mechanisms to be used by implementations
in other languages.

## Documentation

Documentation for the FFI functions and types is available at https://docs.rs/pact_ffi/latest/pact_ffi/index.html, and
documentation on the integration JSON format is [IntegrationJson.md](https://github.com/pact-foundation/pact-reference/blob/master/rust/pact_ffi/IntegrationJson.md).

## Dependencies

This crates requires:

- `cbindgen`, a tool for automatically generating the header file needed for C users of the crate.
- A nightly-channel version of Cargo (needed for an unstable flag used by `cbindgen` to get the macro-expanded contents of the crate source).

It will additionally attempt to find and use `Doxygen` to generate C-friendly documentation (you can of course alternatively use `cargo doc` to get Rustdoc documentation).

**Note:** Linking to the generated static library on Linux requires you to also link to `pthread`, `dl` and `m`.

## Building with CMake

For convenience, this tool integrates with CMake, which is setup to:

1. Run Cargo to build the library file.
2. Run Cbindgen to build the header file.
3. Run Doxygen to build the documentation.

To use this CMake build, you can do the following:

```bash
$ mkdir build
$ cd build
$ cmake ..
$ cmake --build .
```

You can also optionally install the built artifacts as follows:

```bash
$ cmake --install . --prefix=<install location (omit to install globally)>
```

## Conan recipes

The library files (lib and DLLs) are published as Conan recipes to the repository at https://pactfoundation.jfrog.io/artifactory/api/conan/pactfoundation-conan.
To use it with a CMake project, add that repository as a Conan remote and then use Conan to generate
the CMake dependency files for your project. There are two recipes, `pact_ffi` to use the static lib and
`pact_ffi_dll` to use the dynamic lib.

```console
$ conan remote add pact-foundation https://pactfoundation.jfrog.io/artifactory/api/conan/pactfoundation-conan
$ conan search pact_ffi -r=pact-foundation
Existing package recipes:

pact_ffi/0.0.0@pact/beta
$ conan search pact_ffi_dll -r=pact-foundation
Existing package recipes:

pact_ffi_dll/0.0.0@pact/beta
```

## Examples

This project also includes example uses which depend on the crate via CMake.

Before building an example, make sure to run the following from the overall CMake build
directory (`./build`):

```bash
$ cmake --install . --prefix ./install
```

Then, from the example's directory, do the following:

```bash
$ mkdir build
$ cd build
$ cmake ..
$ cmake --build .
```

## Architecture

You can read about the architecture and design choices of this crate in
[ARCHITECTURE.md](https://github.com/pact-foundation/pact-reference/blob/master/rust/pact_ffi/ARCHITECTURE.md).

## Compatibility

&lt;details&;gt;&lt;summary&;gt;Supported Platforms&lt;/summary&;gt;

| OS      | Architecture | Supported  | Pact FFI Version |
| ------- | ------------ | ---------  | ---------------- |
| OSX     | x86_64       | ✅         | All              |
| Linux   | x86_64       | ✅         | All              |
| Windows | x86_64       | ✅         | All              |
| OSX     | arm64        | ✅         | [>=0.0.1](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.4.14)         |
| Linux   | arm64        | ✅         | [>=0.3.6](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.3.6)         |         |
| Windows | arm64        | ✅         | [>=0.4.14](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.4.14)         |
| Alpine  | x86_64       | ✅         | static - [>=0.2.4](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.2.4)|
| Alpine  | arm64        | ✅         | static - [>=0.4.15](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.4.15)|
| Alpine  | x86_64       | ✅         | dynamic - [>=0.4.17](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.4.17)|
| Alpine  | arm64        | ✅         | dynamic - [>=0.4.17](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.4.17)|

&lt;/details&gt;
