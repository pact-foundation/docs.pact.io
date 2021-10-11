---
title: Question archive
---

Some less commonly, but no less importantly, asked questions.

## What if I can't run my provider application locally for Pact verification?

Pact is designed assuming that the verification step can be run locally, stubbing any external dependencies, **before** deploying to an environment. This is part of the "shift left" philosophy of Pact, which aims to provide feedback on integration compatiblity as early as possible in the development lifecycle. It aims to prevent breaking changes ever being merged or deployed to a test or production environment. If you cannnot run your application locally, and hence cannot run the Pact verification step without using a deployed application, then you are negating many of the benefits (eg. focus, isolation, speed) of using Pact in the first place.

Pact verifications are much harder to run when you do not have a high level of control over the application under test, eg. where you cannot can stub out dependencies, completely control the data in the application, or disable/control timebased authentication. Verifications run on a deployed application will be slower to execute on an interaction level, and will provide feedback to the developer or tester much later in the process.

If your application currently cannot be run without deploying it, we recommend spending some time investigating what could be done to enable it to be run locally. While this may take some time initially, it will mostly likely pay off in the long run. 

Some examples:

* for serverless applications, investigate writing or using some proxy code that will make the provider application available for the test harness over HTTP to mimic the serverless runtime. There are most likely existing frameworks that do this, but you could also write some custom code.
* for lambda applications (TBC)

If you have investigated all options for running your application locally, and have decided it is not workable, you have two other options.

1. If your application uses cloud infrastructure, you can deploy a temporary isolated instance/stack of the provider for the purposes of the Pact tests. If you can ensure that each stack is completely isolated from any other stacks, you can run multiple stacks at the same time, and hence, get feedback to developers or testers much earlier than option number 2.
2. If you cannot create an isolated stack for each pact verification run, then you should create a separate environment just dedicated to running Pact verification tests. The CI build created to run the pact verification step should not allow concurrent builds, and the build should be able to deploy an arbitrary version of the provider, perferrably identified by a commit. This will allow it to work correctly when triggered by branch of the provider, and to support the `contract_requiring_verification_published` webhooks which require the production version of the provider to be run against the changed pact. The downside of this approach is that verification builds will need to queue, and feedback will be slower.

Note that when either of these options is used, you do not need to run `can-i-deploy` before deploying to the Pact specific environment, as a failure would stop you being able to run the verification in the first place. You should still use `can-i-deploy` for your other pre-prod or production environments however, as per the standard [CI/CD setup](/pact_nirvana/step_4).

## My team wants to run the application inside docker as they feel that running it inside a docker with http server is much more realistic scenario in line with production.

Contract testing is not about providing a realistic situation. It's about testing your requests and responses in focussed way, isolating the application under test from causes of failure that are unrelated to the contents of the requests and responses \(eg. networking issues, deployment problems, race conditions, downstream service unavailability\)

The types of tests that are about providing realistic situations are end-to-end tests, smoke tests, canary tests, performance tests etc. Incidentally, these types of tests are really bad at checking request/response correctness because their scope is so broad, it's hard to tell exactly what has gone wrong when something fails.

## Should pact files be used for Postman collections to execute integration tests?

You can do this, but would you be getting any extra benefit from it over your existing contract tests? Using contract tests should mean that the boring "when I send this request, I get this response" kind of tests are already done. Viewing the pacts and the verification results in a Pact Broker \(including interaction level results if using Pactflow\) will allow QAs to see what has already been covered, and allow them to identify any gaps, rather than just repeating existing automated tests. This should allow them to spend more time on high value exploratory manual testing.

## Does implementing contract tests means we have to get rid of existing integration tests with Postman?

The introduction of contract testing allows you to reduce your integrated and e2e tests - but how much they reduce them depends heavily on your situation. Some teams skip the integrated and e2e tests altogether, and some teams keep a smaller set that is focussed on the "business value" scenarios rather than the "is this request/response right" kind of scenarios.

## Should I commit the generated pacts into the consumer's repository?

You can if you want, but it's not necessary unless you have another use for them (like using them for stubs). Most people add them to the .gitignore file to avoid having to re-commit them every time they change.

## How can I tell if I have good contract test coverage of my API?

This is actually the wrong question to be asking. Contract tests aren't intended to provide any particular percentage coverage of the _provider_ (that's what the provider's own functional tests are for). Contract tests are meant to provide (as close to) 100% coverage of the _consumer_ code that makes the calls to the provider (you can think of this as the "provider client code"). If you execute your consumer Pact tests in a separate step in your test suite, you can use standard code coverage tools to determine whether or not your Pact tests have covered a sufficient percentage of your provider client code.

