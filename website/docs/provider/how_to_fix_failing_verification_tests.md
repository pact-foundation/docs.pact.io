---
title: Help! My pact verification tests are failing. What do I do?
---

## For Ruby, JS, Python, Go and Swift

1. If your tests are failing on your CI, identify the branch that they are failing on, and check out that branch on your local development machine.
2. Run the pact tests locally with read only credentials.
3. Run just the first failing interaction.
    * Locate the first failure message. In the output, you should see the interaction ID. In Ruby it looks like:
      ```
      bundle exec rake pact:verify:at[https://testdemo.pactflow.io/pacts/provider/pactflow-application-saas
        /consumer/pactflow-ui-saas/pact-version/b20974e7bef45f75caa5252ea392a2dfb9719364
        /metadata/c1tdW2xdPXRydWUmc1tdW2N2bl09NWYzYzk3OTc2ODdhOTE2N2U5ZmQ4YjhiYWI0ZjYxYmE5NTAxZjVlOA==]
        PACT_BROKER_INTERACTION_ID="3c82fcae84594130d4d118d0d790440f41e630db" 
        # Load webhooks request given triggered webhooks exist for consumer supply and provider product
      ```
    * In your console, export the PACT_BROKER_INTERACTION_ID environment variable, or set the environment variable in your IDE. (TODO windows example)

      ```
        export PACT_BROKER_INTERACTION_ID="3c82fcae84594130d4d118d0d790440f41e630db"
      ```
    * Then, run the verification task again. You should only see the failing verification running this time.
4. Identify whether it is a code fix or a data fix that needs to be performed.
    * To check the provider state, locate the code that is setting up the provider state by doing a text search for the provider state string. The output from the test will look something like:

      ```
      Verifying a pact between pactflow-ui-saas and pactflow-application-saas
        Given a webhook has been triggered
          load webhook triggers request
            with GET /webhooks/V9F_Gzf_WqpChQJMz1ka5Q/triggered-webhooks
              returns a response which
                has status code 200
                has a matching body (FAILED - 1)

      ```

  The provider state will be the text following the word `Given`, which in this case is`a webhook has been triggered`

5. Fix the code or state!
6. Rinse and repeat with the next error.
7. Commit and push.

## For JVM

What to make a contribution? If you know how to do this, please click the `Edit this page` link at the bottom and submit a PR. You can find more info on contributing to the docs [here](https://docs.pact.io/contributing/docs).
