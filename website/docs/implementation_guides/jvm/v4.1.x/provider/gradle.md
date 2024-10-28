---
title: Gradle plugin to verify a provider
custom_edit_url: https://github.com/pact-foundation/pact-jvm/edit/v4.1.x/provider/gradle/README.md
---
<!-- This file has been synced from the pact-foundation/pact-jvm repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

Gradle plugin for verifying pacts against a provider.

The Gradle plugin creates a task `pactVerify` to your build which will verify all configured pacts against your provider.

__*Important Note: Any properties that need to be set when using the Gradle plugin need to be provided with `-P` and
not `-D` as with the other Pact-JVM modules!*__ 

## To Use It

### For Gradle versions 2.1+

```groovy
plugins {
  id "au.com.dius.pact" version "4.1.39"
}
```


### For Gradle versions prior to 2.1 or if you can't access the Gradle plugin portal

#### 1.1. Add the gradle jar file to your build script class path:

```groovy
buildscript {
    repositories {
        mavenCentral()
    }
    dependencies {
        classpath 'au.com.dius.pact.provider:gradle:4.1.39'
    }
}
```

#### 1.2. Apply the pact plugin

```groovy
apply plugin: 'au.com.dius.pact'
```

### 2. Define the pacts between your consumers and providers

```groovy

pact {

    serviceProviders {

        // You can define as many as you need, but each must have a unique name
        provider1 {
            // All the provider properties are optional, and have sensible defaults (shown below)
            protocol = 'http'
            host = 'localhost'
            port = 8080
            path = '/'

            // Again, you can define as many consumers for each provider as you need, but each must have a unique name
            hasPactWith('consumer1') {

                // currently supports a file path using file() or a URL using url()
                pactSource = file('path/to/provider1-consumer1-pact.json')

            }

            // Or if you have many pact files in a directory
            hasPactsWith('manyConsumers') {

                // Will define a consumer for each pact file in the directory.
                // Consumer name is read from contents of pact file
                pactFileLocation = file('path/to/pacts')

            }

        }

    }

}
```

### 3. Execute `gradle pactVerify`

# Project Properties

The following project properties can be specified with `-Pproperty=value` on the command line:

|Property|Description|
|--------|-----------|
|`pact.showStacktrace`|This turns on stacktrace printing for each request. It can help with diagnosing network errors|
|`pact.showFullDiff`|This turns on displaying the full diff of the expected versus actual bodies|
|`pact.filter.consumers`|Comma seperated list of consumer names to verify|
|`pact.filter.description`|Only verify interactions whose description match the provided regular expression|
|`pact.filter.providerState`|Only verify interactions whose provider state match the provided regular expression. An empty string matches interactions that have no state|
|`pact.filter.pacturl`|This filter allows just the just the changed pact specified in a webhook to be run. It should be used in conjunction with `pact.filter.consumers` |
|`pact.verifier.publishResults`|Publishing of verification results will be skipped unless this property is set to 'true'|
|`pact.verifier.ignoreNoConsumers`|If set to `true`, don't fail the build if there are no consumers to verify [4.1.19+]|

The following project properties must be specified as system properties:

| Property                                                                                            | Description                                                                                                                                                                               |
|-----------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `pact.verifier.disableUrlPathDecoding`                                                              | Disables decoding of request paths                                                                                                                                                        |
| `pact.pactbroker.httpclient.usePreemptiveAuthentication`                                            | Enables preemptive authentication with the pact broker when set to `true`                                                                                                                 |
| `pact.provider.tag`                                                                                 | Sets the provider tag to push before publishing verification results (can use a comma separated list)                                                                                     |
| `pact.provider.branch`                                                                              | Sets the provider branch to push before publishing verification results                                                                                                                   |
| `pact.content_type.override.<TYPE>.<SUBTYPE>=<VAL>` where `<VAL>` may be `text`, `json` or `binary` | Overrides the handling of a particular content type [4.1.3+]                                                                                                                              |
| `pact.verifier.enableRedirectHandling`                                                              | Enables automatically handling redirects [4.1.8+]                                                                                                                                         |
| `pact.verifier.generateDiff`                                                                        | Controls the generation of diffs. Can be set to `true`, `false` or a size threshold (for instance `1mb` or `100kb`) which only enables diffs for payloads of size less than that [4.2.7+] |
| `pact.verifier.buildUrl`                                                                            | Specifies buildUrl to report to the broker when publishing verification results [4.2.16/4.3.2+]                                                                                           |
| `pactbroker.consumerversionselectors.rawjson`                                                       | Overrides the consumer version selectors with raw JSON [4.1.29+/4.3.0+]                                                                                                                   |

