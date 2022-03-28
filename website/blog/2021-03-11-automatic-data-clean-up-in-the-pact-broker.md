---
title: Automatic data clean up in the Pact Broker
author: Beth Skurrie
authorURL: https://twitter.com/bethskurrie
tags: [pact]
keywords: [pact]
date: 2021-03-11
draft: false
hide_table_of_contents: true
---

When a Pact Broker instance has accumulated large amounts of data, its performance can start to degrade. A new feature has been released in the Pact Foundation's Pact Broker Docker image to allow old, unused data to be removed automatically from the Pact Broker at a configured schedule. 
The clean up can either run on a cron schedule from the Pact Broker application container, or it can be executed from an external location, independent of the running instance. 
Read more about the clean feature in the [Maintenance section of our Pact Broker docs.](https://docs.pact.io/pact_broker/administration/maintenance/)