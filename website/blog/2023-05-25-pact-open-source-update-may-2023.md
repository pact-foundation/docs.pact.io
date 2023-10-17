<!-- ---
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

[Repo](https://github.com/pact-foundation/pact-net)
[Slack](https://pact-foundation.slack.com/archives/C9UTHV2AD)

V4 of `Pact-Net` is about to support `V4` of the `Pact-Specification`.

- <https://github.com/pact-foundation/pact-net/pull/453>

The OCD gods have been appeased. You can all rest easy now, thanks to [Adam Rodger](https://github.com/adamrodger).

### Pact-PHP

- `pact-php` `ffi-dev` branch
  - [Tien Vo](https://github.com/tienvx) has been working hard on `ffi` support in `pact-php` and we are grateful to have had a couple more reviewers join the party. We've wanted to make it easier to consume, for beta testing, in order to get feedback from users, who may be more familiar in their own codebase, than `pact-php`'s. You can read more details about it in [this PR](https://github.com/pact-foundation/pact-php/pull/313#issue-1707802513) on how you can get involved.

### Pact-Python

- `pact-python` has put out a deprecation notice, noting that CI testing will soon be switched off for Python `3.6`.
  - You can check the [Python EOL dates](https://endoflife.date/python) and get prepared. `3.7` will be dropping support shortly, so you might as well take the time to jump up to `3.11` whilst you are there.

### Pact-JS

- `pact-js` & `pact-js-core` have put out deprecation notices, noting that CI testing will soon be switched off for Node `14`.
  - You can check the [Node EOL dates](https://endoflife.date/node) and get prepared. `16` will be dropping support shortly, so you might as well take the time to jump up to `18` which is the latest `LTS` but also check that you are compatible with `20`, the upcoming `LTS`
- `pact-js-core` will soon come will `batteries included` - [PR](https://github.com/pact-foundation/pact-js-core/pull/446)
  - All supported platform/arch combo's for `libpact_ffi` will come pre-packaged in `pact-js-core` and `pact-js`, this means users will be able to
  - `npm install @pact-foundation/pact --ignore-scripts`
  - Not require a full developer tool-chain included Python to run `node-gyp` in order to generate the required `node` bindings. We'll do the grunt work, so you don't have to.

### Pact-Broker

[![pulls](https://badgen.net/docker/pulls/pactfoundation/pact-broker?icon=docker&label=pulls)](https://hub.docker.com/r/pactfoundation/pact-broker)
[![stars](https://badgen.net/docker/stars/pactfoundation/pact-broker?icon=docker&label=stars)](https://hub.docker.com/r/pactfoundation/pact-broker)

As the Pact-Broker nears its birthday, it decided that it better get ready. You'll now find the latest `pact_broker` and `pact_broker-docker` projects have been upgrades to support Ruby `3.2`, and `pact_broker-docker` now comes in the following flavours via [this PR](https://github.com/pact-foundation/pact-ruby-cli/pull/98).

[![size: amd64](https://badgen.net/docker/size/pactfoundation/pact-broker/latest-multi/amd64?icon=docker&label=size%3Aamd64)](https://hub.docker.com/r/pactfoundation/pact-broker)
[![size: arm64](https://badgen.net/docker/size/pactfoundation/pact-broker/latest-multi/arm64?icon=docker&label=size%3Aarm64)](https://hub.docker.com/r/pactfoundation/pact-broker)
[![size: arm](https://badgen.net/docker/size/pactfoundation/pact-broker/latest-multi/arm?icon=docker&label=size%3Aarm)](https://hub.docker.com/r/pactfoundation/pact-broker)

#### New Tagging Format

On 3 May 2023, the format of the docker tag changed from starting with the Pact Broker gem version (`2.107.0.1`), to ending with the Pact Broker gem version (`2.107.1-pactbroker2.107.1`). Read about the new versioning scheme [here](https://github.com/pact-foundation/pact-broker-docker/tree/master#versioning).

#### Docker Multi-Arch Info

You'll be able to pull multi-arch builds for `arm/arm64` machines soon, by adding the `-multi` flag to your `pact_broker` tag.

By default, vanilla tags, are built only for amd64

    docker run --platform=linux/amd64 --rm -it --entrypoint /bin/sh pactfoundation/pact-broker:latest -c 'uname -sm'

returns

```console
Linux x86_64
```

We need some [`binfmt` emulators](https://github.com/tonistiigi/binfmt), to run multi-arch. - Thanks to [tonistiigi](https://github.com/tonistiigi) for his project.

Note: You only need the `binfmt` emulators, if you plan on running a non-native image. Unless you are testing, you wouldn't normally want to do this :)

```sh
docker run --privileged --rm tonistiigi/binfmt --install all
```

We can now run multi-arch images

```sh
docker run --platform=linux/arm64 --rm -it --entrypoint /bin/sh pactfoundation/pact-broker:latest-multi -c 'uname -sm'
docker run --platform=linux/amd64 --rm -it --entrypoint /bin/sh pactfoundation/pact-broker:latest-multi -c 'uname -sm'
docker run --platform=linux/arm/v7 --rm -it --entrypoint /bin/sh pactfoundation/pact-broker:latest-multi -c 'uname -sm'
```

returns

```console
Linux aarch64
Linux x86_64
Linux armv7l
```

#### Armageddon - Go Forth and multi-manifest

:::info
Why not drop into your favourite repo, and see if you can help them build multi-platform images, it's simpler than you might think.
:::

Prepare your docker builder

```sh
docker buildx create --platform linux/arm64,linux/arm/v8,linux/amd64 --name multi_arch_builder
docker buildx use multi_arch_builder
```

Building your own multi-arch images

Note: (this will push the multi-manifest image to Dockerhub), remove `push=true` if you don't want to.

- Replace `DOCKER_IMAGE_ORG_AND_NAME` & `TAG` with your required values

```sh
docker buildx build --platform=linux/amd64,linux/arm64,linux/arm \
    --output=type=image,push=true \
    -t ${DOCKER_IMAGE_ORG_AND_NAME}:${TAG} .
```

### Pact-Ruby-Cli

[![pulls](https://badgen.net/docker/pulls/pactfoundation/pact-cli?icon=docker&label=pulls)](https://hub.docker.com/r/pactfoundation/pact-cli)
[![stars](https://badgen.net/docker/stars/pactfoundation/pact-cli?icon=docker&label=stars)](https://hub.docker.com/r/pactfoundation/pact-cli)

Not to be outshone, by the Pact Broker Docker, Pact Ruby Cli now comes in the following flavours

[![size: amd64](https://badgen.net/docker/size/pactfoundation/pact-cli/latest-multi/amd64?icon=docker&label=size%3Aamd64)](https://hub.docker.com/r/pactfoundation/pact-cli)
[![size: arm64](https://badgen.net/docker/size/pactfoundation/pact-cli/latest-multi/arm64?icon=docker&label=size%3Aarm64)](https://hub.docker.com/r/pactfoundation/pact-cli)
[![size: arm](https://badgen.net/docker/size/pactfoundation/pact-cli/latest-multi/arm?icon=docker&label=size%3Aarm)](https://hub.docker.com/r/pactfoundation/pact-cli)

#### New Tagging Format

On 23rd May 2023, introduced in this [PR](https://github.com/pact-foundation/pact-ruby-cli/pull/112) , the format of the docker tag changed from ending with the Pact Cli Gem version (`0.51.0.4`), where `.4` noted a change to the one of the packaged gems, to ending with the Pact Cli gem version (`0.52.0-pactcli0.52.0`). Read about the new versioning scheme [here](https://github.com/pact-foundation/pact-ruby-cli#versioning).

#### Alpine 3.18 & Ruby 3.2.2

[Alpine 3.18 is out](https://www.alpinelinux.org/posts/Alpine-3.18.0-released.html), and Pact-Ruby-Cli is [now up to date](https://github.com/pact-foundation/pact-ruby-cli/pull/113)

### Pact-Ruby-Standalone

pact-ruby-standalone 2.0.1 is out!

- has [some fancier instructions](https://github.com/pact-foundation/pact-ruby-standalone/pull/108), in case it goes pear when downloading
- lots of [docker files created for users](https://github.com/pact-foundation/pact-ruby-standalone/pull/109), tested x-plat

but most importantly, the latest Ruby runtime, and native arm64 architecture.

#### Supported Platforms

Ruby is not required on the host platform, Ruby 3.2.2 is provided in the distributable.

| OS     | Ruby      | Architecture   | Supported |
| -------| -------   | ------------   | --------- |
| MacOS  | 3.2.2     | x86_64         | ✅        |
| MacOS  | 3.2.2     | aarch64 (arm64)| ✅        |
| Linux  | 3.2.2     | x86_64         | ✅        |
| Linux  | 3.2.2     | aarch64 (arm64)| ✅        |
| Windows| 3.2.2     | x86_64         | ✅        |
| Windows| 3.2.2     | x86            | ✅        |
| Windows| 3.2.2     | aarch64 (arm64)| 🚧        |

🚧 - Tested under emulation mode x86 / x86_64 in Windows on ARM

You'll see the roll out of improved CLI documentation on our main site, more distribution methods and a slicker experience overall soon.

### Pact FFI

- A smorgasbord of [fixes and a small feature went into 0.4.4](https://github.com/pact-foundation/pact-reference/blob/master/rust/pact_ffi/CHANGELOG.md#044---bugfix-release) of Pact FFI.

### Pact Plugins

- Pact-Rust and Pact-JVM [now support auto-loading](https://github.com/pact-foundation/pact-plugins/blob/88a2e1b77a602acc86204976bf8185fa3f5a6611/drivers/rust/driver/CHANGELOG.md?plain=1#L13) of Pact-Plugins

### Pact Erlang

Oh yeah, you heard that right!

With thanks to community contributor [Priyaranjan Mudliar](https://github.com/silverblaze404), [Pact-Erlang](https://github.com/silverblaze404/pact-erlang) is alive.

It describes itself as

>An OTP library for contract testing using pact and generating consumer pacts

and is proudly using the new Pact Rust core, via the FFI. We've been pleased to help guide Priyaranjan along the journey, its a first pass and doesn't contain a full feature-set. Be sure to drop him a ⭐ on his repo to show your support, and even better, if your an Erlang user, why not give it a go.

Check out the repo here https://github.com/silverblaze404/pact-erlang

### Pact Broker Client

Cucumber community contributor [David Goss](https://github.com/davidjgoss) paid us a visit and [dropped a fix in](https://github.com/pact-foundation/pact_broker-client/pull/132) whilst he was there.

If [you are like Homer](https://www.youtube.com/watch?v=VjpcLplkMUs) and often leave a trailing slash on your `PACT_BROKER_BASE_URL` or `--broker-base-url` values, consider yourself sorted.

You may notice [some improved next steps](https://github.com/pact-foundation/pact_broker-client/pull/133) when publishing provider contracts, and highlighted URL's, hopefully indicating to the user, useful next steps.

We hope this helps, please try it out and let us know!

## Pact Ecosystems

I've been introducing a fellow Dev Rel colleague to the history of Pact and vastness of the estate. We've been working through a few things, so we thought it would be awesome to share some of the outcomes so far.

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

## Community Corner - Adam Cox

<div><img src="https://github.com/pact-foundation/pact-ruby-standalone/assets/19932401/e2af26c8-30aa-406f-9796-2077076f488d" alt="Adam Cox" width="150" heigh="150" /></div>

If you've been around our GitHub repos or Slack, over the last couple of months, you can be sure to have seen Adam Cox's name pop up.

Well this month, we have an absolute treat. We have the pleasure of opening a new community corner section on our site, dedicated to your voice.

We are equally as honoured to help the community put a name to the face, as we speak to Adam Cox about his journey at Sky, from introducing Pact to the team, to adventures with embedded devices, websockets, and how the Pact Plugin framework is helping them push the envelope.

Be sure to check it our [here](/users/community_corner/adam_cox_interview_may2023)

## Thats a wrap

That’s it for this month. Stay safe and carry on coding!

- Yousaf Nabi — Developer Advocate at PactFlow and Community Shepherd at Pact. -->
