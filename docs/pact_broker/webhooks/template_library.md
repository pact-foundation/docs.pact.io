---
title: Webhooks template library
---

Please feel free add any that you think might be useful to others.

## Github - publish commit status

Report the pact verification status back to the consumer project in Github.

```javascript
{
  "consumer": {
    "name": "<consumer name>"
  },
  "events": [
    {
      "name": "contract_published"
    },
    {
      "name": "provider_verification_published"
    }
  ],
  "request": {
    "method": "POST",
    "url": "https://api.github.com/repos/<organization>/<project>/statuses/${pactbroker.consumerVersionNumber}",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": {
      "state": "${pactbroker.githubVerificationStatus}",
      "description": "Pact Verification Tests",
      "context": "${pactbroker.providerName} ${pactbroker.providerVersionTags}",
      "target_url": "${pactbroker.verificationResultUrl}"
    },
    "username": "USERNAME",
    "password": "PASSWORD"
  }
}
```

## Slack - post notification

```text
{
  "request": {
    "method": "POST",
    "url": "https://hooks.slack.com/services/<webhook id>",
    "body": {
      "channel": "#<your-channel-here>",
      "username": "webhookbot",
      "text": "New version of pact created for ${pactbroker.consumerName}/${pactbroker.providerName}: ${pactbroker.pactUrl}",
      "icon_emoji": ":ghost:"
    }
  }
}
```

## Travis - trigger build

```javascript
{
  "events": [{
    "name": "contract_content_changed"
  }],
  "request": {
    "method": "POST",
    "url": "https://api.travis-ci.org/repo/<organization>%2F<project>/requests",
    "headers": {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Travis-API-Version": "3",
      "Authorization": "token TOKEN"
    },
    "body": {
      "request": {
        "message": "Triggered by changed pact for ${pactbroker.consumerName} version ${pactbroker.consumerVersionNumber}",
        "branch":"master",
        "config": {
          "env": {
            "global": [
              "PACT_URL=${pactbroker.pactUrl}"
            ]
          }
        }
      }
    }
  }
}
```

Ref:

* [Travis triggering builds docs](https://docs.travis-ci.com/user/triggering-builds)

## Bamboo - trigger build

> If you use Bamboo and have worked out how to pass in parameters to the build, can you please submit a PR to update this example.

```javascript
{
  "request": {
    "method": "POST",
    "url": "http://master.ci.my.domain:8085/rest/api/latest/queue/SOME-PROJECT?os_authType=basic",
    "username": "username",
    "password": "password",
    "headers": {
      "Accept": "application/json"
    }
  }
}
```

Ref:

* [Bamboo Queue documentation](https://docs.atlassian.com/atlassian-bamboo/REST/4.0/?_ga=2.99385502.104409444.1592869883-400989189.1592276231#idp263696)

## Visual Studio Team Services - trigger build

```text
{
  "request": {
    "method": "POST",
    "url": "https://<instance>/DefaultCollection/<project>/_apis/build/builds?api-version=2.0",
    "headers": {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "<authorization>"
    },
    "body": {
      "definition": {
        "id": <build-definition-id>
      },
      "sourceBranch": "refs/heads/master",
      "parameters": "{\"pactUrl\":\"${pactbroker.pactUrl}\"}"
    }
  }
}
```

## CircleCI - trigger workflow build

N.B - currently need to use a personal API token \(ideally for a machine user\)

```text
{
  "events": [
    {
      "name": "contract_content_changed"
    }
  ],
  "request": {
    "method": "POST",
    "url": "https://circleci.com/api/v1.1/project/<VCS>/<ORG>/<REPO>/build?circle-token=****",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": {
      "branch": "<BRANCH>"
    }
  }
}
```

## Bitbucket - pipeline trigger build of a branch

```text
{
  "events": [{
    "name": "contract_content_changed"
  }],
  "request": {
    "method": "POST",
    "url": "https://api.bitbucket.org/2.0/repositories/{workspace}/{repo_slug}/pipelines/",
    "headers": {
        "Content-Type": "application/json"
    },
    "username": "username",
    "password": "password",
    "body": {
        "target": {
            "ref_type": "branch",
            "type": "pipeline_ref_target",
            "ref_name": "your_branch_name"
          }
    }
  }
}
```

Ref:

* [Bitbucket API page](https://developer.atlassian.com/bitbucket/api/2/reference/resource/repositories/%7Bworkspace%7D/%7Brepo_slug%7D/pipelines/)
* [Bitbucket App Password](https://confluence.atlassian.com/bitbucket/app-passwords-828781300.html)


## Buildkite - trigger build

```
{
  "events": [
    {
      "name": "contract_content_changed"
    }
  ],
  "request": {
    "body": {
      "branch": "master",
      "commit": "HEAD",
      "message": "Build all the things! :rocket:",
      "env": {
        "PACT_URL": "${pactbroker.pactUrl}"
      }
    },
    "headers": {
      "Authorization": "Bearer TOKEN",
      "Content-Type": "application/json"
    },
    "method": "POST",
    "url": "https://api.buildkite.com/v2/organizations/<ORG>/pipelines/<PIPELINE>/builds"
  }
}
```

Ref:

* [Buildkite API](https://buildkite.com/docs/apis/rest-api/builds#create-a-build)


## GitLab - trigger build

> If you use Gitlab and have worked out how to pass parameters into the build, can you please submit a PR to update this example.

```json
{
  "request": {
    "method": "POST",
    "url": "https://gitlab.com/api/v4/projects/:id/ref/:ref/trigger/pipeline?token=:token",
    "headers": {
      "Accept": "application/json"
    }
  },
  "events": [
    {
      "name": "contract_content_changed"
    }
  ]
}
```

Ref:

* [GitLab - Adding a new trigger](https://docs.gitlab.com/ee/ci/triggers/#adding-a-new-trigger)
* [GitLab - Pipeline triggers](https://docs.gitlab.com/ee/api/pipeline_triggers.html)

## TeamCity - trigger build

```json
{
  "events": [
    {
      "name": "contract_content_changed"
    }
  ],
  "request": {
    "method": "POST",
    "url": "https://teamcity.net/app/rest/buildQueue?",
    "headers": {
      "Content-Type": "application/xml",
      "Authorization": "bearer token"
    },
    "body": "<build><buildType id='YourJobId'\/><\/build>",
    "username": "username",
    "password": "password"
    }
}
```

Ref:

* [TeamCity - REST Authentication](https://www.jetbrains.com/help/teamcity/rest-api.html#RESTAPI-RESTAuthentication)
* [TeamCity - Triggering Build](https://www.jetbrains.com/help/teamcity/rest-api.html#RESTAPI-TriggeringaBuild)
