---
title: Releasing
custom_edit_url: https://github.com/pact-foundation/pact-php/edit/master/docs/RELEASING.md
---
<!-- This file has been synced from the pact-foundation/pact-php repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

Pact-PHP packages are published to Packagist

- https://packagist.org/packages/pact-foundation/pact-php

## Release Process

The release process is automated via GitHub Release tags, and Packagist Webhooks.

1. Create a tag from the master branch in GitHub
  - New versions of your package are automatically fetched from tags you create in your VCS repository.
2. Release to Packagist
  - A GitHub webhook will inform packagist that the package has been updated.
3. Create a release from the tag in GitHub
  - Set it to `latest`
  - Click `Generate CHANGELOG` to fill out a changelog.
  - Click `Publish Release`
