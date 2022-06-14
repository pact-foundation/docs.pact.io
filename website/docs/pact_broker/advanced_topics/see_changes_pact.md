---
title: How to see what has changed in a pact
---

## Most recent change

To see the most recent change to a pact \(eg. to determine why a provider verification has failed\):

1. On your Broker homepage, click on the _View Pact_ icon you want to diff ;
    ![image](https://user-images.githubusercontent.com/1212392/173522082-b517f597-aea1-483d-8575-5b26d2374f18.png)
2. On the _Pact_ page, click on the `…` on the right and visit _View in API Browser_ (aka _HAL Browser_) ;
    ![image](https://user-images.githubusercontent.com/1212392/173522860-97b36adb-6bdc-425e-be54-e243e233ea2b.png)
3. On the _API Browser_ page search for `pb:diff-previous-distinct` and click the _Follow Link (green icon)_ ;
    ![image](https://user-images.githubusercontent.com/1212392/173523999-3570049e-ce95-4af0-953d-19ff3792f957.png)

1. You will see a resource describing the last changes that were made to the pact.

   ![](https://raw.githubusercontent.com/wiki/pact-foundation/pact_broker/images/diff-previous-distinct.png)

## Two arbitrary pacts

1. Get the version number of the Pact you want to compare:
   1. Go to the Matrix and click _Pact Published_ the first 
      ![image](https://user-images.githubusercontent.com/1212392/173537744-99fdf424-af51-426c-936f-994030939458.png)
   1. On the _API Browser_ page search for `pb:pact-version` and copy the value (a SHA hash) ;
      ![image](https://user-images.githubusercontent.com/1212392/173538553-67f2796e-fafd-45a2-ade4-4a836c46db30.png)
1. Repeat for the pact you want to use as a base for the comparison but this time search for `pb:diff`
1. Click the _Query URI Template_ (green question mark)
    ![image](https://user-images.githubusercontent.com/1212392/173539446-f8fed2aa-c072-447f-9f96-726b3769f18b.png)
1. Paste the first SHA you copied and click _Follow URI_ to see the result
    ![image](https://user-images.githubusercontent.com/1212392/173540379-b89eb292-ff25-4c25-82f4-30f58469ffd3.png)
