---
title: Pact sbt plugin
custom_edit_url: https://github.com/pact-foundation/pact-jvm/edit/v4.1.x/provider/sbt/README.md
---
<!-- This file has been synced from the pact-foundation/pact-jvm repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

The sbt plugin adds an sbt task for running all provider pacts against a running server.

To use the pact sbt plugin, add the following to your project/plugins.sbt

    addSbtPlugin("au.com.dius" %% "pact-jvm-provider-sbt" % "3.5.12")

## Using the old verifyPacts task

The pact plugin adds a task called `verifyPacts`. To use it you need to add the following to your build.sbt

    PactJvmPlugin.pactSettings

Two new keys are added to configure this task:

`pactConfig` is the location of your pact-config json file (defaults to "pact-config.json" in the classpath root)

`pactRoot` is the root folder of your pact json files (defaults to "pacts"), all .json files in root and sub folders will be executed

## Using the newer task [version 2.4.4+]

The pact SBT is being updated to bring it inline with the functionality available in the other build plugins. A new
task is added called `pactVerify`. To use it, add config to your build.sbt that configures `pactProvidersConfig`
with the providers and consumers.

For example:

```scala
import au.com.dius.pact.provider.sbt._
// This defines a single provider and two consumers. The pact files are stored in the src/test/resources directory.
pactProvidersConfig ++ Seq(
  pactProviders := Seq(
    ProviderConfig(name = "Our Service", port = 5050)
        .hasPactWith(ConsumerConfig(name = "sampleconsumer", pactFile = file("src/test/resources/sample-pact.json")))
        .hasPactWith(ConsumerConfig(name = "sampleconsumer2", pactFile = file("src/test/resources/sample-pact2.json")))
  )
)
```

and then execute `pactVerify`.

### Enabling insecure SSL

For providers that are running on SSL with self-signed certificates, you need to enable insecure SSL mode by setting
`insecure` to true on the provider.

```scala
    ProviderConfig(name = "Our Service", protocol = "https", insecure = true)
```

### Specifying a custom trust store

For environments that are running their own certificate chains:

```scala
    ProviderConfig(name = "Our Service", protocol = "https", trustStore = file("relative/path/to/trustStore.jks"),
        trustStorePassword = "securePassword")
```

`trustStore` is relative to the current working directory. `trustStorePassword` defaults to `changeme`.

NOTE: The hostname will still be verified against the certificate.

### Provider States

For a description of what provider states are, see the wiki in the Ruby project:
https://github.com/realestate-com-au/pact/wiki/Provider-states

For each provider you can specify a state change URL to use to switch the state of the provider. This URL will
receive the providerState description from the pact file before each interaction via a POST. The stateChangeUsesBody
controls if the state is passed in the request body or as a query parameter.

These values can be set at the provider level, or for a specific consumer. Consumer values take precedent if both are given.

```scala
        ProviderConfig(name = "Our Service", stateChangeUrl = Some(new java.net.URL("http://localhost:8080/tasks/pactStateChange")))
```

If the `stateChangeUsesBody` value is not specified, or is set to true, then the provider state description will be sent as
 JSON in the body of the request. If it is set to false, it will passed as a query parameter.

### Verifying all pact files in a directory for a provider

You can specify a directory that contains pact files, and the Pact plugin will scan for all pact files that match that
provider and define a consumer for each pact file in the directory. Consumer name is read from contents of pact file.

For example:

```scala
import au.com.dius.pact.provider.sbt._
// This defines a single provider and all the consumers from the src/test/resources directory.
pactProvidersConfig ++ Seq(
  pactProviders := Seq(
    ProviderConfig(name = "Our Service")
        .hasPactsInDirectory(file("src/test/resources")))
)
```

The `hasPactsInDirectory` has the following optional parameters:

| Parameter Name | Parameter Type | Default | Description |
|----------------|----------------|-------- | ------------|
| stateChange | Option[URL] | None | State change URL |
| stateChangeUsesBody | Boolean | false | If state is passed in the body or query parameters |
| verificationType | PactVerification | PactVerification.REQUST_RESPONSE | Whether the provider interacts via request/response or messages |
| packagesToScan | List[String] | List() | Packages to scan for implementations for message pacts |

