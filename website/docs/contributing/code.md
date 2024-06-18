---
title: Contributing to the code
sidebar_label: Contributing to the code
---

We encourage contribution to any of our libraries, if you see something that should be fixed, simply do the following:

1. Fork it
2. Create your feature branch \(`git checkout -b my-new-feature`\)
3. Commit your changes \(`git commit -am 'feat: Add some feature'`\)
4. Push to the branch \(`git push origin my-new-feature`\)
5. Create new Pull Request

## Commit messages

Pact Libraries tend to use the [Conventional Changelog](https://github.com/bcoe/conventional-changelog-standard/blob/master/convention.md) commit message conventions to simplify automation process. Please ensure you follow the guidelines.

You can take a look at the git history (git log) to get the gist of it. If you have questions, feel free to reach out in in our [slack community](https://pact-foundation.slack.com/).

### Release notes

Commit messages with `fix` or `feat` prefixes will appear in the release notes. These communicate changes that users may want to know about.

- `feat(<scope>):` or `feat:` messages appear under "New Features", and trigger minor version bumps.
- `fix(<scope>):` or `fix:` messages appear under "Fixes and improvements", and trigger patch version bumps.

If your commit message introduces a breaking change, please include a footer that starts with `BREAKING CHANGE:`. For more information, please see the [Conventional Changelog](https://github.com/bcoe/conventional-changelog-standard/blob/master/convention.md) guidelines.

(Also, if you are committing breaking changes, you may want to check with the other maintainers on slack first).

- Examples of `fix` include bug fixes and dependency bumps that users of the pact library may want to know about.

- Examples of `feat` include new features and substantial modifications to existing features.

- Examples of things that we'd prefer not to appear in the release notes include documentation updates, modified or new examples, refactorings, new tests, etc. We usually use one of chore, style, refactor, or test as appropriate.

## New Features

If you would like to see a bigger feature, or see `Pact` implemented in another language, please check out the [Pact specification](https://github.com/pact-foundation/pact-specification) and have a chat to one of us on the Pact Slack workspace ([signup](https://slack.pact.io)|[login](https://pact-foundation.slack.com)).

The vision is to have a compatible `Pact` implementation in all the commonly used languages, your help would be greatly appreciated!
