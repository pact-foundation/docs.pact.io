---
title: Troubleshooting
---

## error 'relation "schema_migrations" does not exist' on initial startup

```
pact-broker_1  | 2020-06-25 23:35:35.260038 I [9:46932295825940] pact-broker -- (0.000373s) SELECT NULL
postgres_1     | 2020-06-25 23:35:35.260 UTC [59] ERROR:  relation "schema_migrations" does not exist at character 27
postgres_1     | 2020-06-25 23:35:35.260 UTC [59] STATEMENT:  SELECT NULL AS "nil" FROM "schema_migrations" LIMIT 1
pact-broker_1  | 2020-06-25 23:35:35.261053 E [9:46932295825940 logging.rb:88] pact-broker -- PG::UndefinedTable: ERROR:  relation "schema_migrations" does not exist
pact-broker_1  | LINE 1: SELECT NULL AS "nil" FROM "schema_migrations" LIMIT 1
pact-broker_1  |                                   ^: SELECT NULL AS "nil" FROM "schema_migrations" LIMIT 1
pact-broker_1  | 2020-06-25 23:35:35.264397 I [9:46932295825940] pact-broker -- (0.000323s) SELECT NULL
pact-broker_1  | 2020-06-25 23:35:35.276711 I [9:46932295825940] pact-broker -- (0.012223s) CREATE TABLE "schema_migrations" ("filename" text PRIMARY KEY)
pact-broker_1  | 2020-06-25 23:35:35.277418 I [9:46932295825940] pact-broker -- (0.000461s) SELECT NULL
postgres_1     | 2020-06-25 23:35:35.278 UTC [59] ERROR:  relation "schema_info" does not exist at character 27
postgres_1     | 2020-06-25 23:35:35.278 UTC [59] STATEMENT:  SELECT NULL AS "nil" FROM "schema_info" LIMIT 1
pact-broker_1  | 2020-06-25 23:35:35.278912 E [9:46932295825940 logging.rb:88] pact-broker -- PG::UndefinedTable: ERROR:  relation "schema_info" does not exist
pact-broker_1  | LINE 1: SELECT NULL AS "nil" FROM "schema_info" LIMIT 1
pact-broker_1  |                                   ^: SELECT NULL AS "nil" FROM "schema_info" LIMIT 1
pact-broker_1  | 2020-06-25 23:35:35.279876 I [9:46932295825940] pact-broker -- (0.000532s) SELECT NULL
```

The way the Sequel gem determines if a table exists or not is by attempting to query it. If it doesn't exist, an error is logged. This is normal and expected, as the schema_migrations table and schema_info tables do not exist the very first time the application is started up. Do not panic! As you can see, the tables are then created in the next statements.

## 409 when publishing a pact

When a pact is published normally \(via a PUT to `/pacts/provider/PROVIDER/consumer/CONSUMER/version/CONSUMER_APP_VERSION`\) the `consumer`, `provider` and `consumer version` resources are automatically created.

To prevent a pacticipant \(consumer or provider\) being created multiple times with slightly different name variants \(eg. FooBar/foo-bar/foo bar/Foo Bar Service\), if a new pacticipant name is deemed similar enough to an existing name, a 409 will be returned.

If you get a 409, you have two options.

  * Manually create the pacticipant with the desired name (recommended)
  * Disable the potential duplicate checking (not recommended).

To see what has changed between two versions of a pact, see [this guide](https://docs.pact.io/pact_broker/advanced_topics/see_changes_pact).

### Manually creating the pacticipant via curl

If the pact broker requires authentication, include '-u yourusername:yourpassword' in the command.

```
curl -v -XPOST -H "Content-Type: application/json" \
      -d '{"name": "YourNewPacticipantName"}' \
      http://broker/pacticipants
```

### Manually creating the pacticipant via the API Browser

You can create the pacticipant manually through the API browser of the Pact Broker.

  * Click on the API Browser link at the top right of the index page
  * Find the `pb:pacticipants` relation in the `Links` section.
  * Click on the yellow `NON-GET` button that has a `!` on it.
  * Enter the following in the `Body:` section.

      ```
      {
        "name": "YourNewPacticipantName"
      }
      ```
  * Click `Make Request`.
  * You should see `201 Created` in the `Response Headers` section, and the full JSON document for the newly created pacticipant in the `Response Body` section.

### Disabling the potential duplication checking

If you wish to turn this name checking feature off, see the [configuration settings](/pact_broker/configuration/settings.md#checking-for-potential-duplicate-pacticipant-names) page.
