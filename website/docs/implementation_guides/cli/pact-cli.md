---
title: Pact
custom_edit_url: https://github.com/pact-foundation/pact-cli/edit/main/README.md
---
<!-- This file has been synced from the pact-foundation/pact-cli repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

## Source Code

https://github.com/pact-foundation/pact-cli/tree/main


[![Test and Release](https://github.com/pact-foundation/pact-cli/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/pact-foundation/pact-cli/actions/workflows/test.yml)

A consolidated cli consisting of all Pact command line tools

* [pact_mock_server_cli](https://github.com/pact-foundation/pact-core-mock-server/tree/main/pact_mock_server_cli)
* [pact-stub-server](https://github.com/pact-foundation/pact-stub-server)
* [pact_verifier_cli](https://github.com/pact-foundation/pact-reference/tree/master/rust/pact_verifier_cli)
* [pact-plugin-cli](https://github.com/pact-foundation/pact-plugins/tree/main/cli)
* [pact-broker-cli](https://github.com/pact-foundation/pact-broker-cli)

## Installation

### Supported Platforms

| OS            | Architecture | Supported  |
| ------------- | ------------ | ---------  |
| MacOS         | x86_64       | ✅         |
| MacOS         | arm64        | ✅         |
| Linux (libc)  | x86_64       | ✅         |
| Linux (libc)  | arm64        | ✅         |
| Linux (musl)  | x86_64       | ✅         |
| Linux (musl)  | arm64        | ✅         |
| Windows       | x86_64       | ✅         |
| Windows       | arm64        | ✅         |
| NetBSD        | x86_64       | ✅         |
| NetBSD        | arm64        | ✅         |
| OpenBSD       | x86_64       | ✅         |
| OpenBSD       | arm64        | ✅         |

### Install

Aliased 1-liner to the install scripts

* *nix users (including Windows users running WSL/msys2/mingw):
  * `curl -fsSL https://lin.get-pact.saf.dev | sh`
* Powershell (windows): `
  * `iwr -useb https://win.get-pact.saf.dev | iex`

Unix systems

```sh
curl -fsSL https://raw.githubusercontent.com/pact-foundation/pact-cli/main/install.sh | sh
```

```sh
wget -q https://raw.githubusercontent.com/pact-foundation/pact-cli/main/install.sh -O- | sh
```

install fixed version - pass `PACT_CLI_VERSION=v<PACT_CLI_VERSION>` eg `PACT_CLI_VERSION=v0.0.1` or set as an env var

```sh
curl -fsSL https://raw.githubusercontent.com/pact-foundation/pact-cli/main/install.sh | PACT_CLI_VERSION=v0.0.1 sh
```

```sh
wget -q https://raw.githubusercontent.com/pact-foundation/pact-cli/main/install.sh -O- | PACT_CLI_VERSION=v0.0.1 sh
```

Windows (Powershell)

```powershell
iwr -useb https://raw.githubusercontent.com/pact-foundation/pact-cli/main/install.ps1 | iex
```

To install a specific version, set the `PACT_CLI_VERSION` environment variable before running the script:

```powershell
$env:PACT_CLI_VERSION = "v0.0.1"
iwr -useb https://raw.githubusercontent.com/pact-foundation/pact-cli/main/install.ps1 | iex
```

### Standalone executable

Download the latest binary release for your required platform, from the [release](https://github.com/pact-foundation/pact-cli/releases) page.

### Cargo

```sh
cargo install pact --locked
```

To install a specific version using Cargo:

```sh
cargo install pact --locked --version <VERSION>
```

### GitHub Action

An action is available at `pact-foundation/pact-cli@<tag>`

Example

```yml
    - uses: pact-foundation/pact-cli@main
 
    - name: Show help commands
      run: |
        pact --help
```

### Docker

2 images are available

* alpine (default)
* debian

tags format

* `latest`
* `latest-alpine`
* `latest-debian`
* `<version>`
* `<version>-alpine`
* `<version>-debian`

## Commands

### All commands

```console
$ pact --help

**Pact** is the de-facto API contract testing tool. Replace expensive and brittle end-to-end integration tests with fast, reliable and easy to debug unit tests.

Check out https://docs.pact.io

- ⚡ Lightning fast
- 🎈 Effortless full-stack integration testing - from the front-end to the back-end
- 🔌 Supports HTTP/REST and event-driven systems
- 🛠️  Configurable mock server
- 😌 Powerful matching rules prevents brittle tests
- 🤝 Integrates with Pact Broker / PactFlow for powerful CI/CD workflows
- 🔡 Supports 12+ languages

**Why use Pact?**

Contract testing with Pact lets you:

- ⚡ Test locally
- 🚀 Deploy faster
- ⬇️  Reduce the lead time for change
- 💰 Reduce the cost of API integration testing
- 💥 Prevent breaking changes
- 🔎 Understand your system usage
- 📃 Document your APIs for free
- 🗄  Remove the need for complex data fixtures
- 🤷 Reduce the reliance on complex test environments
        

Usage: pact [OPTIONS] [COMMAND]

Commands:
  broker       A Rust and CLI client for the Pact Broker. Publish and retrieve pacts and verification results.
  pactflow     PactFlow specific commands
  completions  Generates completion scripts for your shell
  extension    Manage Pact CLI extensions
  plugin       CLI utility for Pact plugins
  mock         Standalone Pact mock server
  verifier     Standalone pact verifier for provider pact verification
  stub         Pact Stub Server 0.7.0
  help         Print this message or the help of the given subcommand(s)

Options:
      --enable-otel
          Enable OpenTelemetry tracing

      --enable-otel-logs
          Enable OpenTelemetry logging

      --enable-otel-traces
          Enable OpenTelemetry traces

      --otel-exporter <otel-exporter>
          The OpenTelemetry exporter(s) to use, comma separated (stdout, otlp)
          
          [env: OTEL_TRACES_EXPORTER=]

      --otel-exporter-endpoint <otel-exporter-endpoint>
          The endpoint to use for the OTLP exporter (required if --otel-exporter=otlp)
          
          [env: OTEL_EXPORTER_OTLP_ENDPOINT=]

      --otel-exporter-protocol <otel-exporter-protocol>
          The protocol to use for the OTLP exporter (http/protobuf, http)
          
          [env: OTEL_EXPORTER_OTLP_PROTOCOL=]
          [default: http]
          [possible values: http, http/protobuf]

      --log-level <LEVEL>
          Set the log level (none, off, error, warn, info, debug, trace)
          
          [default: off]
          [possible values: off, none, error, warn, info, debug, trace]

  -h, --help
          Print help (see a summary with '-h')

```

### `broker`

```console
$ pact broker --help
A Rust and CLI client for the Pact Broker. Publish and retrieve pacts and verification results.

Usage: pact broker [OPTIONS] [COMMAND]

Commands:
  publish                       Publishes pacts to the Pact Broker
  list-latest-pact-versions     List the latest pact for each integration
  get-pacts                     Get pacts for a specified provider, optionally filtered by consumer and/or branch
  create-environment            Create an environment resource in the Pact Broker to represent a real world deployment or release environment
  update-environment            Update an environment resource in the Pact Broker
  delete-environment            Delete an environment
  describe-environment          Describe an environment
  list-environments             List environments
  record-deployment             Record deployment of a pacticipant version to an environment
  record-undeployment           Record undeployment of a pacticipant version from an environment
  record-release                Record release of a pacticipant version to an environment.
  record-support-ended          Record the end of support for a pacticipant version in an environment.
  can-i-deploy                  Check if a pacticipant can be deployed.
  can-i-merge                   Checks if the specified pacticipant version is compatible with the configured main branch of each of the pacticipants with which it is integrated.
  create-or-update-pacticipant  Create or update pacticipant by name
  describe-pacticipant          Describe a pacticipant
  list-pacticipants             List pacticipants
  create-webhook                Create a webhook
  create-or-update-webhook      Create or update a webhook
  delete-webhook                Delete a webhook
  test-webhook                  Test a webhook
  delete-branch                 Deletes a pacticipant branch. Does not delete the versions or pacts/verifications associated with the branch, but does make the pacts inaccessible for verification via consumer versions selectors or WIP pacts.
  create-version-tag            Add a tag to a pacticipant version
  delete-version-tag            Delete a tag from a pacticipant version
  describe-version              Describes a pacticipant version. If no version or tag is specified, the latest version is described. Use --environment to query versions deployed/released to specific environments.
  create-or-update-version      Create or update pacticipant version by version number
  generate-uuid                 Generate a UUID for use when calling create-or-update-webhook
  provider-states               Manage provider states
  ruby                          Install & Run the Pact Broker using system Ruby in $HOME/.pact/pact-broker
  docker                        Run the Pact Broker as a Docker container
  help                          Print this message or the help of the given subcommand(s)

Options:
      --enable-otel
          Enable OpenTelemetry tracing
  -o, --output <OUTPUT>
          Value must be one of ["json", "text", "table", "pretty"] [default: text] [possible values: json, text, table, pretty]
      --enable-otel-logs
          Enable OpenTelemetry logging
      --enable-otel-traces
          Enable OpenTelemetry traces
      --otel-exporter <otel-exporter>
          The OpenTelemetry exporter(s) to use, comma separated (stdout, otlp) [env: OTEL_TRACES_EXPORTER=]
      --otel-exporter-endpoint <otel-exporter-endpoint>
          The endpoint to use for the OTLP exporter (required if --otel-exporter=otlp) [env: OTEL_EXPORTER_OTLP_ENDPOINT=]
      --otel-exporter-protocol <otel-exporter-protocol>
          The protocol to use for the OTLP exporter (http/protobuf, http) [env: OTEL_EXPORTER_OTLP_PROTOCOL=] [default: http] [possible values: http, http/protobuf]
      --log-level <LEVEL>
          Set the log level (none, off, error, warn, info, debug, trace) [default: off] [possible values: off, none, error, warn, info, debug, trace]
  -h, --help
          Print help
  -V, --version
          Print version

```

### `pactflow`

```console
$ pact pactflow --help
PactFlow specific commands

Usage: pact pactflow [OPTIONS] [COMMAND]

Commands:
  publish-provider-contract  Publish provider contract to PactFlow
  help                       Print this message or the help of the given subcommand(s)

Options:
      --enable-otel
          Enable OpenTelemetry tracing
      --enable-otel-logs
          Enable OpenTelemetry logging
      --enable-otel-traces
          Enable OpenTelemetry traces
      --otel-exporter <otel-exporter>
          The OpenTelemetry exporter(s) to use, comma separated (stdout, otlp) [env: OTEL_TRACES_EXPORTER=]
      --otel-exporter-endpoint <otel-exporter-endpoint>
          The endpoint to use for the OTLP exporter (required if --otel-exporter=otlp) [env: OTEL_EXPORTER_OTLP_ENDPOINT=]
      --otel-exporter-protocol <otel-exporter-protocol>
          The protocol to use for the OTLP exporter (http/protobuf, http) [env: OTEL_EXPORTER_OTLP_PROTOCOL=] [default: http] [possible values: http, http/protobuf]
      --log-level <LEVEL>
          Set the log level (none, off, error, warn, info, debug, trace) [default: off] [possible values: off, none, error, warn, info, debug, trace]
  -h, --help
          Print help

```

### `plugin`

```console
$ pact plugin --help
CLI utility for Pact plugins

Usage: pact plugin [OPTIONS] <COMMAND>

Commands:
  list        List installed or available plugins
  env         Print out the Pact plugin environment config
  install     Install a plugin
  remove      Remove a plugin
  enable      Enable a plugin version
  disable     Disable a plugin version
  repository  Sub-commands for dealing with a plugin repository
  help        Print this message or the help of the given subcommand(s)

Options:
      --enable-otel
          Enable OpenTelemetry tracing
  -y, --yes
          Automatically answer Yes for all prompts
  -d, --debug
          Enable debug level logs
      --enable-otel-logs
          Enable OpenTelemetry logging
      --enable-otel-traces
          Enable OpenTelemetry traces
  -t, --trace
          Enable trace level logs
      --otel-exporter <otel-exporter>
          The OpenTelemetry exporter(s) to use, comma separated (stdout, otlp) [env: OTEL_TRACES_EXPORTER=]
      --otel-exporter-endpoint <otel-exporter-endpoint>
          The endpoint to use for the OTLP exporter (required if --otel-exporter=otlp) [env: OTEL_EXPORTER_OTLP_ENDPOINT=]
      --otel-exporter-protocol <otel-exporter-protocol>
          The protocol to use for the OTLP exporter (http/protobuf, http) [env: OTEL_EXPORTER_OTLP_PROTOCOL=] [default: http] [possible values: http, http/protobuf]
      --log-level <LEVEL>
          Set the log level (none, off, error, warn, info, debug, trace) [default: off] [possible values: off, none, error, warn, info, debug, trace]
  -v, --version
          Print CLI version
  -h, --help
          Print help

```

### `mock`

```console
$ pact mock --help
Standalone Pact mock server

Usage: pact mock [OPTIONS] [COMMAND]

Commands:
  start            Starts the master mock server
  list             Lists all the running mock servers
  create           Creates a new mock server from a pact file
  verify           Verify the mock server by id or port number, and generate a pact file if all ok
  shutdown         Shutdown the mock server by id or port number, releasing all its resources
  shutdown-master  Performs a graceful shutdown of the master server (displayed when it started)
  help             Print this message or the help of the given subcommand(s)

Options:
      --enable-otel
          Enable OpenTelemetry tracing
      --help
          Print help and exit
      --enable-otel-logs
          Enable OpenTelemetry logging
  -v, --version
          Print version information and exit
      --enable-otel-traces
          Enable OpenTelemetry traces
  -p, --port <port>
          port the master mock server runs on (defaults to 8080)
  -h, --host <host>
          hostname the master mock server runs on (defaults to localhost)
      --otel-exporter <otel-exporter>
          The OpenTelemetry exporter(s) to use, comma separated (stdout, otlp) [env: OTEL_TRACES_EXPORTER=]
  -l, --loglevel <loglevel>
          Log level for mock servers to write to the log file (defaults to info) [possible values: error, warn, info, debug, trace, none]
      --otel-exporter-endpoint <otel-exporter-endpoint>
          The endpoint to use for the OTLP exporter (required if --otel-exporter=otlp) [env: OTEL_EXPORTER_OTLP_ENDPOINT=]
      --no-term-log
          Turns off using terminal ANSI escape codes
      --otel-exporter-protocol <otel-exporter-protocol>
          The protocol to use for the OTLP exporter (http/protobuf, http) [env: OTEL_EXPORTER_OTLP_PROTOCOL=] [default: http] [possible values: http, http/protobuf]
      --no-file-log
          Do not log to an output file
      --log-level <LEVEL>
          Set the log level (none, off, error, warn, info, debug, trace) [default: off] [possible values: off, none, error, warn, info, debug, trace]

```

### `verifier`

```console
$ pact verifier --help
Standalone pact verifier for provider pact verification

Usage: pact verifier [OPTIONS]

Options:
      --enable-otel
          Enable OpenTelemetry tracing
      --help
          Print help and exit
      --enable-otel-logs
          Enable OpenTelemetry logging
  -v, --version
          Print version information and exit
      --enable-otel-traces
          Enable OpenTelemetry traces
      --otel-exporter <otel-exporter>
          The OpenTelemetry exporter(s) to use, comma separated (stdout, otlp) [env: OTEL_TRACES_EXPORTER=]
      --otel-exporter-endpoint <otel-exporter-endpoint>
          The endpoint to use for the OTLP exporter (required if --otel-exporter=otlp) [env: OTEL_EXPORTER_OTLP_ENDPOINT=]
      --otel-exporter-protocol <otel-exporter-protocol>
          The protocol to use for the OTLP exporter (http/protobuf, http) [env: OTEL_EXPORTER_OTLP_PROTOCOL=] [default: http] [possible values: http, http/protobuf]
      --log-level <LEVEL>
          Set the log level (none, off, error, warn, info, debug, trace) [default: off] [possible values: off, none, error, warn, info, debug, trace]

Logging options:
  -l, --loglevel <loglevel>  Log level to emit log events at (defaults to warn) [possible values: error, warn, info, debug, trace, none]
      --pretty-log           Emits excessively pretty, multi-line logs, optimized for human readability.
      --full-log             This emits human-readable, single-line logs for each event that occurs, with the current span context displayed before the formatted representation of the event.
      --compact-log          Emit logs optimized for short line lengths.
  -j, --json <json-file>     Generate a JSON report of the verification [env: PACT_VERIFIER_JSON_REPORT=]
  -x, --junit <junit-file>   Generate a JUnit XML report of the verification (requires the junit feature) [env: PACT_VERIFIER_JUNIT_REPORT=]
      --no-colour            Disables ANSI escape codes in the output [aliases: --no-color]

Loading pacts options:
  -f, --file <file>
          Pact file to verify (can be repeated)
  -d, --dir <dir>
          Directory of pact files to verify (can be repeated)
  -u, --url <url>
          URL of pact file to verify (can be repeated)
  -b, --broker-url <broker-url>
          URL of the pact broker to fetch pacts from to verify (requires the provider name parameter) [env: PACT_BROKER_BASE_URL=]
      --webhook-callback-url <webhook-callback-url>
          URL of a Pact to verify via a webhook callback. Requires the broker-url to be set. [env: PACT_WEBHOOK_CALLBACK_URL=]
      --ignore-no-pacts-error
          Do not fail if no pacts are found to verify

Authentication options:
      --user <user>          Username to use when fetching pacts from URLS [env: PACT_BROKER_USERNAME=]
      --password <password>  Password to use when fetching pacts from URLS [env: PACT_BROKER_PASSWORD=]
  -t, --token <token>        Bearer token to use when fetching pacts from URLS [env: PACT_BROKER_TOKEN=]

Provider options:
  -h, --hostname <hostname>
          Provider hostname (defaults to localhost) [env: PACT_PROVIDER_HOSTNAME=]
  -p, --port <port>
          Provider port (defaults to protocol default 80/443) [env: PACT_PROVIDER_PORT=]
      --transport <transport>
          Provider protocol transport to use (http, https, grpc, etc.) [env: PACT_PROVIDER_TRANSPORT=] [default: http]
      --transports <transports>
          Allows multiple protocol transports to be configured (http, https, grpc, etc.) with their associated port numbers separated by a colon. For example, use --transports http:8080 grpc:5555 to configure both.
  -n, --provider-name <provider-name>
          Provider name (defaults to provider) [env: PACT_PROVIDER_NAME=]
      --base-path <base-path>
          Base path to add to all requests [env: PACT_PROVIDER_BASE_PATH=]
      --request-timeout <request-timeout>
          Sets the HTTP request timeout in milliseconds for requests to the target API and for state change requests. [env: PACT_PROVIDER_REQUEST_TIMEOUT=]
  -H, --header <custom-header>
          Add a custom header to be included in the calls to the provider. Values must be in the form KEY=VALUE, where KEY and VALUE contain ASCII characters (32-127) only. Can be repeated.
      --disable-ssl-verification
          Disables validation of SSL certificates

Provider state options:
  -s, --state-change-url <state-change-url>
          URL to post state change requests to [env: PACT_PROVIDER_STATE_CHANGE_URL=]
      --state-change-as-query
          State change request data will be sent as query parameters instead of in the request body [env: PACT_PROVIDER_STATE_CHANGE_AS_QUERY=]
      --state-change-teardown
          State change teardown requests are to be made after each interaction [env: PACT_PROVIDER_STATE_CHANGE_TEARDOWN=]

Filtering interactions:
      --filter-description <filter-description>
          Only validate interactions whose descriptions match this filter (regex format) [env: PACT_DESCRIPTION=]
      --filter-state <filter-state>
          Only validate interactions whose provider states match this filter (regex format) [env: PACT_PROVIDER_STATE=]
      --filter-no-state
          Only validate interactions that have no defined provider state [env: PACT_PROVIDER_NO_STATE=]
  -c, --filter-consumer <filter-consumer>
          Consumer name to filter the pacts to be verified (can be repeated)

Publishing options:
      --publish
          Enables publishing of verification results back to the Pact Broker. Requires the broker-url and provider-version parameters.
      --provider-version <provider-version>
          Provider version that is being verified. This is required when publishing results.
      --build-url <build-url>
          URL of the build to associate with the published verification results.
      --provider-tags <provider-tags>
          Provider tags to use when publishing results. Accepts comma-separated values.
      --provider-branch <provider-branch>
          Provider branch to use when publishing results

Pact Broker options:
      --consumer-version-tags <consumer-version-tags>
          Consumer tags to use when fetching pacts from the Broker. Accepts comma-separated values.
      --consumer-version-selectors <consumer-version-selectors>
          Consumer version selectors to use when fetching pacts from the Broker. Accepts a JSON string as per https://docs.pact.io/pact_broker/advanced_topics/consumer_version_selectors/. Can be repeated.
      --enable-pending
          Enables Pending Pacts
      --include-wip-pacts-since <include-wip-pacts-since>
          Allow pacts that don't match given consumer selectors (or tags) to  be verified, without causing the overall task to fail. For more information, see https://pact.io/wip

Development options:
      --exit-on-first-error  Stops the verifier at the first failure
      --last-failed          Only runs the interactions that failed on the previous verifier run. Requires --json-file to have been set

```

### `stub`

```console
$ pact stub --help
Pact Stub Server 0.7.0

Usage: pact stub [OPTIONS]

Options:
      --enable-otel
          Enable OpenTelemetry tracing
  -l, --loglevel <loglevel>
          Log level (defaults to info) [default: info] [possible values: error, warn, info, debug, trace, none]
      --enable-otel-logs
          Enable OpenTelemetry logging
  -f, --file <file>
          Pact file to load (can be repeated)
  -d, --dir <dir>
          Directory of pact files to load (can be repeated)
      --enable-otel-traces
          Enable OpenTelemetry traces
  -e, --extension <ext>
          File extension to use when loading from a directory (default is json)
      --otel-exporter <otel-exporter>
          The OpenTelemetry exporter(s) to use, comma separated (stdout, otlp) [env: OTEL_TRACES_EXPORTER=]
      --otel-exporter-endpoint <otel-exporter-endpoint>
          The endpoint to use for the OTLP exporter (required if --otel-exporter=otlp) [env: OTEL_EXPORTER_OTLP_ENDPOINT=]
  -u, --url <url>
          URL of pact file to fetch (can be repeated)
  -b, --broker-url <broker-url>
          URL of the pact broker to fetch pacts from [env: PACT_BROKER_BASE_URL=]
      --otel-exporter-protocol <otel-exporter-protocol>
          The protocol to use for the OTLP exporter (http/protobuf, http) [env: OTEL_EXPORTER_OTLP_PROTOCOL=] [default: http] [possible values: http, http/protobuf]
      --user <user>
          User and password to use when fetching pacts from URLS or Pact Broker in user:password form
      --log-level <LEVEL>
          Set the log level (none, off, error, warn, info, debug, trace) [default: off] [possible values: off, none, error, warn, info, debug, trace]
  -t, --token <token>
          Bearer token to use when fetching pacts from URLS or Pact Broker
  -p, --port <port>
          Port to run on (defaults to random port assigned by the OS)
  -o, --cors
          Automatically respond to OPTIONS requests and return default CORS headers
      --cors-referer
          Set the CORS Access-Control-Allow-Origin header to the Referer
      --insecure-tls
          Disables TLS certificate validation
  -s, --provider-state <provider-state>
          Provider state regular expression to filter the responses by
      --provider-state-header-name <provider-state-header-name>
          Name of the header parameter containing the provider state to be used in case multiple matching interactions are found
      --empty-provider-state
          Include empty provider states when filtering with --provider-state
      --consumer-name <consumer-name>
          Consumer name or regex to use to filter the Pacts fetched from the Pact broker (can be repeated)
      --provider-name <provider-name>
          Provider name or regex to use to filter the Pacts fetched from the Pact broker (can be repeated)
  -w, --watch
          Watch for changes in pact files and reload automatically
  -v, --version
          Print version information
  -h, --help
          Print help

```

## Open Telemetry

The `pact` cli supports native opentelemetry for traces and application logs.

It is opt-in via `--enable-otel`, you must set
    - `--enable-otel-traces` for traces
    - `--enable-otel-logs` for logs
        - `--log-level` must be set
    - `--enable-otlp-exporter` must be set

By default, `--otel-exporter-endpoint` will route to `http://localhost:4318`.

```sh
Options:
      --enable-otel
          Enable OpenTelemetry tracing
      --enable-otel-logs
          Enable OpenTelemetry logging
      --enable-otel-traces
          Enable OpenTelemetry traces
      --otel-exporter <otel-exporter>
          The OpenTelemetry exporter(s) to use, comma separated (stdout, otlp) [env: OTEL_TRACES_EXPORTER=]
      --otel-exporter-endpoint <otel-exporter-endpoint>
          The endpoint to use for the OTLP exporter (required if --otel-exporter=otlp) [env: OTEL_EXPORTER_OTLP_ENDPOINT=]
      --otel-exporter-protocol <otel-exporter-protocol>
          The protocol to use for the OTLP exporter (http/protobuf, grpc) [env: OTEL_EXPORTER_OTLP_PROTOCOL=] [default: http] [possible values: http, http/protobuf, grpc]
      --log-level <LEVEL>
          Set the log level (none, off, error, warn, info, debug, trace) [default: off] [possible values: off, none, error, warn, info, debug, trace]
```

Standard otel environemnt variables are followed

```sh
export OTEL_EXPORTER_OTLP_ENDPOINT="http://localhost:4318"
export OTEL_TRACES_EXPORTER="otlp"
export OTEL_EXPORTER_OTLP_PROTOCOL="http/protobuf"
```

Currently instrumented crates are

* pact-broker-cli
* pact-cli

## Ecosystem

The ecosystem is built up of multiple different crates, each which serve a different purpose.

All active crates are listed below.

### Core

[`pact_models`](https://github.com/pact-foundation/pact-reference/tree/master/rust/pact_models)
This is a library that provides the Pact models and functions for reading and writing pact files.

[`pact_matching`](https://github.com/pact-foundation/pact-reference/tree/master/rust/pact_matching)
This is a library that provides the Pact functions for matching requests and responses.

[`pact_mock_server`](https://github.com/pact-foundation/pact-core-mock-server/pact_mock_server)
This is a library that implements the in-process mock server for matching HTTP requests and generating responses from a pact file. It implements the [V3 Pact specification](https://github.com/pact-foundation/pact-specification/tree/version-3) and [V4 Pact specification](https://github.com/pact-foundation/pact-specification/tree/version-4)

### Library Consumers

[`pact_consumer`](https://github.com/pact-foundation/pact-reference/tree/master/rust/pact_consumer)
This is a library that provides the Pact consumer test support and DSL for use in Rust projects.

[`pact_verifier`](https://github.com/pact-foundation/pact-reference/tree/master/rust/pact_verifier)
This library provides support for verifying a provider against pact files.

### External Consumers

#### FFI

[`pact_ffi`](https://github.com/pact-foundation/pact-reference/tree/master/rust/pact_ffi)
This is a library that implements exported functions using C bindings for use in foreign languages.

#### CLI

[`pact_mock_server_cli`](https://github.com/pact-foundation/pact-core-mock-server/pact_mock_server_cli)
A command line application that provides both a restful web api and command line interface to run pact mock servers and is able to manage multiple mock servers. The lifecycle of each mock server can be controlled by the restful web api or through the command line interface. It implements the [V4 Pact specification](https://github.com/pact-foundation/pact-specification/tree/version-4).

[`pact_verifier_cli`](https://github.com/pact-foundation/pact-reference/tree/master/rust/pact_verifier_cli)
Command line executable that uses the [pact_verifier](https://github.com/pact-foundation/pact-reference/tree/master/rust/pact_verifier) to be able to verify a running provider against pact files.

### Plugins

[`pact-plugin-driver`](https://github.com/pact-foundation/pact-plugins/tree/main/drivers/rust/driver)
A support library that provides an interface for interacting with Pact plugins

[`pact-plugin-cli`](https://github.com/pact-foundation/pact-plugins/tree/main/cli)
Command line executable to manage and install Pact plugins.

### Satellite

[`pact-stub-server`](https://github.com/pact-foundation/pact-stub-server)
Command line executable that provides a server that can generate responses based on pact files. It implements the [V4 Pact specification](https://github.com/pact-foundation/pact-specification/tree/version-4).

## Contributing

See [CONTRIBUTING](https://github.com/pact-foundation/pact-cli/tree/main/CONTRIBUTING.md) (PRs are always welcome!).

## Documentation

Rust crate documentation is published to the Rust documentation site.

* [pact_matching](https://docs.rs/pact_matching/)
* [pact_models](https://docs.rs/pact_models/)
* [pact_mock_server](https://docs.rs/pact_mock_server)
* [pact_consumer](https://docs.rs/pact_consumer/)
* [pact_verifier](https://docs.rs/pact_verifier/)
* [pact_ffi](https://docs.rs/pact_ffi/)
* [pact_mock_server_cli](https://docs.rs/pact_mock_server_cli)
* [pact_verifier_cli](https://docs.rs/pact_verifier_cli/)
* [pact-plugin-driver](https://docs.rs/pact-plugin-driver)
* [pact-plugin-cli](https://docs.rs/pact-plugin-cli)
* [pact-broker-cli](https://docs.rs/pact-broker-cli)
* [pact-stub-server](https://docs.rs/pact-stub-server)

Additional documentation can be found at the main [Pact website](https://pact.io/).

Contact

Join us in slack: slack

or

* Twitter: @pact_up
* Stack Overflow: stackoverflow.com/questions/tagged/pact

## Licensing

The code in this project is licensed under a MIT license. See [LICENSE](https://github.com/pact-foundation/pact-cli/tree/main/LICENSE).
