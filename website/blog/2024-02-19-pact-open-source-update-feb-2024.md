---
title: Pact Open Source Update — Feb 2024
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2024-02-19
draft: false
hide_table_of_contents: false
---

Hello, and welcome to our first Pact Open post of 2024. It seem's customary that you get a month's reprieve from me at the start of every year, so I'll start by saying Happy new year to everyone, and also Happy new year of the Dragon, to those who celebrated the Chinese New Year recently.

I hope you all had the chance to wind-down, relax and spend time with people you care about, whilst looking back, hopefully with a smile, at all the things you achieved last year. If you helped get involved in Pact, in any way, big or small, we are grateful.

Anyhow, that brings me to February, and I get the pleasure of letting you know what has been happening across the Pact estate over the last 8 weeks!

## Pact OSS Updates

## Specific language updates

### Pact-Reference

Pact-Reference: Lots of changes in the Pact-Reference project, from Ron and others. You'll find Pact FFI [0.4.16](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.4.16) out with a number of QoL improvements from a range of contributors.

- [Stanislav Vodetskyi](https://github.com/stan-is-hate) : [Support metadata rules for sync message](https://github.com/pact-foundation/pact-reference/pull/384)
- [Tien Vo](https://github.com/tienvx)
  - [feat: Print provider name in 'no pacts found' message to help debugging](https://github.com/pact-foundation/pact-reference/pull/381)
  - [fix(pact_matching): Allow matching strings using Values matcher](https://github.com/pact-foundation/pact-reference/pull/364)
- [Josh Ellis](https://github.com/JP-Ellis) : [feat(ffi): add with_matching_rules ](https://github.com/pact-foundation/pact-reference/pull/383)

Chat with us in: [#pact-rust](https://pact-foundation.slack.com/archives/CA2S7E6KC)

### Pact-Plugins

Pact-Plugins: The pact-protobuf-plugin has seen an uptick in usage, with several new contributors raising issues and fixes. We appreciate both, especially if the issues come with reproducible snippets as we have been seeing. Keep it up.

- [Stanislav Vodetskyi](https://github.com/stan-is-hate) : [Support metadata rules for sync message](https://github.com/pact-foundation/pact-reference/pull/384)
- [Rohit G Krishnan](https://github.com/rkrishnan2012) : [Fix merging between plugin config and manifest values.](https://github.com/pactflow/pact-protobuf-plugin/issues/41)

Fixes by Ron

- [fix: accept empty maps where there is a eachKey or eachValue matcher](https://github.com/pactflow/pact-protobuf-plugin/commit/0a6458c2784bd234d80a31c14e14bf5d739a8565)
- [fix: when checking for unexpected fields, ignore fields with default values](https://github.com/pactflow/pact-protobuf-plugin/commit/4db432835b26b3d384af88b722c6fad00cf104bc)
- [fix: Missing fields may have been dropped from the payload if they had a default value](https://github.com/pactflow/pact-protobuf-plugin/commit/661a154150ca6d3edf3e1330cab46028fefd6ead)
- [Issue with matching a list of enums](https://github.com/pactflow/pact-protobuf-plugin/issues/27)

Have you tried out Pact Plugins yet? What's stopping you?

Chat with us in: [#pact-plugins](https://pact-foundation.slack.com/archives/CA2S7E6KC)

### .NET

Pact-net: [5.0.0-beta.2](https://github.com/pact-foundation/pact-net/releases/tag/5.0.0-beta.2) was released a few days ago which includes the following

- Replaced Newtonsoft with System.Text.Json (see upgrade guide for more info)
- Increased minimum supported .Net Framework version to 4.6.2
- Marked MacOS ARM architecture as fully supported
- Upgraded to FFI 0.4.16
- Upgraded tests to .Net 8 and .Net Frame 4.6.2
- Find unused ports for the messaging server more efficiently

Want to upgrade? Check out the upgrade guide [here](https://github.com/pact-foundation/pact-net/blob/master/docs/upgrading-to-5.md)

Still on Pact-Net v3.x and want to migrate to the latest stable v4 version? Check out the upgrade guide [here](https://github.com/pact-foundation/pact-net/blob/master/docs/upgrading-to-4.md)

Whats next? Pact Plugin support! Check out the [RFC](https://github.com/pact-foundation/pact-net/issues/492) for more detail, and feel free to add your feedback.

Chat with us in: [#pact-net](https://pact-foundation.slack.com/archives/C9UTHV2AD)

### Golang

Pact-go: v2.0.4 has just been released, which bumps the Pact FFI and includes external contributions from [Armin Becher](https://github.com/becheran) and [Stanislav Vodetskyi](https://github.com/stan-is-hate), thanks guys :rocket:

- feat: add native lib path function [#376](https://github.com/pact-foundation/pact-go/pull/376)
- fix: allow empty responses in sync messages (#386)
- fix: update pact-ffi to 0.4.16

Armin's change looks to improve the developer experience for GoLang users utilising Windows. Are you one of them?

Chat with us in: [#pact-go](https://pact-foundation.slack.com/archives/C9UTHTFFB)

### Node JS

Pact-JS: [v12.2.0](https://github.com/pact-foundation/pact-js/releases/tag/v12.2.0) has just been released. This introduces the PactV4 interface into GA. (It was previously feature-flag enabled), allowing for Pact plugin support to the Pact-JS project. A team effort, led to a [vulnerability fix](https://github.com/pact-foundation/pact-js/pull/1175), closing off an outstanding [issue](https://github.com/pact-foundation/pact-js/issues/1169), thanks [Yukun](https://github.com/yukun-han) & [Rufei](https://github.com/Rufei77). Matchers can now be applied to response bodies, thanks to [this PR](https://github.com/pact-foundation/pact-js-core/pull/486)

Want to see it the plugin framework in action in Pact-JS? Check out our gRPC example [here](https://github.com/pact-foundation/pact-plugins/tree/main/examples/gRPC/area_calculator/js)

Chat with us in: [#pact-js](https://pact-foundation.slack.com/archives/C9VBGLUM9)

### Python

Pact-Python: Josh has been continuing to work on the pact-compatability-suite integration in order to verify the Pact-Python integration with the Pact Rust libraries works correctly. You can keep track of the road to V3/V4 and the Rust backed implementation in this tracking [issue](https://github.com/pact-foundation/pact-python/issues/396). We saw a community fix: [ensure interactions are not left when exception occur inside with statement](https://github.com/pact-foundation/pact-python/pull/539) from [Jakub Stolarkski](https://github.com/dryobates).

We hope to get a release out shortly, which will bring in an updated pact-ruby-standalone, and support for Python 3.12, and Jakub's fix. Also don't forget to watch the repository, if you want to be first in the loop when the new release lands, and later in the year you can start trialing the pact rust engine in your pact-python projects.

Chat to us in: [#pact-python](https://pact-foundation.slack.com/archives/C9VECUP6E)

### PHP

Pact-PHP: Tien Vo has been on fire over the last 8 weeks, buoyed by Lewis Cowles input at review time. It has been nice to see Lewis dropping in to help lighten the load of Tien as well. It's nice to watch from afar, as I can see them both learning off each other, and goes to show how much collaboration helps as sometimes it can feel like a lonely place when you are just plugging away.

Changes in the FFI branch include

- Implementing of the [V1 Consumer](https://github.com/pact-foundation/pact-php/pull/428) / [V1 Provider](https://github.com/pact-foundation/pact-php/pull/429)/ [V2](https://github.com/pact-foundation/pact-php/pull/430) / [V3](https://github.com/pact-foundation/pact-php/pull/431) and [V4](https://github.com/pact-foundation/pact-php/pull/432) pact compatibility suites. If you've not seen the compat suite, it uses Cucumber to describe the Pact features, and Pact-PHP is using the Behat flavour. It is worth taking a look at.

I'd recommend dropping into the FFI branch, and checking out some of the [examples](https://github.com/pact-foundation/pact-php/tree/ffi/example) where you can see Pact-PHP being used for contract testing gRPC services.

Have you trialed the V10 Beta of Pact-PHP?

Chat to us in: [#pact-php](https://pact-foundation.slack.com/archives/C9W94PXPY)

### Pact Broker

Pact-Broker: [Jörgen Andersson](https://github.com/jorander) is helping keeping the Pact Broker up to date, by updating our base image to Ruby 3.2.3, the Alpine version from 3.17 -> 3.19 and upgrading Supercronic 0.2.29.

Unfortunately moving to Alpine 3.19, broke Sqlite for x86_64 users, in the same way that it had been noted to have been broken in the aarch64 and arm images. We got a couple of reports, one from a fellow maintainer, and another from a user, which provided a cookie trail, which led to a [fix](https://github.com/pact-foundation/pact-broker-docker/pull/166), building sqlite3 gem from source, which not only solver the issue in our x86_64 image, and the outstanding aarch64/arm issue as well.

What does this mean for you? We will soon be publishing our multi-manifest images, without a `-multi` suffix, which means whether you are running on shiny M-Series macbook, a Raspberry PI, or your Intel/AMD gaming rig, you'll be able to pull the `latest` image, and get a native image that is right for your system.

Chat to us in: [#pact-broker](https://pact-foundation.slack.com/archives/C9VPNUJR2)

### Pact Ruby Standalone

Pact-Ruby-Standalone: Our fork of Traveling-Ruby has been [updated with a few goodies](https://github.com/phusion/traveling-ruby/pull/134#issuecomment-1948945881).

What does this mean for users of the Pact Ruby Standalone project?

- The ruby runtime is updated to Ruby 3.2.3
- The bundled version of OpenSSL is now bumped to 3.2.0
- The dependency on `bash` is gone! Yep, you heard that right, you can get away with `sh` only which means no more bash required in your Alpine images.

### Pact Workshops

The following workshops have been updated to use the latest versions of the Pact client libraries:

- [Pact-workshop-go](https://github.com/pact-foundation/pact-workshop-go)
- [pact-workshop-Maven-Springboot-JUnit5](https://github.com/pact-foundation/pact-workshop-Maven-Springboot-JUnit5)
- [pact-workshop-jvm-spring](https://github.com/pact-foundation/pact-workshop-jvm-spring)

## Yo dawg, I heard you like Alpine

Unless you've been living under a rock, you've probably heard about Alpine. If not, it is a variant of Linux, which many teams choose to run their builds on due to its tiny footprint, and smaller security surface area. One of the significant areas of differences to more regular flavour of Linux (Debian/Ubuntu/Fedora etc), are it's choice of standard library. With Alpine choosing musl whilst others prefer glibc. This poses challenges for distributors of packages used within the Linux ecosystem.

So lets take a look at our options.

1. We provide a single distribution, linked to glibc
   1. Users need to be aware that the distribution is linked to glibc.
   2. Alpine users are required to [perform workarounds](https://wiki.alpinelinux.org/wiki/Running_glibc_programs).
   3. There will be a performance overhead in calling a program linked to glibc, over musl for Alpine users
   4. Compatibility is not guaranteed, so further issues may occur, which can become complex to diagnose, especially if not reproducible on a glibc based distro
   5. Maintainers need to ideally update their code to detect the presence of musl, to inform users of compatability issues. In many cases, glibc programs won't run without the Alpine workarounds, and therefore there is no ability in code to provide useful messages to users, so the onus is on them reading the documentation
2. We provide two distributions, one linked to glibc, one linked to musl
   1. Users need to be aware of which std library they use, glibc or musl
   2. Maintainers need to ideally update their code to detect the presence of musl, so they can provide the correct musl package to users. This can be challenging.
   3. Alpine traditionally prefers creating static builds, which can cause the inability of client languages to link to the shared C libraries.

### Rust Core

Alpine support has not been made available to the pact-reference project, often referred to the Pact Core, with our [official guidance](https://docs.pact.io/docker#alpine-linux) on our website

>Alpine is not supported as it requires us to build dynamically linked libraries for each specific version of Alpine and musl.
>It's possible to make it work, but we make no guarantees and it's likely to break in subtle ways and we would instead recommend adopting Ubuntu or Debian which supports linking to glibc.

I'm not sure how many users have been limited by this, unable to switch from Alpine based containers, and therefore unable to utilise the pact-reference project, and all the V3/V4 Pact Spec goodness, along with the benefits that the Pact Plugin ecosystem providers, however there were enough issues on our repositories to make it a worthwhile wander to investigate. I've documented it in this [issue](https://github.com/pact-foundation/devrel/issues/30) in our [pact-foundation/devrel](https://github.com/pact-foundation/devrel) repo.

The pact-core consists of a few elements, which are of use to end consumers, and languages, who are not using Rust.

- [Mock Server CLI](https://github.com/pact-foundation/pact-reference/pull/385)
- [Verifier CLI](https://github.com/pact-foundation/pact-reference/pull/385)
- [Stub Server CLI](https://github.com/pact-foundation/pact-stub-server/pull/62)
- [Pact FFI library](https://github.com/pact-foundation/pact-reference/pull/372)
- [Pact Plugin Framework](https://github.com/pact-foundation/pact-plugins/pull/57)
  - Pact Plugin CLI
  - Pact Plugin Drivers
  - Pact Plugins
    - [pact-protobuf-plugin](https://github.com/pactflow/pact-protobuf-plugin/pull/47)
    - [pact-csv-plugin](https://github.com/pact-foundation/pact-plugins/pull/56)

You can take a look at the ecosystem [here](https://docs.pact.io/diagrams/ecosystem#rust-goldberg-machine)

As the project is built with Rust, we can easily add in musl targets, both aarch64 and x86_64 with Cross (we'll talk a little about Cross in our next section).

The CLI's are easy, add in our required targets, build with cross, and out pops a musl based executable.

Shared libraries are a little more awkward. In order to tell Rust to create a shared library, we use the `cdylib` notation in our `Cargo.toml` file. This pops out shared libaries, when we build it with the following extensions.

- Linux `.so` (shared object)
- MacOS `.dylib` (dynamic library)
- Windows `.dll` (dynamic linked library)

The extensions here, denote that they are shared libaries. If one was to build them statically, they would return a `.a` extension, which denotes archive. These files are in order of magnitude larger than their dynamic counterparts, as they self-contain everything needed to run the program, without requiring any external or system libraries.

When we build for Alpine targets, we only get a `.a` file output. Whilst this is perfect for some of our client languages, some such as PHP, Ruby and .NET to name a few, are unable to read `.a` files, excluding them from the picture.

It's possible by setting some flags, either as Rust compile time, or by using some `gcc` commands to take a `.a` file, and [convert it into a shared object file](https://github.com/pact-foundation/pact-reference/pull/388). With this newly created file, we can load it with PHP, Ruby and .NET, in Alpine successfully.

In order to get green test suites, under the Alpine platform, it was necessary to also update parts of the Pact plugin framework to become musl aware, such that if it detects musl, it attempts to download a musl variant of a plugin. If the musl variant doesn't exist, it would be nice if we could attempt to load the glibc variant, which _may_ work with the compatibility workarounds discussed earlier. If we can warn the user, so they can take an proactive actions, even better.

For two of the plugins, protobuf and csv, these are written in rust, so again we can follow our same pattern to enable musl variants. For our sample build your own plugin template, it is written in GoLang, which uses Goreleaser to build the linux variants. There is the added benefit that the application is built linked against musl, but able to be run on machines that link to glibc or musl, meaning there is no need to produce a separate musl named artifact.

The last of the plugins I took a look at was [pact-avro-plugin](https://github.com/austek/pact-avro-plugin), created by one of our community members [Ali Ustek](https://github.com/austek). This particular plugin is written in Java, so required the end user to install at least the JRE, if not the SDK, of Java 17, in order to use it. It also had a requirement on `bash`, in it's startup script, but the author has since updated this to use a `sh` based wrapper, meaning end users on Alpine, won't additionally need to install `bash`. Hooray!

#### Lower is better

Whilst we've been talking about glibc/musl, it's usually good to know that they tend to be forwards compatible, such that if you build against an older version of musl or glibc, then your application will work with later versions of each respective library.

If you happen to build your application on the latest version of Alpine (musl) or Debian (glibc), you'll find users of older versions of those distro's will have errors running your application due to missing symbols.

We can resolve that using fixed images, which carefully control the versions of musl/glibc that we link against.

Now rather than creating our own build-box, the [cross-rs](https://github.com/cross-rs/cross) project allows Rust based projects, to compile (and cross-compile) for multiple targets. Each of these targets, has a corresponding build image, and the team provide a brilliant [table of the libc versions](https://github.com/cross-rs/cross?tab=readme-ov-file#supported-targets) in place.

Now you'll note against the main branch, the glibc version is 2.31. This caused issues for several users, often for them indirectly. For [example](https://github.com/pact-foundation/pact-js-core/issues/472), one might be running an official NodeJS image, for an older version of Node, say version 16. These images are no longer being updated, as Node 16 is EOL, so it's built against an older version of Debian, which runs an older version of glibc, than 2.31. Oh noes!

Whilst our user in our story, was able to unblock themselves by updating to a later node image, which contained a later distribution, we are unknowingly excluding many Linux users from utilising the Pact Framework.

That isn't a place we'd like to position ourselves, as we understand that not only do teams in greenfield applications, who have the freedom to choose their tools and techniques, often pick contract testing, but that teams supporting heritage (legacy) applications, who for many varying reasons, might not have the ability to upgrade their infrastructure to the latest and greatest at the drop of a hat. These teams can benefit too from contract testing and should not be omitted from the frame.

So how do we solve it?

By pinning our version of cross to 0.2.5, our glibc based targets will link to 2.23, as shown in this [cross target table](https://github.com/cross-rs/cross/tree/v0.2.5?tab=readme-ov-file#supported-targets)

One of our community members Omair Majid posted this [table](https://github.com/pact-foundation/pact-reference/issues/202#issuecomment-1216683343) of glibc versions in use across common linux distributions.

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

### Ruby Core

So what about Ruby? I spoke earlier about our fork of traveling-ruby, which recently underwent some updates. Whilst on my Alpine adventures, I realised that there would now be some disparity between the platforms supported by the Pact Rust core, and the Pact Ruby core. That was an itch, I needed to scratch. Could I bring native musl based support to traveling-ruby? That way not only do we need to tell users, they no longer need bash, due to using sh compliant warpper scripts, but they no longer would need a compatability layer, if one was running Alpine.

So similar to Cross, the traveling-ruby package uses Docker images to build for Linux. They are referred to as a holy-build-box, and was originally created by the Phusion team, of Passenger fame (and also the creators of traveling-ruby). The box used for building the current linux packages are based on Centos7 which links to glibc 2.17.

So I would need to create an Alpine based holy-build-box and see how far could get. Turns out pretty far and I managed to successfully Alpine/musl based packages for aarch64/x86_64. They were built on an Alpine 3.15 box, and have been tested up to the current 3.19 Alpine release.

Itching to try out the musl based packages? I've published a [release from my fork of pact-ruby-standalone](https://github.com/YOU54F/pact-ruby-standalone/releases/tag/v3.0.0), that you can take them out for a test drive today.

## Who and whose ARMy?

### Multi-Manifest Images

For the last year, we have been trialing multi-manifest images for the pact-cli and pact-broker docker images, which you have to opt in to use, by appending the tag name with `-multi`.

We've had a small amount of feedback, mainly all positive, with hopefully the last of the gremlins sorted (Sqlite3 was failing on arm64 images, then x86_64 images, resolved by building from source), so we are beginning to drop the multi suffix.

Pact-CLI has been the first, and also it celebrates it v1.0.0 release. You can find a multi-manifest tag with AMD64/ARM64 and ARM flavours [here](https://hub.docker.com/layers/pactfoundation/pact-cli/1.0.0.0/images/sha256-f3945862389b736f34907bd1b1c205800f17dd3dc242f10f90d490a198bb23c7?context=explore)

We would also like to publish our images to GitHub container registry in order to alleviate any pain, DockerHub's rate limits may be imposing on teams. The first of a series of PR's across our images is [here](https://github.com/pact-foundation/pact-ruby-cli/pull/127), and a tracking issue [here](https://github.com/pact-foundation/devrel/issues/29)

### GitHub Actions launches ARM64 MacOS Runners

We recently introduced ARM64 CI testing capabilities via CirrusCI last year, and rolled it out to several of our repositories, which unlocked cross-platform, cross-architecture testing for our maintainers, however due to licensing changes, CirrusCI began limiting OSS users usage, which mean monthly, builds would fail as we moved over our limits.

This was an inconvenience, but not limiting as we had not removed our existing GitHub Actions workflows, and were infact waiting for GitHub to unlock access to MacOS M1 runners for OSS usage. That time came last month, and we have see it applied to a couple of our repositories already.

https://github.blog/changelog/2024-01-30-github-actions-introducing-the-new-m1-macos-runner-available-to-open-source/

If you spot a repo not covered by the new `macos-14` runner, why not drop a PR in on the project?

### Windows on ARM

Are you running Windows on ARM? Whether you running it natively, or you are enjoying it via your speedy M-Series Apple processors via Apples Virtualisation framework (Check out [UTM](https://github.com/utmapp/UTM) for a rather splendid open-source virt tool), I've got some good news for you.

We have started to [publish support](https://github.com/pact-foundation/pact-reference/pull/370) for Windows on ARM across a few of our projects. I'll borrow our list of Rust tooling before, as it'll highlight some of the gaps that we still need to cover. If you want to see Windows on ARM via your favourite Pact Client library, why not help fill in some of the blacks.

- [X] [Mock Server CLI](https://github.com/pact-foundation/pact-reference/releases/tag/pact_mock_server_cli-v1.0.4)
- [X] [Verifier CLI](https://github.com/pact-foundation/pact-reference/releases/tag/pact_verifier_cli-v1.0.3)
- [ ] Stub Server CLI
- [X] [Pact FFI library](https://github.com/pact-foundation/pact-reference/releases/tag/libpact_ffi-v0.4.16)
- Pact Plugin Framework
  - [ ] Pact Plugin CLI
  - [ ] Pact Plugin Drivers
  - Pact Plugins
    - [ ] pact-protobuf-plugin
    - [ ] pact-csv-plugin

So what about Ruby? Not again Saf! Well it turns out Windows on ARM for Ruby, transpired to be a bit more complex, with even x86_64 emulation being broken in some versions. Users would come across this [error](https://github.com/oneclick/rubyinstaller2/issues/308), which would ultimately be solved for arm64 native builds (still broken in x86_64 emulation mode) via this [patchset](https://github.com/ruby/ruby/pull/8995/files).

With this in place, it is now possible to compile later versions of Ruby > 3.1 for arm64 via a clangarm64 msys2 environment, and official msys2 packages were [released](https://packages.msys2.org/package/mingw-w64-clang-aarch64-ruby?repo=clangarm64) for Ruby 3.1.4.

Traveling-Ruby utilises RubyInstaller2's packages for bundling Ruby and your gems, for distribution, but is awaiting arm64 support, with a request [here](https://github.com/oneclick/rubyinstaller2/issues/362). One can't utilise the msys2 packages directly, without a couple of tweaks, as RI2 maintains it's [own Pacman repository](https://github.com/oneclick/rubyinstaller2-packages) with Ruby builds.

So I had a [little dive into RI2](https://github.com/YOU54F/rubyinstaller2/tree/mingw-w64-clang-aarch64-ruby3.1.4-2), and managed to [get it building for ARM64](https://github.com/YOU54F/rubyinstaller2/releases/tag/RubyInstaller-3.1.4-2), consumed via [traveling-ruby](https://github.com/YOU54F/traveling-ruby/releases/tag/rel-20240116) and consumed in pact-ruby-standalone locally.


## Community Events

### Eric DeAndrea - How to avoid common pitfalls with modern microservices testing

Eric DeAndrea [spoke this month at the San Francisco Java User Group](https://www.meetup.com/sfjava/events/298620866/) where he some common battle scars from our experiences in the field. He introduced the testing pyramid and explained why it is important in helping to continuously deploy microservices independently without fear. He also demonstrated, through a test-driven development approach, how the combination of Pact contract testing combined with Quarkus developer joy can help prevent your microservices from breaking in production.

Missed it? Don't worry you can catch the slides [here](https://speakerdeck.com/edeandrea/2-15-24-sf-jug-avoiding-pitfalls-with-modern-microservices-testing), and you can be sure to hear more from Eric throughout the year. I would recommend following his socials for heads up on his next event.

- GitHub: <https://github.com/edeandrea>
- Twitter/X: <https://twitter.com/edeandrea>
- LinkedIn: <https://www.linkedin.com/in/edeandrea>

### WomenWhoGo - London

![WomenWhoGo London](https://secure.meetupstatic.com/photos/event/5/f/b/5/600_518664501.webp?w=384)

If you're based in London, why not link up with the Women Who Go community, who are holding their first in-person event of 2024.

You'll get to hear from [Sanyia Saidova](https://deliveroo.engineering/authors/sanyia-saidova/) from Deliveroo who will be speaking about Growing your application from prototype to production, and I'll be talking about Pact + GoLang - Contract testing for the past, present and the future (and how you can get involved!)

You can check out the meetup event [here](https://www.meetup.com/women-who-go-london/events/298730462/)

## Community shout-outs

We'd love to give a huge shout out to [Stanislav Vodetskyi](https://github.com/stan-is-hate), who has been going above and beyond to improve the Pact-Go experience, by not only dropping PR's in the Pact-Go project, but rolling up his sleeves, learning Rust on the fly, to provide PR's in the Pact-Reference and Pact-Rust project, to improve the gRPC plugin capabilities, either by bug-fixes or improvements.

It's great to the see the plugin framework being actively used in an organisation, and this adoption helps bring more use cases to the table, and the feedback we receive in terms of Slack, GitHub issues or pull-requests, all go a long way to helping new users embrace Pact Plugins and the DX around it.

If you've spotted an improvement you can make, why not strike up a discussion with the maintainers, or fork the repo and have a play.

## Thats a wrap

Phew, that was a-lot! I didn't even scratch the surface, as this is only a small selection of the repositories across the Pact Foundation. If I missed something you achieved since the start of 2024, be sure to give me a shout so I get you a mention in the post.

If you haven't yet contributed to the Pact project, this is your year. If you are stuck and don't know where to start, why not join us in our Pact Slack community.

Sign up [here](https://slack.pact.io/)!

See you next month folks!

Cheers,
Saf
