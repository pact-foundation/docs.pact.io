---
title: Gotchas
---

## Pact follows [Postel's law](https://en.wikipedia.org/wiki/Robustness_principle)

_Be conservative in what you send_ - when the mock server in the consumer project compares the actual request with the expected request, the actual request body is not allowed to contain fields that are not defined in the expected request body. We don't want the situation where our real consumer is "leaking" data that we don't know about.

_Be liberal in what you accept_ - when verifying a pact in the provider project, the response body and headers may contain fields that were not defined in the expectations, on the assumption that any extra field will be ignored by your consumer. This allows a provider to evolve without breaking existing consumers \(unlike the bad old WSDL days\).

## But Pact breaks Postel's law for request headers

The exception to this is the request headers - we have found that frameworks tend to add their own headers, and that maintaining these can be extremely tedious, so be aware that if you are using a header that will change the behavior of the provider, you _must_ specify it in your expectations.

## An empty hash in the response means "allow any hash"

Following Postel's law, when verifying a pact in the provider project, the response body and headers may contain fields that were not defined in the expectations. This means that if you specify an empty hash, you are actually saying, "expect a hash here with anything in it".

## You cannot expect a field to not be present in a response

Following Postel's law, the provider may return fields that the consumer will just ignore. The provider may have a pact with another consumer that requires those fields, so your consumer cannot tell the provider what it should not do. It can only specify what it should do.

## Consumer language != Provider language

If you are writing tests on the Consumer side with a different language on the Provider side, you must ensure you use a common Pact Specification between them or you will be unable to validate the Pacts. Currently, all official languages are at least v2.0 compatible.

## I have a problem of which I solved with regex, now I have two problems

Be one with your regex and know what you're matching. Take for example validating an enum field with this regex: `(OBJECT|STRING|INTEGER|FLOAT|BOOLEAN|TIME)`.  All's well until it's not!

A change in the provider enum can easily break the compatibility of the API, and this unfortunate matcher may provide an unintended verification result as it does not match on the full string (it's missing the `^` and `$` at each end).  For example, adding `_RESULT` to the enum names will not break a pact with this regular expression, so the change from `INTEGER` to `INTEGER_RESULT` would not be picked up. For durability, try `^(OBJECT|STRING|INTEGER|FLOAT|BOOLEAN|TIME)$` instead.

