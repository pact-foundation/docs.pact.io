---
title: Deleting resources
---

All resources can be deleted by sending an HTTP Delete request to the resource URL. The easiest way is to do that using the embedded API Browser, which you can get to by clicking the "API Browser" link on the Pact Broker index page.

Once you have opened the API Browser, either paste the URL of the resource you wish to delete into the location bar and press `Go`, or navigate to the resource using the relations in the `Links` section. Once you've reached the resource you want to delete, in the `Links` section, click on the `NON-GET` button for the `self` relation. Set the `Method` to `DELETE` and then press `Make Request`.

Note that if you delete a pacticipant resource, all related pacticipant versions, pacts, verifications and webhooks get deleted along with it. If you delete a pacticipant version resource, the associated pacts and verifications get deleted with it. Otherwise, you can just delete an individual pact resource.

## Deleting a pacticipant

* Open the API browser.
* Under the `Links` section, click on the green arrow next to the `pb:pacticipants` relation. A list of pacticipants will be shown.
* Under the `Links` section, click on the yellow `!` button next to the pacticipant you wish to delete. A form to submit a request will be shown.
* Change the `Method:` to `DELETE` and then click `Make Request`.


## Deleting multiple pacts

You can delete all pacts for a given consumer/provider by sending a `DELETE` request to `/pacts/provider/{provider}/consumer/{consumer}/versions`. 

To delete only those from certain branch, the path is `/pacts/provider/{provider}/consumer/{consumer}/branch/{branch}`.

To delete only those with a certain tag, the path is `/pacts/provider/{provider}/consumer/{consumer}/tag/{tag}`.

