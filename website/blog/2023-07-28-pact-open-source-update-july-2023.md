---
title: Pact Open Source Update — July 2023
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2023-07-28
draft: false
hide_table_of_contents: false
---

:wave: Hello, its July, it's scorching so I hope you've got an ice cream to accompany you this episode or maybe a brolly if you are stuck in a rain-shower!

For the keener of our readers, you may note we missed our June episode. I was on holiday ( a rare treat! ) which was spent mainly away from the keyboard, with
with the exception of a little flurry in pact-python.

Never fear, a double-dose of Pact Open Source updates are here!

## OSS Updates

<!-- overview of open source activity -->

### Pact-xyz

<!-- libary updates here -->

### Pact-Go

Pact-Go V2 has officially been released, following an extended beta period. We are very grateful to our many early users who provided invaluable feedback.

You can check out the full release notes [here](https://github.com/pact-foundation/pact-go/releases/tag/v2.0.0)

and for those migrating from v1, you can check out the migration guide [here](https://github.com/pact-foundation/pact-go/blob/master/MIGRATION.md)

This update replaces the pact-ruby core, with the pact-rust core, utilized through the pact_ffi library, bringing support for V3 and V4 Pact specifications and the ability to load pact-plugins to extend the capabilities of pact-go.

- Supported platforms.
  - Linux x86_64 / arm64
  - MacOS x86_64 / arm64
  - Windows x86_64

Please note that Alpine Linux is not supported at this time.

### Pact-JS

:nodejs: - JavaScripters/TypeScripters/Nodemads

We listened to our community, who struggled with requiring python to install pact-js in order to get at that lovely rust pact-core functionality in pact-js v10 & v11 and pact-js-core v13

You can now find they both come fully charged with batteries included, meaning that supported platforms can use pact js v12 and pact-js-core v14 with `--ignore-scripts true` and no additional install time build requirements

- Supported platforms.
  - Linux x86_64 / arm64
  - MacOS x86_64 / arm64
  - Windows x86_64
- [Migration notes](https://github.com/pact-foundation/pact-js/blob/master/MIGRATION.md#11xx---12xx)
- Troubleshooting
  - [Failed to find native build](https://github.com/pact-foundation/pact-js/blob/master/docs/troubleshooting.md#failed-to-find-native-build)
  - [Failed to find node:path](https://github.com/pact-foundation/pact-js/blob/master/docs/troubleshooting.md#enoent-no-such-file-or-directory-open-nodepath)
  
In addition, the new releases now support versions of Node 16 and greater, CI testing has been dropped for earlier versions, and we explicitly set the `engines` value in the `package.json` of both `pact-js` and `pact-js-core` to honour this restriction. We would advise updating your projects to an in support LTS version, (Node 18 LTS is probably most sensible at this point and node 16 is due to EOL on 11th Sept 2023)

- Pact-JS v12 Release Notes https://github.com/pact-foundation/pact-js/releases/tag/v12.0.0
- Pact-JS-Core v14 Release Notes https://github.com/pact-foundation/pact-js-core/releases/tag/v14.0.0

### Pact-Python

Pact-Python 2.0.0 has been released

- What does it contain?
  - ARM64 for both Linux & MacOS is now natively supported by Pact Python
  - Linux Support for x86 platforms (32-bit) has been dropped
  - The ruby standalone now runs the latest ruby 3.2.2 (big bump  - from a deprecated Ruby 2.4)
  - Plus a few other fixes and enhancements from the community and maintainers.
- Release notes:- https://github.com/pact-foundation/pact-python/releases/tag/v2.0.0
- PyPi:- https://pypi.org/project/pact-python/2.0.0/

Whats next for Pact-Python?

  - [Dropping support for Python 3.6](https://github.com/pact-foundation/pact-python/issues/350)
  - [Support for pact verification by URI](https://github.com/pact-foundation/pact-python/pull/356)
  - [Pact FFI in Pact-Python](https://github.com/pact-foundation/pact-python/pulls)

### Pact-PHP

Pact-PHP 9.0.0 has been released

- What does it contain?
  - ARM64 for both Linux & MacOS is now natively supported by Pact PHP
  - Linux Support for x86 platforms (32-bit) has been dropped
  - The ruby standalone now runs the latest ruby 3.2.2 (big bump from a deprecated Ruby 2.4)
  - Plus a few other fixes and enhancements from the community and maintainers.
  - The CI Pipeline has dependabot hooked up, to ensure our dependencies stay up to date
  - Release documentation has been added to aid future maintainers
  - Support for PHP 7.4 has been dropped. You should be on 8 by now though, surely
- Release Notes:- https://github.com/pact-foundation/pact-php/releases/tag/9.0.0
- Packagist:- https://packagist.org/packages/pact-foundation/pact-php#9.0.0

Whats next for Pact-PHP?

Oh Hi FFI :blobwave:

[#262 Pact FFI in Pact PHP](https://github.com/pact-foundation/pact-php/issues/262)

## Hello Jo!

<!-- Jo's intro -->

## Pactober

<!-- initial info about October event -->

## Thats a wrap

That’s it for this month. Stay safe and carry on coding!

- Yousaf Nabi — Developer Advocate at PactFlow and Community Shepherd at Pact.
