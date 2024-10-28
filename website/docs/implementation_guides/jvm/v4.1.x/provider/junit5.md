---
title: Pact Junit 5 Extension
custom_edit_url: https://github.com/pact-foundation/pact-jvm/edit/v4.1.x/provider/junit5/README.md
---
<!-- This file has been synced from the pact-foundation/pact-jvm repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## Dependency

The library is available on maven central using:

* group-id = `au.com.dius.pact.provider`
* artifact-id = `junit5`
* version-id = `4.3.x`

## Overview

For writing Pact verification tests with JUnit 5, there is an JUnit 5 Invocation Context Provider that you can use with 
the `@TestTemplate` annotation. This will generate a test for each interaction found for the pact files for the provider.

To use it, add the `@Provider` and one of the pact source annotations to your test class (as per a JUnit 4 test), then
add a method annotated with `@TestTemplate` and `@ExtendWith(PactVerificationInvocationContextProvider.class)` that
takes a `PactVerificationContext` parameter. You will need to call `verifyInteraction()` on the context parameter in
your test template method.

For example:

```java
@Provider("myAwesomeService")
@PactFolder("pacts")
public class ContractVerificationTest {

    @TestTemplate
    @ExtendWith(PactVerificationInvocationContextProvider.class)
    void pactVerificationTestTemplate(PactVerificationContext context) {
      context.verifyInteraction();
    }

}
```

For details on the provider and pact source annotations, refer to the [Pact junit runner](/implementation_guides/jvm/v4.1.x/provider/junit) docs.

## Test target

You can set the test target (the object that defines the target of the test, which should point to your provider) on the
`PactVerificationContext`, but you need to do this in a before test method (annotated with `@BeforeEach`). There are three
different test targets you can use: `HttpTestTarget`, `HttpsTestTarget` and `MessageTestTarget`.

For example:

```java
  @BeforeEach
  void before(PactVerificationContext context) {
    context.setTarget(HttpTestTarget.fromUrl(new URL(myProviderUrl)));
    // or something like
    // context.setTarget(new HttpTestTarget("localhost", myProviderPort, "/"));
  }
```

### HttpTestTarget

`HttpTestTarget` accepts the following options:

| Option | Type | Default | Description |
| ------ | ---- | ------- | ----------- |
| host | String | localhost | The hostname to use to access the provider |
| port | Int | 8080 | The port the provider is running on |
| path | String | "/" | The base path the provider is mounted on |
| httpClientFactory | () -> IHttpClientFactory | Default Factory | Callback used to override the HTTP client factory |

### HttpsTestTarget

`HttpsTestTarget` accepts the following options:

| Option | Type | Default | Description |
| ------ | ---- | ------- | ----------- |
| host | String | localhost | The hostname to use to access the provider |
| port | Int | 8443 | The port the provider is running on |
| path | String | "/" | The base path the provider is mounted on |
| insecure | Boolean | false | Disables the standard TLS verification used with HTTPS connections |
| httpClientFactory | () -> IHttpClientFactory | Default Factory | Callback used to override the HTTP client factory |

### MessageTestTarget

`MessageTestTarget` accepts the following options:

| Option | Type | Default | Description |
| ------ | ---- | ------- | ----------- |
| packagesToScan | List&lt;String&gt; | empty List | The Java packages to scan to find classes with annotated methods. If your methods are on your test class, you don't need to supply a value for this. | 
| classLoader | ClassLoader? | null | Class loader to use to load the classes with annotated methods | 

## !! Important note for Maven users !! 
If you use Maven to run your tests, you will have to make sure that the Maven Surefire plugin is at least version 
2.22.1 and configured to use an isolated classpath.

For example, configure it by adding the following to your POM: 

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-surefire-plugin</artifactId>
    <version>2.22.1</version>
    <configuration>
        <useSystemClassLoader>false</useSystemClassLoader>
    </configuration>
</plugin>
```

## IMPORTANT NOTE!!!: JVM system properties needs to be set on the test JVM if your build is running with Gradle or Maven.

Gradle and Maven do not pass in the system properties in to the test JVM from the command line. The system properties
specified on the command line only control the build JVM (the one that runs Gradle or Maven), but the tests will run in
a new JVM. See [Maven Surefire Using System Properties](https://maven.apache.org/surefire/maven-surefire-plugin/examples/system-properties.html)
and [Gradle Test docs](https://docs.gradle.org/current/dsl/org.gradle.api.tasks.testing.Test.html#org.gradle.api.tasks.testing.Test:systemProperties).

### For Message Tests and Spring and Maven

If you are using Spring (or Springboot), and want to have values injected into your test, you need to ensure 
that the same class loader is used to execute your annotated test method as Spring is using to inject the values. 
In particular, options like the Maven Surefire plugin's `forkCount == 0` can impact this. Either don't supply any 
packages to scan (this will use the default class loader and the annotated methods **have** to be on your test class), 
or you can provide the classloader to use as the second parameter to `MessageTestTarget`.

## Selecting the Pacts to verify with Consumer Version Selectors [4.3.12+]

If you are using a Pact broker to host your Pact files, you can select the Pacts to verify using [Consumer Version Selectors](https://docs.pact.io/pact_broker/advanced_topics/consumer_version_selectors).
There are a few ways to do this.

### Using an annotated method with a builder
You can add a static method to your test class annotated with `au.com.dius.pact.provider.junitsupport.loader.PactBrokerConsumerVersionSelectors` 
which returns a `SelectorBuilder`. The builder will allow you to specify the selectors to use in a type-safe manner.

For example:

```java
    @au.com.dius.pact.provider.junitsupport.loader.PactBrokerConsumerVersionSelectors
    public static SelectorBuilder consumerVersionSelectors() {
      // Select Pacts for consumers deployed to production with branch 'FEAT-123' 
      return new SelectorBuilder()
        .environment('production')
        .branch('FEAT-123');
    }
