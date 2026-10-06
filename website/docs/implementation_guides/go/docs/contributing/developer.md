---
title: Developer documentation
custom_edit_url: https://github.com/pact-foundation/pact-go/edit/master/docs/contributing/developer.md
---
<!-- This file has been synced from the pact-foundation/pact-go repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## Tooling

Install [mise](https://mise.jdx.dev), then run `mise install` to get the
pinned Java and protoc versions. Go comes from your own toolchain; the
version floor is in `go.mod`.

Run `mise tasks` to list the available commands.

Docker is required for `mise run pact` and the containerised test tasks.

## Key Branches

### `1.x.x` 

The previous major version. Only bug fixes and security updates will be considered.

### `master`

The `2.x.x` release line. Current major version.
