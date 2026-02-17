---
title: Docker
---

Often times, you'll want to use Docker to run Pact. For example, a common approach is to run all CI builds within a docker container. This guide offers some assistance in those wanting to pursue this path.

## Official Docker Images

We provide official containers to run common utilities as Docker images. All images from the `"pactfoundation"` [repository](https://hub.docker.com/u/pactfoundation) can be considered official:

* Mock Server: [https://hub.docker.com/r/pactfoundation/pact-mock-server](https://hub.docker.com/r/pactfoundation/pact-mock-server)
* Stub Server: [https://hub.docker.com/r/pactfoundation/pact-stub-server](https://hub.docker.com/r/pactfoundation/pact-stub-server)
* Provider Verifier: [https://hub.docker.com/r/pactfoundation/pact-verifier](https://hub.docker.com/r/pactfoundation/pact-verifier)
* CLI Tools: [https://hub.docker.com/r/pactfoundation/pact-cli](https://hub.docker.com/r/pactfoundation/pact-cli)(Pact Broker client tool plus the Ruby implementation of the mock service & provider verifier.)
* Pact Broker: [https://hub.docker.com/r/pactfoundation/pact-broker/](https://hub.docker.com/r/pactfoundation/pact-broker/)

## Running Pact on Docker

If you want to run your Pact tests in Docker, please note the following guidance.

### Requirements

#### For Pact implementations that use the [Rust shared core](roadmap/feature_support)
:::info
**Applicable languages**: Pact JS, Pact .NET, Pact Go, Pact-PHP, Pact C++ and Pact Swift
:::

Pact currently supports both glibc (debian based) & musl (alpine) distributions.

If you are running Alpine or a musl libc based distrubution, see the [next section](#alpine-linux).

If you are running Debian-based or a glibc based distrubution, please read on.

Pact requires glibc `>= 2.23`. Most modern debian-based images will ship with a compatible version.

You can check the version of glibc installed via the `ldd` command:

```
> ldd --version
ldd (Debian GLIBC 2.31-13+deb11u3) 2.31
Copyright (C) 2020 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
Written by Roland McGrath and Ulrich Drepper.
```

If you see an error that looks like the following, taken from a JS project, it means your version of glibc is incompatible:

```
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.23' not found (required by /app/node_modules/@pact-foundation/pact-core/build/Release/libpact_ffi.so)
```

For a more exhaustive list of glibc versions against distroes, see the below table

Distribution | glibc version
-- | --
Arch Linux | 2.36
Alpine 3.13 | N/A
CentOS 7 | 2.17
CentOS Stream 8 | 2.28
CentOS Stream 9 | 2.34
Debian 9 (Stretch) | 2.24
Debian 10 (Buster) | 2.28
Debian 11 (Bullseye) | 2.31
Fedora 35 | 2.34
Homebrew | 2.23
OpenSUSE Leap 15.3 | 2.31
OpenSUSE Tumbleweed | 2.35
RHEL 7 | 2.17
RHEL 8 | 2.28
RHEL 9 | 2.34
Ubuntu 18.04 | 2.27
Ubuntu 20.04 | 2.31
Ubuntu 22.04 | 2.35


#### For Pact implementations that use the [Ruby shared core](roadmap/feature_support) 
:::info
**Applicable languages**: Python
:::

Pact currently [requires](https://github.com/phusion/traveling-ruby/blob/10262231f19238c638e7a4806408cf1e57cb2dca/CHANGELOG.md#version-20210206) glibc `>= 2.17`. The minimum supported Linux version is now RHEL 7 / CentOS 7 / Debian 8 / Ubuntu 14.06 / glibc 2.17.

### Example

Here is an example JS container that will run Pact tests within an official Node container based on Debian.

```shell
FROM node:20

WORKDIR /app

COPY package*.json /app/
RUN npm install
COPY . /app/

RUN npm test
```

### Alpine Linux

Many teams choose to run builds on Alpine Linux due to its tiny footprint, and smaller security surface area. 

#### For Pact implementations that use the [Rust shared core](roadmap/feature_support) or 
:::info
**Applicable languages**: Pact JS, Pact .NET, Pact Go, Pact-PHP, Pact C++ and Pact Swift
:::

- Executable builds are static, and therefore the single binary works across musl or glibc based distros (excluding ffi)
- pact_ffi library comes in both static `*.a` & shared `*.so` variants for musl, depending on the consuming client libraries requirements for ffi interop
  - If you are consuming this in a client DSL, check the readme's compatability chart to see if it using a musl supported version of pact_ffi. If not, drop in a PR. 

Support is available in the following tools for Alpine from specific versions.

| library | alpine support | version | 
| -- | -- | -- | 
| pact_ffi | ✅  | - `x86_64` `.a` from [0.2.4](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.2.4)
| | | - `aarch64` `.a` from [0.4.15](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.4.15)|
| | | - `.so` from [0.4.17](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.4.17) | |
| pact_mock_server_cli | ✅ | - [1.0.5](https://github.com/pact-foundation/pact-reference/releases/tag/pact_mock_server_cli-v1.0.5)
| pact_verifier_cli | ✅ | - [1.1.1](https://github.com/pact-foundation/pact-reference/releases/tag/pact_verifier_cli-v1.1.1)
| pact-stub-server | ✅ | - [0.6.0](https://github.com/pact-foundation/pact-stub-server/releases/tag/v0.6.0) | 
| pact-plugin-cli | ✅ | - [0.1.2](https://github.com/pact-foundation/pact-plugins/releases/tag/pact-plugin-cli-v0.1.2) | 
| pact-protobuf-plugin | ✅ | - [0.3.15](https://github.com/pactflow/pact-protobuf-plugin/releases/tag/v-0.3.15) | 
| pact-csv-plugin | ✅ | - [0.0.6](https://github.com/pact-foundation/pact-plugins/releases/tag/csv-plugin-0.0.6) | 

#### Reference Image

Here is an example NodeJS container that can be used as a reference to create a working container for your example:

```bash
FROM node:20-alpine

WORKDIR /app

COPY package*.json /app/
RUN npm install
COPY . /app/

RUN npm test
```

#### For Pact implementations that use the [Ruby shared core](roadmap/feature_support) 
:::info
**Applicable languages**: Python
:::

You'll need to ensure the following dependencies are met:

* Standard CAs for TLS network communication
* glibc (>= 2.17)

_NOTE_: You do not need to install Ruby. The distribution takes care of this for you.

#### Reference Image

Here is an example NodeJS container that can be used as a reference to create a working container for your example:

```bash
FROM node:20-alpine

WORKDIR /app

COPY package*.json /app/
RUN npm install
COPY . /app/

RUN npm test
```


#### For all other languages
:::info
**Applicable languages**: Pact JVM, pact4s, Rust, Ruby
:::

There are no specific requirements for Pact in these environments, you should be able to follow the standard guidance for your specific runtime.
