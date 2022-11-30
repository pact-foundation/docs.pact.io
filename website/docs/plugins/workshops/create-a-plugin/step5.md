---
title: 6. Testing our first plugin
---

## Test our plugin

We have created a basic Pact JS test using the new `PactV4` interface that supports plugins, and the new interaction types.

Now that we have built and installed the plugin locally, we can test that it works.

As we iterate on the plugin, it's helpful to have a development cycle that allows you to make rapid changes.

## Run the tests

Open up the  `plugin.consumer.spec.ts` and also the provider test `plugin.provider.spec.ts` to see how the plugin is used in an HTTP interaction. Note the plugin can also be used in other interaction types and transports provided by other plugins

```
cd ~/example-project-js-foobar-plugin
npm t
```{{exec}}

