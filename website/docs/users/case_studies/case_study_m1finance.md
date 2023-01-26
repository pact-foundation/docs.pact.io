---
title: Case Study - M1 Finance
---

> Published **29 Sep, 2021**

<p style={{textAlign:"center"}}><img src="/img/logos/brand/m1-logo-dark.svg" alt="M1 Logo" align="centre" /></p>

> **How hypergrowth FinTech, M1 Finance rapidly rolled out contract testing with PactFlow.**


> - **About**: [M1 Finance](https://www.m1finance.com/) is an all-in-one money management platform that helps self-directed investors achieve long-term financial wellness.
> - **Headquarters**: Chicago, Illinois - USA
> - **Industry**: Personal finance, mobile app
> - **Website**: https://www.m1finance.com/
> - **Customer since**: March, 2021

<p style={{textAlign:"center"}}><img src="/img/case_studies/m1/m1_group.png" alt="M1 Group" width="500" /></p>

### At a glance

M1 Finance (M1) is a Chicago-based personal financial app providing automated investing, borrowing and banking products to hundreds of thousands of Americans. Founded in 2015, [M1 Finance](https://www.m1finance.com/) is a hypergrowth FinTech—having recently hit a USD1.45 billion valuation and USD5B assets under management <sup><a href="#fn1" id="ref1">1</a></sup>

Head of Test Engineering, Bedford West, joined in February 2021, bringing sound rigour around the discipline of testing—an imperative given the company’s rapid growth.

Starting from a greenfield approach where there was limited testing in place to validate assumptions, M1 now has a cohesive strategy comprising more thorough integration, end-to-end, unit tests—plus contract testing. The greatest success, in Bedford’s mind, is giving the engineering and product teams across the company greater confidence in their build and deploy processes.

### The business need

M1 Finance, founded in 2015, is a hyper growth FinTech giving hundreds of thousands of Amercian’s more financial freedom. Currently sitting at a USD1.45 billion valuation and USD5B assets under management 1 more growth is on the agenda, including a host of new features in a short time.

When he began this new and important role at M1 Finance, Bedford could see some quick-wins were in order. Like many scaleups that have scaled fast, there was room to improve test coverage. So, one of Bedford’s first tasks was devising and implementing a holistic automation strategy.

As Bedford explains, M1 structures their product development capability across two separate departments—product and engineering—mediated by a central GraphQL API gateway. Product is responsible for the consumer facing applications and relies on services provided by engineering.

The platform backend had a solid and trusted set of unit tests, automated tests and integration tests in place and were operating with their own testing approach. Their tech stack, with Scala for the backend, lends itself well to building in a safe way.

While on the frontend API gateway, unit tests along with sparsely used integration and end-to-end tests were used. The team had wrangled a level of safety by working out of TypeScript. Even though this helps build stronger API connections with GraphQL, Bedford could see that there was not a strong set of test automation that you’d get with contract testing.

It was clear that with the ambitious vision to grow the platform, M1 needed better test coverage so teams had the confidence to move as fast as was required.

### The pains of scaling microservices

Like many scale-ups M1 was growing rapidly, resulting in a proliferation of teams and new technology such as the iOS and Android apps, the API gateway and web application for the product, even before the engineering side was considered. More and more, engineering would reach out to borrow bandwidth to help test new services and features.

#### The three main pain points he sought to solve were:

1. Communication and collaboration between engineering and product
1. Communication and collaboration within teams
1. Time consuming and manual testing processes

> About a third of development time was spent on manual API testing using ad hoc tools such as Postman. It immediately made sense to me—there was an opportunity for contract testing to really shine, especially given the barriers between teams.

### Getting started with contract testing

It was clear that contract testing was going to be an integral part of the test automation strategy.

Bedford was familiar with contract testing however it was at M1, where he paired with his colleague Ion Pinzari–Test Architect, that he first implemented contract testing. They followed a two stage approach to determine the fit for M1 and demonstrate value.

#### Stage one - prototype with Open Source Pact Broker

The first step was to put together the initial prototype. To do so, Bedford and Ion used the self-hosted Open Source Pact Broker locally. This worked for the prototype, but they quickly realised they would need a way to run it as a centralised piece of infrastructure if they were to use Pact across teams and integrate into their CI/CD infrastructure.


#### Stage two - assess the best approach to implement, using PactFlow

Bedford was aware of PactFlow and the features it offered over the self-hosted Pact Broker. Running into a few friction points with the initial prototype—namely the overheads of self-hosting and CI/CD pipeline, they had to consider the options for expanding the roll out: build and maintain or buy with added benefits.

So the second step was signing up to PactFlow’s Starter Plan, allowing them to easily involve other team members and add it to their CI/CD pipeline. Following this, and a successful demo to their team, the confidence to proceed with PactFlow for contract testing was confirmed.


> We realised it was much easier for us to get PactFlow up and running rather than building and supporting the self-hosted Pact Broker by running a proof of concept.

All in all, the process has taken less than six months—from proof of concept and bringing key stakeholders on the journey—they are now up and running with 17 services and counting.

> I would say the initial prototype was extremely quick given the documentation and the support is pretty solid and that was before I even knew about Pact Slack workspace!

<p style={{textAlign:"center"}}><img src="/img/case_studies/m1/m1-finance-arch-2021-08-20.png" alt="M1 Arch" width="500" /></p>

Network diagram of M1’s microservices architecture (generated via PactFlow on August 20, 2021)

### Bringing the team on the journey

While now a popular method of testing within complex microservices and API environments, contract testing does require a shift in mindset and process for teams taking it on board.

The exercise of building out the prototype was an important step to not only demonstrate the value of contract testing but the use of PactFlow as the best means for M1 Finance to apply contract testing.

Bedford found that his colleagues working on the API / front end side of the product grasped the benefits of contract testing with PactFlow easily.

Other parts of the broader team came with questions such as how contract testing differs from from Swagger (OpenAPI Specification) and why not focus more on end-to-end integration testing

The case for contract testing was simple: rather than generating a bulk of ineffective and expensive-to-maintain tests, contract testing with PactFlow saves time and gives a greater level of confidence

### Great results with contract testing: two use cases

Contract testing with PactFlow is alive and well at M1 Finance, giving many teams more mental freedom. Rather than having to worry about potential issues in advance, or having the entire system top of mind, engineers and product teams can focus on the task at hand, knowing that if there are problems they'll be caught.

Bedford shared two recent use cases with us that demonstrate how much they have achieved in a short period of time.

#### Use case one: roll out of a major backend feature for managing investments

Bedford was called upon by the team building the feature; they were seeking a way to deliver automated testing to ensure that if they turned off a service, nothing else would break.

This ended up being a great use case for contract testing due to the lack of end-to-end and UI tests employed at the time— contract testing with Pact provided unit level coverage in an easy to use and nimble way. Paired with PactFlow, the team had control and visibility of the status of the services, being able to validate easily through the build process, requiring less checkpoints along the way.

Moving forward in a more nimble way, with a higher level of confidence, is a major win in Bedford’s books.

#### Use case two: credit card for the platform

A second use case, the introduction of a credit card for the platform, required a great deal of complex integrations for the backend with external vendors. The introduction of contract testing with PactFlow meant that the team could validate the assumptions they were making were correct.



For Bedford and the team at M1, it’s not just about being able to operate at a higher velocity, it's about confidence. Without a holistic, automated test strategy and when using tools such as Postman, there’s a great deal of room for error. Including contract testing with PactFlow in his test automation strategy has meant teams can simply reveal both the provider and the consumer side of the contract and move forward with confidence when they see validation.

<p style={{textAlign:"center"}}><img src="/img/case_studies/m1/m1_bedford.png" alt="M1 Bedford" width="500" /></p>

[**Bedford West, Head of Test Engineering**](https://www.linkedin.com/in/bedfordwest/)

About Bedford:
> [Bedford West](https://www.linkedin.com/in/bedfordwest/) is the Head of Test Engineering at M1 Finance, a personal finance platform that helps people manage and grow their money. He formerly led testing and engineering teams at BenchPrep, Sprout Social, and the University of Chicago Center for Data Intensive Science. He loves to participate in and follow independent game development as a hobby. Bedford currently resides in Chicago.


<sup id="fn1">1.<a href="https://www.finextra.com/newsarticle/38459/m1-finance-raises-150m" title="Jump back to footnote 1 in the text."> https://www.finextra.com/newsarticle/38459/m1-finance-raises-150m</a><a href="#ref1" title="Jump back to footnote 1 in the text."> ↩</a></sup>


___