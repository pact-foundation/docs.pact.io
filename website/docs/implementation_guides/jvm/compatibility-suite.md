---
title: Compatability Suite
custom_edit_url: https://github.com/pact-foundation/pact-jvm/edit/master/compatibility-suite/README.md
---
<!-- This file has been synced from the pact-foundation/pact-jvm repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

This is the implementation of the [Pact Compatability Suite](https://github.com/pact-foundation/pact-compatibility-suite) implemented with Cucumber JVM.

## Running the suite

The suite has Gradle tasks for each of the specification versions. For example, to run the V1 features:

```console
 ./gradlew :compatibility-suite:v1
```

### Running just a consumer or provider set of features

Features for just consumer, provider or messages are identified using Cucumber tags. You can run a subset of features
by providing the matching tags. I.e.:

```console
 ./gradlew :compatibility-suite:v1 -Pcucumber.filter.tags=@consumer
```

### Changing the log level

By default, the suite runs with logging set to ERROR. To change it, either edit the file in 
`compatibility-suite/src/test/resources/logback-test.xml` or provide the `cucumber.log.level` property.

I.e.,

```console
 ./gradlew :compatibility-suite:v1 -Pcucumber.log.level=DEBUG
```
