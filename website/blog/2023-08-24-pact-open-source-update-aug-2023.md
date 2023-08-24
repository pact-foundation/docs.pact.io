---
title: Pact Open Source Update — August 2023
author: Yousaf Nabi
authorURL: https://twitter.com/you54f
tags: [pact, oss, community]
keywords: [pact, oss, community]
date: 2023-08-24
draft: false
hide_table_of_contents: false
---

:wave: Hello, its August, hope you've had a great summer so far, and enjoyed a nice well-deserved break.

However if you've been in the office, _not_ worrying about your deployments because you use Pact, huzzah.

Whatever you've been up to, the community has been busy aswell, so we've rounded up some of the latest happenings in the world of Pact to sink your teeth into.

## OSS Updates

It has been another busy month in the world of Pact, I've pulled out some changes from the changes from community to showcase in our latest round of Open Source updates.

- Pact Docs
- Pact Getting started
- Pact Go
- Pact Broker
- Pact Rust
- Pact JVM
- Pact Ruby
- Pact Python
- Pact PHP
- Pact Erlang
- Pact CLI Tooling

### Pact Docs

#### MUnit (Mule4) with Pact Recipe

Are you an MulesSoft user running MUnit?
If so, check out the [latest recipe](https://docs.pact.io/recipes/munit) on our site, kindly provided by [Grace Sandford](https://github.com/TheTreeofGrace)!

Got something you want to share? Why not drop in a pull request. You can find out ways you can help [here](https://docs.pact.io/contributing#pact---how-you-can-help)

### Pact Getting Started

Our Pact getting started guide has been updated to the latest pact-js version, which prepackages the pact ffi runtime, meaning it will be even easier for users with only a current version of node to get up and running.

https://github.com/pact-foundation/pact-5-minute-getting-started-guide

Fancy creating one in your favourite Pact client language? Whats stopping you?

### Pact-Go

Thanks [Boreyuk](https://github.com/boreyuk) for picking up this [golintci task](https://github.com/pact-foundation/pact-go/issues/320) in the following [pull request](https://github.com/pact-foundation/pact-go/pull/323)

A great quality of life improvement for maintainers and contributors of pact-go, and a better user experience, with some of the changes made.

It just goes to show that not all improvements need to be big, and you can drop in and help out maintainers anywhere. If you don't know where to start, just ask!

### Pact-Broker

[Beth](https://github.com/bethesque) making us all laugh again with this [comment](https://github.com/pact-foundation/pact_broker/pull/631#issuecomment-1685566664) whilst she took some time out on cold Aussie Saturday arvo to bust out a beast of a feature, improving performance of the matrix when multiple selectors are specified.

### Pact Rust

Beth did Rust!

https://github.com/pact-foundation/pact-reference/pull/312

Looking to improve on the error messages returned in various scenarios during provider verification.

Why not hope into Slack or GitHub and let us know what would be on your wish list, to help you when it goes wrong.

### Pact-JVM

- The maintainer of [Kotlin-Logging](https://github.com/oshai/kotlin-logging) [Osad Shai](https://github.com/oshai), dropped in and upgraded his library in Pact-JVM in this [PR](https://github.com/pact-foundation/pact-jvm/pull/1703). It's awesome to see some real world testing from a package maintainer, I like doing the smae when I am fixing up open source projects. The test subjects are the one's already using your libraries. It is also why I get stoked to see public repos showcasing Pact.

- [Victor Enaud](https://github.com/victorenaud) spotted a [bug](https://github.com/pact-foundation/pact-jvm/issues/1705) in Pact-JVM, applied a [fix](https://github.com/pact-foundation/pact-jvm/pull/1706) which ultimately was rejected in favour of another solution, but we are super grateful for both the excellent report, and an attempted solution!

### Pact-Ruby

- Using Faraday 2.5 or later? [Lluís Xavier Casals Garcia](https://github.com/lluis-jt) has you covered with this [PR](https://github.com/pact-foundation/pact-provider-verifier/pull/107) in the pact-provider-verifier

### Pact-Python

Checkout a sample of the PactV3 interface, powered by the Pact FFI in the following [pull request](https://github.com/pact-foundation/pact-python/pull/367)

You can also find more V3 examples [here](https://github.com/YOU54F/pact-python/tree/3.0.0b0/examples/v3) and a grpc example [here](https://github.com/YOU54F/pact-python/blob/3.0.0b0/examples/v4/grpc/test_grpc_consumer.py)

I'm inviting Pythonistas who are itching for that V3 and V4 functionality to collaborate with me on the aforementioned PR to help bring your Python projects up to be speed with all the latest pact features.

```python
"""pact test for product service client"""

import logging
import os

import pytest
from pact import PactV3
from pact.ffi.native_mock_server import MockServerStatus
from pact.matchers_v3 import Like, Format
from src.consumer import ProductConsumer

log = logging.getLogger(__name__)
logging.basicConfig(level=logging.INFO)
print(Format().__dict__)

PACT_MOCK_HOST = '127.0.0.1'
PACT_MOCK_PORT = 8888
PACT_DIR = os.path.dirname(os.path.realpath(__file__))


@pytest.fixture
def consumer():
    return ProductConsumer(
        'http://{host}:{port}'
        .format(host=PACT_MOCK_HOST, port=PACT_MOCK_PORT)
    )


@pytest.fixture(scope='session')
def pact(request):
    pact = PactV3(
        'pactflow-example-consumer-python-v3',
        'pactflow-example-provider-python-v3',
        hostname=PACT_MOCK_HOST,
        port=PACT_MOCK_PORT,
        pact_dir="./pacts",
    )

    return pact

def test_get_product(pact: PactV3, consumer):
    expected = {
        'id': "27",
        'name': 'Margharita',
        'type': 'Pizza'
    }

    (pact
     .new_http_interaction('interaction')
     .given('a product with ID 10 exists')
     .upon_receiving('a request to get a product')
     .with_request('GET', '/product/10')
     .will_respond_with(200, body=Like(expected), headers=[{"name": 'content-type', "value": 'application/json'}]))

    with pact:
        pact.start_service()
        user = consumer.get_product('10')
        assert user.name == 'Margharita'
        result = pact.verify()
        assert MockServerStatus(result.return_code) == MockServerStatus.SUCCESS

```

### Pact-PHP

[Tien Vo](https://github.com/tienvx) has been working had in the pact-php ffi branch, introducing an auto-installing plugins feature in this [PR](https://github.com/pact-foundation/pact-php/pull/330).

You can pick this up in the latest alpha from packagist. See the release [here](https://github.com/pact-foundation/pact-php/releases/tag/10.0.0-alpha2)

Have you tried this out in your project? Why not let us know in [#pact-php](https://pact-foundation.slack.com/archives/C9W94PXPY) in Slack.

### Pact-Erlang

[Srijan Choudhary](https://github.com/srijan) announced pact_erlang version `0.2.0` has been released with the new map-based DSL: https://github.com/greyorange-labs/pact_erlang

```erlang
PactRef = pact:v4(<<"myapp">>, <<"animal_service">>),
AnimalObject = #{<<"name">> => <<"Mary">>, <<"type">> => <<"alligator">>},
{ok, Port} = pact:interaction(PactRef,
#{
    given => <<"an alligator with the name Mary exists">>,
    upon_receiving => <<"a request to GET an animal: Mary">>,
    with_request => #{
        method => <<"GET">>,
        path => <<"/animals/Mary">>
    },
    will_respond_with => #{
        status => 200,
        headers => #{
            <<"Content-Type">> => <<"application/json">>
        },
        body => thoas:encode(AnimalObject)
    }
}),
?assertMatch({ok, AnimalObject}, animal_service_interface:get_animal(Port, "Mary")),
{ok, matched} = pact:verify(PactRef),
pact:write(PactRef, <<"./pacts">>),
pact:cleanup(PactRef).
```

### Pact CLI tooling

Would you want to see all our pact cli tooling, in a single place?

Is file size a concern to you?

I had a go at a consolidated bundle of our ruby/rust tooling, to aid migration.

Why not take a look at this [PR](https://github.com/pact-foundation/pact-ruby-standalone/pull/117) and let us know your thoughts?

What about getting them [all in a single file](https://github.com/pact-foundation/pact-ruby-standalone/issues/118)? :O

Hop onto [Slack](https://slack.pact.io/), or drop us a message in GitHub and provide your input!

## Community Events

Are you hosting events about Pact? Why not let us know!

### DevOps Playground: Get hands-on with Pact, Mule 4 and MUnit (London)

The DevOps Playground meetup event are hosting another event showcasing Pact at the end of August.

https://www.meetup.com/devopsplayground/events/295147445/

You can check out the one they performed last year Pact-NET and dotnet.

Youtube: https://www.youtube.com/watch?v=VDigIOV7lzM

## Pacto - A blast from the past

Have you ever heard of [Pacto](https://github.com/thoughtworks/pacto)?

Nope, that's not a typo, Pacto is another Ruby implementation of a library that provides a mock service and provider verification using consumer driven contracts, originally cooked up at ThoughtWorks.

It's now fallen out of maintenance, but many of our long-standing community contributors both remember and tip our hats to Pacto and its champions, for helping raise contract-testing awareness.

[Marthinus Engelbrecht](https://github.com/marthinus-engelbrecht) updated our docs to reflect this in this [PR](https://github.com/pact-foundation/docs.pact.io/pull/278)

## Pactober

We've been squirreling away organising an awesome lineup for [Pactober's](https://pact.io/pactober) main event on the 10th October. You can see the updated pages in the below links.

- [Full Schedule](https://pact.io/pactober#schedule_container)
- [Main Event](https://pact.io/birthday)

Add your own event!

- Chat to us in out [Pactober Slack](https://pact-foundation.slack.com/archives/C05G8DSD82U) channel
- Drop a pull request on the website using the [following template](https://github.com/pact-foundation/pact.io/blob/master/pages/pactober/2023/template.html) with:-
  - Your proposed event time
  - Your Event landing page

We can't wait for you to get involved, whether you attend one of the sessions throughout the month, or you decide to host something yourself. Long live Pact and its awesome community!

## Thats a wrap

That’s it for this month. Stay safe and carry on coding!

- Yousaf Nabi — Developer Advocate at PactFlow and Community Shepherd at Pact.
