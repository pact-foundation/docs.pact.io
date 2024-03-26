---
title: Pact Open Source Update — Mar 2024
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2024-03-26
draft: false
hide_table_of_contents: false
---

Welcome everyone, to that time of year when the 🕒 shifts an hour forward, the 🌞 shines on for a bit longer, which is nice, after a 🥶 and 🌧️ winter. It's March and we are live for another Pact Open Source update.

We've got lots of community contributions this month, and pleased to announce that Pact-PHP v10 is wrapping up for an official release, which will bring that Pact Rust core to more users, bringing speed and reliability benefits over the existing implementation. Huge props go out to [Tien Vo](https://github.com/tienvx) 👨🏻‍💻 for the incredible coding marathon, and [Lewis Cowles](https://github.com/Lewiscowles1986) 🕵️ for the code reviews.

## Pact OSS Updates

## Specific language updates

### PHP

Pact-PHP: V10 is nearly here. 🚀 This brings the Pact Rust core to Pact-PHP allowing support up to the Pact V4 specification, which includes http / async & sync message / plugin interaction support, as well as allowing these to all co-exist in a single Pact file.

Here is a bit of a timeline of activities:

- ✅[`10.0.0-alpha7` release](https://github.com/pact-foundation/pact-php/releases/tag/10.0.0-alpha7) just went live
- ✅ Creation of a [`release/9.x`](https://github.com/pact-foundation/pact-php/tree/release/9.x) branch from current `master` branch for anyone who still want to work on Ruby Standalone code.
- ✅ Merging of [`ffi`](https://github.com/pact-foundation/pact-php/tree/ffi) branch into `master`
  - [PR](https://github.com/pact-foundation/pact-php/pull/326)
- 🔜 Official release of Pact-PHP v10
  - `alpha` -> `beta` -> `release`

Once again we want to thank [Tien](https://github.com/tienvx) and [Lewis](https://github.com/Lewiscowles1986) for their efforts in bringing this across the line. It is a testament to open-source collaboration across the globe, and has been really fun to watch. I really hope you enjoy using the new release. Be sure to drop us feedback like [Steve Taylor](https://github.com/slt) did in this [_Github Issue_](https://github.com/pact-foundation/pact-php/issues/377)

>Not an issue as such, just want to say I love it. (I'm using 10-alpha3)
>It's so much faster and simpler, and I'm looking forward to using some of the newer Pact specification features.
> My API tests came across easily without much fuss.

Chat to us in: [#pact-php](https://pact-foundation.slack.com/archives/C9W94PXPY).

### Pact-Reference

Pact-Reference:

- Multi-Arch Docker images.
  - You [asked](https://github.com/pact-foundation/pact-reference/issues/397) for it, you got it!
    - `--platform=linux/amd64`
    - `--platform=linux/arm64`
    - DockerHub Images
      - [pact-ref-verifier](https://hub.docker.com/layers/pactfoundation/pact-ref-verifier/1.1.1/images/sha256-585fcb7ec5b6815efa7e598fb45b33c0fe252d2d3d62431128af57d8863b16dd?context=explore)

        ```sh
        docker pull pactfoundation/pact-ref-verifier:1.1.1
        ```

      - [pact-ref-mock-server](https://hub.docker.com/layers/pactfoundation/pact-ref-mock-server/1.0.5/images/sha256-7d6cf711e4503efde9d7a768d9cb6d4277229add2e7b263dcd84c2bbcd8c91aa?context=explore)

        ```sh
        docker pull pactfoundation/pact-ref-mock-server:1.0.5
        ```

      - [pact-stub-server](https://hub.docker.com/r/pactfoundation/pact-stub-server/tags)

        ```sh
        docker pull pactfoundation/pact-stub-server:0.5.3
        ```

  - Whats left?
    - CI pipeline to automate building/publishing of Docker images
    - Publishing of images to GitHub container registry

- Alpine Support
  - Linux binaries are now built with `musl` statically linked rather than `glibc` dynamically.
    - This means any Linux users, regardless of distribution should all be able to use a single architecture specific binary.
  - Releases
    - [pact-verifier-cli](https://github.com/pact-foundation/pact-reference/releases/tag/pact_verifier_cli-v1.1.1)

      ```sh
      curl -LO https://github.com/pact-foundation/pact-reference/releases/download/pact_verifier_cli-v1.1.1/pact_verifier_cli-linux-$(uname -m).gz
      gunzip pact_verifier_cli-linux-$(uname -m).gz
      mv pact_verifier_cli-linux-$(uname -m) pact_verifier_cli
      ./pact_verifier_cli --help
      ```

    - [pact_mock_server_cli](https://github.com/pact-foundation/pact-reference/releases/tag/pact_mock_server_cli-v1.0.5)

      ```sh
      curl -LO https://github.com/pact-foundation/pact-reference/releases/download/pact_mock_server_cli-v1.0.5/pact_mock_server_cli-linux-$(uname -m).gz
      gunzip pact_mock_server_cli-linux-$(uname -m).gz
      mv pact_mock_server_cli-linux-$(uname -m) pact_mock_server_cli
      ./pact_mock_server_cli --help
      ```

  - Whats left?
    - The following projects require updating to build single linux binaries built with musl
      - [pact-stub-server](https://github.com/pact-foundation/pact-stub-server)
      - [pact-plugin-cli](https://github.com/pact-foundation/pact-plugins/tree/main/cli)
      - [pact-protobuf-plugin](https://github.com/pactflow/pact-protobuf-plugin)
      - [pact-csv-plugin](https://github.com/pact-foundation/pact-plugins/tree/main/plugins/csv)
  - Pact FFI Alpine specific static and shared libraries
    - These are now published, and require consumption in client libraries. Contributions are welcome, otherwise you'll hopefully see these rolling out throughout the year.

Chat with us in: [#pact-rust](https://pact-foundation.slack.com/archives/CA2S7E6KC).

<!-- ### Pact-Plugins

Pact-Plugins: 

- 

Have you tried out Pact Plugins yet? What's stopping you?

Chat with us in: [#pact-plugins](https://pact-foundation.slack.com/archives/CA2S7E6KC). -->

<!-- ### .NET

Pact-net: 

- 

Chat with us in: [#pact-net](https://pact-foundation.slack.com/archives/C9UTHV2AD). -->

<!-- ### Golang

Pact-go: 

- 

Chat with us in: [#pact-go](https://pact-foundation.slack.com/archives/C9UTHTFFB). -->

### Node JS

#### Pact-JS

##### Pact-JS Features

:::info
Did you know, Pact-JS now supports the V4 Specification via the PactV4 interface. The documentation has been updated to reflect this. Found an issue or gap? Let us know

- [Consumer](https://docs.pact.io/implementation_guides/javascript/docs/consumer#consumer-package)
- [Messaging](https://github.com/pact-foundation/pact-js/blob/master/docs/messages.md)
- [Plugins](https://github.com/pact-foundation/pact-js/blob/master/docs/plugins.md)
- [Changelog](https://github.com/pact-foundation/pact-js/blob/master/CHANGELOG.md#1220-2024-02-09)

:::

Corporate proxy support was delivered by [Zac Poe](https://github.com/zac-poe-vg) in this [pull request](https://github.com/pact-foundation/pact-js/pull/1199)
 - feat(corporate proxy [#1188](https://github.com/pact-foundation/pact-js/issues/1188))

In Zac's words

>Add native support of HTTPS_PROXY and HTTP_PROXY for verifier for [#1188](https://github.com/pact-foundation/pact-js/issues/1188)
>
> This change adds two pieces of behavior:
>
> - The verifier's 2 step parse body behavior now uses a proxy request buffer (instead of the 'proxyReq' rewrite behavior) to ensure the request stream is accessible for intermediary agent behavior
> - The verifier natively supports HTTP_PROXY/HTTPS_PROXY config and assigns a proxy http Agent where those values are present
>
> This results in out-of-the-box support for corporate proxies in the js verifier

Thanks Zac 🙌

##### Pact-JS Fixes

[Dany Marques](https://github.com/danymarques) went down the NPM rabbit hole, to investigate the root cause of a very interesting bug, affecting NPM registry proxies, and npm script-jacking!

Some long nights with his detective hat on, saw Dany find a suitable workaround as an interim for the Pact-JS project, as well as upstream fixes to the npm project itself. We cannot thank you enough for your herculean efforts.

- [PR](https://github.com/pact-foundation/pact-js-core/pull/494)
- [Longest Slack thread ever xD - 213 replies!](https://www.linen.dev/s/pact-foundation/t/16633868/hell-all-quick-question-in-the-migration-guide-for-v12-it-s-#100081d7-2fee-4420-8eac-d55858dcc483)
- Read more about manifest confusion in this [medium blog](https://medium.com/checkmarx-security/manifest-confusion-dont-believe-what-you-see-how-attackers-can-trick-developers-c3c6419f3ae4) (You may want to use incognito mode, if you don't have an account)

Matt Fellows fixed an issue where matching rules are not supported in messages: [pact-foundation/pact-js#1183](https://github.com/pact-foundation/pact-js/pull/1183).

If you've been stuck on either of these issues, be sure to give it a re-test!

- [Use matchers when verifying metadata](https://github.com/pact-foundation/pact-js/issues/745)
- [(TypeScript) Cannot use V3 matchers within MessagePact. Types are incompatible.](https://github.com/pact-foundation/pact-js/issues/1133)


Chat with us in: [#pact-js](https://pact-foundation.slack.com/archives/C9VBGLUM9).

#### React/Cypress users

[Gearóid Ó Treasaig](https://github.com/gotreasa) upgraded one of our [example repos](https://github.com/pactflow/example-bi-directional-consumer-cypress) which contains our vanilla React "Product" API consumer used across all the JS HTTP based examples, and additionally includes Cypress and [Pact-Cypress-Adapter](https://www.npmjs.com/package/@pactflow/pact-cypress-adapter).

Gearóid utilized [graphite.dev](graphite.dev) to stage his pull-requests in distinct commits. The [PR](https://github.com/pactflow/example-bi-directional-consumer-cypress/pull/74) for good reading if you are preparing for upgrading some major dependencies in your JavaScript project, and want an example to follow. Thank you, we really appreciate it.

If you want to get involved, why not pull down the example and try it out, or apply upgrades to one of our many example repos. We would greatly appreciate it, and it is a neat way to start contributing to open source, if you haven't managed to already, but want to start somewhere!

<!-- ### Python

Pact-Python: 

Chat to us in: [#pact-python](https://pact-foundation.slack.com/archives/C9VECUP6E). -->

### Pact Broker

Pact-Broker: Multi-Platform support + GitHub container registry support.

Multi-platform images are available

- `--platform=linux/amd64`
- `--platform=linux/arm/v7`
- `--platform=linux/arm64`

- [DockerHub Image](https://hub.docker.com/r/pactfoundation/pact-broker)

    ```sh
    docker pull pactfoundation/pact-broker:latest
    ```

- [GitHub Container Registry Image](https://github.com/pact-foundation/pact-broker-docker/pkgs/container/pact-broker)

    ```sh
    docker pull ghcr.io/pact-foundation/pact-broker:latest
    ```

  - _Note:_ The Org name needs to match our GitHub org, so note the additional hyphen `-` between `pact-foundation`

#### Pact Broker on AWS Fargate with CDK

The beauty of the Pact Broker nature as a Docker image, means that it can be deployed in a multitude of different ways, and the architecture considerations are the end users to determine, implement and manage.

There are projects which seek to offer experiences with Terraform & Helm in order to provide some out-the-box experiences for regular deployment platforms.

Most of these have come from community contributions, either publicly displayed on GitHub, or shared back into the Pact-Foundation, such as [pact-broker-chart](https://github.com/pact-foundation/pact-broker-chart).

I'm pleased to announce that we've had a [community contribution](https://github.com/pact-foundation/pact-broker-docker/pull/176/files) by [learnautomatedtesting](https://github.com/learnautomatedtesting) of a PactStack, an open source tool utilizing gitlab AWS CDK to publish and deploy a serverless framework of the pactbroker and postgres database.

>PactStack is a serverless solution for running a Pact broker alongside a PostgreSQL database entirely on AWS Fargate, leveraging the AWS Cloud Development Kit (CDK) for infrastructure as code. This solution is designed to facilitate contract testing between microservices by providing a centralized broker for storing and retrieving Pact contracts. The stack includes an ECS cluster, Fargate services for the Pact broker and PostgreSQL database, a CloudWatch Log Group for logs, and an S3 bucket for storing Pacts.

You can check out the repository [here](https://gitlab.com/learnautomatedtesting/servicevirtualizationandpact/) and see it in action against a [full worked example](https://gitlab.com/learnautomatedtesting/pactexample)

We've not had the chance to test this out yet, but if it appeals to you, please feel free to try it out and let the author know if you have any issues.

Chat to us in: [#pact-broker](https://pact-foundation.slack.com/archives/C9VPNUJR2).


### Pact Ruby CLI

Pact-Ruby-CLI: Multi-Platform support + GitHub container registry support.

Multi-platform images are available

- `--platform=linux/amd64`
- `--platform=linux/arm/v7`
- `--platform=linux/arm64`

- [DockerHub Image](https://hub.docker.com/r/pactfoundation/pact-cli)

  ```sh
  docker pull pactfoundation/pact-cli:latest
  ```

- [GitHub Container Registry Image](https://github.com/pact-foundation/pact-ruby-cli/pkgs/container/pact-cli)

  ```sh
  docker pull ghcr.io/pact-foundation/pact-cli:latest
  ```
  - _Note:_ The Org name needs to match our GitHub org, so note the additional hyphen `-` between `pact-foundation`

Chat to us in: [#pact-ruby](https://pact-foundation.slack.com/archives/C9VHVEDE1).

### Pact Docs

[Martin Gallauner](https://github.com/MartinGallauner) is on his road to Pact Nirvana, and has been dropping some edits to the guide as he is working through it.

Thanks Martin, we really appreciate it and know that our end-users will to!

Did you know, that the majority of our website documentation was written by volunteers and it is a collective smattering of shared knowledge. A contract testing wikipedia if you will.

Whilst this is awesome, it can make a new users journey, a little disjointed at times, as they can feel overloaded with information.

We'd love to look at the documentation estate as a whole this year, and redesign our user journeys. If this appeals to you, why not get in touch.

## Community Events

### Women Who Go London Feb 2024

![image](https://github.com/pact-foundation/devrel/assets/19932401/85972fde-b5b6-42b3-8546-42795a95010b)

I had the pleasure of traveling down to London and speaking to a load of budding software-engineers at Deliveroo HQ about GoLang via the [Women Who Go London group](https://www.meetup.com/women-who-go-london/)!

> How do we test our applications now, what are the benefits and drawbacks of each way of testing and how does integration fit into all of it. Yousaf explains it all and provides examples on how to start contract testing with Go and Pact.

You can check out the slides [here](https://github.com/WWGLondon/talks/blob/main/2024_February/Yousaf_Nabi-Contract_testing_for_the_past_present_and_the_future_with_Pact-Go.pdf)

> Sanyia Saidova walks us through the journey of how to shape your platform to account for growth in your application - what decisions lay in your path as your userbase grows and how to weight them.

![IMG_5478](https://github.com/pact-foundation/devrel/assets/19932401/90abadbd-4628-4c55-9ef5-0b16291e371a)

You can check out Sanyia's slides [here](https://github.com/WWGLondon/talks/blob/main/2024_February/Sanyia_Saidova-Platforms_from_Prototype_to_Production.pdf)

Are you in, or near London? Do you love coding? Do you want to build a more diverse and inclusive Go community? Why not join us the [WWGL Meetup group](https://www.meetup.com/women-who-go-london/) and attend an event soon.

## Community shout-outs

Big shout outs go to these contributors for their efforts, big and small.

- [Tien Vo](https://github.com/tienvx) for his dedication and determination to complete the pact-php rust core migration, I'm sure it's been a learning journey and you've come out as an even better PHP developer. We hope you can take you learnings and apply in a day job, as many others will be able to apply your code against their projects, providing safety and guarantees for years to come.
- [Lewis Cowles](https://github.com/Lewiscowles1986) for the continual reviews in pact-php and support for Tien Vo.
- [Dany Marques](https://github.com/danymarques) for his tenacity in tracking down an obscure bug in the npm ecosystem, and creating upstream fixes, as well as resolving his issue in the interim in the pact-js project.
- [Gearóid Ó Treasaig](https://github.com/gotreasa) for a series of PR's to improve the quality and health of our examples.
- [learnautomatedtesting](https://github.com/learnautomatedtesting) for the Pact Broker AWS Fargate project and demo.
- [Zac Poe](https://github.com/zac-poe-vg) for corporate proxy support in Pact-JS

No matter the contributions, your work will make a positive impact to end users, who wish to benefit for Pact's feature-set, no matter the language or the tooling. We love seeing users bring fixes, improvements and new features to the Pact stable. We can help support you, if you aren't sure where to start.

What's stopping you?

## Thats a wrap

Want to carry on the conversation? Sign up [here](https://slack.pact.io/) to join our Slack community, where you will be amongst over 5k other users. It's a safe place to ask questions, and a great place to share the awesome work you are doing in the Pact ecosystem.

Whatever you are up to, let us know, and we can look to get you featured in the Pact post.

See you next month folks!

Cheers,
Saf