## Specifying the provider hostname at runtime

If you need to calculate the provider hostname at runtime, you can give a Closure as the provider `host`.

```groovy
pact {

    serviceProviders {

        provider1 {
            host = { lookupHostName() }

            hasPactWith('consumer1') {
                pactFile = file('path/to/provider1-consumer1-pact.json')
            }
        }

    }

}
```

You can also give a Closure as the provider `port`.

## Specifying the pact file or URL at runtime

If you need to calculate the pact file or URL at runtime, you can give a Closure as the provider `pactFile`.

```groovy
pact {

    serviceProviders {

        provider1 {
            host = 'localhost'

            hasPactWith('consumer1') {
                pactFile = { lookupPactFile() }
            }
        }

    }

}
```

## Starting and shutting down your provider

If you need to start-up or shutdown your provider, define Gradle tasks for each action and set  
`startProviderTask` and `terminateProviderTask` properties of each provider.
You could use the jetty tasks here if you provider is built as a WAR file.

```groovy

// This will be called before the provider task
task('startTheApp') {
  doLast {
    // start up your provider here
  }
}

// This will be called after the provider task
task('killTheApp') {
  doLast {
    // kill your provider here
  }
}

pact {

    serviceProviders {

        provider1 {

            startProviderTask = startTheApp
            terminateProviderTask = killTheApp

            hasPactWith('consumer1') {
                pactFile = file('path/to/provider1-consumer1-pact.json')
            }

        }

    }

}
```

