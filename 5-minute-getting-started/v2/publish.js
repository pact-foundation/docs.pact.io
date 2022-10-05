const { pactFile, consumerVersion } = require("./pact");

// STEP 2: Publish to broker
const publishPacts = async () => {
  const publisher = require("@pact-foundation/pact-node");
  const opts = {
    pactFilesOrDirs: [pactFile],
    pactBroker: "https://test.pact.dius.com.au",
    pactBrokerUsername: "dXfltyFMgNOFZAxr8io9wJ37iUpY42M",
    pactBrokerPassword: "O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1",
    // This PR needs merging to allow uploading with branches via pact-js-core
    // https://github.com/pact-foundation/pact-js-core/pull/408
    tags: ["repl"],
    consumerVersion,
  };

  publisher
    .publishPacts(opts)
    .then((res) => {
      console.log("Pact contract publishing complete!");
      console.log("");
      console.log(
        "Head over to https://test.pact.dius.com.au/pacts/provider/GettingStartedOrderApi/consumer/GettingStartedOrderWeb/latest and login with"
      );
      console.log("=> Username: dXfltyFMgNOFZAxr8io9wJ37iUpY42M");
      console.log("=> Password: O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1");
      console.log("to see your published contracts.");
    })
    .catch((e) => {
      console.log("Pact contract publishing failed :(. \n:", e);
    });
};

module.exports = {
  publishPacts,
};
