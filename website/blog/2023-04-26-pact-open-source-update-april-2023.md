---
title: Pact Open Source Update — April 2023
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2023-04-26
draft: false
hide_table_of_contents: false
---

Welcome all, Yousaf here, your Pact Community Shepherd. This month I’ll be sharing all the good things happening in the world of Pact.  

## OSS Updates

### Pact Broker on Kubernetes

Chris Burns, has been maintaining the pact-broker-chart repository, which is currently the easiest way to run a Pact Broker on Kubernetes.

He's just hooked it up to the Pact documentation site and you can find the page in its new home here https://docs.pact.io/pact_broker/kubernetes

### Pact-Net

Pact-Netizens

got some goodies for you, wouldn't mind some eyes across them :)

- Updated https://github.com/pactflow/example-consumer-dotnet to use pact-net 4.x / .NET 6.0 and branches/environments/record deployments over tags
- Updated https://github.com/pactflow/example-provider-dotnet to use pact-net 4.x / .NET 6.0 and branches/environments/record deployments over tags
- Added a PR to update the v1 workshop https://github.com/pact-foundation/pact-workshop-dotnet-core-v1/pull/25
- Added a PR to update the v3 workshop https://github.com/DiUS/pact-workshop-dotnet-core-v3/pull/8

I think we may in the very near future, to consolidate all the things.

- rename https://github.com/pact-foundation/pact-workshop-dotnet-core-v1 to pact-workshop-dotnet
- canonical example from https://github.com/DiUS/pact-workshop-dotnet-core-v3/pull/8 becomes the main course
- sub foldered (probably easier than branches) workshop for https://github.com/pact-foundation/pact-workshop-dotnet-core-v1/pull/25
- we can then add additional examples for x framework
  - Such as Minimal API https://github.com/DiUS/pact-workshop-dotnet-core-v3/pulls
- Update all the links to point at the renamed https://github.com/pact-foundation/pact-workshop-dotnet

PS. I have to say, the DSL is pact-net 4.x is quite nice, and the delta between 3.x -> 4.x isn't bad at all, especially once you've got one test converted, the rest is relatively plain sailing. Great work Adam!

If you want to build out your own workshop to share with others, please do join in!

## Pact Broker

ARM64 & ARM builds of the Pact Broker are brewing, you can check them out here

- https://github.com/pact-foundation/pact-broker-docker/pull/123

I have proposed we publish multi-manifest builds with the `$TAG-multi` prefix so it is an opt-in arrangement until we get further feedback.

## Pact Broker CLI

Good things, come in two's! Plus Beth made common scripts across the libraries many moons ago which means applying changes in one repo can easily be applied across others

- https://github.com/pact-foundation/pact-ruby-cli/pull/98

## Pact Ruby Standalone

Well okay, maybe there are like busses and they come in three.

The current state of packaging Ruby applications, hasn't kept up with the times, and it's left our pact-ruby-standalone package, stuck on Ruby 2.4.x

The maintainer of the build system wrote about it a few years back https://www.joyfulbikeshedding.com/blog/2021-01-06-the-future-of-traveling-ruby.html

>Traveling Ruby hasn't seen updates for quite a while now, but it's still being used. Yesterday, the author of the Pact contract testing framework asked me to do a new release, because he needed a bug fix for supporting paths that contain spaces. So I gave it a try. Predictably, the build system is broken due to all the changes in Linux and macOS the past few years, and fixing it all takes a lot of effort.

It leaves our current state of play of support like this.

| OS     | Ruby      | Architecture   | Supported |
| -------| -------   | ------------   | --------- |
| MacOS  | 2.4.x     | x86_64         | ✅        |
| MacOS  | 2.4.x     | aarch64 (arm64)| 🚧        |
| Linux  | 2.4.x     | x86_64         | ✅        |
| Linux  | 2.4.x     | aarch64 (arm64)| ❌        |
| Windows| 2.4.x     | x86_64         | ✅        |
| Windows| 2.4.x     | x86            | ❌        |
| Windows| 2.4.x     | aarch64 (arm64)| 🚧        |

🚧 are supported under emulation.

Due to open source, the build system being available on GitHub, the power of ARM processors (via M1/M2 processors found in Apple machines), and leaps and bounds in virtualization / emulation technologies, it's really easy to spin up ephemeral build boxes, than ever before. The build systems themselves are still incredibly complex, but thankfully I managed to munge a few community forks, into one gotta-build-em all solution.

You can check out the current PR [here](https://github.com/phusion/traveling-ruby/pull/133)

This means our support table will possibly extend now to

| OS     | Ruby      | Architecture   | Supported |
| -------| -------   | ------------   | --------- |
| MacOS  | 3.2.2     | x86_64         | ✅        |
| MacOS  | 3.2.2     | aarch64 (arm64)| ✅        |
| Linux  | 3.2.2     | x86_64         | ✅        |
| Linux  | 3.2.2     | aarch64 (arm64)| ✅        |
| Windows| 3.2.2     | x86_64         | ✅        |
| Windows| 3.2.2     | x86            | ✅        |
| Windows| 3.2.2     | aarch64 (arm64)| 🚧        |

I have got some very alpha arm64 osx and linux standalone packages you can trial

https://github.com/YOU54F/pact-ruby-standalone/releases/tag/v3.1.2.2-alpha

Note these aren't official builds so your mileage might vary and you shouldn't rely on them at the moment until we get some feedback

## HomeBrew

Our Homebrew repo now supports installing the x86_64 ruby standalone on Linux

https://github.com/pact-foundation/homebrew-pact-ruby-standalone

```
brew tap pact-foundation/pact-ruby-standalone
brew install pact-ruby-standalone
```

| OS           | Architecture | Supported |
| ------- | ------------ | --------- |
| OSX        | x86_64       | ✅         |
| OSX        | aarch64 (arm)| 🚧       |
| Linux    | x86_64         | ✅         |

You'll need rosetta on M1/M2 Mac's until we get my PR's merged, watch this space

## Windows users

We are sorry, we've probably not given you as much love as we should have been. I've long been a windows fan boi, but got a Mac with work in 2015, and rarely fire the windows machine up for anything other than games. I did set it up for devvin' a while back and was incredibly surprised at how awesome the experience is now, and for everything else there is WSL2. That is how I felt about MacOS when I first joined the party.

Anyway, it could be better! Want the pact-ruby-standalone, but don't want to manually unzip a file, I mean cmon' sheesh, it's not the 90's and is Clippy even still a thing?

I've got your back. And because you might be a Scoop VS Choco, kinda person, I've got you both covered.

Let me know if these work, and we can move them under the Pact-Foundation!

### Scoop

`scoop bucket add pact https://github.com/you54f/scoop`
`scoop install pact`

https://github.com/YOU54F/scoop

### Choco

`choco install pact --version=0.0.1`

https://github.com/YOU54F/choco

## SmartBear Supported

We spoke last month about what SmartBear supported means for Pact on our newly published [page](https://docs.pact.io/help/smartbear). We started engaging without core maintainer group and are listening intently to the feedback before we share it out with the wider contributor group to get your valued input.

We all want to ensure Pact is here forever!

That’s it for this month. Stay safe and carry on coding!

- Yousaf Nabi — Developer Advocate at PactFlow and Community Shepherd at Pact.
