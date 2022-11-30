---
title: 4. Choosing a language
---


## Choosing a language

When creating a plugin, you need to consider in advance the types of runtimes you need to support.

If you use, say Java, that means any user who uses your plugin needs to have a JDK installed on their machines and CI servers, as well as anything that verifies a Pact file created using that plugin even if the provider is written in a different language.

We suggest you choose a language that can be compiled and distributed as a single executable to multiple languages, such as Rust, Golang or .NET.

In this tutorial we will use Golang, which can be cross compliled to common targets.

## Recommended targets

We recommend you provide first class support for the following OS/Architecture targets, and provide a similar compatibility table in your Plugin docs:

| OS      | Architecture | Supported |
| ------- | ------------ | --------- |
| OSX     | x86_64       | ✅         |
| OSX     | aarch64 (arm)| ✅         |
| Linux   | x86_64       | ✅         |
| Linux   | aarch64 (arm)| ✅         |
| Windows | x86_64       | ✅         |
| Windows | aarch64 (arm)| ✅         |

GitHub provides support for compiling for such targets.