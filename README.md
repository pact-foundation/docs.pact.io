# Pact Docs Website

[![Netlify Status](https://api.netlify.com/api/v1/badges/b5808ef1-8072-4687-84e8-2a0257f3ac8f/deploy-status)](https://app.netlify.com/sites/docs-pact-io/deploys)

![Sync Pact docs](https://github.com/pact-foundation/docs.pact.io/workflows/Sync%20Pact%20docs/badge.svg)

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

The markdown files in the following directories are synced from their respective source repositories. Do not edit them directly!

* `docs/implementation_guides/go`
* `docs/implementation_guides/javascript`
* `docs/implementation_guides/jvm`
* `docs/implementation_guides/python`
* `docs/implementation_guides/cpp`
* `docs/implementation_guides/rust`
* `docs/pact_broker/docker_images/`

Each of the above Pact repositories has a Github workflow that triggers the [sync-docs](.github/workflows/sync-docs.yml) workflow when any markdown files are edited on `master`.

When the sync-docs workflow runs, it pulls in the `master` markdown files from the changed repository, syncs and processes them, and then commits and pushes them. On push, Netlify automatically deploys.

## Hosting

The Pact docs site is hosted by Netlify. Thanks!

The site will be automatically redeployed after any push to `master`.

<a href="https://www.netlify.com">
  <img src="https://www.netlify.com/img/global/badges/netlify-dark.svg" alt="Deploys by Netlify" />
</a>


## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## Contact

* [Pact Foundation Slack workspace](https://slack.pact.io)
* [Twitter](https://twitter.com/pact_up)
