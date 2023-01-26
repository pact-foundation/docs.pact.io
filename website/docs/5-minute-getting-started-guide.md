---
id: 5-minute-getting-started-guide
title: 5 minute guide
description: From zero to running Pact tests in 5 mins
---


This getting started guide can be run purely in the browser or on your local mahcine, with the intention to get you across the key concepts quickly. As we go through, there will be code snippets to demonstrate concepts. These are not runnable, but are there to assist with explanation. When there is code to run, you will be presented with a REPL as per below. Simply hit the green ▶ button, and the output will be displayed in the terminal below. Give it a shot now:

<iframe frameborder="0" width="100%" height="500px" src="https://repl.it/@mefellows/Getting-Started-Intro?lite=true"></iframe>

## Ways to run

> When you've picked an option, click the corresponding button

1. [Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) our [getting started repository](https://github.com/pact-foundation/pact-5-minute-getting-started-guide) (and [clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) it to your local machine)

<a href="https://github.com/pact-foundation/pact-5-minute-getting-started-guide/fork">
  <img src="https://img.shields.io/badge/fork%20our-starter-blue?logo=github"/>
</a>

2. Create a [new repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) from our [getting started template](https://github.com/pact-foundation/pact-5-minute-getting-started-guide) (and [clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) it to your local machine)


<a href="https://github.com/pact-foundation/pact-5-minute-getting-started-guide/generate">
  <img src="https://img.shields.io/badge/fork%20our-template-blue?logo=github"/>
</a>

3. Run it in your browser by creating a new Repl from our template.

> You'll need to sign up, don't worry it is free, and you can run it from your phone, via the [repl.it mobile app](https://replit.com/mobile)

[![Run on Repl.it](https://repl.it/badge/github/pact-foundation/pact-5-minute-getting-started-guide)](https://repl.it/github/pact-foundation/pact-5-minute-getting-started-guide)

4. Run it in your browser by running our [Repl](https://replit.com/@pact)

<a href="https://replit.com/@pact/pact-5-minute-getting-started-guide?outputonly=1&lite=true">
  <img src="https://img.shields.io/badge/run%20in-browser-blue?logo=react"/>
</a>

## An example scenario: Order API

Here we have an example describing Pact tests between a consumer \(Order Web\), and its provider \(the Order API\).

In the Consumer project, we're going to need:

* A model \(the `Order` class\) to represent the data returned from the Order API
* A client \(the `OrderApiClient`\) which will be responsible for making the HTTP calls to the Order API and returning an internal representation of an Order.

Note that to create a pact, you _do_ need to write the code that executes the HTTP requests to your service \(in your client class\), but you _don't_ need to write the full stack of consumer code \(eg. the UI\).

## Testing the Order Web \(consumer\) project

### Scope of a Consumer Pact Test

Ideally, the Pact tests should be "unit tests" for your client class, and they should just focus on ensuring that the request creation and response handling are correct. If you use pact for your UI tests, you'll end up with an explosion of redundant interactions that will make the verification process tedious. Remember that pact is for testing the contract used for communication, and not for testing particular UI behaviour or business logic.

Usually, your application will be broken down into a number of sub-components, depending on what type of application your consumer is \(e.g. a Web application or another API\). This is how you might visualise the coverage of a consumer Pact test:

![Scope of a consumer Pact test](/img/consumer-test-coverage.png)

Here, a _Collaborator_ is a component whose job is to communicate with another system. In our case, this is the `OrderApiClient`communicating with the external `Order Api` system. This is what we want our consumer test to inspect.

### 1. Start with your model

Imagine a simple model class that looks something like this \(order.js\). The attributes for an Order live on a remote server, and will need to be retrieved by an HTTP call to the Order API.

<!--DOCUSAURUS_CODE_TABS-->
<!--order.js-->

```js
class Order {
  constructor(id, items) {
    this.id = id;
    this.items = items;
  }

  total() {
    return this.items.reduce((acc, v) => {
      acc += v.quantity * v.value;
      return acc;
    }, 0);
  }

  toString() {
    return `Order ${this.id}, Total: ${this.total()}`;
  }
}

module.exports = {
  Order,
};

```

<!--Sample Order-->

```js
module.exports = [
  {
    id: 1,
    items: [
      {
        name: "burger",
        quantity: 2,
        value: 20,
      },
      {
        name: "coke",
        quantity: 2,
        value: 5,
      },
    ],
  },
];
```
<!--END_DOCUSAURUS_CODE_TABS-->

### 2. Create an Order API client

Here we have our external collaborator client. Its job is to both make the external request to the Order API and convert the response into the internal Order model as per above:

<!--DOCUSAURUS_CODE_TABS-->
<!--orderClient.js-->

```js
const request = require("superagent");
const { Order } = require("./order");

const fetchOrders = () => {
  return request.get(`http://localhost:${process.env.API_PORT}/orders`).then(
    (res) => {
      return res.body.reduce((acc, o) => {
        acc.push(new Order(o.id, o.items));
        return acc;
      }, []);
    },
    (err) => {
      console.log(err)
      throw new Error(`Error from response: ${err.body}`);
    }
  );
};

module.exports = {
  fetchOrders,
};
```

<!--END_DOCUSAURUS_CODE_TABS-->

### 3. Configure the mock Order API

The following code will create a mock service on `localhost:1234` which will respond to your application's queries over HTTP as if it were the real Order API. It also creates a mock provider object which you will use to set up your expectations.

```js
// Import Pact & other dependencies
const pact = require("@pact-foundation/pact");
const Pact = pact.PactV3;
const path = require("path");

// Setup Pact
const provider = new Pact({
  log: path.resolve(process.cwd(), "logs", "pact.log"),
  dir: path.resolve(process.cwd(), "pacts"),
  logLevel: "info",
  consumer: consumerName,
  provider: providerName,
});
```

### 4. Write a test

<!--DOCUSAURUS_CODE_TABS-->
<!-- order.spec.js -->
```js
// Setting up our test framework
const chai = require("chai");
const expect = chai.expect;
const chaiAsPromised = require("chai-as-promised");
chai.use(chaiAsPromised);

// We need Pact in order to use it in our test
const { provider } = require("../pact");
const { eachLike } = require("@pact-foundation/pact").MatchersV3;

// Importing our system under test (the orderClient) and our Order model
const { Order } = require("./order"); 
const { fetchOrders } = require("./orderClient");

// This is where we start writing our test
describe("Pact with Order API", () => {
  describe("given there are orders", () => {
    const itemProperties = {
      name: "burger",
      quantity: 2,
      value: 100,
    };

    const orderProperties = {
      id: 1,
      items: eachLike(itemProperties),
    };

    describe("when a call to the API is made", () => {
      before(() => {
        provider
          .given("there are orders")
          .uponReceiving("a request for orders")
          .withRequest({
            method: "GET",
            path: "/orders",
          })
          .willRespondWith({
            body: eachLike(orderProperties),
            status: 200,
            headers: {
              "Content-Type": "application/json; charset=utf-8",
            },
          });
      });

      it("will receive the list of current orders", () => {
        return provider.executeTest((mockserver) => {
          // The mock server is started on a randomly available port,
          // so we set the API mock service port so HTTP clients
          // can dynamically find the endpoint
          process.env.API_PORT = mockserver.port;
          return expect(fetchOrders()).to.eventually.have.deep.members([
            new Order(orderProperties.id, [itemProperties]),
          ]);
        });
      });
    });
  });
});

```
<!--END_DOCUSAURUS_CODE_TABS-->

Green!

Running the passing Order API spec will generate a pact file in the configured pact dir \(`./pacts` by default\). Logs will be output to the configured log dir \(`./log` by default\) that can be useful when diagnosing problems.

You now have a pact file that can be used to verify your expectations of the Order API provider project.

Now, in real life you would rinse and repeat for other likely status codes that may be returned. For example, consider how you want your client to respond to a:

* 404 \(return null, or raise an error?\)
* 400 \(how should validation errors be handled, what will the body look like when there is one?\)
* 500 \(specifying that the response body should contain an error message, and ensuring that your client logs that error message will make your life much easier when things go wrong. Note that it may be hard to force your provider to generate a 500 error on demand. You may need to collaborate with your provider team to create a known provider state that will artificially return a 500 error, or you may just wish to use a standard unit test without a pact to test this.\)
* 401/403 if there is authorisation.

#### **Run the consumer Tests!**

OK enough talk - let's run the consumer test. If you like, click around the project to see the files from above in context. The most interesting file is the consumer test in `./consumer/consumer.spec.js` .

>in your repl type `consumer` or `npm run test:consumer` this will run our consumer test `./consumer/consumer.spec.js` which will invoke our Order API client, and create a pact file, if the required interaction took place.

Simply hit the green ▶ button, and the output will be displayed in the terminal below. Give it a shot now:

<iframe frameborder="0" width="100%" height="500px" src="https://replit.com/@pact/pact-5-minute-getting-started-guide?outputonly=1&lite=true"></iframe>

## Sharing the contracts with the provider team

Now that you have created and run your consumer tests, producing a contract \(the pact file\) as an artefact, we need to share it with the team responsible for managing the Order API, so that they can confirm they meet all of the expectations set in it. There are multiple ways to [share pacts](getting_started/sharing_pacts.md), but the recommended approach is to use a [Pact Broker](pact_broker/) as it enables powerful automation workflows.

For this purpose, we are going to use a hosted Pact Broker from pactflow.io.

> The Pact Broker is an open source tool that requires you to deploy, administer and host it yourself. If you would prefer a plug-and-play option, we've created [PactFlow](https://pactflow.io/?utm_source=ossdocs&utm_campaign=five_minute_guide), a fully managed Pact Broker with additional features to simplify teams getting started and scaling with Pact.
>
> To get started for free, you can sign up to our Developer Plan [here](https://pactflow.io/pricing/?utm_source=ossdocs&utm_campaign=five_minute_guide_dev_plan).

<!-- <iframe style="padding-bottom:20px" frameborder="0" width="100%" height="500px" src="https://repl.it/@mefellows/docspactio-getting-started-publish?lite=true"></iframe> -->

You can see the published pact [here](https://test.pactflow.io/pacts/provider/GettingStartedOrderApi/consumer/GettingStartedOrderWeb/latest). The PactFlow account is protected using basic auth. Use the username `dXfltyFMgNOFZAxr8io9wJ37iUpY42M`, and password `O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1`.

>in your repl type `publish` or `npm run pact:publish` this will run our script `./publish.sh` which will publish our pact files to the PactFlow hosted broker.

After publishing the pact, we can now verify that the Provider meets these expectations.

## Testing the Order API \(provider\) project

### Scope of a Provider Pact Test

On the Provider side, Pact needs to replay all of the interactions \(usually HTTP requests\) against your service. There are a number of choices that can be made here, but usually these are the choices:

* Invoke just the controller layer \(in an MVC app, or the "Adapter" in our diagram\) and stub out layers beneath
* Choosing a real vs mocked out database
* Choosing to hit mock HTTP servers or mocks for external services

Generally speaking, we test the entire service and mock out external services such as downstream APIs \(which would need their own set of Pact tests\) and databases. This gives you some of the benefits of an integration test without the high costs of maintenance.

This is how you might visualise the coverage of a provider Pact test:

![Provider side Pact test scope](/img/provider-test-coverage.png)

### 1. Create the Order API

Below we have created a simple API using [Express JS](https://expressjs.com).

<!--DOCUSAURUS_CODE_TABS-->
<!-- orderApi.js -->

```js
const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const server = express();

server.use(cors());
server.use(bodyParser.json());
server.use(bodyParser.urlencoded({ extended: true }));
server.use((_, res, next) => {
  res.header("Content-Type", "application/json; charset=utf-8");
  next();
});

// "In memory" data store
let dataStore = require("./data/orders.js");

server.get("/orders", (_, res) => {
  res.json(dataStore);
});

module.exports = {
  server,
  dataStore,
};
```

<!--END_DOCUSAURUS_CODE_TABS-->

### 2. Run provider verification tests

We now need to perform the "provider verification" task, which involves the following:

1. Telling Pact where to find the contract files, and where the Order API will be running \(lines 3-13\)
2. Starting the API \(line 16-18\)
3. Running the Provider verification task \(line 22\)

<!--DOCUSAURUS_CODE_TABS-->
<!-- provider.spec.js -->
```js
const Verifier = require("@pact-foundation/pact").Verifier;
const chai = require("chai");
const chaiAsPromised = require("chai-as-promised");
const getPort = require("get-port");
const { server } = require("./provider.js");
const { providerName, pactFile } = require("../pact.js");
chai.use(chaiAsPromised);
let port;
let opts;
let app;

// Verify that the provider meets all consumer expectations
describe("Pact Verification", () => {
  before(async () => {
    port = await getPort();
    opts = {
      provider: providerName,
      providerBaseUrl: `http://localhost:${port}`,
      // pactUrls: [pactFile], // if you don't use a broker
      pactBrokerUrl: "https://test.pactflow.io",
      pactBrokerUsername: "dXfltyFMgNOFZAxr8io9wJ37iUpY42M",
      pactBrokerPassword: "O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1",
      publishVerificationResult: false,
      providerVersionBranch: process.env.GIT_BRANCH ?? "master",
      providerVersion: process.env.GIT_COMMIT ?? "1.0." + process.env.HOSTNAME,
      consumerVersionSelectors: [
        { mainBranch: true },
        { deployedOrReleased: true }
      ]
    };

    app = server.listen(port, () => {
      console.log(`Provider service listening on http://localhost:${port}`);
    });
  });

  after(() => {
    if (app) {
      app.close();
    }
  });
  it("should validate the expectations of Order Web", () => {
    return new Verifier(opts)
      .verifyProvider()
      .then((output) => {
        console.log("Pact Verification Complete!");
        console.log(output);
      })
      .catch((e) => {
        console.error("Pact verification failed :(", e);
      });
  });
});
```
<!--END_DOCUSAURUS_CODE_TABS-->

#### Run the Provider tests

Let's run the provider test. If you like, click around the project to see the files from above in context. The most interesting file is the consumer test in `./provider/provider.spec.js` .

>in your repl type `npm run test:provider` or `provider` this will run our provider test `./provider/provider.spec.js` which will start our Order API provider, connect to our broker, pull down the relevant pacts to verify. Pact will issue these requests against the provider, and verify that the expectations in the pact file are met by the Order API provider.

[![Run on Repl.it](https://repl.it/badge/github/pact-foundation/pact-5-minute-getting-started-guide)](https://repl.it/github/pact-foundation/pact-5-minute-getting-started-guide)

**caveat** - Due to a bug/quirk/feature of Repl.it, due to our provider step starting an express server, this will cause the repl.it to start a [webview](https://docs.replit.com/hosting/deploying-http-servers). This will result in your repl stuck in a waking up loop. 👇. If you get stuck like this, just click on our `Run on Repl.it` button and get your own copy.

<img width="889" alt="repl waking up" src="https://user-images.githubusercontent.com/19932401/208748438-e67f20f9-b1bc-46e8-9f42-8cca788ceec1.png"/>

## Whats next?

Thanks and happy Pacting! If you want to go a bit deeper, you can checkout our [Pact University](https://docs.pact.io/university)