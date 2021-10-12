---
title: Standalone Pact Verifier
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_verifier_cli/README.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

This project provides a command line interface to verify pact files against a running provider. It is a single executable binary. It implements the [V3 Pact specification](https://github.com/pact-foundation/pact-specification/tree/version-3).

[Online rust docs](https://docs.rs/pact_verifier_cli/)

The Pact Verifier works by taking all the interactions (requests and responses) from a number of pact files. For each interaction, it will make the request defined in the pact to a running service provider and check the response received back against the one defined in the pact file. All mismatches will then be reported.

## Command line interface

The pact verifier is bundled as a single binary executable `pact_verifier_cli`. Running this with out any options displays the standard help.

```console
pact_verifier_cli v0.8.9
Standalone Pact verifier

USAGE:
    pact_verifier_cli [FLAGS] [OPTIONS] --broker-url <broker-url> --dir <dir>... --file <file>... --provider-name <provider-name> --url <url>...

FLAGS:
        --disable-ssl-verification    Disables validation of SSL certificates
        --enable-pending              Enables Pending Pacts
        --help                        Prints help information
        --publish                     Enables publishing of verification results back to the Pact Broker. Requires the
                                      broker-url and provider-version parameters.
        --state-change-as-query       State change request data will be sent as query parameters instead of in the
                                      request body
        --state-change-teardown       State change teardown requests are to be made after each interaction
    -v, --version                     Prints version information

OPTIONS:
        --base-path <base-path>                                      Base path to add to all requests
    -b, --broker-url <broker-url>
            URL of the pact broker to fetch pacts from to verify (requires the provider name parameter) [env:
            PACT_BROKER_BASE_URL=]
        --build-url <build-url>
            URL of the build to associate with the published verification results.

        --consumer-version-selectors <consumer-version-selectors>
            Consumer version selectors to use when fetching pacts from the Broker. Accepts a JSON string as per
            https://docs.pact.io/pact_broker/advanced_topics/consumer_version_selectors/
        --consumer-version-tags <consumer-version-tags>
            Consumer tags to use when fetching pacts from the Broker. Accepts comma-separated values.

    -d, --dir <dir>...                                               Directory of pact files to verify (can be repeated)
    -f, --file <file>...                                             Pact file to verify (can be repeated)
    -c, --filter-consumer <filter-consumer>...
            Consumer name to filter the pacts to be verified (can be repeated)

        --filter-description <filter-description>
            Only validate interactions whose descriptions match this filter [env: PACT_DESCRIPTION=]

        --filter-no-state <filter-no-state>
            Only validate interactions that have no defined provider state [env: PACT_PROVIDER_NO_STATE=]

        --filter-state <filter-state>
            Only validate interactions whose provider states match this filter [env: PACT_PROVIDER_STATE=]

    -h, --hostname <hostname>                                        Provider hostname (defaults to localhost)
        --include-wip-pacts-since <include-wip-pacts-since>
            Allow pacts that don't match given consumer selectors (or tags) to  be verified, without causing the overall
            task to fail. For more information, see https://pact.io/wip
    -l, --loglevel <loglevel>
            Log level (defaults to warn) [possible values: error, warn, info, debug,
            trace, none]
        --password <password>
            Password to use when fetching pacts from URLS [env: PACT_BROKER_PASSWORD=]

    -p, --port <port>                                                Provider port (defaults to protocol default 80/443)
    -n, --provider-name <provider-name>                              Provider name (defaults to provider)
        --provider-tags <provider-tags>
            Provider tags to use when publishing results. Accepts comma-separated values.

        --provider-version <provider-version>
            Provider version that is being verified. This is required when publishing results.

        --request-timeout <request-timeout>
            Sets the HTTP request timeout in milliseconds for requests to the target API and for state change requests.

        --scheme <scheme>
            Provider URI scheme (defaults to http) [default: http]  [possible values: http, https]

    -s, --state-change-url <state-change-url>                        URL to post state change requests to
    -t, --token <token>
            Bearer token to use when fetching pacts from URLS [env: PACT_BROKER_TOKEN=]

    -u, --url <url>...                                               URL of pact file to verify (can be repeated)
        --user <user>
            Username to use when fetching pacts from URLS [env: PACT_BROKER_USERNAME=]
```

## Options

### Log Level

You can control the log level with the `-l, --loglevel <loglevel>` option. It defaults to warn, and the options that you can specify are: error, warn, info, debug, trace, none.

### Pact File Sources

You can specify the pacts to verify with the following options. They can be repeated to set multiple sources.

| Option | Type | Description |
|--------|------|-------------|
| `-f, --file <file>` | File | Loads a pact from the given file |
| `-u, --url <url>` | URL | Loads a pact from a URL resource |
| `-d, --dir <dir>` | Directory | Loads all the pacts from the given directory |
| `-b, --broker-url <broker-url>` | Pact Broker | Loads all the pacts for the provider from the pact broker. Requires the `-n, --provider-name <provider-name>` option |

### Provider Options

The running provider can be specified with the following options:

| Option | Description |
|--------|-------------|
| `-h, --hostname <hostname>` | The provider hostname, defaults to `localhost` |
| `-p, --port <port>` | The provider port (defaults to protocol default 80/443) |
| `-n, --provider-name <provider-name>` | The name of the provider. Required if you are loading pacts from a pact broker |
| `--base-path <base-path>` | If the provider is mounted on a sub-path, you can use this option to set the base path to add to all requests |

### Filtering the interactions

The interactions that are verified can be filtered by the following options:

#### `-c, --filter-consumer <filter-consumer>`

This will only verify the interactions of matching consumers. You can specify multiple consumers by either separating
the names with a comma, or repeating the option.

#### `--filter-description <filter-description>`

This option will filter the interactions that are verified that match by description. You can use a regular expression
to match.

#### `--filter-state <filter-state>`

This option will filter the interactions that are verified that match by provider state. You can use a regular
expression to match. Can't be used with the `--filter-no-state` option.

#### `--filter-no-state`

This option will filter the interactions that are verified that don't have a defined provider state. Can't be used
with the `--filter-state` option.

### State change requests

Provider states are a mechanism to define the state that the provider needs to be in to be able to verify a particular
request. This is achieved by setting a state change URL that will receive a POST request with the provider state before
the actual request is made.

*NOTE:* For verifying messages fetched via HTTP, the provider state is also passed in the request to fetch the message,
so the state change URL is not required.

#### `-s, --state-change-url <state-change-url>`

This sets the URL that the POST requests will be made to before each actual request.

#### `--state-change-as-query`

By default, the state for the state change request will be sent as a JSON document in the body of the request. This option forces it to be sent as a query parameter instead.

#### `--state-change-teardown`

This option will cause the verifier to also make a tear down request after the main request is made. It will receive a second field in the body or a query parameter named `action` with the value `teardown`.

#### `--consumer-version-selectors`

Accepts a set of [Consumer Version Selectors](https://docs.pact.io/pact_broker/advanced_topics/consumer_version_selectors/) encoded as JSON.

An example well formed argument value might be:

```sh
--consumer-version-selectors '{"branch": "master"}'
```

## Example run

This will verify all the pacts for the `happy_provider` found in the pact broker (running on localhost) against the provider running on localhost port 5050. Only the pacts for the consumers `Consumer` and `Consumer2` will be verified.

```console
$ pact_verifier_cli -b http://localhost -n 'happy_provider' -p 5050 --filter-consumer Consumer --filter-consumer Consumer2
21:59:28 [WARN] pact_matching::models: No metadata found in pact file "http://localhost/pacts/provider/happy_provider/consumer/Consumer/version/1.0.0", assuming V1.1 specification
21:59:28 [WARN] pact_matching::models: No metadata found in pact file "http://localhost/pacts/provider/happy_provider/consumer/Consumer2/version/1.0.0", assuming V1.1 specification

Verifying a pact between Consumer and happy_provider
  Given I am friends with Fred
    WARNING: State Change ignored as there is no state change URL
  Given I have no friends
    WARNING: State Change ignored as there is no state change URL
  a request to unfriend but no friends
    returns a response which
      has status code 200 (OK)
      includes headers
      has a matching body (OK)
  a request friends
    returns a response which
      has status code 200 (FAILED)
      includes headers
        "Content-Type" with value "application/json" (FAILED)
      has a matching body (FAILED)
  a request to unfriend
    returns a response which
      has status code 200 (OK)
      includes headers
        "Content-Type" with value "application/json" (OK)
      has a matching body (FAILED)


Verifying a pact between Consumer2 and happy_provider
  Given I am friends with Fred
    WARNING: State Change ignored as there is no state change URL
  Given I have no friends
    WARNING: State Change ignored as there is no state change URL
  a request to unfriend but no friends
    returns a response which
      has status code 200 (OK)
      includes headers
      has a matching body (OK)
  a request friends
    returns a response which
      has status code 200 (FAILED)
      includes headers
        "Content-Type" with value "application/json" (FAILED)
      has a matching body (FAILED)
  a request to unfriend
    returns a response which
      has status code 200 (OK)
      includes headers
        "Content-Type" with value "application/json" (OK)
      has a matching body (FAILED)


Failures:

0) Verifying a pact between Consumer and happy_provider - a request friends returns a response which has a matching body
    expected 'application/json' body but was 'text/plain'

1) Verifying a pact between Consumer and happy_provider - a request friends returns a response which has status code 200
    expected 200 but was 404

2) Verifying a pact between Consumer and happy_provider - a request friends returns a response which includes header 'Content-Type' with value 'application/json'
    Expected header 'Content-Type' to have value 'application/json' but was 'text/plain'

3) Verifying a pact between Consumer and happy_provider Given I am friends with Fred - a request to unfriend returns a response which has a matching body
    $.body -> Type mismatch: Expected Map {"reply":"Bye"} but received  "Ok"


4) Verifying a pact between Consumer2 and happy_provider - a request friends returns a response which has a matching body
    expected 'application/json' body but was 'text/plain'

5) Verifying a pact between Consumer2 and happy_provider - a request friends returns a response which has status code 200
    expected 200 but was 404

6) Verifying a pact between Consumer2 and happy_provider - a request friends returns a response which includes header 'Content-Type' with value 'application/json'
    Expected header 'Content-Type' to have value 'application/json' but was 'text/plain'

7) Verifying a pact between Consumer2 and happy_provider Given I am friends with Fred - a request to unfriend returns a response which has a matching body
    $.body -> Type mismatch: Expected Map {"reply":"Bye"} but received  "Ok"



There were 8 pact failures

```

## Verifying message pacts

Message pacts can be verified, the messages just need to be fetched from an HTTP endpoint. The verifier will send a
POST request to the configured provider and expect the message payload in the response. The POST request will include
the description and any provider states configured in the Pact file for the message, formatted as JSON.

Example POST request:

```json
{
    "description": "Test Message",
    "providerStates":[ {"name": "message exists"} ]
}
```

### Verifying metadata

Message metadata can be included as base64 encoded key/value pairs in the response, packed into the `Pact-Message-Metadata` HTTP header, and will be compared against any expected metadata in the pact file.

The values may contain any valid JSON.

For example, given this metadata:

```json
{
  "Content-Type": "application/json",
  "topic": "baz",
  "number": 27,
  "complex": {
    "foo": "bar"
  }
}
```

we would encode it into a base64 string, giving us `ewogICJDb250ZW50LVR5cGUiOiAiYXBwbGljYXRpb24vanNvbiIsCiAgInRvcGljIjogImJheiIsCiAgIm51bWJlciI6IDI3LAogICJjb21wbGV4IjogewogICAgImZvbyI6ICJiYXIiCiAgfQp9Cg==`.

## TLS and Certificate Management

Pact uses the [rustls-native-certs](https://lib.rs/crates/rustls-native-certs) crate, which will respect the platform's native certificate store when operating as a TLS client:

This is supported on Windows, macOS and Linux:

* On Windows, certificates are loaded from the system certificate store. The schannel crate is used to access the Windows certificate store APIs.
* On macOS, certificates are loaded from the keychain. The user, admin and system trust settings are merged together as documented by Apple. The security-framework crate is used to access the keystore APIs.
* On Linux and other UNIX-like operating systems, the openssl-probe crate is used to discover the filename of the system CA bundle.

On Linux the standard OpenSSL environment variables `SSL_CERT_FILE` and `SSL_CERT_DIR` will also be respected.
