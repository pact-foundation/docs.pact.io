---
title: Docker
---

Often times, you'll want to use Docker to run Pact. For example, a common approach is to run all CI builds within a docker container. This guide offers some assistance in those wanting to pursue this path.

## Official Docker Images

We provide official containers to run common utilities as Docker images. All images from the `"pactfoundation"` [repository](https://hub.docker.com/u/pactfoundation) can be considered official:

* CLI Tools: [https://hub.docker.com/r/pactfoundation/pact-cli](https://hub.docker.com/r/pactfoundation/pact-cli) \(includes the Ruby implementation of the mock service, a language agnostic provider verifier, and the Pact Broker client tools.\)
* Pact Broker: [https://hub.docker.com/r/pactfoundation/pact-broker/](https://hub.docker.com/r/pactfoundation/pact-broker/)
* Stub Server: [https://hub.docker.com/r/pactfoundation/pact-stub-server](https://hub.docker.com/r/pactfoundation/pact-stub-server)

## Running Pact on Docker

If you want to run your Pact tests in Docker, please note the following guidance.

### Requirements

#### For Pact implementations that use the [Rust shared core](roadmap/feature_support)
:::info
**Applicable languages**: Pact JS, Pact .NET, Pact Go, Pact C++ and Pact Swift
:::

Pact currently requires glibc `>= 2.29`. Most modern debian-based images will ship with a compatible version.

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
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.25' not found (required by /app/node_modules/@pact-foundation/pact-core/build/Release/libpact_ffi.so)
```


#### For Pact implementations that use the [Ruby shared core](roadmap/feature_support) 
:::info
**Applicable languages**: Pact PHP, Python
:::

Pact currently [requires](https://github.com/phusion/traveling-ruby/blob/10262231f19238c638e7a4806408cf1e57cb2dca/CHANGELOG.md#version-20210206) glibc `>= 2.17`. The minimum supported Linux version is now RHEL 7 / CentOS 7 / Debian 8 / Ubuntu 14.06 / glibc 2.17.

### Example

Here is an example JS container that will run Pact tests within an official Node container based on Debian.

```shell
FROM node:18

RUN apt-get update -y && \
    apt-get install -y git g++ python3 build-essential && \
    rm -rf /var/lib/apt/lists/*

COPY ./ /app/
WORKDIR /app
RUN npm install
CMD ["npm", "t"]
```

*NOTE: we are installing some build tools here to allow native dependencies to be compiled, this is a prerequisite for many NodeJS packages, including Pact. Other languages may not require this*

### Alpine Linux

Many teams choose to run builds on Alpine Linux due to its tiny footprint, and smaller security surface area. 

#### For Pact implementations that use the [Rust shared core](roadmap/feature_support) or 
:::info
**Applicable languages**: Pact JS, Pact .NET, Pact Go, Pact C++ and Pact Swift
:::

Alpine is not supported as it requires us to build dynamically linked libraries for each specific version of Alpine and musl.

It's possible to make it work, but we make no guarantees and it's likely to [break](https://ariadne.space/2021/08/26/there-is-no-such-thing-as-a-glibc-based-alpine-image/) in subtle ways and we would instead recommend adopting Ubuntu or Debian which supports linking to glibc. 

#### For Pact implementations that use the [Ruby shared core](roadmap/feature_support) 
:::info
**Applicable languages**: Pact PHP, Python
:::

You'll need to ensure the following dependencies are met:

* Bash \(it's not enough to have Ash\)
* Standard CAs for TLS network communication
* glibc (>= 2.17)

_NOTE_: You do not need to install Ruby. The distribution takes care of this for you.

#### Reference Image

Here is an example NodeJS container that can be used as a reference to create a working container for your example:

```bash
FROM node:8-alpine

RUN apk add --no-cache --virtual build-dependencies build-base

RUN  apk --no-cache add ca-certificates wget bash \
  && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
  && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk \
  && apk add glibc-2.29-r0.apk

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
