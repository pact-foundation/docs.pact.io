# Pact Docs Website

[![Netlify Status](https://api.netlify.com/api/v1/badges/b5808ef1-8072-4687-84e8-2a0257f3ac8f/deploy-status)](https://app.netlify.com/sites/docs-pact-io/deploys)

![Sync Pact docs](https://github.com/pact-foundation/docs.pact.io/workflows/Sync%20Pact%20docs/badge.svg)

## Table of Contents
1. [Local development](#local-development)
2. [Adding pages](#adding-pages)
3. [Moving pages](#moving-pages)
4. [Automatic syncing from the markdown files in each Pact implementation repository](#automatic-syncing-from-the-markdown-files-in-each-pact-implementation-repository)
5. [Slack history](#slack-history)
6. [Hosting](#hosting)
7. [Search](#search)
8. [Contributing](#contributing)
9. [Contact](#contact)

## Local development

The files are markdown, stored under the `docs` directory.

You will need Docker and Docker Compose to run the docs application locally.

`docker-compose up`

## Adding pages

* Add the file to the appropriate path under the `docs` directory.
* Update [website/sidebars.json](website/sidebars.json).

## Moving pages

* Find the file under the `docs` directory.
* Move it to the directory/name you want.
* Update [website/sidebars.json](website/sidebars.json).
* Do a file search and replace to update any internal references to the page.
* Create a redirect in [netlify.toml](netlify.toml).

## Automatic syncing from the markdown files in each Pact implementation repository

The markdown files in the following directories are synced from their respective source repositories. Do not edit them directly! You'll be able to tell if it's a file that has been synced from another repository because the `custom_edit_url` will be set in the page metadata.

* `docs/implementation_guides/go`
* `docs/implementation_guides/javascript`
* `docs/implementation_guides/jvm`
* `docs/implementation_guides/python`
* `docs/implementation_guides/cpp`
* `docs/implementation_guides/rust`
* `docs/implementation_guides/net`
* `docs/pact_broker/client_cli`
* `docs/pact_broker/docker_images/`

Each of the above Pact repositories has a Github workflow that triggers the [sync-docs](.github/workflows/sync-docs.yml) workflow when any markdown files are edited on `master`.

When the sync-docs workflow runs, it pulls in the `master` markdown files from the changed repository, syncs and processes them, and then commits and pushes them. On push, Netlify automatically deploys.

## Slack history

Because the free version of slack only lets you read the last 10k of messages, and at the time of writing this (March 2021) that means about 97k messages are gone, it's helpful to have access to the history.

You can docs.pact.io/slack/

To update the export:

1. Download the latest extract from https://pact-foundation.slack.com/services/export
1. Extract into a directory
1. Download this php file (to e.g. `slack.php`) into the same directory as the export: https://gist.github.com/mefellows/1b825c86b2ff1063afbb2e5cb6b8cb3e
1. Run this script `php slack.php`
1. Sync the HTML files from `slack2html/html/*` into the `website/static/slack` directory

## Hosting

The Pact docs site is hosted by Netlify. Thanks!

The site will be automatically redeployed after any push to `master`.

<a href="https://www.netlify.com">
  <img src="https://www.netlify.com/img/global/badges/netlify-dark.svg" alt="Deploys by Netlify" />
</a>

## Search

The search is provided free by Algolia because Pact is an open source project. It is configured in docs.pact.io in `website/siteConfig.js`. It is configured in Algolia in https://github.com/algolia/docsearch-configs/blob/master/configs/pact.json The Algolia analytics page is [here](https://www.algolia.com/apps/BH4D9OD16A/analytics). Currently only Beth has access to it via her Github login. We may be able to add extra people, but she hasn't looked into that yet. Info on how to style the search UI is [here](https://docsearch.algolia.com/docs/styling/).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## Contact

* [Pact Foundation Slack workspace](https://slack.pact.io)
* [Twitter](https://twitter.com/pact_up)