These will be applied to all consumers configured from the files in the directory.

### Verifying pact files from a pact broker

You can setup your build to validate against the pacts stored in a pact broker. The pact plugin will query
the pact broker for all consumers that have a pact with the provider based on its name. To use it, just configure the
provider config with `hasPactsFromPactBroker` with the base URL to the pact broker.

For example:

```scala
import au.com.dius.pact.provider.sbt._
pactProvidersConfig ++ Seq(
  pactProviders := Seq(
    ProviderConfig(name = "Our Service")
        .hasPactsFromPactBroker(new URL("http://pact-broker.local")))
)
```


You can also verify all the latest pacts for a provider for all its consumer where pacts have a specified tag:


```scala
import au.com.dius.pact.provider.sbt._
pactProvidersConfig ++ Seq(
  pactProviders := Seq(
    ProviderConfig(name = "Our Service")
        .hasPactsFromPactBroker(new URL("http://pact-broker.local"), Some("tagName")))
)
```

Working with tags requires pact-broker >= v1.12.0.

### Filtering the interactions that are verified

You can filter the interactions that are run using three properties: `pact.filter.consumers`, `pact.filter.description` and `pact.filter.providerState`.
Adding `-Dpact.filter.consumers=consumer1,consumer2` to the command line will only run the pact files for those
consumers (consumer1 and consumer2).
Adding `-Dpact.filter.description=a\\srequest\\sfor\\spayment.*` will only run those interactions
whose descriptions start with 'a request for payment'. `-Dpact.filter.providerState=.*payment` will match any interaction that
has a provider state that ends with payment, and `-Dpact.filter.providerState=` will match any interaction that does not have a
provider state.

**NOTE:** SBT does not handle spaces in the property values, so you will have to use escaped values (like using '\\s' in the
description and provider state filters).

### Command Line Properties

The following project properties can be specified with `-Dproperty=value` on the command line:

|Property|Description|
|--------|-----------|
|pact.showStacktrace|This turns on stacktrace printing for each request. It can help with diagnosing network errors|
|pact.showFullDiff|This turns on displaying the full diff of the expected versus actual bodies [version 3.3.6+]|
|pact.filter.consumers|Comma separated list of consumer names to verify|
|pact.filter.description|Only verify interactions whose description match the provided regular expression|
|pact.filter.providerState|Only verify interactions whose provider state match the provided regular expression. An empty string matches interactions that have no state|
|pact.logLevel|Set the log level for the pact verification (DEBUG, INFO, etc).|
|pact.verifier.publishResults|Publishing of verification results will be skipped unless this property is set to 'true' [version 3.5.18+]|

## Modifying the requests before they are sent

Sometimes you may need to add things to the requests that can't be persisted in a pact file. Examples of these would
be authentication tokens, which have a small life span. The Pact SBT plugin provides a request filter that can be
set to an anonymous function on the provider config that will be called before the request is made. This function will receive the HttpRequest
prior to it being executed. For normal requests, set `requestFilter` and for state change requests, `stateChangeRequestFilter`.

**NOTE:** The request filter is executed for every request, so make so it does not do too much.

For example:

```scala
import au.com.dius.pact.provider.sbt._
pactProvidersConfig ++ Seq(
  pactProviders := Seq(
    ProviderConfig(name = "Our Service", requestFilter = Some(request =>
       // request is an instance of org.apache.http.HttpRequest
       request.addHeader("Authorization", "OAUTH eyJhbGciOiJSUzI1NiIsImN0eSI6ImFw...")
    )).hasPactWith(ConsumerConfig(name = "sampleconsumer", pactFile = file("src/test/resources/sample-pact.json")))
  )
)
```

__*Important Note:*__ You should only use this feature for things that can not be persisted in the pact file. By modifying
the request, you are potentially modifying the contract from the consumer tests!
