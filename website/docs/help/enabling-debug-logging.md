---
title: "Enabling debug logging"
author: Beth Skurrie
---

# Enabling debug logging

Enabling debug/verbose logging can help identify the cause of issues. For many Pact libraries, this will allow you to see the HTTP requests and responses when the library interacts with a Pact Broker or PactFlow. For older Pact libraries that wrap a shared Ruby Pact implementation, verbose logging can be enabled by setting the environment variable `VERBOSE=true`. New Pact libraries that use the shared Rust Pact implementation will have their own language specific ways of enabling verbose logging.

## pact-cli Docker image

Set environment variable `VERBOSE=true`. This will cause the HTTP requests and responses to be logged to the console.

## Pact Ruby Standalone

Set environment variable `VERBOSE=true`. This will cause the HTTP requests and responses to be logged to the console.

## Pact Ruby

Set environment variable `VERBOSE=true`. This will cause the HTTP requests and responses to be logged to the console.

## Pact JS

**Latest (10.x.x, 11.x.x)**

Set the `logLevel` property to `trace` when configuring the `PactV3({...})` or `PactV4({...})` class, or as an option to the verifier.

**9.x.x**

For consumer tests, set the `logLevel` property to `debug` when configuring the `Pact({...})` class. Logs will be emitted to the console. 

For provider tests, set the `verbose` property to `true` on the `Verifier` class to log additional HTTP requests and responses to a `pact.log` file in the directory specified by the `logDir` property.

## Pact JVM

Set the logging level to `debug` in the logging framework used in your project. This will cause the HTTP requests and responses to be logged in the test output.

## Pact Python

TBC

## Pact PHP

TBC

## Pact Scala

TBC

## Pact Go

**1.x.x**

For consumer tests, set the `LogLevel` property to `debug` on the `Pact` struct. Logs will be emitted to the console.

For provider tests, specify `PactLogDir` to write verbose HTTP request and responses to a `pact.log` file in the given directory, and set `PactLogLevel` string to `debug`.

**2.x.x**

You can either set the `LOG_LEVEL` environment variable to `TRACE` before running your tests or add `SetLogLevel("trace")` to the top of your test.

*NOTE: `SetLogLevel` can only be set once across your entire suite and cannot be changed dynamically*
