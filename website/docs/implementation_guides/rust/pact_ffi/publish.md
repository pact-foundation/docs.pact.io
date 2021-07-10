---
title: Publishing the FFI libs to conan repo
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_ffi/publish.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

You're obviously going to replace the versions below with the actual versions you're releasing, and not
just copy it verbatim and expect magical things to happen.

### For lib conan package

```
 git checkout libpact_mock_server_ffi-v0.0.7
 cd conan/lib/
 conan create . pact/beta
 conan upload pact_mock_server_ffi/0.0.7@pact/beta -r=pact-foundation
```

### For DLL conan package

```
 git checkout libpact_mock_server_ffi-v0.0.7
 cd conan/dll/
 conan create . pact/beta
 conan upload pact_mock_server_ffi_dll/0.0.7@pact/beta -r=pact-foundation
```
