---
title: Requirements
sidebar_label: Requirements
---
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

1 of the following languages, depending on which examples you want to run.

- Node 16+
- Java 17+
- Python 3.9+
- Rust
- Dotnet 8
- Go 1.21+

To run the kafka queue and applications E2E (not required for Pact testing)

[Docker](https://www.docker.com)
[Docker Compose](https://docs.docker.com/compose/install/)

**Workshop flavours**:

The workshop is designed in a variety of languages, in order to showcase Pact's many first class client facing DSL's and also highlight the interoperability of Pact.

- Pact-JS
- Pact-JVM
- Pact-Net
- Pact-Go
- Pact-Python
- Pact-Rust

You can mix and match any of the examples.

There are sub-folders with both a `consumer` and `provider` application, in the format

`<application>-<language>-<queue_type>`

- consumer-dotnet-kafka
- provider-dotnet-kafka
- consumer-rust-kafka
- provider-rust-kafka
- consumer-go-kafka
- provider-go-kafka
- provider-python-kafka
- consumer-python-kafka
- provider-js-kafka
- consumer-js-kafka
- consumer-java-kafka
- provider-java-kafka

If you have trouble, reach out in [Slack](https://slack.pact.io), we appreciate contributions and fixes back
to the workshops as well.

## Clone the workshop repo

SSH

```sh
git clone git@github.com:pact-foundation/pact-workshop-message.git
```

HTTPS

```
git clone https://github.com/pact-foundation/pact-workshop-message.git
```

GitHub CLI

```
gh repo clone pact-foundation/pact-workshop-message
```

<hr/>