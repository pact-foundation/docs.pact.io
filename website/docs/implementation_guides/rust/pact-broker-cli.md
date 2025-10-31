---
title: Pact Broker Client
custom_edit_url: https://github.com/pact-foundation/pact-broker-cli/edit/main/README.md
---
<!-- This file has been synced from the pact-foundation/pact-broker-cli repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

A client for the [Pact Broker](https://docs.pact.io/pact_broker/) and [PactFlow](https://pactflow.io/?utm_source=ossdocs&utm_campaign=pact-broker-client_readme) application.

Publishes and retrieves pacts, pacticipants, pacticipant versions, environments, deployments and releases. Supports publishing provider contracts for PactFlow. The functionality is available via a CLI.

It is designed as a replacement for the [pact_broker-client](https://github.com/pact-foundation/pact_broker-client) application, written in Ruby.

![Build status](https://github.com/pact-foundation/pact_broker-client/workflows/Test/badge.svg)

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

### Install Scripts

Unix systems

```sh
curl -fsSL https://raw.githubusercontent.com/pact-foundation/pact-broker-cli/main/install.sh | sh
```

```sh
wget -q https://raw.githubusercontent.com/pact-foundation/pact-broker-cli/main/install.sh -O- | sh
```

install fixed version - pass `PACT_BROKER_CLI_VERSION=v<PACT_BROKER_CLI_VERSION>` eg `PACT_BROKER_CLI_VERSION=v0.0.1` or set as an env var

```sh
curl -fsSL https://raw.githubusercontent.com/pact-foundation/pact-broker-cli/main/install.sh | PACT_BROKER_CLI_VERSION=v0.0.1 sh
```

```sh
wget -q https://raw.githubusercontent.com/pact-foundation/pact-broker-cli/main/install.sh -O- | PACT_BROKER_CLI_VERSION=v0.0.1 sh
```

Windows (Powershell)

```powershell
iwr -useb https://raw.githubusercontent.com/pact-foundation/pact-broker-cli/main/install.ps1 | iex
```

To install a specific version, set the `PACT_BROKER_CLI_VERSION` environment variable before running the script:

```powershell
$env:PACT_BROKER_CLI_VERSION = "v0.0.1"
iwr -useb https://raw.githubusercontent.com/pact-foundation/pact-broker-cli/main/install.ps1 | iex
```

### Standalone executable

Download the latest binary release for your required platform, from the [release](https://github.com/pact-foundation/pact-broker-cli/releases) page.

### Cargo

```sh
cargo install pact-broker-cli --locked
```

To install a specific version using Cargo:

```sh
cargo install pact-broker-cli --locked --version <VERSION>
```

### GitHub Action

An action is available at `pact-foundation/pact-broker-cli@<tag>`

Example

```yml
    - uses: pact-foundation/pact-broker-cli@main
 
    - name: Show help commands
      run: |
        pact-broker-cli --help
        pact-broker-cli pactflow --help
```

### Docker

2 images are available

- alpine (default)
- debian

tags format

- `latest`
- `latest-alpine`
- `latest-debian`
- `<version>`
- `<version>-alpine`
- `<version>-debian`

#### DockerHub

https://hub.docker.com/r/pactfoundation/pact-broker-cli

#### GitHub Container Registry

https://github.com/pact-foundation/pact-broker-cli/pkgs/container/pact-broker-cli

## Commands

All commands can be used with the OSS Pact Broker and PactFlow with exception to `pactflow` subcommands which can only be used with PactFlow.

The Pact Broker base URL can be specified either using the environment variable `$PACT_BROKER_BASE_URL` or the `-b` or `--broker-base-url` parameters.

Pact Broker authentication can be performed either using basic auth or a bearer token.

Basic auth parameters can be specified using the `$PACT_BROKER_USERNAME` and `$PACT_BROKER_PASSWORD` environment variables, or the `-u` or `--broker-username` and `-p` or `--broker-password` parameters.

Authentication using a bearer token can be specified using the environment variable `$PACT_BROKER_TOKEN` or the `-k` or `--broker-token` parameters. This bearer token authentication is used by [PactFlow](https://pactflow.io) and is not available in the [OSS Pact Broker](https://docs.pact.io/pact_broker/), which only supports basic auth.

### Pacts

#### publish

```console
$ pact-broker-cli publish --help
Publishes pacts to the Pact Broker

Usage: pact-broker-cli publish [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL> <PACT_FILES_DIRS_OR_GLOBS>...

Arguments:
  <PACT_FILES_DIRS_OR_GLOBS>...
          
          Glob pattern to match pact files to publish
          
          ?      matches any single character.
          *      matches any (possibly empty) sequence of characters.
          **     matches the current directory and arbitrary subdirectories. This sequence must form
                   a single path component, so both **a and b** are invalid and will result in an
                   error. A sequence of more than two consecutive * characters is also invalid.
          [...]  matches any character inside the brackets. Character sequences can also specify
                   ranges of characters, as ordered by Unicode, so e.g. [0-9] specifies any character
                   between 0 and 9 inclusive. An unclosed bracket is invalid.
          [!...] is the negation of [...], i.e. it matches any characters not in the brackets.
          
          The metacharacters ?, *, [, ] can be matched by using brackets (e.g. [?]). When a ]
          occurs immediately following [ or [! then it is interpreted as being part of, rather
          then ending, the character set, so ] and NOT ] can be matched by []] and [!]] respectively.
          The - character can be specified inside a character sequence pattern by placing it at
          the start or the end, e.g. [abc-].
          
          See https://docs.rs/glob/0.3.0/glob/struct.Pattern.html

Options:
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker
          
          [env: PACT_BROKER_BASE_URL=]

  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username
          
          [env: PACT_BROKER_USERNAME=]

  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password
          
          [env: PACT_BROKER_PASSWORD=]

  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token
          
          [env: PACT_BROKER_TOKEN=]

      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)

      --validate
          Validate the Pact files before publishing.

      --strict
          Require strict validation.

  -a, --consumer-app-version <consumer-app-version>
          The consumer application version

      --branch <branch>
          Repository branch of the consumer version

  -r, --auto-detect-version-properties
          Automatically detect the repository commit, branch and build URL from known CI environment variables or git CLI. Supports Buildkite, Circle CI, Travis CI, GitHub Actions, Jenkins, Hudson, AppVeyor, GitLab, CodeShip, Bitbucket and Azure DevOps.

  -t, --tag [<tag>...]
          Tag name for consumer version. Can be specified multiple times (delimiter ,).

      --tag-with-git-branch
          Tag consumer version with the name of the current git branch. Supports Buildkite, Circle CI, Travis CI, GitHub Actions, Jenkins, Hudson, AppVeyor, GitLab, CodeShip, Bitbucket and Azure DevOps.

      --build-url <build-url>
          The build URL that created the pact

      --merge
          If a pact already exists for this consumer version and provider, merge the contents. Useful when running Pact tests concurrently on different build nodes.

  -o, --output <OUTPUT>
          Value must be one of ["json", "text", "pretty"]
          
          [default: text]
          [possible values: json, text, pretty]

  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file
          
          [env: SSL_CERT_FILE=]

      --skip-ssl-verification
          Skip SSL certificate verification
          
          [env: SSL_SKIP_VERIFICATION=]

      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification
          
          [env: SSL_TRUST_STORE=]
          [default: true]
          [possible values: true, false]

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

Publish pacts to a Pact Broker.

#### list-latest-pact-versions

```console
$ pact-broker-cli list-latest-pact-versions --help
List the latest pact for each integration

Usage: pact-broker-cli list-latest-pact-versions [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL>

Options:
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
  -o, --output <OUTPUT>
          Value must be one of ["json", "table"] [default: table] [possible values: json, table]
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

List the latest pact for each integration

#### get-pacts

```console
$ pact-broker-cli get-pacts --help
Get pacts for a specified provider, optionally filtered by consumer and/or branch

Usage: pact-broker-cli get-pacts [OPTIONS] --provider <PROVIDER> --broker-base-url <PACT_BROKER_BASE_URL>

Options:
      --provider <PROVIDER>
          The name of the provider
      --consumer <CONSUMER>
          The name of the consumer (optional)
      --branch <BRANCH>
          The branch name (optional, defaults to main branch)
      --latest
          Get only the latest pact(s)
      --download
          Download the pact files to local directory
      --download-dir <DIR>
          Directory to download pact files to (defaults to ./pacts) [default: ./pacts]
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
  -o, --output <OUTPUT>
          Value must be one of ["json", "table"] [default: table] [possible values: json, table]
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

Retrieve pacts for a specified provider with optional filtering by consumer and/or branch. This command allows you to query pacts associated with a provider, providing flexibility to narrow down results based on specific consumers or branches.

Examples:

```sh
# Get all pacts for a provider
pact-broker-cli get-pacts --provider "My API" --broker-base-url http://localhost:9292

# Get pacts for a specific provider and consumer
pact-broker-cli get-pacts --provider "My API" --consumer "My App" --broker-base-url http://localhost:9292

# Get pacts for a provider from a specific branch
pact-broker-cli get-pacts --provider "My API" --branch "feature/new-endpoint" --broker-base-url http://localhost:9292

# Get only the latest pacts for a provider
pact-broker-cli get-pacts --provider "My API" --latest --broker-base-url http://localhost:9292

# Get pacts for a specific provider and consumer from a specific branch
pact-broker-cli get-pacts --provider "My API" --consumer "My App" --branch "develop" --broker-base-url http://localhost:9292

# Output in JSON format
pact-broker-cli get-pacts --provider "My API" --output json --broker-base-url http://localhost:9292
```

### Environments

#### create-environment

```console
$ pact-broker-cli create-environment --help
Create an environment resource in the Pact Broker to represent a real world deployment or release environment

Usage: pact-broker-cli create-environment [OPTIONS] --name <NAME> --broker-base-url <PACT_BROKER_BASE_URL>

Options:
      --name <NAME>
          The uniquely identifying name of the environment as used in deployment code
      --display-name <DISPLAY_NAME>
          The display name of the environment
      --production
          Whether or not this environment is a production environment. This is currently informational only.
      --contact-name <CONTACT_NAME>
          The name of the team/person responsible for this environment
      --contact-email-address <CONTACT_EMAIL_ADDRESS>
          The email address of the team/person responsible for this environment
  -o, --output <OUTPUT>
          Value must be one of ["json", "text", "id"] [default: text] [possible values: json, text, id]
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Create an environment resource in the Pact Broker to represent a real world deployment or release environment.

#### update-environment

```console
$ pact-broker-cli update-environment --help
Update an environment resource in the Pact Broker

Usage: pact-broker-cli update-environment [OPTIONS] --uuid <UUID> --broker-base-url <PACT_BROKER_BASE_URL>

Options:
      --uuid <UUID>
          The UUID of the environment to update
      --name <NAME>
          The uniquely identifying name of the environment as used in deployment code
      --display-name <DISPLAY_NAME>
          The display name of the environment
      --production
          Whether or not this environment is a production environment. This is currently informational only.
      --contact-name <CONTACT_NAME>
          The name of the team/person responsible for this environment
      --contact-email-address <CONTACT_EMAIL_ADDRESS>
          The email address of the team/person responsible for this environment
  -o, --output <OUTPUT>
          Value must be one of ["json", "text", "id"] [default: text] [possible values: json, text, id]
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Update an environment resource in the Pact Broker.

#### describe-environment

```console
$ pact-broker-cli describe-environment --help
Describe an environment

Usage: pact-broker-cli describe-environment [OPTIONS] --uuid <UUID> --broker-base-url <PACT_BROKER_BASE_URL>

Options:
      --uuid <UUID>
          The UUID of the environment to describe
  -o, --output <OUTPUT>
          Value must be one of ["json", "text"] [default: text] [possible values: json, text]
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Describe an environment

#### delete-environment

```console
$ pact-broker-cli delete-environment --help
Delete an environment

Usage: pact-broker-cli delete-environment [OPTIONS] --uuid <UUID> --broker-base-url <PACT_BROKER_BASE_URL>

Options:
      --uuid <UUID>
          The UUID of the environment to delete
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Delete an environment

#### list-environments

```console
$ pact-broker-cli list-environments --help
List environments

Usage: pact-broker-cli list-environments [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL>

Options:
  -o, --output <OUTPUT>
          Value must be one of ["json", "text", "pretty"] [default: text] [possible values: json, text, pretty]
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

List environments

### Deployments

#### record-deployment

```console
$ pact-broker-cli record-deployment --help
Record deployment of a pacticipant version to an environment

Usage: pact-broker-cli record-deployment [OPTIONS] --pacticipant <PACTICIPANT> --version <VERSION> --environment <ENVIRONMENT> --broker-base-url <PACT_BROKER_BASE_URL>

Options:
  -a, --pacticipant <PACTICIPANT>
          The name of the pacticipant that was deployed
  -e, --version <VERSION>
          The pacticipant version number that was deployed
      --environment <ENVIRONMENT>
          The name of the environment that the pacticipant version was deployed to
      --application-instance <APPLICATION_INSTANCE>
          Optional. The application instance to which the deployment has occurred - a logical identifer required to differentiate deployments when there are multiple instances of the same application in an environment. This field was called 'target' in a beta release
  -o, --output <OUTPUT>
          Value must be one of ["json", "text", "pretty"] [default: text] [possible values: json, text, pretty]
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Record deployment of a pacticipant version to an environment. See https://docs.pact.io/record-deployment for more information.

#### record-undeployment

```console
$ pact-broker-cli record-undeployment --help
Record undeployment of a pacticipant version from an environment.

Note that use of this command is only required if you are permanently removing an application instance from an environment. It is not required if you are deploying over a previous version, as record-deployment will automatically mark the previously deployed version as undeployed for you. See https://docs.pact.io/go/record-undeployment for more information.

Usage: pact-broker-cli record-undeployment [OPTIONS] --pacticipant <PACTICIPANT> --environment <ENVIRONMENT> --broker-base-url <PACT_BROKER_BASE_URL>

Options:
  -a, --pacticipant <PACTICIPANT>
          The name of the pacticipant that was undeployed

      --environment <ENVIRONMENT>
          The name of the environment that the pacticipant version was undeployed from

      --application-instance <APPLICATION_INSTANCE>
          Optional. The application instance from which the application is being undeployed - a logical identifer required to differentiate deployments when there are multiple instances of the same application in an environment. This field was called 'target' in a beta release

  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker
          
          [env: PACT_BROKER_BASE_URL=]

  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username
          
          [env: PACT_BROKER_USERNAME=]

  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password
          
          [env: PACT_BROKER_PASSWORD=]

  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token
          
          [env: PACT_BROKER_TOKEN=]

      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)

  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file
          
          [env: SSL_CERT_FILE=]

      --skip-ssl-verification
          Skip SSL certificate verification
          
          [env: SSL_SKIP_VERIFICATION=]

      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification
          
          [env: SSL_TRUST_STORE=]
          [default: true]
          [possible values: true, false]

  -o, --output <OUTPUT>
          Value must be one of ["json", "text", "pretty"]
          
          [default: text]
          [possible values: json, text, pretty]

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

Description:
  Note that use of this command is only required if you are permanently removing an application instance from an environment. It is not required if you are
  deploying over a previous version, as record-deployment will automatically mark the previously deployed version as undeployed for you. See
  https://docs.pact.io/record-undeployment for more information.

### Releases

#### record-release

```console
$ pact-broker-cli record-release --help
Record release of a pacticipant version to an environment.

Usage: pact-broker-cli record-release [OPTIONS] --pacticipant <PACTICIPANT> --version <VERSION> --environment <ENVIRONMENT> --broker-base-url <PACT_BROKER_BASE_URL>

Options:
  -a, --pacticipant <PACTICIPANT>
          The name of the pacticipant that was released.
  -e, --version <VERSION>
          The pacticipant version number that was released.
      --environment <ENVIRONMENT>
          The name of the environment that the pacticipant version was released to.
  -o, --output <OUTPUT>
          Value must be one of ["json", "text", "pretty"] [default: text] [possible values: json, text, pretty]
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Record release of a pacticipant version to an environment. See See https://docs.pact.io/record-release for more information.

#### record-support-ended

```console
$ pact-broker-cli record-support-ended --help
Record the end of support for a pacticipant version in an environment.

Usage: pact-broker-cli record-support-ended [OPTIONS] --pacticipant <PACTICIPANT> --version <VERSION> --environment <ENVIRONMENT> --broker-base-url <PACT_BROKER_BASE_URL>

Options:
  -a, --pacticipant <PACTICIPANT>
          The name of the pacticipant.
  -e, --version <VERSION>
          The pacticipant version number for which support is ended.
      --environment <ENVIRONMENT>
          The name of the environment in which the support is ended.
  -o, --output <OUTPUT>
          Value must be one of ["json", "text", "pretty"] [default: text] [possible values: json, text, pretty]
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Record the end of support for a pacticipant version in an environment. See https://docs.pact.io/record-support-ended for more information.

### Matrix

#### can-i-deploy

```console
$ pact-broker-cli can-i-deploy --help
    Check if a pacticipant can be deployed.

    Description:
    Returns exit code 0 or 1, indicating whether or not the specified application (pacticipant) has a successful verification result with
    each of the application versions that are already deployed to a particular environment. Prints out the relevant pact/verification
    details, indicating any missing or failed verification results.
  
    The can-i-deploy tool was originally written to support specifying versions and dependencies using tags. This usage has now been
    superseded by first class support for environments, deployments and releases. For documentation on how to use can-i-deploy with tags,
    please see https://docs.pact.io/pact_broker/client_cli/can_i_deploy_usage_with_tags/
  
    Before `can-i-deploy` can be used, the relevant environment resources must first be created in the Pact Broker using the
    `create-environment` command. The 'test' and 'production' environments will have been seeded for you. You can check the existing
    environments by running `pact-broker-cli list-environments`. See https://docs.pact.io/pact_broker/client_cli/readme#environments for more
    information.

    $ pact-broker-cli create-environment --name 'uat' --display-name 'UAT' --no-production

    After an application is deployed or released, its deployment must be recorded using the `record-deployment` or `record-release`
    commands. See https://docs.pact.io/pact_broker/recording_deployments_and_releases/ for more information.
  
    $ pact-broker-cli record-deployment --pacticipant Foo --version 173153ae0 --environment uat
  
    Before an application is deployed or released to an environment, the can-i-deploy command must be run to check that the application
    version is safe to deploy with the versions of each integrated application that are already in that environment.
  
    $ pact-broker-cli can-i-deploy --pacticipant PACTICIPANT --version VERSION --to-environment ENVIRONMENT
  
    Example: can I deploy version 173153ae0 of application Foo to the test environment?
  
    $ pact-broker-cli can-i-deploy --pacticipant Foo --version 173153ae0 --to-environment test
  
    Can-i-deploy can also be used to check if arbitrary versions have a successful verification. When asking 'Can I deploy this
    application version with the latest version from the main branch of another application' it functions as a 'can I merge' check.
  
    $ pact-broker-cli can-i-deploy --pacticipant Foo 173153ae0 // --pacticipant Bar --latest main
  
    ##### Polling
  
    If the verification process takes a long time and there are results missing when the can-i-deploy command runs in your CI/CD pipeline,
    you can configure the command to poll and wait for the missing results to arrive. The arguments to specify are `--retry-while-unknown
    TIMES` and `--retry-interval SECONDS`, set to appropriate values for your pipeline.
    

Usage: pact-broker-cli can-i-deploy [OPTIONS] --pacticipant <PACTICIPANT> --broker-base-url <PACT_BROKER_BASE_URL>

Options:
  -a, --pacticipant <PACTICIPANT>
          The pacticipant name. Use once for each pacticipant being checked. The following options (--version, --latest, --tag, --branch, --main-branch, --no-main-branch, --skip-main-branch) must come after each --pacticipant.

  -e, --version <VERSION>
          The pacticipant version. Must be entered after the --pacticipant that it relates to.

  -l, --latest [<TAG>]
          Use the latest pacticipant version. Optionally specify a TAG to use the latest version with the specified tag. Must be entered after the --pacticipant that it relates to.

      --tag <TAG>
          The tag of the version for which you want to check the verification results. Must be entered after the --pacticipant that it relates to.

      --branch <BRANCH>
          The branch of the version for which you want to check the verification results. Must be entered after the --pacticipant that it relates to.

      --main-branch
          Use the latest version of the configured main branch of the pacticipant as the version for which you want to check the verification results. Must be entered after the --pacticipant that it relates to.

      --no-main-branch <no-main-branch>
          Do not use the main branch of the pacticipant as the version for which you want to check the verification results. Must be entered after the --pacticipant that it relates to.

      --skip-main-branch <skip-main-branch>
          Skip the configured main branch of the pacticipant as the version for which you want to check the verification results. Must be entered after the --pacticipant that it relates to.

      --ignore <ignore>
          The pacticipant name to ignore. Use once for each pacticipant being ignored. A specific version can be ignored by also specifying a --version after the pacticipant name option. The environment variable PACT_BROKER_CAN_I_DEPLOY_IGNORE may also be used to specify a pacticipant name to ignore, with commas to separate multiple pacticipant names if necessary.

      --to-environment <ENVIRONMENT>
          The environment into which the pacticipant(s) are to be deployed

      --to <TO>
          The tag that represents the branch or environment of the integrated applications for which you want to check the verification result status.

  -o, --output <OUTPUT>
          Value must be one of ["json", "table"]
          
          [default: table]
          [possible values: json, table]

      --retry-while-unknown <TIMES>
          The number of times to retry while there is an unknown verification result (ie. the provider verification is likely still running)

      --retry-interval <SECONDS>
          The time between retries in seconds. Use in conjuction with --retry-while-unknown

      --dry-run
          When dry-run is enabled, always exit process with a success code. Can also be enabled by setting the environment variable PACT_BROKER_CAN_I_DEPLOY_DRY_RUN=true. This mode is useful when setting up your CI/CD pipeline for the first time, or in a 'break glass' situation where you need to knowingly deploy what Pact considers a breaking change. For the second scenario, it is recommended to use the environment variable and just set it for the build required to deploy that particular version, so you don't accidentally leave the dry run mode enabled.

  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker
          
          [env: PACT_BROKER_BASE_URL=]

  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username
          
          [env: PACT_BROKER_USERNAME=]

  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password
          
          [env: PACT_BROKER_PASSWORD=]

  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token
          
          [env: PACT_BROKER_TOKEN=]

      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)

  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file
          
          [env: SSL_CERT_FILE=]

      --skip-ssl-verification
          Skip SSL certificate verification
          
          [env: SSL_SKIP_VERIFICATION=]

      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification
          
          [env: SSL_TRUST_STORE=]
          [default: true]
          [possible values: true, false]

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

Description:
  Returns exit code 0 or 1, indicating whether or not the specified application (pacticipant) has a successful verification result with each of the application
  versions that are already deployed to a particular environment. Prints out the relevant pact/verification details, indicating any missing or failed
  verification results.

  The can-i-deploy tool was originally written to support specifying versions and dependencies using tags. This usage has now been superseded by first class
  support for environments, deployments and releases. For documentation on how to use can-i-deploy with tags, please see
  https://docs.pact.io/pact_broker/client_cli/can_i_deploy_usage_with_tags/

  Before `can-i-deploy` can be used, the relevant environment resources must first be created in the Pact Broker using the `create-environment` command. The
  "test" and "production" environments will have been seeded for you. You can check the existing environments by running `pact-broker list-environments`. See
  https://docs.pact.io/pact_broker/client_cli/readme#environments for more information.

`$ pact-broker-cli create-environment --name "uat" --display-name "UAT" --no-production`

  After an application is deployed or released, its deployment must be recorded using the `record-deployment` or `record-release` commands. See
  https://docs.pact.io/pact_broker/recording_deployments_and_releases/ for more information.

`$ pact-broker-cli record-deployment --pacticipant Foo --version 173153ae0 --environment uat`

  Before an application is deployed or released to an environment, the can-i-deploy command must be run to check that the application version is safe to deploy
  with the versions of each integrated application that are already in that environment.

`$ pact-broker-cli can-i-deploy --pacticipant PACTICIPANT --version VERSION --to-environment ENVIRONMENT`

  Example: can I deploy version 173153ae0 of application Foo to the test environment?

`$ pact-broker-cli can-i-deploy --pacticipant Foo --version 173153ae0 --to-environment test`

  Can-i-deploy can also be used to check if arbitrary versions have a successful verification. When asking "Can I deploy this application version with the
  latest version from the main branch of another application" it functions as a "can I merge" check.

`$ pact-broker-cli can-i-deploy --pacticipant Foo 173153ae0 \ --pacticipant Bar --latest main`

##### Polling

If the verification process takes a long time and there are results missing when the can-i-deploy command runs in your CI/CD pipeline, you can configure the
command to poll and wait for the missing results to arrive. The arguments to specify are `--retry-while-unknown TIMES` and `--retry-interval SECONDS`, set to
appropriate values for your pipeline.

#### can-i-merge

```console
$ pact-broker-cli can-i-merge --help
Checks if the specified pacticipant version is compatible with the configured main branch of each of the pacticipants with which it is integrated.

Usage: pact-broker-cli can-i-merge [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL> --pacticipant <PACTICIPANT>

Options:
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -a, --pacticipant <PACTICIPANT>
          The pacticipant name. Use once for each pacticipant being checked. The following options (--version, --latest, --tag, --branch) must come after each --pacticipant.
  -e, --version <VERSION>
          The pacticipant version. Must be entered after the --pacticipant that it relates to.
  -o, --output <OUTPUT>
          Value must be one of ["json", "table"] [default: table] [possible values: json, table]
      --retry-while-unknown <TIMES>
          The number of times to retry while there is an unknown verification result (ie. the provider verification is likely still running)
      --retry-interval <SECONDS>
          The time between retries in seconds. Use in conjuction with --retry-while-unknown
      --dry-run
          When dry-run is enabled, always exit process with a success code. Can also be enabled by setting the environment variable PACT_BROKER_CAN_I_DEPLOY_DRY_RUN=true. This mode is useful when setting up your CI/CD pipeline for the first time, or in a 'break glass' situation where you need to knowingly deploy what Pact considers a breaking change. For the second scenario, it is recommended to use the environment variable and just set it for the build required to deploy that particular version, so you don't accidentally leave the dry run mode enabled.
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Description:
  Checks if the specified pacticipant version is compatible with the configured main branch of each of the pacticipants with which it is integrated.

### Provider States

#### list

```console
$ pact-broker-cli provider-states list --help
This command retrieves a de-duplicated list of all provider states for a given provider.
Provider states are collected from the latest pact on the main branch for any dependent consumers,
or from a specified branch or environment.

Usage: pact-broker-cli provider-states list [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL> --provider <PROVIDER>

Options:
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker
          
          [env: PACT_BROKER_BASE_URL=]

  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username
          
          [env: PACT_BROKER_USERNAME=]

  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password
          
          [env: PACT_BROKER_PASSWORD=]

  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token
          
          [env: PACT_BROKER_TOKEN=]

      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)

  -r, --provider <PROVIDER>
          The name of the provider

      --branch <BRANCH>
          The branch name to get provider states from

      --environment <ENVIRONMENT>
          The environment name to get provider states from

      --json
          Output in JSON format

  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file
          
          [env: SSL_CERT_FILE=]

      --skip-ssl-verification
          Skip SSL certificate verification
          
          [env: SSL_SKIP_VERIFICATION=]

      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification
          
          [env: SSL_TRUST_STORE=]
          [default: true]
          [possible values: true, false]

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

List aggregated provider states for a provider. This command retrieves all unique provider states across consumer pacts for the specified provider. Provider states are used in contract testing to set up specific server-side conditions before running verification tests.

Examples:

```sh
# List all provider states for a provider from the main branch
pact-broker-cli provider-states list --broker-base-url http://localhost:9292 --provider "My API"

# List provider states from a specific branch
pact-broker-cli provider-states list --broker-base-url http://localhost:9292 --provider "My API" --branch "feature/new-endpoint"

# List provider states from a specific environment
pact-broker-cli provider-states list --broker-base-url http://localhost:9292 --provider "My API" --environment "test"

# Output in JSON format
pact-broker-cli provider-states list --broker-base-url http://localhost:9292 --provider "My API" --json
```

### Pacticipants

#### create-or-update-pacticipant

```console
$ pact-broker-cli create-or-update-pacticipant --help
Create or update pacticipant by name

Usage: pact-broker-cli create-or-update-pacticipant [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL> --name <NAME>

Options:
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
      --name <NAME>
          Pacticipant name
      --display-name <DISPLAY_NAME>
          Display name
      --main-branch <MAIN_BRANCH>
          The main development branch of the pacticipant repository
      --repository-url <REPOSITORY_URL>
          The repository URL of the pacticipant
  -o, --output <OUTPUT>
          Value must be one of ["json", "text"] [default: text] [possible values: json, text]
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Create or update pacticipant by name

#### describe-pacticipant

```console
$ pact-broker-cli describe-pacticipant --help
Describe a pacticipant

Usage: pact-broker-cli describe-pacticipant [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL> --name <NAME>

Options:
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
      --name <NAME>
          Pacticipant name
  -o, --output <OUTPUT>
          Value must be one of ["json", "text", "table"] [default: text] [possible values: json, text, table]
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Describe a pacticipant

#### list-pacticipants

```console
$ pact-broker-cli list-pacticipants --help
List pacticipants

Usage: pact-broker-cli list-pacticipants [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL>

Options:
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -o, --output <OUTPUT>
          Value must be one of ["json", "table"] [default: table] [possible values: json, table]
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

List pacticipants

### Webhooks

#### create-webhook

```console
$ pact-broker-cli create-webhook --help
Create a webhook

Usage: pact-broker-cli create-webhook [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL> <URL>

Arguments:
  <URL>  Webhook URL

Options:
  -X, --request <METHOD>
          Webhook HTTP method
  -H, --header [<one two three>]
          Webhook Header
  -d, --data <DATA>
          Webhook payload
      --user <USER>
          Webhook basic auth username and password eg. username:password
      --consumer <CONSUMER>
          Consumer name
      --consumer-label <CONSUMER_LABEL>
          Consumer label, mutually exclusive with consumer name
      --provider <PROVIDER>
          Provider name
      --provider-label <PROVIDER_LABEL>
          Provider label, mutually exclusive with provider name
      --description <DESCRIPTION>
          Webhook description
      --contract-content-changed
          Trigger this webhook when the pact content changes
      --contract-published
          Trigger this webhook when a pact is published
      --provider-verification-published
          Trigger this webhook when a provider verification result is published
      --provider-verification-failed
          Trigger this webhook when a failed provider verification result is published
      --provider-verification-succeeded
          Trigger this webhook when a successful provider verification result is published
      --contract-requiring-verification-published
          Trigger this webhook when a contract is published that requires verification
      --team-uuid <UUID>
          UUID of the PactFlow team to which the webhook should be assigned (PactFlow only)
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Description:
  Create a curl command that executes the request that you want your webhook to execute, then replace "curl" with "pact-broker create-webhook" and add the
  consumer, provider, event types and broker details. Note that the URL must be the first parameter when executing create-webhook.

  Note that the -u option from the curl command clashes with the -u option from the pact-broker CLI. When used in this command, the -u will be used as a curl
  option. Please use the --broker-username or environment variable for the Pact Broker username.

#### create-or-update-webhook

```console
$ pact-broker-cli create-or-update-webhook --help
Create or update a webhook

Usage: pact-broker-cli create-or-update-webhook [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL> --uuid <UUID> <URL>

Arguments:
  <URL>  Webhook URL

Options:
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
      --uuid <UUID>
          Specify the uuid for the webhook
  -X, --request <METHOD>
          Webhook HTTP method
  -H, --header [<one two three>]
          Webhook Header
  -d, --data <DATA>
          Webhook payload
      --user <USER>
          Webhook basic auth username and password eg. username:password
      --consumer <CONSUMER>
          Consumer name
      --consumer-label <CONSUMER_LABEL>
          Consumer label, mutually exclusive with consumer name
      --provider <PROVIDER>
          Provider name
      --provider-label <PROVIDER_LABEL>
          Provider label, mutually exclusive with provider name
      --description <DESCRIPTION>
          Webhook description
      --contract-content-changed
          Trigger this webhook when the pact content changes
      --contract-published
          Trigger this webhook when a pact is published
      --provider-verification-published
          Trigger this webhook when a provider verification result is published
      --provider-verification-failed
          Trigger this webhook when a failed provider verification result is published
      --provider-verification-succeeded
          Trigger this webhook when a successful provider verification result is published
      --contract-requiring-verification-published
          Trigger this webhook when a contract is published that requires verification
      --team-uuid <UUID>
          UUID of the PactFlow team to which the webhook should be assigned (PactFlow only)
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Description:
  Create a curl command that executes the request that you want your webhook to execute, then replace "curl" with "pact-broker create-or-update-webhook" and
  add the consumer, provider, event types and broker details. Note that the URL must be the first parameter when executing create-or-update-webhook and a uuid
  must also be provided. You can generate a valid UUID by using the `generate-uuid` command.

  Note that the -u option from the curl command clashes with the -u option from the pact-broker CLI. When used in this command, the -u will be used as a curl
  option. Please use the --broker-username or environment variable for the Pact Broker username.

#### test-webhook

```console
$ pact-broker-cli test-webhook --help
Test a webhook

Usage: pact-broker-cli test-webhook [OPTIONS] --uuid <UUID> --broker-base-url <PACT_BROKER_BASE_URL>

Options:
      --uuid <UUID>
          Specify the uuid for the webhook
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Test the execution of a webhook

#### delete-webhook

```console
$ pact-broker-cli delete-webhook --help
Delete a webhook

Usage: pact-broker-cli delete-webhook [OPTIONS] --uuid <UUID> --broker-base-url <PACT_BROKER_BASE_URL>

Options:
      --uuid <UUID>
          UUID of the webhook to delete
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Delete a webhook by its UUID. The command will not return an error if the webhook does not exist, but will print a message indicating whether or not it was found.

### Branches

#### delete-branch

```console
$ pact-broker-cli delete-branch --help
Deletes a pacticipant branch. Does not delete the versions or pacts/verifications associated with the branch, but does make the pacts inaccessible for verification via consumer versions selectors or WIP pacts.

Usage: pact-broker-cli delete-branch [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL> --branch <BRANCH> --pacticipant <PACTICIPANT>

Options:
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
      --branch <BRANCH>
          The pacticipant branch name
  -a, --pacticipant <PACTICIPANT>
          The name of the pacticipant that the branch belongs to
      --error-when-not-found <error-when-not-found>
          Raise an error if the branch that is to be deleted is not found [default: false] [possible values: true, false]
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Deletes a pacticipant branch. Does not delete the versions or pacts/verifications associated with the branch, but does make the pacts inaccessible for verification via consumer versions selectors or WIP pacts.

### Tags

#### create-version-tag

```console
$ pact-broker-cli create-version-tag --help
Add a tag to a pacticipant version

Usage: pact-broker-cli create-version-tag [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL> --pacticipant <PACTICIPANT> --version <VERSION> --tag <TAG>...

Options:
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -a, --pacticipant <PACTICIPANT>
          The pacticipant name
  -e, --version <VERSION>
          The pacticipant version
  -t, --tag <TAG>...
          Tag name for pacticipant version. Can be specified multiple times
      --auto-create-version
          Automatically create the pacticipant version if it does not exist
  -g, --tag-with-git-branch
          Tag pacticipant version with the name of the current git branch
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Add a tag to a pacticipant version

#### delete-version-tag

```console
$ pact-broker-cli delete-version-tag --help
Delete a tag from a pacticipant version

Usage: pact-broker-cli delete-version-tag [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL> --pacticipant <PACTICIPANT> --version <VERSION> --tag <TAG>

Options:
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -a, --pacticipant <PACTICIPANT>
          The pacticipant name
  -e, --version <VERSION>
          The pacticipant version
  -t, --tag <TAG>
          Tag name to delete from the pacticipant version
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Delete a tag from a pacticipant version. The command will not throw an error if the tag does not exist, but will print a message indicating whether or not it was found.

### Versions

#### describe-version

```console
$ pact-broker-cli describe-version --help
Describes a pacticipant version. If no version or tag is specified, the latest version is described. Use --environment to query versions deployed/released to specific environments.

Usage: pact-broker-cli describe-version [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL> --pacticipant <PACTICIPANT>

Options:
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -a, --pacticipant <PACTICIPANT>
          The name of the pacticipant that the version belongs to
  -e, --version <VERSION>
          The pacticipant version number
  -l, --latest [<TAG>]
          Describe the latest pacticipant version. Optionally specify a TAG to describe the latest version with the specified tag
      --environment <ENVIRONMENT>
          The environment name to describe versions deployed/released to. Returns all versions deployed or released to this environment
      --deployed
          Show only deployed versions (use with --environment)
      --released
          Show only released versions (use with --environment)
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
  -o, --output <OUTPUT>
          Value must be one of ["json", "table"] [default: table] [possible values: json, table]
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

Describes a pacticipant version. If no version or tag is specified, the latest version is described.

#### create-or-update-version

```console
$ pact-broker-cli create-or-update-version --help
Create or update pacticipant version by version number

Usage: pact-broker-cli create-or-update-version [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL> --pacticipant <PACTICIPANT> --version <VERSION>

Options:
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
  -a, --pacticipant <PACTICIPANT>
          The pacticipant name
  -e, --version <VERSION>
          The pacticipant version number
      --branch <BRANCH>
          The repository branch name
  -t, --tag [<TAG>]
          Tag name for pacticipant version. Can be specified multiple times
  -o, --output <OUTPUT>
          Value must be one of ["json", "text"] [default: text] [possible values: json, text]
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

Create or update pacticipant version by version number

### Miscellaneous

#### generate-uuid

```console
$ pact-broker-cli generate-uuid --help
Generate a UUID for use when calling create-or-update-webhook

Usage: pact-broker-cli generate-uuid [OPTIONS]

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

Generate a UUID for use when calling create-or-update-webhook

### Provider contracts (PactFlow only)

#### publish-provider-contract

```console
$ pact-broker-cli pactflow publish-provider-contract --help
Publish provider contract to PactFlow

Usage: pact-broker-cli pactflow publish-provider-contract [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL> --provider <PROVIDER> <CONTRACT_FILE>

Arguments:
  <CONTRACT_FILE>  The contract file to publish

Options:
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --custom-header <HEADER>
          Custom header(s) to send with requests (format: 'Header-Name: Value', can be used multiple times)
      --provider <PROVIDER>
          The provider name
  -a, --provider-app-version <PROVIDER_APP_VERSION>
          The provider application version
      --branch <BRANCH>
          Repository branch of the provider version
  -t, --tag [<tag>...]
          Tag name for provider version. Can be specified multiple times (delimiter ,).
      --specification <SPECIFICATION>
          The contract specification [default: oas]
      --content-type <CONTENT_TYPE>
          The content type. eg. application/yml
      --verification-success
          Whether or not the self verification passed successfully.
      --no-verification-success
          Whether or not the self verification failed.
      --verification-exit-code <N>
          The exit code of the verification process. Can be used instead of --verification-success|--no-verification-success for a simpler build script.
      --verification-results <VERIFICATION_RESULTS>
          The path to the file containing the output from the verification process
      --verification-results-content-type <VERIFICATION_RESULTS_CONTENT_TYPE>
          The content type of the verification output eg. text/plain, application/yaml
      --verification-results-format <VERIFICATION_RESULTS_FORMAT>
          The format of the verification output eg. junit, text
      --verifier <VERIFIER>
          The tool used to verify the provider contract
      --verifier-version <VERIFIER_VERSION>
          The version of the tool used to verify the provider contract
      --build-url <BUILD_URL>
          The build URL that created the provider contract
  -r, --auto-detect-version-properties
          Automatically detect the repository commit, branch and build URL from known CI environment variables or git CLI. Supports Buildkite, Circle CI, Travis CI, GitHub Actions, Jenkins, Hudson, AppVeyor, GitLab, CodeShip, Bitbucket and Azure DevOps.
      --tag-with-git-branch
          Tag provider version with the name of the current git branch. Supports Buildkite, Circle CI, Travis CI, GitHub Actions, Jenkins, Hudson, AppVeyor, GitLab, CodeShip, Bitbucket and Azure DevOps.
  -o, --output <OUTPUT>
          Value must be one of ["json", "text"] [default: text] [possible values: json, text]
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
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

## Connecting to a Pact Broker with a self signed certificate

To connect to a Pact Broker that uses custom SSL cerificates, set the environment variable `SSL_CERT_FILE` to a path that contains the appropriate certificate. Read more at https://docs.pact.io/pact_broker/advanced_topics/using-tls#for-non-jvm

The available ssl options are available for all commands

```sh
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file
          
          [env: SSL_CERT_FILE=]

      --skip-ssl-verification
          Skip SSL certificate verification
          
          [env: SSL_SKIP_VERIFICATION=]

      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification
          
          [env: SSL_TRUST_STORE=]
          [default: true]
          [possible values: true, false]
```

## Open Telemetry

The `pact-broker-cli` cli supports native opentelemetry for traces and application logs.

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