```

Or for example where the branch is set with the `BRANCH_NAME` environment variable:

```java
    @au.com.dius.pact.provider.junitsupport.loader.PactBrokerConsumerVersionSelectors
    public static SelectorBuilder consumerVersionSelectors() {
      // Select Pacts for consumers deployed to production with branch from CI build 
      return new SelectorBuilder()
        .environment('production')
        .branch(System.getenv('BRANCH_NAME'));
    }
```

The builder has the following methods:

- `mainBranch()` - The latest version from the main branch of each consumer, as specified by the consumer's mainBranch property.
- `branch(name: String, consumer: String? = null, fallback: String? = null)` - The latest version from a particular branch 
of each consumer, or for a particular consumer if the second parameter is provided. If fallback is provided, falling 
back to the fallback branch if none is found from the specified branch.
- `matchingBranch()` - The latest version from any branch of the consumer that has the same name as the current branch
of the provider. Used for coordinated development between consumer and provider teams using matching feature branch names.
- `deployedOrReleased()` - All the currently deployed and currently released and supported versions of each consumer. 
- `matchingBranch()` - The latest version from any branch of the consumer that has the same name as the current branch of the provider.
Used for coordinated development between consumer and provider teams using matching feature branch names.
- `deployedTo(environment: String)` - Any versions currently deployed to the specified environment.
- `releasedTo(environment: String)` - Any versions currently released and supported in the specified environment.
- `environment(environment: String)` - Any versions currently deployed or released and supported in the specified environment.
- `tag(name: String)` - All versions with the specified tag. Tags are deprecated in favor of branches.
- `latestTag(name: String)` - The latest version for each consumer with the specified tag. Tags are deprecated in favor of branches.
- `rawSelectorJson(json: String)` - You can also provide the raw JSON snippets for selectors.

If you require more control, your selector method can also return a list of `au.com.dius.pact.core.pactbroker.ConsumerVersionSelectors` 
instead of the builder class.   

### Providing the raw Consumer Version Selectors JSON

You can also set the consumer versions selectors as raw JSON with the `pactbroker.consumerversionselectors.rawjson` JVM
system property or environment variable. This will allow you to pass the selectors in from a CI build.

**IMPORTANT NOTE:** *JVM system properties needs to be set on the test JVM if your build is running with Gradle or Maven.* 
Just passing them in on the command line won't work, as they will not be available to the test JVM that is running your test.
To set the properties, see [Maven Surefire Using System Properties](https://maven.apache.org/surefire/maven-surefire-plugin/examples/system-properties.html)
and [Gradle Test docs](https://docs.gradle.org/current/dsl/org.gradle.api.tasks.testing.Test.html#org.gradle.api.tasks.testing.Test:systemProperties).

## Provider State Methods

Provider State Methods work in the same way as with JUnit 4 tests, refer to the [Pact junit runner](/implementation_guides/jvm/v4.1.x/provider/junit) docs.

### Using multiple classes for the state change methods

If you have a large number of state change methods, you can split things up by moving them to other classes. You will 
need to specify the additional classes on the test context in a `Before` method. Do this with the `withStateHandler` 
or `setStateHandlers` methods. See [StateAnnotationsOnAdditionalClassTest](https://github.com/DiUS/pact-jvm/blob/master/provider/junit5/src/test/java/au/com/dius/pact/provider/junit5/StateAnnotationsOnAdditionalClassTest.java) for an example. 

## Modifying the requests before they are sent

**Important Note:** You should only use this feature for things that can not be persisted in the pact file. By modifying
 the request, you are potentially modifying the contract from the consumer tests!
 
**NOTE: JUnit 5 tests do not use `@TargetRequestFilter`**

Sometimes you may need to add things to the requests that can't be persisted in a pact file. Examples of these would be
authentication tokens, which have a small life span. The Http and Https test targets support injecting the request that
will executed into the test template method.
You can then add things to the request before calling the `verifyInteraction()` method.

For example to add a header:

```java
    @TestTemplate
    @ExtendWith(PactVerificationInvocationContextProvider.class)
    void testTemplate(PactVerificationContext context, HttpRequest request) {
      // This will add a header to the request
      request.addHeader("X-Auth-Token", "1234");
      context.verifyInteraction();
    }
