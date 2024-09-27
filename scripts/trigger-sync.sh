#!/bin/bash

curl -X POST https://api.github.com/repos/pact-foundation/docs.pact.io/dispatches \
      -H 'Accept: application/vnd.github.everest-preview+json' \
      -H "Authorization: Bearer $GITHUB_TOKEN" \
      -d '{"event_type": "pact-broker-docker-pactfoundation-docs-updated"}'

echo "See https://github.com/pact-foundation/docs.pact.io/actions?query=workflow%3A%22Sync+Pact+docs%22"