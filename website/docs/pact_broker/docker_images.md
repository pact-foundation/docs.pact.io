---
title: Dockerized Pact Broker
sidebar_label: Overview
---

The Pact Broker is an application for sharing for Pact contracts and verification results, and is required for integrating Pact into CI/CD pipelines.

There are currently two supported Docker images: one which based on [Alpine, running on Puma](/pact_broker/docker_images/pactfoundation), and one which is based on [Ubuntu, running Phusion Passenger](/pact_broker/docker_images/dius). See [Which Docker image should I use?](#which-docker-image-should-i-use) for a comparison.

While there are [high level instructions][rollyourown] provided for running the application outside of Docker, we cannot provide support for these installations, as there are too many variables.

## In a hurry?

If you want to try out a Pact Broker that can be accessed by all your teams, without having to fill in infrastructure requisition forms and wait for 3 months, you can get a free trial at <a href="https://pactflow.io/?utm_source=github&utm_campaign=dockerized_pact_broker_index"/>pactflow.io</a>. Built by a group of core Pact maintainers, Pactflow is a fork of the OSS Pact Broker with extra goodies like an improved UI, field level verification results, and user and teams management. It's also fully supported, and that means when something goes wrong, *someone else* gets woken up in the middle of the afternoon to fix it...


## Which Docker image should I use?

The `pactfoundation` image:

* Uses Puma on Alpine
* Is smaller
* Does not require root to run (and hence, can only run on ports above 1024)
* Will not restart itself if it crashes
* Is more suited to being run by a Docker container orchestration service (ECS, Fargate, Kubernetes etc.)

The `dius` image:

* Uses Passenger on Ubuntu
* Is bigger
* Requires root to run (and hence, can run on ports under 1024)
* Will restart the child processes if they crash.

Please read https://github.com/phusion/passenger/wiki/Puma-vs-Phusion-Passenger for information on which server will suit your needs best. The tl;dr is that if you want to run the docker image in a managed architecture which will make your application highly available (eg. ECS, Kubernetes) then use the Puma based `pactfoundation/pact-broker`. Puma will not restart itself if it crashes, so you will need external monitoring to ensure the Pact Broker stays available.

If you want to run the container as a standalone instance, then the `dius/pact-broker` image which uses Phusion Passenger may serve you better, as Passenger will restart any crashed processes.


[rollyourown]: https://github.com/pact-foundation/pact_broker#rolling-your-own