```

## Objects that can be injected into the test methods

You can inject the following objects into your test methods (just like the `PactVerificationContext`). They will be null if injected before the
supported phase.

| Object | Can be injected from phase | Description |
| ------ | --------------- | ----------- |
| PactVerificationContext | @BeforeEach | The context to use to execute the interaction test |
| Pact | any | The Pact model for the test |
| Interaction | any | The Interaction model for the test |
| HttpRequest | @TestTemplate | The request that is going to be executed (only for HTTP and HTTPS targets) |
| ProviderVerifier | @TestTemplate | The verifier instance that is used to verify the interaction |

## Allowing the test to pass when no pacts are found to verify (version 4.0.7+)

By default, the test will fail with an exception if no pacts were found to verify. This can be overridden by adding the 
`@IgnoreNoPactsToVerify` annotation to the test class. For this to work, you test class will need to be able to receive 
null values for any of the injected parameters.

## Overriding the handling of a body data type

**NOTE: version 4.1.3+**

By default, bodies will be handled based on their content types. For binary contents, the bodies will be base64
encoded when written to the Pact file and then decoded again when the file is loaded. You can change this with
an override property: `pact.content_type.override.<TYPE>.<SUBTYPE>=text|json|binary`. For instance, setting 
`pact.content_type.override.application.pdf=text` will treat PDF bodies as a text type and not encode/decode them.

### Controlling the generation of diffs

**NOTE: version 4.2.7+**

When there are mismatches with large bodies the calculation of the diff can take a long time . You can turn off the
generation of the diffs with the JVM system property: `pact.verifier.generateDiff=true|false|<dataSize>`, where
`dataSize`, if specified, must be a valid data size (for instance `100kb` or `1mb`). This will turn off the diff
calculation for payloads that exceed this size.

For instance, setting `pact.verifier.generateDiff=false` will turn off the generation of diffs for all bodies, while
`pact.verifier.generateDiff=512kb` will only turn off the diffs if the actual or expected body is larger than 512kb.

# Publishing verification results to a Pact Broker

For pacts that are loaded from a Pact Broker, the results of running the verification can be published back to the
broker against the URL for the pact. You will be able to see the result on the Pact Broker home screen. You need to
set the version of the provider that is verified using the `pact.provider.version` system property.

To enable publishing of results, set the Java system property or environment variable `pact.verifier.publishResults` to `true`.

### IMPORTANT NOTE!!!: this property needs to be set on the test JVM if your build is running with Gradle or Maven.

Gradle and Maven do not pass in the system properties in to the test JVM from the command line. The system properties
specified on the command line only control the build JVM (the one that runs Gradle or Maven), but the tests will run in
a new JVM. See [Maven Surefire Using System Properties](https://maven.apache.org/surefire/maven-surefire-plugin/examples/system-properties.html)
and [Gradle Test docs](https://docs.gradle.org/current/dsl/org.gradle.api.tasks.testing.Test.html#org.gradle.api.tasks.testing.Test:systemProperties).

## Tagging the provider before verification results are published [4.0.1+]

You can have a tag pushed against the provider version before the verification results are published. To do this
you need set the `pact.provider.tag` JVM system property to the tag value.

From 4.1.8+, you can specify multiple tags with a comma separated string for the `pact.provider.tag`
system property.

## Setting the provider branch before verification results are published [4.3.0-beta.7+]

Pact Broker version 2.86.0 or later

You can have a branch pushed against the provider version before the verification results are published. To do this
you need set the `pact.provider.branch` JVM system property to the branch value.

## Setting the build URL for verification results [4.3.2+]

You can specify a URL to link to your CI build output. To do this you need to set the `pact.verifier.buildUrl` JVM
system property to the URL value.

# Pending Pact Support (version 4.1.0 and later)

If your Pact broker supports pending pacts, you can enable support for that by enabling that on your Pact broker annotation or with JVM system properties. You also need to provide the tags that will be published with your provider's verification results. The broker will then label any pacts found that don't have a successful verification result as pending. That way, if they fail verification, the verifier will ignore those failures and not fail the build.

For example, with annotation:

```java
@Provider("Activity Service")
@PactBroker(host = "test.pactflow.io", tags = {"test"}, scheme = "https",
  enablePendingPacts = "true",
  providerTags = "master"
)
public class PactJUnitTest {
```

You can also use the `pactbroker.enablePending` and `pactbroker.providerTags` JVM system properties. 

Then any pending pacts will not cause a build failure.

# Work In Progress (WIP) Pact Support (version 4.1.5 and later)

WIP pacts work in the same way as with JUnit 4 tests, refer to the [Pact junit runner](/implementation_guides/jvm/v4.1.x/provider/junit) docs.

# Test Analytics

We are tracking anonymous analytics to gather important usage statistics like JVM version
and operating system. To disable tracking, set the 'pact_do_not_track' system property or environment
variable to 'true'.
