---
title: Pact Open Source Update — May 2023
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2023-05-25
draft: false
hide_table_of_contents: false
---

It's May, the sunshine ☀️ is upon us, and you might be reading this in the park 🏞️. If you are, watch out, theres a cyclist 🚴coming. 🛎️ 🛎️

Phew, that was close. Right, well now we are sorted, we've got some goodies lined up for this month, as the city of open-source never sleeps.

## OSS Updates

### Pact-Net

V4 of `Pact-Net` is about to support `V4` of the `Pact-Specification`.
  - https://github.com/pact-foundation/pact-net/pull/453

The OCD gods have been appeased. You can all rest easy now, thanks to Adam Rodgers.

### Pact-PHP

- `pact-php` `ffi-dev` branch
  - Tien Vo has been working hard on `ffi` support in `pact-php` and we are grateful to have had a couple more reviewers join the party. We've wanted to make it easier to consume, for beta testing, in order to get feedback from users, who may be more familiar in their own codebase, than `pact-php`'s. You can read more details about it in this post, on how you can get involved.
- `pact-php` with the `ruby` reference core
  - Introduces Arm64 Linux / MacOS

### Pact-Python

- `pact-python` has put out a deprecation notice, noting that CI testing will soon be switched off for Python `3.6`.
  - You can check the [Python EOL dates](https://endoflife.date/python) and get prepared. `3.7` will be dropping support shortly, so you might as well take the time to jump up to `3.11` whilst you are there.
- `pact-python` with the `ruby` reference core
  - Introduces Arm64 Linux / MacOS
  - Reintroduces x86 Windows

### Pact-JS

- `pact-js` & `pact-js-core` has put out a deprecation notice, noting that CI testing will soon be switched off for Node `14`.
  - You can check the [Node EOL dates](https://endoflife.date/node) and get prepared. `16` will be dropping support shortly, so you might as well take the time to jump up to `18` which is the latest `LTS` but also check that you are compatible with `20`, the upcoming `LTS`
- `pact-js-core` with the `ruby` standalone binaries
  - Introduces Arm64 Linux / MacOS
  - Closes currents issues for users on Linux arm64 machines who cannot install `pact-js-core` or `pact-js` despite us using the `rust` reference core.
- `pact-js-core` will soon come will `batteries included`
  - All supported platform/arch combo's for `libpact_ffi` will come pre-packaged in `pact-js-core` and `pact-js`, this means users will be able to
  - `npm install @pact-foundation/pact --ignore-scripts`
  - Not require a full developer tool-chain included Python to run `node-gyp` in order to generate the required `node` bindings. We'll do the grunt work, so you don't have to.

### Pact-Broker

As the `pact_broker` nears its birthday, it decided that is better get ready. You'll now find the latest `pact_broker` and `pact_broker-docker` projects have been upgrades to support Ruby `3.2`.

You'll be able to pull multi-arch builds for `arm/arm64` machines soon, by adding the `-multi` flag to your `pact_broker` tag.

### Pact FFI

### Pact Plugins

## Pact Ecosystems

### Aim

- Identify all Ruby codebases which need updating to Ruby 3.1 or higher
- Identify all consumers of ruby codebases
- Document "Rube Goldberg" machine for
  - Pact Ruby Reference Core as referenced [here](https://github.com/pact-foundation/devrel#dependency-graph-of-doom) in the dependency graph of doom
  - Pact Rust Reference Core
- Update to at least, Ruby 3.1, preferably Ruby 3.2 across all affected repos
- Update all affected repos
- Test all affected repos


### Why?

- Users of our pact-ruby-standalone project, have been stuck on a packaged Ruby 2.4 run-time due to the build system traveling-ruby, being out-of-maintainence. It has been revived by your very own Devo Avo, into the 21st century with
  - Update to Ruby 3.1.2 & 3.2.2
  - Support for Arm64 Darwin
  - Support for Aarch64 Linux
  - Support for x86 and x64 windows

### Rube Goldberg

Beth often refers to the Ruby Goldberg machine, in a nod to Rube Goldberg.

[![image](https://user-images.githubusercontent.com/19932401/202261902-fd61e2a4-7df1-4f1a-a795-b0722a8ecc33.png)](https://en.wikipedia.org/wiki/Rube_Goldberg_machine)

:::tip Wondered what it looks like?
You can see our newly published Pact Ecosystem page [here](/diagrams/ecosystem)
:::


## Pacticipate in our Ecosystem

> [Sorry Beth!](/getting_started/terminology#pacticipant)

Did you know, we've used many CI systems here at Pact, now using GitHub Actions extensively, after migrating from Travis CI when they stopped being so friendly towards open-sourcerers. That has been great for x86_64 / Intel Architectures, but we've had a missing link, namely Arm64/Aarch64 architecture, for those of use with shiny new Macs, or perhaps using some cheaper cloud hardware like AWS Graviton's or Oracle clouds free tier offering.

We've documented some details about our CI systems in a new contributing page, on our docs site, you can check them out [here](/contributing/ci)

:::tip did you know?
You can drop into any repository with a `.github/workflows/*.yml` or `.cirrus.yml` file and run the CI systems workflows ephemerally on your own machine.
:::
### 🐱‍💻 Local Machine - GitHub Actions

1. Download [Act](https://github.com/nektos/act)
2. Download Docker (or Podman)

#### Linux workflows

`act --container-architecture linux/amd64`

### 🐱‍💻 Local Machine - Cirrus CLI

1. Download [Cirrus CLI](https://github.com/cirruslabs/cirrus-cli)
2. Download Docker (or Podman)
3. If on an arm64 mac, download [tart.run](https://tart.run/)

#### Linux or MacOS workflows

   `cirrus run --output github-actions`
