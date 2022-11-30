const { Verifier } = require("@pact-foundation/pact");
const { server } = require("./provider");

describe("Pact Verification", () => {
  // (1) Starting the Provider API
  before((done) => server.listen(8081, done));

  it("validates the expectations of ProductService", () => {
    // (2) Telling Pact to use the contracts stored in Pactflow and where the Product API will be running
    const opts = {
      logLevel: "INFO",
      providerBaseUrl: "http://localhost:8081",
      providerVersion: "1.0.0-someprovidersha",
      provider: "katacoda-provider-v3",
      providerBranch: "main",
      consumerVersionSelectors: [{ branch: "main" }],
      pactBrokerUrl: process.env.PACT_BROKER_BASE_URL,
      // pactUrls: [
      // `${process.env.PWD}/pacts/katacoda-consumer-katacoda-provider.json`,
      // ],
      publishVerificationResult: true,
      enablePending: true,
    };
    // (3) Running the Provider verification task
    return new Verifier(opts).verifyProvider().then((output) => {
      console.log("Pact Verification Complete!");
      console.log(output);
    });
  });
});