Following typical Gradle behaviour, you can set the provider task properties to the actual tasks, or to the task names
as a string (for the case when they haven't been defined yet).

## Preventing the chaining of provider verify task to `pactVerify`

Normally a gradle task named `pactVerify_${provider.name}` is created and added as a task dependency for `pactVerify`.  You 
can disable this dependency on a provider by setting `isDependencyForPactVerify` to `false` (defaults to `true`).

```groovy
pact {

    serviceProviders {

        provider1 {

            isDependencyForPactVerify = false

            hasPactWith('consumer1') {
                pactFile = file('path/to/provider1-consumer1-pact.json')
            }

        }

    }

}
```

To run this task, you would then have to explicitly name it as in ```gradle pactVerify_provider1```, a normal ```gradle pactVerify``` 
would skip it.  This can be useful when you want to define two providers, one with `startProviderTask`/`terminateProviderTask` 
and as second without, so you can manually start your provider (to debug it from your IDE, for example) but still want a `pactVerify` 
 to run normally from your CI build.

## Enabling insecure SSL

For providers that are running on SSL with self-signed certificates, you need to enable insecure SSL mode by setting
`insecure = true` on the provider.

```groovy
pact {

    serviceProviders {

        provider1 {
            insecure = true // allow SSL with a self-signed cert
            hasPactWith('consumer1') {
                pactFile = file('path/to/provider1-consumer1-pact.json')
            }

        }

    }

}
```

## Specifying a custom trust store

For environments that are running their own certificate chains:

```groovy
pact {

    serviceProviders {

        provider1 {
            trustStore = new File('relative/path/to/trustStore.jks')
            trustStorePassword = 'changeit'
            hasPactWith('consumer1') {
                pactFile = file('path/to/provider1-consumer1-pact.json')
            }

        }

    }

}
```

`trustStore` is either relative to the current working (build) directory. `trustStorePassword` defaults to `changeit`.

NOTE: The hostname will still be verified against the certificate.

## Modifying the HTTP Client Used

The default HTTP client is used for all requests to providers (created with a call to `HttpClients.createDefault()`).
This can be changed by specifying a closure assigned to createClient on the provider that returns a CloseableHttpClient. For example:

```groovy
pact {

    serviceProviders {

        provider1 {

            createClient = { provider ->
                // This will enable the client to accept self-signed certificates
                HttpClients.custom().setSSLHostnameVerifier(new NoopHostnameVerifier())
                    .setSslcontext(new SSLContextBuilder().loadTrustMaterial(null, { x509Certificates, s -> true })
                        .build())
                    .build()
            }

            hasPactWith('consumer1') {
                pactFile = file('path/to/provider1-consumer1-pact.json')
            }

        }

    }

}
```

## Modifying the requests before they are sent

Sometimes you may need to add things to the requests that can't be persisted in a pact file. Examples of these would
be authentication tokens, which have a small life span. The Pact Gradle plugin provides a request filter that can be
set to a closure on the provider that will be called before the request is made. This closure will receive the HttpRequest
prior to it being executed.

```groovy
pact {

    serviceProviders {

        provider1 {

            requestFilter = { req ->
                // Add an authorization header to each request
                req.addHeader('Authorization', 'OAUTH eyJhbGciOiJSUzI1NiIsImN0eSI6ImFw...')
            }

            hasPactWith('consumer1') {
                pactFile = file('path/to/provider1-consumer1-pact.json')
            }

        }

    }

}
```

__*Important Note:*__ You should only use this feature for things that can not be persisted in the pact file. By modifying
the request, you are potentially modifying the contract from the consumer tests!

## Turning off URL decoding of the paths in the pact file

By default the paths loaded from the pact file will be decoded before the request is sent to the provider. To turn this
behaviour off, set the property `pact.verifier.disableUrlPathDecoding` to `true`.

__*Important Note:*__ If you turn off the url path decoding, you need to ensure that the paths in the pact files are
correctly encoded. The verifier will not be able to make a request with an invalid encoded path.

## Overriding the handling of a body data type

**NOTE: version 4.1.3+**

By default, bodies will be handled based on their content types. For binary contents, the bodies will be base64
encoded when written to the Pact file and then decoded again when the file is loaded. You can change this with
an override property: `pact.content_type.override.<TYPE>.<SUBTYPE>=text|binary`. For instance, setting 
`pact.content_type.override.application.pdf=text` will treat PDF bodies as a text type and not encode/decode them.

## Provider States

For a description of what provider states are, see the pact documentations: https://docs.pact.io/getting_started/provider_states

### Using a state change URL

For each provider you can specify a state change URL to use to switch the state of the provider. This URL will
receive the providerState description and all the parameters from the pact file before each interaction via a POST. 
As for normal requests, a request filter (`stateChangeRequestFilter`) can also be set to manipulate the request before it is sent.

```groovy
pact {

    serviceProviders {

        provider1 {

            hasPactWith('consumer1') {
                pactFile = file('path/to/provider1-consumer1-pact.json')
                stateChangeUrl = url('http://localhost:8001/tasks/pactStateChange')
                stateChangeUsesBody = false // defaults to true
                stateChangeRequestFilter = { req ->
                    // Add an authorization header to each request
                    req.addHeader('Authorization', 'OAUTH eyJhbGciOiJSUzI1NiIsImN0eSI6ImFw...')
                }
            }

            // or
            hasPactsWith('consumers') {
                pactFileLocation = file('path/to/pacts')                
                stateChangeUrl = url('http://localhost:8001/tasks/pactStateChange')
                stateChangeUsesBody = false // defaults to true
            }

        }

    }

}
```

If the `stateChangeUsesBody` is not specified, or is set to true, then the provider state description and parameters 
will be sent as JSON in the body of the request :
```json
{ "state" : "a provider state description", "params": { "a": "1", "b": "2" } }
```  
If it is set to false, they will be passed as query parameters.

#### Teardown calls for state changes

You can enable teardown state change calls by setting the property `stateChangeTeardown = true` on the provider. This
will add an `action` parameter to the state change call. The setup call before the test will receive `action=setup`, and
then a teardown call will be made afterwards to the state change URL with `action=teardown`.

### Using a Closure

You can set a closure to be called before each verification with a defined provider state. The closure will be
called with the state description and parameters from the pact file.

```groovy
pact {

    serviceProviders {

        provider1 {

            hasPactWith('consumer1') {
                pactFile = file('path/to/provider1-consumer1-pact.json')
                // Load a fixture file based on the provider state and then setup some database
                // data. Does not require a state change request so returns false
                stateChange = { providerState ->
                    // providerState is an instance of ProviderState
                    def fixture = loadFixtuerForProviderState(providerState)
                    setupDatabase(fixture)
                }
            }

        }

    }

}
```

#### Teardown calls for state changes

You can enable teardown state change calls by setting the property `stateChangeTeardown = true` on the provider. This
will add an `action` parameter to the state change closure call. The setup call before the test will receive `setup`,
as the second parameter, and then a teardown call will be made afterwards with `teardown` as the second parameter.

```groovy
pact {

    serviceProviders {

        provider1 {

            hasPactWith('consumer1') {
                pactFile = file('path/to/provider1-consumer1-pact.json')
                // Load a fixture file based on the provider state and then setup some database
                // data. Does not require a state change request so returns false
                stateChange = { providerState, action ->
                    if (action == 'setup') {
                      def fixture = loadFixtuerForProviderState(providerState)
                      setupDatabase(fixture)
                    } else {
                      cleanupDatabase()
                    }
                    false
                }
            }

        }

    }

}
```

#### Returning values that can be injected

You can have values from the provider state callbacks be injected into most places (paths, query parameters, headers,
bodies, etc.). This works by using the V3 spec generators with provider state callbacks that return values. One example
of where this would be useful is API calls that require an ID which would be auto-generated by the database on the
provider side, so there is no way to know what the ID would be beforehand.

There are methods on the consumer DSLs that can provider an expression that contains variables (like '/api/user/${id}'
for the path). The provider state callback can then return a map for values, and the `id` attribute from the map will
be expanded in the expression. For URL callbacks, the values need to be returned as JSON in the response body. 

## Filtering the interactions that are verified

You can filter the interactions that are run using three project properties: `pact.filter.consumers`, `pact.filter.description` and `pact.filter.providerState`.
Adding `-Ppact.filter.consumers=consumer1,consumer2` to the command line will only run the pact files for those
consumers (consumer1 and consumer2). Adding `-Ppact.filter.description=a request for payment.*` will only run those interactions
whose descriptions start with 'a request for payment'. `-Ppact.filter.providerState=.*payment` will match any interaction that
has a provider state that ends with payment, and `-Ppact.filter.providerState=` will match any interaction that does not have a
provider state.

## Verifying pact files from a pact broker

You can setup your build to validate against the pacts stored in a pact broker. The pact gradle plugin will query
the pact broker for all consumers that have a pact with the provider based on its name.

### For Pact-JVM 4.1.0 and later

#### First: Add a `broker` configuration block

You can enable Pact broker support by adding a `broker` configuration block to the `pact` block.

For example:

```groovy
pact {

    broker {
        pactBrokerUrl = 'https://your-broker-url/'
    
        // To use basic auth    
        pactBrokerUsername = '<USERNAME>'
        pactBrokerPassword = '<PASSWORD>'
    
        // OR to use a bearer token
        pactBrokerToken = '<TOKEN>'
    }

}
```

#### Second: Define your service provider

```groovy
pact {

  serviceProviders {
    myProvider { // Define the name of your provider here

      fromPactBroker {
        // For 4.1.39+ 
        withSelectors {
          branch('test') // the latest version from a particular branch of each consumer.
        }
       
        // For versions before 4.1.39
        selectors = latestTags('test') // specify your tags here. You can leave this out to just use the latest pacts  
      }

    }
  }

}
```

#### Using consumer version selectors (4.1.39+)

You can use a number of different selectors to fetch Pact files that match some criteria. See [Consumer Version Selectors](https://docs.pact.io/pact_broker/advanced_topics/consumer_version_selectors)
for more information. The following selectors are available:

##### Main branch

The latest version from the main branch of each consumer, as specified by the consumer's mainBranch property.

```groovy
    fromPactBroker {
        withSelectors {
            mainBranch()
        }
    }
```

##### Matching branch

The latest version from any branch of the consumer that has the same name as the current branch of the provider.
Used for coordinated development between consumer and provider teams using matching feature branch names.

```groovy
    fromPactBroker {
        withSelectors {
            matchingBranch()
        }
    }
```

##### Branch

The latest version from a particular branch of each consumer, or for a particular consumer if the second
parameter is provided. If fallback is provided, falling back to the fallback branch if none is found from the
specified branch.

```groovy
    fromPactBroker {
        withSelectors {
            branch('FEAT-1234') // Latest version from the particular branch of each consumer
          
            branch('FEAT-1234', 'consumer-a') // Latest version from the particular branch of the provided consumer
         
            branch('FEAT-1234', null, 'master') // Fall back to master branch if none is found from the specified feature branch
            branch('FEAT-1234', 'consumer-a', 'master') // As above, but for a single consumer
        }
    }
```

##### Deployed or released

All the currently deployed and currently released and supported versions of each consumer. You can also specify if
deployed or released to a particular environment.

```groovy
    fromPactBroker {
        withSelectors {
            deployedOrReleased() // All the currently deployed and currently released and supported versions of each consumer.

            deployedTo('test') // Any versions currently deployed to the specified environment
            releasedTo('test') // Any versions currently released and supported in the specified environment   
            environment('test') // any versions currently deployed or released and supported in the specified environment
        }
    }
```

##### Tags

Supports all the forms of selecting Pacts with tags.

```groovy
    fromPactBroker {
        withSelectors {
            tag('test') // All versions with the specified tag.
            latestTag('test') // The latest version for each consumer with the specified tag
        }
    }
```

Using the generic selector:

**NOTE: Generic Tag selectors are deprecated in favor of the more specific selectors (branches/tags/environments etc.)**

* With just the tag name, returns all versions with the specified tag.
* With latest, returns the latest version for each consumer with the specified tag.
* With a fallback tag, returns the latest version for each consumer with the specified tag, falling back to the fallbackTag if none is found with the specified tag.
* With a consumer name, returns the latest version for a specified consumer with the specified tag.
* With only latest, returns the latest version for each consumer. **NOT RECOMMENDED** as it suffers from race conditions when pacts are published from multiple branches.

```groovy
    fromPactBroker {
        withSelectors {
            selector('test') // All versions with the specified tag.
            selector('test', true) // The latest version for each consumer with the specified tag
            selector('test', true, 'fallback') // the latest version for each consumer with the specified tag, falling back to the fallbackTag if none is found with the specified tag
            selector('test', true, null, 'consumer-a') // the latest version for a specified consumer with the specified tag
        }
    }
```

##### Raw JSON

You can also provide the raw JSON snippets for selectors.

```groovy
    fromPactBroker {
        withSelectors {
          rawSelectorJson('{"tag": "tagname"}')
        }
    }
```

### For Pact-JVM versions before 4.1.0

You configure your service provider and then use the `hasPactsFrom..` methods.

For example:

```groovy
pact {

    serviceProviders {
        provider1 {
            // You can get the latest pacts from the broker
            hasPactsFromPactBroker('http://pact-broker:5000/')
            // And/or you can get the latest pact with a specific tag
            hasPactsFromPactBrokerWithTag('http://pact-broker:5000/',"tagname")
        }
    }

}
```

This will verify all pacts found in the pact broker where the provider name is 'provider1'. If you need to set any
values on the consumers from the pact broker, you can add a Closure to configure them.

```groovy
pact {

    serviceProviders {
        provider1 {
            hasPactsFromPactBroker('http://pact-broker:5000/') { consumer ->
                 stateChange = { providerState -> /* state change code here */ true }
            }
        }
    }

}
```

To only load the pacts when running the validate task, you can do something like:

```groovy
pact {

    serviceProviders {
        provider1 {
            // Only load the pacts from the broker if the start tasks from the command line include pactVerify
            if ('pactVerify' in gradle.startParameter.taskNames) {
                hasPactsFromPactBroker('http://pact-broker:5000/') { consumer ->
                     stateChange = { providerState -> /* state change code here */ true }
                }
            }
        }
    }

}
```

#### Using an authenticated Pact Broker

You can add the authentication details for the Pact Broker like so:

```groovy
pact {

    serviceProviders {
        provider1 {
            hasPactsFromPactBroker('http://pact-broker:5000/', authentication: ['Basic', pactBrokerUser, pactBrokerPassword])
        }
    }

}
```

`pactBrokerUser` and `pactBrokerPassword` can be defined in the gradle properties.

Or with a bearer token:

```groovy
pact {

    serviceProviders {
        provider1 {
            hasPactsFromPactBroker('http://pact-broker:5000/', authentication: ['Bearer', pactBrokerToken])
        }
    }
    
}
```

Preemptive Authentication can be enabled by setting the `pact.pactbroker.httpclient.usePreemptiveAuthentication` property to `true`.

**NOTE:** If you're using [pactflow.io](https://pactflow.io/), follow these instructions for configuring your [bearer token](https://docs.pactflow.io/docs/getting-started/#configuring-your-api-token).

### Allowing just the changed pact specified in a webhook to be verified [4.0.6+]

When a consumer publishes a new version of a pact file, the Pact broker can fire off a webhook with the URL of the changed 
pact file. To allow only the changed pact file to be verified, you can override the URL by using the `pact.filter.pacturl` project properties.

For example, running:

```console
gradle pactVerify -Ppact.filter.pacturl=https://test.pact.dius.com.au/pacts/provider/Activity%20Service/consumer/Foo%20Web%20Client/version/1.0.1
```

will only run the verification with the given pact file URL.

## Verifying pact files from a S3 bucket

**NOTE:** You will need to add the Amazon S3 SDK jar file to your project.

Pact files stored in an S3 bucket can be verified by using an S3 URL to the pact file. I.e.,

```groovy
pact {

    serviceProviders {

        provider1 {

            hasPactWith('consumer1') {
                pactFile = 's3://bucketname/path/to/provider1-consumer1-pact.json'
            }

        }

    }

}
```

**NOTE:** you can't use the `url` function with S3 URLs, as the URL and URI classes from the Java SDK
 don't support URLs with the s3 scheme.

# Publishing pact files to a pact broker

**NOTE**: There is a pact CLI that can be used to publish pacts. See https://github.com/pact-foundation/pact-ruby-cli.

The pact gradle plugin provides a `pactPublish` task that can publish all pact files in a directory
to a pact broker. To use it, you need to add a publish configuration to the pact configuration that defines the
directory where the pact files are and the URL to the pact broker.

If you have configured your broker details in a broker configuration block, the task will use that. Otherwise, 
configure the broker details on the publish block.

For example:

```groovy
pact {

    publish {
        pactDirectory = '/pact/dir' // defaults to $buildDir/pacts
        pactBrokerUrl = 'http://pactbroker:1234'
    }

}
```

You can set any tags that the pacts should be published with by setting the `tags` property. A common use of this
is setting the tag to the current source control branch. This supports using pact with feature branches.

```groovy
pact {

    publish {
        pactDirectory = '/pact/dir' // defaults to $buildDir/pacts
        tags = [project.pactBrokerTag]
    }

}
```

_NOTE:_ The pact broker requires a version for all published pacts. The `pactPublish` task will use the version of the
gradle project by default. You can override this with the `consumerVersion` property. Make sure you have set one 
otherwise the broker will reject the pact files.

## Publishing to an authenticated pact broker

To publish to a broker protected by basic auth, include the username/password in the broker configuration

For example:

```groovy
pact {

    broker {
        pactBrokerUrl = 'https://your-broker-url/'
    
        // To use basic auth    
        pactBrokerUsername = '<USERNAME>'
        pactBrokerPassword = '<PASSWORD>'
    
        // OR to use a bearer token
        pactBrokerToken = '<TOKEN>'
    }

}
```

You can add the username and password as properties on the publish block.

```groovy
pact {

    publish {
        pactBrokerUrl = 'https://mypactbroker.com'
        pactBrokerUsername = 'username'
        pactBrokerPassword = 'password'
    }

}
```

or with a bearer token

```groovy
pact {

    publish {
        pactBrokerUrl = 'https://mypactbroker.com'
        pactBrokerToken = 'token'
    }

}
```

## Excluding pacts from being published

You can exclude some of the pact files from being published by providing a list of regular expressions that match
against the base names of the pact files.

For example:

```groovy
pact {

    publish {
        excludes = [ '.*\\-\\d+$' ] // exclude all pact files that end with a dash followed by a number in the name 
    }

}
```

## Including the consumer branch when publishing [min versions 4.1.33/4.2.19/4.3.4]

The consumer branch and build URL can be included when the pacts are published. This requires Pact Broker version 
**2.86.0 or later**.

The branch name and build URL can either be configured in the project or as system properties or environment variables.

### Configured in the build

There are attributes on the `publish` block to set these values.

```groovy
pact {

    publish {
      consumerBranch = 'feat/test'
      // build URL is optional 
      consumerBuildUrl = 'https://github.com/pact-foundation/pact-jvm/actions/runs/1685674772'
    }

}
```

## Configured as JVM system properties

You can configure these values as system properties using the following keys:
* `pact.publish.consumer.buildUrl`
* `pact.publish.consumer.branchName`
* `pact.publish.consumer.version`

## Configured as environment variables

You can configure these values as environment variables using the following keys:
* `pact.publish.consumer.buildUrl`
* `pact.publish.consumer.branchName`
* `pact.publish.consumer.version`

OR

* `PACT_PUBLISH_CONSUMER_BUILDURL`
* `PACT_PUBLISH_CONSUMER_BRANCHNAME`
* `PACT_PUBLISH_CONSUMER_VERSION`

# Verifying a message provider

The Gradle plugin has been updated to allow invoking test methods that can return the message contents from a message
producer. To use it, set the way to invoke the verification to `ANNOTATED_METHOD`. This will allow the pact verification
 task to scan for test methods that return the message contents.

Add something like the following to your gradle build file:

```groovy
pact {

    serviceProviders {

        messageProvider {

            verificationType = 'ANNOTATED_METHOD'
            packagesToScan = ['au.com.example.messageprovider.*'] // This is optional, but leaving it out will result in the entire
                                                                  // test classpath being scanned

            hasPactWith('messageConsumer') {
                pactFile = url('url/to/messagepact.json')
            }

        }

    }

}
```

Now when the `pactVerify` task is run, will look for methods annotated with `@PactVerifyProvider` in the test classpath
that have a matching description to what is in the pact file.

```groovy
class ConfirmationKafkaMessageBuilderTest {

  @PactVerifyProvider('an order confirmation message')
  String verifyMessageForOrder() {
      Order order = new Order()
      order.setId(10000004)
      order.setExchange('ASX')
      order.setSecurityCode('CBA')
      order.setPrice(BigDecimal.TEN)
      order.setUnits(15)
      order.setGst(new BigDecimal('15.0'))
      order.setFees(BigDecimal.TEN)

      def message = new ConfirmationKafkaMessageBuilder()
              .withOrder(order)
              .build()

      JsonOutput.toJson(message)
  }

}
```

It will then validate that the returned contents matches the contents for the message in the pact file.

# Verification Reports

The default behaviour is to display the verification being done to the console, and pass or fail the build via the normal
Gradle mechanism. Additional reports can be generated from the verification.

## Enabling additional reports

The verification reports can be controlled by adding a reports section to the pact configuration in the gradle build file.

For example:

```groovy
pact {

    reports {
      defaultReports() // adds the standard console output

      markdown // report in markdown format
      json // report in json format
    }
}
```

Any report files will be written to "build/reports/pact".

## Additional Reports

The following report types are available in addition to console output (which is enabled by default):
`markdown`, `json`.

# Publishing verification results to a Pact Broker

For pacts that are loaded from a Pact Broker, the results of running the verification can be published back to the
 broker against the URL for the pact. You will be able to see the result on the Pact Broker home screen.

To turn on the verification publishing, set the project property `pact.verifier.publishResults` to `true`.

To provide the build URL, set the JVM system property `pact.verifier.buildUrl`.

By default, the Gradle project version will be used as the provider version. You can override this by setting the
`providerVersion` property.

```groovy
pact {
    serviceProviders {
        provider1 {
            providerVersion = { branchName() + '-' + abbreviatedId() }
            hasPactsFromPactBroker('http://pact-broker:5000/', authentication: ['Basic', pactBrokerUser, pactBrokerPassword])
        }
    }
}
```

## Tagging the provider before verification results are published [4.0.1+]

You can have a tag pushed against the provider version before the verification results are published. There are two ways
to do this with the Gradle plugin. You can provide a closure in a similar way to the provider version, i.e.

```groovy
pact {
    serviceProviders {
        provider1 {
            providerVersion = { branchName() + '-' + abbreviatedId() }
            providerTags = { [ branchName() ] }
            hasPactsFromPactBroker('http://pact-broker:5000/', authentication: ['Basic', pactBrokerUser, pactBrokerPassword])
        }
    }
}
```

or you can set the `pact.provider.tag` JVM system property. For example:

```console
$ ./gradlew -d pactverify -Ppact.verifier.publishResults=true -Dpact.provider.tag=Test2
```

From 4.1.8+, you can specify multiple tags with an array for the `providerTag` value, or a comma separated string for the `pact.provider.tag`
system property.

# Pending Pact Support (version 4.1.0 and later)

If your Pact broker supports pending pacts, you can enable support for that by enabling that on your Pact broker annotation or with JVM system properties. You also need to provide the tags that will be published with your provider's verification results. The broker will then label any pacts found that don't have a successful verification result as pending. That way, if they fail verification, the verifier will ignore those failures and not fail the build.

For example:

```groovy
pact {

  serviceProviders {
    myProvider {

      fromPactBroker {
        selectors = latestTags('test') // specify your tags here. You can leave this out to just use the latest pacts
        enablePending = true // enable pending pacts support
        providerTags = ['master'] // specify the provider main-line tags  
      }

    }
  }

}
```

Then any pending pacts will not cause a build failure.

# Can I Deploy check

There is a `canIDeploy` Gradle task that you can use to preform a deployment safety check. This task requires two
parameters: `pacticipant` and either `pacticipantVersion` or `latest=true`. It will use the configuration from the 
`broker` section of your Gradle build. 

```console
$ ./gradlew canideploy -Ppacticipant='Activity Service' -Platest=true

> Task :canIDeploy FAILED
Computer says no ¯\_(ツ)_/¯ 

The verification between the latest version of Foo Web Client 2 (1.2.3/AB) and the latest version of Activity Service (0.0.3) failed
There is no verified pact between the latest version of Foo Web Client (1.2.3/AB) and the latest version of Activity Service (0.0.3)

FAILURE: Build failed with an exception.

* What went wrong:
Can you deploy? Computer says no ¯\_(ツ)_/¯ 

* Try:
Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.

* Get more help at https://help.gradle.org

BUILD FAILED in 1s
```

## Enabling retry when there are unknown results (4.1.11+)

It can happen that there are still unknown results in the Pact broker because the provider verification is still running.
You can enable a retry with a wait interval to poll for the results to become available. There are two settings that can
be added to the `broker` configuration to enable this: `retryCountWhileUnknown` and `retryWhileUnknownInterval`.

|Field|Description|Default|
|-----|-----------|-------|
|retryCountWhileUnknown|The amount of times to retry while there are unknown results|0|
|retryWhileUnknownInterval|The number of seconds to wait between retries|10|

Example use:

```groovy
pact {
  broker {
      pactBrokerUrl = 'http://localhost:1234/'
      retryCountWhileUnknown = 3
      retryWhileUnknownInterval = 120 // 2 minutes between retries
  }
}
```

# Test Analytics

We are tracking anonymous analytics to gather important usage statistics like JVM version
and operating system. To disable tracking, set the 'pact_do_not_track' system property or environment
variable to 'true'.
