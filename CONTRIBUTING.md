# Contributing

Contributions are very welcome, from beginners and experienced Pact users alike. Please chat to us in the `#documentation` channel of the [Pact Foundation Slack workspace](https://slack.pact.io) if you have any questions or suggestions, or raise an issue in the Github repository for bugs that you can't submit a PR for yourself.

## Content updates

* Click on the `EDIT` link of the page you want to update.
* You will be prompted to create a fork. Please do so.
* Make your changes.
* Open a PR back to the `docs.pact.io` repository.

You can test our your changes locally if you have Docker Compose by cloning your fork and running `docker-compose up`.

## Page additions/deletions/relocations

For more significant changes, like adding pages or changing URLs, you will need to checkout the repository locally. See the instructions in the README.

## Syncing docs from a new repository

1. Prepare development environment
    1. Install Ruby 2.6 ish
    1. Install the bundler gem `gem install bundler -v 2.0.2`
    1. Install the gems `bundle install`
1. Copy one of the sync scripts from [/scripts/sync](/scripts/sync) and modify it to sync from the desired repository to the desired path.
1. Run it by executing `bundle exec scripts/sync/your_new_script.rb`
1. Update [/website/sidebars.json](/website/sidebars.json) to include the new section and pages.
1. Update [.github/workflows/sync-docs.yml](.github/workflows/sync-docs.yml) with an event for the new repository.
1. In the source repository, copy [this workflow]((https://github.com/pact-foundation/pact-js/blob/master/.github/workflows/trigger_pact_docs_update.yml)) into the corresponding location.
1. If the source repository is in the `pact-foundation` organisation and you have permissions, modify the scope of the `GHTOKENFORTRIGGERINGPACTDOCSUPDATE` secret so that it can be used by the repo. Otherwise, ask @bethesque to do it.
