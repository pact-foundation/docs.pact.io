---
title: pact-jvm-consumer-specs2
custom_edit_url: https://github.com/pact-foundation/pact-jvm/edit/v4.1.x/consumer/specs2/README.md
---
<!-- This file has been synced from the pact-foundation/pact-jvm repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## Specs2 Bindings for the pact-jvm library

## Dependency

In the root folder of your project in build.sbt add the line:

```scala
libraryDependencies += "au.com.dius.pact.consumer" %% "specs2" % "4.0.1"
```

or if you are using Gradle:

```groovy
dependencies {
    testCompile "au.com.dius.pact.consumer:specs2_2.13:4.0.1"
}

```

__*Note:*__ `PactSpec` requires spec2 3.x. Also, for spray users there's an incompatibility between specs2 v3.x and spray.
Follow these instructions to resolve that problem: https://groups.google.com/forum/#!msg/spray-user/2T6SBp4OJeI/AJlnJuAKPRsJ

## Usage

To author a test, mix `PactSpec` into your spec

First we define a service client called `ConsumerService`. In our example this is a simple wrapper for `dispatch`, an HTTP client. The source code can be found in the test folder alongside the `ExamplePactSpec`.

Here is a simple example:

```
import au.com.dius.pact.consumer.PactSpec

class ExamplePactSpec extends Specification with PactSpec {

  val consumer = "My Consumer"
  val provider = "My Provider"

  override def is = uponReceiving("a request for foo")
    .matching(path = "/foo")
    .willRespondWith(body = "{}")
    .withConsumerTest { providerConfig =>
      Await.result(ConsumerService(providerConfig.url).simpleGet("/foo"), Duration(1000, MILLISECONDS)) must beEqualTo(200, Some("{}"))
    }
}

```

This spec will be run along with the rest of your specs2 unit tests and will output your pact json to

```
/target/pacts/<Consumer>_<Provider>.json
```

# Forcing pact files to be overwritten (3.6.5+)

By default, when the pact file is written, it will be merged with any existing pact file. To force the file to be 
overwritten, set the Java system property `pact.writer.overwrite` to `true`.

# Test Analytics

We are tracking anonymous analytics to gather important usage statistics like JVM version
and operating system. To disable tracking, set the 'pact_do_not_track' system property or environment
variable to 'true'.
