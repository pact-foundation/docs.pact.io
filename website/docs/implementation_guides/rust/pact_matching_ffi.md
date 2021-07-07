---
title: Pact Matching FFI [DEPRECATED]
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_matching_ffi/README.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->


**NOTE:** This library is being moved into a single FFI library.

This crate provides a Foreign Function Interface (FFI) to the `pact_matching` crate,
with the intent of enabling Pact's core matching mechanisms to be used by implementations
in other languages.

## Dependencies

This crates requires:

- `cbindgen`, a tool for automatically generating the header file needed for C users of the crate.
- A nightly-channel version of Cargo (needed for an unstable flag used by `cbindgen` to get the macro-expanded contents of the crate source).

It will additionally attempt to find and use `Doxygen` to generate C-friendly documentation (you can of course alternatively use `cargo doc` to get Rustdoc documentation).

**Note:** Linking to the generated static library on Linux requires you to also link to `pthread`, `dl` and `m`.

## Building

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
[ARCHITECTURE.md](/implementation_guides/rust/pact_matching_ffi/architecture).
