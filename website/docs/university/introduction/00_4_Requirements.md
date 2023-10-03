---
title: Requirements
sidebar_label: Requirements
---
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';


[Docker](https://www.docker.com)

[Docker Compose](https://docs.docker.com/compose/install/)


Depending on the workshop

- [Node + NPM](https://nodejs.org/en/)
- Other any other language as prescribed by the workshop

One of the workshop flavours

* [JS](https://github.com/pact-foundation/pact-workshop-js)
* [Golang](https://github.com/pact-foundation/pact-workshop-go)
* [.NET](https://github.com/pactflow/pact-workshop-dotnet-core-v1)
* [JVM - Gradle/Junit4/Springboot](https://github.com/pact-foundation/pact-workshop-jvm-spring)
* [JVM - Maven/Junit5/Springboot](https://github.com/pact-foundation/pact-workshop-Maven-Springboot-JUnit5)
* [Ruby](https://github.com/DiUS/pact-workshop-ruby-v2)
* [Android](https://github.com/DiUS/pact-workshop-android)

We would recommended the JS workshop, and will assume you are using that for the rest of the tutorial.

The principles apply in the other workshops, but some of the commands might vary slight. Each projects documentation
should contain up to date commands relative to each language.

If you have trouble, reach out in [Slack](https://slack.pact.io), we appreciate contributions and fixes back
to the workshops as well.

## Clone the workshop repo

<Tabs
groupId="sdk-choice"
defaultValue="javascript"
values={[
{label: 'Javascript', value: 'javascript', },
]}>
<TabItem value="javascript">

SSH

```sh
git clone git@github.com:pact-foundation/pact-workshop-js.git
```

HTTPS

```
git clone https://github.com/pact-foundation/pact-workshop-js.git
```

GitHub CLI

```
gh repo clone pact-foundation/pact-workshop-js
```

</TabItem>
<TabItem value="java">
</TabItem>
<TabItem value="java">
</TabItem>
<TabItem value="gradle">
</TabItem>
<TabItem value="ruby">
</TabItem>
<TabItem value="python">
</TabItem>
<TabItem value="C#">
</TabItem>
<TabItem value="golang">
</TabItem>
</Tabs>

<hr/>

## Moving through steps

_NOTE: Each step is tied to, and must be run within, a git branch, allowing you to progress through each stage incrementally._

_EG: Move to step 2:_

_`git checkout step2`_

<Tabs
groupId="sdk-choice"
defaultValue="javascript"
values={[
{label: 'Javascript', value: 'javascript', },
]}>
<TabItem value="javascript">

_`npm install`_

</TabItem>
<TabItem value="java">
</TabItem>
<TabItem value="java">
</TabItem>
<TabItem value="gradle">
</TabItem>
<TabItem value="ruby">
</TabItem>
<TabItem value="python">
</TabItem>
<TabItem value="C#">
</TabItem>
<TabItem value="golang">
</TabItem>
</Tabs>

<hr/>