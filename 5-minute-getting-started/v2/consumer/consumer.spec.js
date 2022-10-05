const chai = require("chai");
const chaiAsPromised = require("chai-as-promised");
const { eachLike } = require("@pact-foundation/pact").Matchers;
const { Order } = require("./order");
const expect = chai.expect;
const { fetchOrders } = require("./orderClient");
const { provider } = require("../pact");
chai.use(chaiAsPromised);

describe("Pact with Order API", () => {
  // Start the mock service on a randomly available port,
  // and set the API mock service port so clients can dynamically
  // find the endpoint
  before(() =>
    provider.setup().then((opts) => {
      process.env.API_PORT = opts.port;
    })
  );
  afterEach(() => provider.verify());

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
        return provider.addInteraction({
          state: "there are orders",
          uponReceiving: "a request for orders",
          withRequest: {
            path: "/orders",
            method: "GET",
          },
          willRespondWith: {
            body: eachLike(orderProperties),
            status: 200,
            headers: {
              "Content-Type": "application/json; charset=utf-8",
            },
          },
        });
      });

      it("will receive the list of current orders", () => {
        return expect(fetchOrders()).to.eventually.have.deep.members([
          new Order(orderProperties.id, [itemProperties]),
        ]);
      });
    });
  });

  // Write pact files to file
  after(() => {
    return provider.finalize();
  });
});
