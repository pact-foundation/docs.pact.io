#!/bin/sh

if [ -z "${GITHUB_TOKEN}" ]; then
  echo "Please set GITHUB_TOKEN"
  exit 1
fi

scripts=$(find scripts/sync -name pact*.rb)

for script in "${scripts}"; do
  bundle exec "${script}"
done
