---
title: How to see what has changed in a pact
---

## Most recent change

To see the most recent change to a pact \(eg. to determine why a provider verification has failed\):

1. Paste the pact url into your browser. This will bring up a HTML view of the pact.
2. Click the `HAL browser` link to open the pact up in the HAL browser.
3. Click the `GET` button for the link named "Diff with previous distinct version of this pact"

![](https://raw.githubusercontent.com/wiki/pact-foundation/pact_broker/images/diff-previous-distinct-link.png)

1. You will see a resource describing the last changes that were made to the pact.

   ![](https://raw.githubusercontent.com/wiki/pact-foundation/pact_broker/images/diff-previous-distinct.png)

## Two arbitrary pacts

1. Open both of the pacts in the API browser (open them in the Pact Broker/Pactflow, then click on the "API" button/link). 
2. On one of them, scroll down to the `pb:diff` relation. Click on the green `?` button for that relation.
3. Go to the other pact, and copy the SHA that you'll see next to the `pb:pact-version` relation.
4. Enter that in the `pactVersion` value in the form. Click `Follow URI`.
