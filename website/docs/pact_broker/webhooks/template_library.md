---
title: Webhooks template library
---

Please feel free add any that you think might be useful to others.

## Github - publish commit status

Report the pact verification status back to the consumer project in Github.

### CLI

```
pact-broker create-webhook \
  'https://api.github.com/repos/<organization>/<project>/statuses/${pactbroker.consumerVersionNumber}' \
  -X POST \
  -H "Content-Type: application/json" \
  -d '{ "state": "${pactbroker.githubVerificationStatus}", "description": "Pact Verification Tests ${pactbroker.providerVersionTags}", "context": "${pactbroker.providerName}", "target_url": "${pactbroker.verificationResultUrl}" }' \
  --user username:password \
  --description "Publish pact verification status to Github" \
  --contract-published \
  --provider-verification-published \
  --broker-base-url <your-broker>
```

### JSON

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
      "description": "Pact Verification Tests ${pactbroker.providerVersionTags}",
      "context": "${pactbroker.providerName}",
      "target_url": "${pactbroker.verificationResultUrl}"
    },
    "username": "USERNAME",
    "password": "PASSWORD"
  }
}
```

## Slack - post notification - contract_published

```javascript
{
  "events": [
    {
      "name": "contract_published"
    }
  ],
  "request": {
    "method": "POST",
    "url": "https://hooks.slack.com/services/<webhook id>",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": {
      "channel": "#<your-channel-here>",
      "username": "webhookbot",
      "text": "New version of pact created for ${pactbroker.consumerName}/${pactbroker.providerName}: <${pactbroker.pactUrl}|contract-details>",
      "icon_emoji": ":ghost:"
    }
  }
}
```
## Slack - post notification - provider_verification_published

```javascript
{
  "events": [
    {
      "name": "provider_verification_published"
    }
  ],
  "request": {
    "method": "POST",
    "url": "https://hooks.slack.com/services/<webhook id>",
    "headers": {
      "Content-Type": "application/json"
    },
    "body": {
      "channel": "#<your-channel-here>",
      "username": "webhookbot",
      "text": "Pact Verification published for $${pactbroker.consumerName}/$${pactbroker.providerName}<$${pactbroker.verificationResultUrl}|$${pactbroker.githubVerificationStatus}>",
      "icon_emoji": ":ghost:"
    }
  }
}
```

## GitHub - trigger build

Trigger a build in GitHub using the repository_dispatch event.

```javascript
{
  "events": [{
    "name": "contract_content_changed"
  }],
  "request": {
    "method": "POST",
    "url": "https://api.github.com/repos/<organisation>/<repository>/dispatches",
    "headers": {
      "Content-Type": "application/json",
      "Accept": "application/vnd.github.everest-preview+json",
      "Authorization": "Bearer ${user.GithubToken}"
    },
    "body": {
      "event_type": "pact_changed",
      "client_payload": {
        "pact_url": "${pactbroker.pactUrl}"
      }
    }
  }
}
```
Ref:

* [Github repository_dispatch docs](https://docs.github.com/en/free-pro-team@latest/rest/reference/repos#create-a-repository-dispatch-event)

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

```javascript
{
  "request": {
    "method": "POST",
    "url": "http://master.ci.my.domain:8085/rest/api/latest/queue/SOME-PROJECT?os_authType=basic?bamboo.variable.pact-url=${pactbroker.pactUrl}",
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

## Azure DevOps - trigger build

```json
{
  "request": {
    "method": "POST",
    "url": "https://<instance>/<organization>/<project>/_apis/build/builds?api-version=6.0",
    "headers": {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "<authorization>"
    },
    "body": {
      "definition": {
        "id": <build-definition-id>
      },
      "sourceBranch": "refs/heads/master"
    }
  }
}
```

Ref:

* [Azure DevOps Builds API page](https://docs.microsoft.com/en-us/rest/api/azure/devops/build/builds/queue?view=azure-devops-rest-6.0)

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

If you use Bitbucket and have worked out how to pass parameters into the build, can you please submit a PR to update this example.

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

```json
{
  "request": {
    "method": "POST",
    "url": "https://gitlab.com/api/v4/projects/:id/ref/:ref/trigger/pipeline?token=:token&variables[PACT_URL]=${pactbroker.pactUrl}",
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

If you use TeamCity and know out how to pass parameters into the build, can you please submit a PR to update this example.

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

## Jenkins - Trigger Build

The following example shows how to trigger a Jenkins build with parameters.

```json
{
  "description": "Trigger ${pactbroker.provider} build on Jenkins",
  "provider": {
    "name": "<PROVIDER>"
  },
  "consumer": {
  	"name": "<CONSUMER>"
  },
  "events": [{
    "name": "contract_content_changed"
  }],
  "request": {
    "method": "POST",
    "url": "https://<JENKINS_HOST>/job/listeners-acceptance/job/graphql/job/<JOB_NAME>/buildWithParameters?os_authType=basic",
    "username": "<USERNAME>",
    "password": "<TOKEN>",
    "headers": {
      "Accept": "application/json"
    }
  }
}
```

Ref:

* [Jenkins Remote API](https://www.jenkins.io/doc/book/using/remote-access-api/).
