# Pact Conceptual Overview 
Using Pact successfully requires you to understand how Pact works and the concepts and terminology behind Pact. 
If you try to build your CI/CD without this foundational understanding, you may find yourself getting confused or getting unexpected results.

## Consumers and publishing pacts
Whenever a consumer runs a contract test for a particular provider and it succeeds, a file is generated that records 
all of the interactions between the consumer and the provider. This record is called a pact.

In your CI/CD environment, every time you run the contract tests, the resulting pact will be published to the Pact Broker. 
This is called a pact publication.

Whenever the consumer changes, this is called a _consumer version_. The version is often identified by its git hash. 
You may also want to add other distinguishing information, such as the feature toggle name if you are using feature 
toggles.  In general, you want to uniquely identify each version of the consumer which may require a different contract.

A given pact published by the consumer may or may not change actual contents of the pact (e.g. by adding a request 
parameter, or changing the expected results).  If it does change, then the pact gets a new _pact version_.

![Consumer domain model](conceptual_overview_images/consumer-domain-model.png)

It's important to understand a few rules about how consumers relate to pacts:

- Multiple versions of the consumer can have the same pact version (if the changes to the consumer don't change the pact)
- A specific version of the consumer will always have exactly one pact version

## Tagging
At any point you may want to label a particular version of the consumer with one or more tags. For example, 
you can tag the consumer with its current branch (e.g. a PR branch or the main branch), or you can tag it with the 
environment it has been deployed to.

The general recommendation is to tag with the branch name when you publish a pact, and tag with the environment when you deploy.
I'll discuss later how we use tags to help answer the question: can I deploy?

For example, let's say you have a PetStoreConsumer application.  Every time you change it that's a new version 
of the application.  When you run contract tests for that version, you publish a new pact publication to the broker, 
which may or may not generate a new pact version.

| Date | Consumer Versions | Tags | Pact Version |
| ---- | ----------------- | ---- | ------------ |
| 12/21 | 63be8b | prod, main | 1 |


12/22|9ecb61|staging,main|2
12/23
31696e
feat-xyz
2
12/23
3b4de7
feat-abc
3

Here we see that:
Version 63be8b is deployed to prod and is in the main branch.
Version 9ecb61 is deployed to staging, and is also in the main branch. It has changed the pact, so it has a new pact version.
Version 31696e is in a feature branch and has not been deployed anywhere. It did not change the pact, so the pact version remains the same
Version 3b4de7 is in a different feature branch. It did change the pact, so we now have a new pact version
Verifying the pact
We need to know if a particular pact version will work with a particular version of the provider. This is done by running a verification, where Pact replays the interactions against the provider and ensures that the providers responses match the consumer's expectations recorded in the pact.
In our CI/CD environment, every time we run a verification, the results will be published to the Pact Broker. This is called a verification result.
Whenever the provider changes, this is called a provider version (usually identified by its git hash).
Just as with a consumer, you may want to label a particular version of the provider with one or more tags. For example, you can tag the provider with its current branch (e.g. a PR branch or the main branch), or you can tag it with the environment it has been deployed to.  The general recommendation is to set a tag of the branch name when a verification passes, and set a tag of the environment name (like "prod" or "staging") when the provider is deployed to that environment.

Let's expand the example from above to include the provider and its verifications.



12/21
6464f9
prod
main
1, 2
12/22
a8513e
staging
main
1, 2, 3
12/23
35a850
feat-X
2, 3
12/23
741a54
feat-Y
3

Note that provider version 35a850 in the feat-X branch has not been verified against pact version 1. Because that's the version that the prod consumer is at, it is not safe to deploy this version of the provider to prod. You probably also don't want to merge it into main until this gets fixed.
Similarly provider version 741a54 has only verified pact version 3. So it's not safe to deploy to either staging or prod, and should definitely not be merged to main.
Looking at the pact grid
If you can go to https://pactbroker.qa.ebay.com, you will see the list of all pacts:

Note the grid icon  . If you click on this it will show you a grid of all combinations of consumer and provider versions where verification has been attempted, and indicates whether the verification succeeded (green) or passed (red).

Here we can see that the PetstoreConsumer b5fe085 is on the master branch (it has the "master" tag) and has been verified with three different versions of the PetstoreService.
You can see that two versions of PetStoreService are in the master branch, but that the latest version in master is f96cb62.  f2c00b3 is currently in the feature branch "DebugPactBroker"
Generalizing: the pacticipant
The Pact team has generalized the "consumer" and "provider" roles of a pact using the term pacticipant. A particular pact publication has two pacticipants: the consumer and the provider.  A verification result also has two pacticipants: the consumer and the provider.
This generalized concept of a pacticipant can be useful because sometimes you can perform the same operations on a pacticipant regardless of whether it is a consumer or a provider.



