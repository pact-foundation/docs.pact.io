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

TBC

## Pact JVM

TBC

## Pact Python

TBC

## Pact PHP

TBC

## Pact Scala

TBC

## Pact Go

TBC
