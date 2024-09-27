---
title: Upgrading
---

The Pact Broker follows semantic versioning rules, and will not knowingly introduce a breaking change to a publicly released feature without incrementing the major version. Features in developer preview or beta release that have been enabled using the [`PACT_BROKER_FEATURES`](/pact_broker/configuration/settings#features) setting may change in a non-backwards compatible way however.

Database schema and data migrations are performed on application startup. They are designed to be backwards compatible and to correctly handle requests and migrate data in the situation where there is a rolling deployment, and data may be coming in to the database via an instance of the previous version as well as the new version.

We recommend you back up your database before performing an upgrade, just to be on the safe side, and choose a time of day when the traffic is low, so that any lengthy data migrations to not impact on performance.

## For Docker images

Change the tag to the latest available version (following semantic versioning rules) from the [pact-foundation](https://hub.docker.com/r/pactfoundation/pact-broker/tags?page=1&ordering=last_updated) organisation, and redeploy your Docker managed infrastructure. Remember not use the tag `latest`, for a production installation of the Pact Broker.

## For native Ruby installations

We don't recommend installing the Ruby application directly, as it is very difficult for the maintainers to provide support, and the user is required to be experienced in running native Ruby applications. If you do run the application this way, upgrading just requires updating the version of the `pact_broker` gem in the Gemfile to the latest version, and running `bundle update`. The application needs to then be redeployed.

## Pact Broker versions &gt;= 2.1.0

Backwards compatibility tests will ensure that the latest version of the database will be compatible with a previous version of the code until v3.0.0 for the following endpoints:

* Tag version
* Publish pact
* Retrieve latest pact
* Retrieve latest pact for tag

This means that zero downtime rolling upgrades for architectures that use multiple web servers \(eg. Amazon autoscaling groups\) are supported between any two versions from 2.1.0.

When backwards-incompatible changes need to be made in the future, a zero downtime upgrade path will documented on this page.

## Pact Broker &lt; 2.1.0

The upgrades between 1.18.0 and 2.1.0 contains database migrations that are NOT backwards compatible with previous versions of the code. It is recommended to run a single instance of the broker while performing an upgrade that traverses these versions.

