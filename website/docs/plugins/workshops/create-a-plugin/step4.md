---
title: 5. Creating our first plugin
---


# Creating our first plugin

## The scenario

We are going to create a new plugin to support a fictional content type `application/foo`. Initially, it will simply be a text-based protocol with no special features. However in an bonus module, we will encourage you to modify and implement a custom grammar for the language.

## The Template

We will be using the following template project to create our plugin: https://github.com/pact-foundation/pact-plugin-template-golang

The template helps you bootstrap a new plugin quickly. It features:

* A gRPC server with stubbed gRPC methods ready to implement
* An automated release procedure
* Support cross-complinig for recommended common platform/targets

It's worth opening the `README` in `pact-plugin-template-golang/README.md` and familiarising yourself.

We will now proceed to create our first plugin! Let's open the template project:

`cd ~/pact-plugin-template-golang`{{exec}}

## Creating the plugin

Please familiarise yourself with the general guide for creating a [Content Matcher](https://github.com/pact-foundation/pact-plugins/blob/main/docs/content-matcher-design.md) Plugin before moving on. 

This should give you some perspective for when we dive into the code. Take particular note of the sequence diagram to understand the flow of events.

## Create a new GitHub repo

1. Create a new repository in GitHub. The name of the project should be `pact-<PROJECT>-plugin`. We will use `pact-foobar-plugin`
   * ![New Repository](./assets/new-repository.png)
2. Change into the template folder: `cd ~/pact-plugin-template-golang/`{{exec}}
3. Add your remote, e.g. `git remote add origin https://github.com/YOUR_ORG/pact-foobar-plugin.git`
4. Push this code to your new repository `git push origin`

You should now have a basic template in your new project on GitHub.

## Compile and run the plugin

At this point, the plugin should be able to compile and start a gRPC server.

Run `make bin`{{exec}} to create the plugin, and then start it: `build/myplugin`{{exec}}. 

You should see some output that looks like this:

```
{"port": 40555, "serverKey": "bf71bb84-2e08-411b-86d5-8449e2b0497b"}
```

When the Plugin Driver discovers and starts your plugin, it reads this JSON output and registers the plugin. 
It will then issue a discovery call `InitPlugin` to understand what the plugin can do.

Stop the server by running `ctrl-c` in the terminal.

## Update the Go module name

We need to rename all the things, otherwise it will be called the unhelpful `myplugin`. 

Replace `github.com/pact-foundation/pact-plugin-template-golang` in [`go.mod`](./go.mod) with your github URL (without the protocol prefix) to identify the package uniquely.

Similarly, correct the import at the top of [`plugin.go`](./plugin.go) and [`server.go`](./server.go).

Or simply do a workspace wide search and replace from `github.com/pact-foundation/pact-plugin-template-golang` to your go module name.

```
go mod tidy
go mod vendor
```{{exec}}

## Set the name and version

In the top of the [`Makefile`](./Makefile) set `PROJECT` to your plugin's name - `foobar`

*NOTE: It's important that the name of your go module and the `PROJECT` variable must align, to create artifacts discoverable to the CLI tooling, such as the [Plugin CLI](https://docs.pact.io/implementation_guides/pact_plugins/cli).*

## Design the consumer interface

This is how the users of your plugin will write the plugin specific interaction details. 

For example, take the following HTTP interaction:

```js
await pact
  .addInteraction()
  .given('the foobar protocol exists')
  .uponReceiving('an HTTP request to /foobar')
  .usingPlugin({
    plugin: 'foobar',
    version: '0.0.1',
  })
  .withRequest('POST', '/foo', (builder) => {
    builder.pluginContents('application/foo', {"request": {"body": "hello"}}); // <- request
  })
  .willRespondWith(200, (builder) => {
    builder.pluginContents('application/foo', {"response": {"body": "hello"}}); // <- response
  })
  .executeTest((mockserver) => {
          ...
```          

The user needs to specify the request and response body portion of the request.

Because the use cases for plugins are so wide and varied, the framework does not impose limits
on this data structure and is something you need to design.

This being said, most plugins have opted to use a JSON structure, and use keys similar to how they are mapped in Pact today (under the `request` and `response` properties).

This structure is be represented in [`configuration.go`](./configuration.go).

Think about how you would like your user to specify the interaction details for the various interaction types. 

Here is an example for a TCP plugin with a custom text protocol:

### Synchronous Messages

Set the expected response from the API:

```go
foobarMessage = `{"response": {"body": "hellotcp"}}`
```

### Asynchronous Messages

Set the request/response all in one go:

```go
foobarMessage = `{"request": {"body": "hello"}, "response":{"body":"world"}}`
```

### HTTP

Separate out the body on the request/response part of the interaction:

```go
foobarRequest = `{"request": {"body": "hello"}}`
foobarResponse = `{"response":{"body":"world"}}`
```

We will stick with this default for now, but note it is an important design decision.

## Write the Plugin!

### Implement the relevant RPC functions

Open [`plugin.go`](./plugin.go) and update the relevant RPC functions. 

Depending on your use case, some of the RPC calls won't be required, each method is well signposted to help you along.

In our case, we will be updating the following RPCs:

* `InitPlugin`
* `ConfigureInteraction`
* `CompareContents`
* `GenerateContent`

### `InitPlugin`

This RPC initialises the plugin, and registers the plugin capabilities with the driver, storing the enries in a catalogue.

When a plugin loads, it will receive an `InitPluginRequest` and must respond with an `InitPluginResponse` with the catalogue entries for the plugin. See the plugin proto file for details of these messages.

We are going to implement a `CONTENT_MATCHER` for the content type of `application/foo`. Update the response from the procedure as folows:

```go
	return &plugin.InitPluginResponse{
		Catalogue: []*plugin.CatalogueEntry{
			{
				Key:  "foobarplugin", // <-
				Type: plugin.CatalogueEntry_CONTENT_MATCHER, // <- leave this
				Values: map[string]string{
					"content-types": CONTENT_TYPE, // <- check this (it should be application/foo already)
				},
			},
            // <- remove the transport plugin
		},
	}, nil
```

### `ConfigureInteraction`

In the consumer test, the first thing it will do is send though a `ConfigureInteractionRequest`
containing the content type and the data the user configured in the test for the interaction.

The plugin needs to consume this data, and then return the data required to configure the interaction
(which includes the body, matching rules, generators and additional data that needs to be persisted
to the pact file).

This method is already pre-filled to accept inputs that correspond to the consumer interface described above.

Take a moment to read the code in this RPC.

_HINT: if you want to extend the grammar of `application/foo` to beyond verbatim text to something more exotic, you will want to parse/generate the correct content types in this method_

### `CompareContents`

Now that the interaction has been configured, everytime the Pact mock
server (consumer side) or verifier (provider side) encounters a content
type associated with the plugin, the plugin will receive a
`CompareContentsRequest` request and must respond with a `CompareContentsResponse`
with the match results of the contents.

Basically, this is where you compare the actual vs expected message, and return any errors.

Again, this method is already setup to compare two string values. 

Take a moment to read the code in this RPC.

### `GenerateContent`

Request to generate the content using any defined generators
If there are no generators, this should just return back the given data.

Every time the Pact implementation needs to generate contents for a
content associated with a plugin, it will send a `GenerateContentRequest`
to the plugin. This will happen in consumer tests when the mock server
needs to generate a response or the contents of a message, or during
verification of the provider when the verifier needs to send a request
to the provider.

The Golang library doesn't support generators, so you can leave this method as is, which simply returns what it got untouched.

## Test that you can compile your plugin

By now, you should have a simple text content matcher that knows how to handle a `application/foo` content type. It can now be used in any Pact test or interaction that supports plugins, and uses that content type.

Run `make bin`{{exec}} to create the plugin, and then start it to ensure it compiles and runs: `build/foobar`{{exec}}. 

## Install our plugin for local testing

run `make install_local`{{exec}} to build the plugin and move it into the plugins directory for local development.

## Further Reading

* Creating a [Content Matcher](https://github.com/pact-foundation/pact-plugins/blob/main/docs/content-matcher-design.md) Plugin developer guide

## A note on logging

You should log regularly. Debugging gRPC calls from the framework can be challenging, as the plugin is started asynchronously by the Plugin Driver behind the scenes.

There are two ways to log:

1. Stdout - all stdout (e.g. `fmt.Print*`) is pulled into the general Pact logs for the framework you're running
2. To file. All calls to `log.Print*` will be written to file

The log setup has three main features:

1. It works with the native Go `log` package
2. It logs to a file relative to plugin execution in `log/plugin.log`
3. It is levelled, at the direction of the plugin driver (that is, the log level will pass in from the driver which will restrict the levels logged in this plugin)

To write something to the log file, you simply use the `log` package, with the level prefixed as per below:

```golang
log.Println("[TRACE] ...")
log.Println("[DEBUG] ...")
log.Println("[INFO] ...")
log.Println("[WARN] ...")
log.Println("[ERROR] ...")
```
