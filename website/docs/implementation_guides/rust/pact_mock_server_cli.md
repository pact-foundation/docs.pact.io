---
title: Standalone Pact Mock Server
custom_edit_url: https://github.com/pact-foundation/pact-reference/edit/master/rust/pact_mock_server_cli/README.md
---
<!-- This file has been synced from the pact-foundation/pact-reference repository. Please do not edit it directly. The URL of the source file can be found in the custom_edit_url value above -->

This project provides both a restful web api and command line interface to run pact mock servers. It is a single
executable binary and is able to manage multiple mock servers. The lifecycle of each mock server can be controlled by the
restful web api or through the command line interface. It implements the [V3 Pact specification](https://github.com/pact-foundation/pact-specification/tree/version-3).

[Online rust docs](https://docs.rs/pact_mock_server_cli/)

## Command line interface

The mock server is bundles as a single binary executable `pact_mock_server_cli`. Running this with out any options displays
the standard help.

```console,ignore
$ ./pact_mock_server_cli --help
./pact_mock_server_cli v1.0.0
Standalone Pact mock server

USAGE:
    pact_mock_server_cli [FLAGS] [OPTIONS] <SUBCOMMAND>

FLAGS:
        --help           Prints help information
        --no-file-log    Do not log to an output file
        --no-term-log    Use a simple logger instead of the term based one
    -v, --version        Prints version information

OPTIONS:
    -h, --host <host>            hostname the master mock server runs on (defaults to localhost)
    -l, --loglevel <loglevel>    Log level for mock servers to write to the log file (defaults to info) [possible
                                 values: error, warn, info, debug, trace, none]
    -p, --port <port>            port the master mock server runs on (defaults to 8080)

SUBCOMMANDS:
    create             Creates a new mock server from a pact file
    help               Prints this message or the help of the given subcommand(s)
    list               Lists all the running mock servers
    shutdown           Shutdown the mock server by id or port number, releasing all its resources
    shutdown-master    Performs a graceful shutdown of the master server (displayed when it started)
    start              Starts the master mock server
    verify             Verify the mock server by id or port number, and generate a pact file if all ok


```

### Options

The following options are available for all subcommands:

#### Host: -h, --host &lt;host&;gt;

This sets the host the master mock server runs on. By default this will be localhost.

#### Port: -p, --port &lt;port&;gt;

This sets the port that the master mock server runs on. By default this will be 8080. The start command will start the
master server using this port.

#### Log level: -l, --loglevel &lt;loglevel&;gt;

This sets the log level that the CLI and mock servers log at. It defaults to info. Valid values are: error, warn,
info, debug, trace, none.

### Sub-commands

#### help

This prints either the main help or the help for a sub-command.

#### start

This starts the master mock server. This server needs to be running for the other sub-commands to work.

```console
$ ./pact_mock_server_cli help start
Starts the master mock server

Usage: pact_mock_server_cli start [OPTIONS]

Options:
      --help                     Print help and exit
  -o, --output <output>          the directory where to write files to (defaults to current directory)
      --base-port <base-port>    the base port number that mock server ports will be allocated from. If not specified, ports will be randomly assigned by the OS.
  -v, --version                  Print version information and exit
  -p, --port <port>              port the master mock server runs on (defaults to 8080)
      --server-key <server-key>  the server key to use to authenticate shutdown requests (defaults to a random generated one)
  -h, --host <host>              hostname the master mock server runs on (defaults to localhost)
  -l, --loglevel <loglevel>      Log level for mock servers to write to the log file (defaults to info) [possible values: error, warn, info, debug, trace, none]
      --no-term-log              Turns off using terminal ANSI escape codes
      --no-file-log              Do not log to an output file


```

##### Options

###### Output directory: -o, --output &lt;output&;gt;

This sets the output directory that log files and pact files are written to. It defaults to the current working directory.

##### Example

```console,ignore
$ ./pact_mock_server_cli start -l debug -o logs/
15:40:08 [DEBUG] hyper::server: threads = 10
15:40:08 [INFO] pact_mock_server_cli::server: Server started on port 8080
```

#### create

This creates a new pact mock server managed by the master server from a pact file. The ID and port of the mock server
will be displayed.

```console
$ ./pact_mock_server_cli help create
Creates a new mock server from a pact file

Usage: pact_mock_server_cli create [OPTIONS] --file <file>

Options:
  -f, --file <file>          the pact file to define the mock server
      --help                 Print help and exit
  -c, --cors-preflight       Handle CORS pre-flight requests
  -v, --version              Print version information and exit
  -p, --port <port>          port the master mock server runs on (defaults to 8080)
      --tls                  Enable TLS with the mock server (will use a self-signed certificate)
  -h, --host <host>          hostname the master mock server runs on (defaults to localhost)
  -l, --loglevel <loglevel>  Log level for mock servers to write to the log file (defaults to info) [possible values: error, warn, info, debug, trace, none]
      --no-term-log          Turns off using terminal ANSI escape codes
      --no-file-log          Do not log to an output file


```

##### Options

###### Pact File: -f, --file &lt;file&;gt;

This option specifies the pact file to base the mock server on. It is a mandatory option.

##### Example

```console,ignore
$ ./pact_mock_server_cli create -f ../../../libpact_matching/tests/pact.json
15:43:47 [INFO] pact_mock_server_cli::create_mock: Creating mock server from file ../../../libpact_matching/tests/pact.json
Mock server "7d1bf906d0ff42528f2d7d794dd19c5b" started on port 52943
```

#### list

Lists out all running mock servers with their ID, port, provider name and status.

```console
$ ./pact_mock_server_cli list --help
Lists all the running mock servers

Usage: pact_mock_server_cli list [OPTIONS]

Options:
      --help                 Print help and exit
  -v, --version              Print version information and exit
  -p, --port <port>          port the master mock server runs on (defaults to 8080)
  -h, --host <host>          hostname the master mock server runs on (defaults to localhost)
  -l, --loglevel <loglevel>  Log level for mock servers to write to the log file (defaults to info) [possible values: error, warn, info, debug, trace, none]
      --no-term-log          Turns off using terminal ANSI escape codes
      --no-file-log          Do not log to an output file


```

##### Example

```console,ignore
$ ./pact_mock_server_cli list
Mock Server Id                    Port   Provider       Status
7d1bf906d0ff42528f2d7d794dd19c5b  52943  Alice Service  error
```

#### verify

This checks that the mock server, specified by ID or port number, has met all the expectations of the pact file. If all
expectations have been met, the pact file will be written out to the output directory that was specified with the start
sub-command. If there is any errors, no pact file will be written and the errors displayed to the console.

```console
$ ./pact_mock_server_cli verify --help
Verify the mock server by id or port number, and generate a pact file if all ok

Usage: pact_mock_server_cli verify [OPTIONS]

Options:
      --help
          Print help and exit
  -i, --mock-server-id <mock-server-id>
          the ID of the mock server
  -m, --mock-server-port <mock-server-port>
          the port number of the mock server
  -v, --version
          Print version information and exit
  -p, --port <port>
          port the master mock server runs on (defaults to 8080)
  -h, --host <host>
          hostname the master mock server runs on (defaults to localhost)
  -l, --loglevel <loglevel>
          Log level for mock servers to write to the log file (defaults to info) [possible values: error, warn, info, debug, trace, none]
      --no-term-log
          Turns off using terminal ANSI escape codes
      --no-file-log
          Do not log to an output file


```

##### Options

###### Mock server ID: -i, --mock-server-id &lt;mock-server-id&;gt;

The ID of the mock server to verify. Either this option or the mock server port option must be provided.

###### Mock server Port: -m, --mock-server-port &lt;mock-server-port&;gt;

The port number of the mock server to verify. Either this option or the mock server ID option must be provided.

##### Example

In the case of a mock server that has issues:

```console,ignore
$ ./pact_mock_server_cli verify -m 52943
Mock server 7d1bf906d0ff42528f2d7d794dd19c5b/52943 failed verification with 1 errors

0 - Expected request was not received - {"method":"GET","path":"/mallory","query":"name=ron&status=good"}
```

and for a mock server that has matched all requests:

```console,ignore
$ ./pact_mock_server_cli verify -m 52943
Mock server 7d1bf906d0ff42528f2d7d794dd19c5b/52943 verified ok
```

#### shutdown

Shutdown the mock server by id or port number, releasing all its resources.

```console
$ ./pact_mock_server_cli help shutdown
Shutdown the mock server by id or port number, releasing all its resources

Usage: pact_mock_server_cli shutdown [OPTIONS]

Options:
      --help
          Print help and exit
  -i, --mock-server-id <mock-server-id>
          the ID of the mock server
  -m, --mock-server-port <mock-server-port>
          the port number of the mock server
  -v, --version
          Print version information and exit
  -p, --port <port>
          port the master mock server runs on (defaults to 8080)
  -h, --host <host>
          hostname the master mock server runs on (defaults to localhost)
  -l, --loglevel <loglevel>
          Log level for mock servers to write to the log file (defaults to info) [possible values: error, warn, info, debug, trace, none]
      --no-term-log
          Turns off using terminal ANSI escape codes
      --no-file-log
          Do not log to an output file


```

##### Options

###### Mock server ID: -i, --mock-server-id &lt;mock-server-id&;gt;

The ID of the mock server to shutdown. Either this option or the mock server port option must be provided.

###### Mock server Port: -m, --mock-server-port &lt;mock-server-port&;gt;

The port number of the mock server to shutdown. Either this option or the mock server ID option must be provided.

##### Example

```console,ignore
$ ./pact_mock_server_cli shutdown -i 3a94a472d04849048b78109e288702d0
Mock server with id '3a94a472d04849048b78109e288702d0' shutdown ok
```

## Restful JSON API

The master mock server provides a restful JSON API, and this API is what the command line sub-commands use to
communicate and control the master server.

### End points

#### GET /

This returns a list of all running mock servers managed by this master server.

example request:

```ignore
GET http://localhost:8080/ HTTP/1.1
```

example response:

```json
{
  "mockServers": [
    {
      "id": "7d1bf906d0ff42528f2d7d794dd19c5b",
      "port": 52943,
      "provider": "Alice Service",
      "status": "ok"
    }
  ]
}
```

#### POST /

This creates a new mock server from a pact file that must be present as JSON in the body. Returns the details of the mock server
in the response.

example request:

```ignore
POST http://localhost:8080/ HTTP/1.1
Content-Type: application/json
```

payload:

```json
{
  "provider": {
    "name": "Alice Service"
  },
  "consumer": {
    "name": "Consumer"
  },
  "interactions": [
    {
      "description": "a retrieve Mallory request",
      "request": {
        "method": "GET",
        "path": "/mallory",
        "query": "name=ron&status=good"
      },
      "response": {
        "status": 200,
        "headers": {
          "Content-Type": "text/html"
        },
        "body": "\"That is some good Mallory.\""
      }
    }
  ]
}
```

example response:

```json
{
  "mockServer": {
    "id": "81c3483901e647ba8f545f2842d09cba",
    "port": 58276
  }
}
```

#### Response codes

##### 200 OK

This is returned when if the mock server was created successfully.

##### 422 Unprocessable Entity

This is returned if the pact JSON could not be parsed or the mock server could not be started.

#### GET /mockserver/:id

Returns details of the mock server with `:id`, which can be either a mockserver ID or port number.

example request:

```ignore
GET http://localhost:8080/mockserver/33218 HTTP/1.1
```

example response:

```json
{
  "id": "3201b3e2f04f402c83b374a077f8f8dd",
  "port": 33218,
  "provider": "Alice Service",
  "status": "error"
}
```

#### Response codes

##### 200 OK

This is returned with a valid mockserver.

##### 404 Not Found

This is returned if no mock server was found with the given ID or port number.

#### POST /mockserver/:id/verify

This checks that the mock server, specified by ID or port number, has met all the expectations of the pact file. If all
expectations have been met, the pact file will be written out to the output directory that was specified with the start
sub-command. If any mismatched requests where received by the mock server, they will be returned.

example request:

```ignore
POST http://localhost:8080/mockserver/33218/verify HTTP/1.1
```

#### Response codes

##### 204 No Content

This is returned when all expectations have been successfully met and the pact file has been written out to the output directory.

##### 422 Unprocessable Entity

This is returned if any expectations have not been met, or any unrecognised requests where received. The details are
returned in the body.

example response:

```json
{
  "mismatches": [
    {
      "method": "GET",
      "path": "/mallory",
      "request": {
        "method": "GET",
        "path": "/mallory",
        "query": "name=ron&status=good"
      },
      "type": "missing-request"
    }
  ],
  "mockServer": {
    "id": "3201b3e2f04f402c83b374a077f8f8dd",
    "port": 33218,
    "provider": "Alice Service",
    "status": "error"
  }
}
```

##### 404 Not Found

This is returned if the ID or port number did not correspond to a running mock server or the pact file could not be
written.

#### DELETE /mockserver/:id

Shuts down the mock server with `:id`, which can be either a mockserver ID or port number.

example request:

```ignore
DELETE http://localhost:8080/mockserver/33218 HTTP/1.1
```

#### Response codes

##### 204 No Content

This is returned when the mock server has been shutdown.

##### 404 Not Found

This is returned if no mock server was found with the given ID or port number.
