---
title: How to see what has changed in a pact
---

## Most recent change

To see the most recent change to a pact \(eg. to determine why a provider verification has failed\):

1. On your Broker homepage, click on the _View Pact_ icon you want to diff ;
    ![click `view pact`](/img/see-changes-pact/view-pact.png)
2. On the _Pact_ page, click on the `…` on the right and visit _View in API Browser_ (aka _HAL Browser_) ;
    ![visit `View in API Browser`](/img/see-changes-pact/pact-view-in-api-browser.png)
3. On the _API Browser_ page search for `pb:diff-previous-distinct` and click the _Follow Link (green icon)_ ;
    ![search for `pb:diff-previous-distinct`](/img/see-changes-pact/pact-compare-previous-version.png)

4. You will see a resource describing the last changes that were made to the pact.
   ![](https://raw.githubusercontent.com/wiki/pact-foundation/pact_broker/images/diff-previous-distinct.png)

## Two arbitrary pacts

1. Get the version number of the Pact you want to compare:
   1. Go to the Matrix and click _Pact Published_ the first ;
      ![click `Pact Published`](/img/see-changes-pact/get-pact-version.png)

   2. On the _API Browser_ page search for `pb:pact-version` and copy the value (a SHA hash) ;
       ![search for `pb:pact-version`](/img/see-changes-pact/pact-version.png)

2. **Repeat for the pact you want to use as a base** for the comparison but this time search for `pb:diff` ;
3. Click the _Query URI Template_ (green question mark) ;
    ![search for `pb:diff`](/img/see-changes-pact/compare-specific-version.png)

4. Paste the first SHA you copied and click _Follow URI_ to see the result.
    ![Query URI Template](/img/see-changes-pact/pact-query-uri-template.png)
