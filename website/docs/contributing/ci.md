---
title: CI/CD Systems
sidebar_label: CI/CD Systems
---

## Testing

We aim to support testing locally on all platforms, as well as using automated CI scripts.

We suggest avoiding putting logic out of CI workflow yaml files and instead prefer shell files.

We believe it makes testing locally so much easier.

> The workflow files should just contain code that wires the CI platform into your own scripts.

Because of this, you should find a `script` or `scripts` folder in the repo, with all the relevant commands, see other pact-foundation repos, if you are unsure.

For your particular repo, check the following

- `./github/workflows` folder for github action jobs
- `.cirrus.yml` workflow for cirrus-ci jobs

### Tested Platforms

- Windows
- MacOS
- Linux

### Tested Architectures

- x86_64 / x64
- arm64 / aarch64

### CI Systems

We utilize a combination of

- GitHub Actions
  - Windows x86_64
  - MacOS x86_64
  - Linux x86_64 / amd64
- Cirrus-CI
  - MacOS arm64
  - MacOS x86_64 emulation via Rosetta
  - Linux arm64
  - Linux x86_64 / amd64

### CI Testing Table

This is a CI testing table for `pact-ruby-standalone` - You should aim to try and cover as many as possible.

| OS     | Standalone Version     | Architecture | Tested |
| -------| ------- | ------------ | --------- |
| OSX    | v2.0.0     | x86_64       | GitHub Actions            |
| OSX    | v2.0.0     | aarch64 (arm)| Cirrus CI         |
| Linux  | v2.0.0  | x86_64       | GitHub Actions          |
| Linux  | v2.0.0  | aarch64 (arm)| Cirrus-CI       |
| Windows| v2.0.0 | x86_64       | GitHub Actions        |
| Windows| v2.0.0 | x86       | Untested        |
| Windows| v2.0.0 | aarch64 (via x86 emulation) |  Untested       |

### Running as the CI system locally

You should be able to run the steps shown in the CI workflows, from your local machine, however there are some additional options available to you

> "Think globally, act locally"

There are a couple of ways, you can act as the CI system locally.

- GitHub Actions
  - [Act](https://github.com/nektos/act) (all hosts)
- Cirrus-CI
  - [Cirrus-cli](https://github.com/cirruslabs/cirrus-cli) (all hosts)
  - [Tart.run](https://github.com/cirruslabs/tart/) (macOS hosts)

These will provide you the ability to run the following combinations.

| OS     | CI System        | Architecture  | Tool  | Notes |
| ------ | ---------------- | ------------- | ----- | ----- |
| Linux  | GitHub Actions   | x86_64        | act   | requires docker |
| Linux  | Cirrus CI        | x86_64        | cirrus-cli   | requires docker or podman and x86_64 host |
| Linux  | Cirrus CI        | aarch64       | cirrus-cli    | requires docker or podman and aarch64 host |
| macOS  | Cirrus CI        | aarch64       | cirrus-cli / tart.run   | requires MacOS arm64 (M1/M2) host, can test with or without rosetta |

#### Act notes

In any repo with a `.github/workflows/*.yml` file in, you can run

##### Running all the tasks

`act`

##### Reporters

Reporting is pretty good out the box, if a little noisy, especially when running multi-matrix ubuntu tasks

##### Running a single workflow

`act -W .github/workflows/x-plat.yml`

##### Running a single job

`act -W --job build_linux`

##### Passing in custom env vars

##### Passing in secrets

`act -s DOCKER_HUB_USERNAME=pactfoundation -s DOCKER_HUB_TOKEN=i<3Pact`

##### Using docker-compose inside a workflow

The base act image, doesn't have docker-compose in it, you can install it conditionally, using this [action](https://github.com/KengoTODA/actions-setup-docker-compose) 

    ```yaml
        - uses: KengoTODA/actions-setup-docker-compose@v1
            if: ${{ env.ACT }}
            name: Install `docker-compose` for use with https://github.com/nektos/act
            with:
            version: '2.15.1'
    ```

##### Gotchas

1. non `x86_64` / `amd64` hosts will need to pass the `--container-architecture linux/amd64` flag when running `act`
2. sometimes you get zombie containers that need killing.
3. not everything works, so sometimes it justs worth pushing the code to CI

#### Cirrus CLI notes

See https://github.com/cirruslabs/cirrus-cli for instructions on how to download the tool

_Note:_ Cirrus CLI only supports Linux container and macos_instance VMs at the moment.

In any repo with a `.cirrus.yml` file in, you can run

##### Running all the tasks

`cirrus run`

##### Reporters

By default, you are shown `stdout` but it is swallowed as each step passes. I would recommend using the `--output github-actions` command

`cirrus run --output github-actions`

##### Running a single task

`cirrus run "linux_arm64" --output github-actions`

##### Passing in custom env vars

`cirrus run "builder_ruby_source_linux" --output github-actions -e CIRRUS_CHANGE_TITLE="ci(cirrus): builder_ruby_source_linux"`

##### Load a dockerfile as an environment

_Note:_ Linux runners support the Dockerfile as a CI environment feature.

 https://cirrus-ci.org/guide/docker-builder-vm/#dockerfile-as-a-ci-environme

    ```yaml
        alpine_arm64_task: 
            arm_container:
                dockerfile: Dockerfile.alpine.arm64
                <<: *DOCKER_ARGS_ARM64_TEMPLATE
            <<: *TEST_TASK_TEMPLATE
    ```

##### Placeholders / Templating

We want to avoid repeating ourselves in our scripts, so we can use templates. Based on the `dockerfile` as an environment scenario above.

This allows us to reuse our tasks across cirrus-ci, and ideally run the same scripts in both GitHub Actions and Cirrus-CI, remembering our golden rule

> The workflow files should just contain code that wires the CI platform into your own scripts.
        ```yaml
        env:
        PACT_VERSION: 2.0.0
        TEST_TASK_TEMPLATE: &TEST_TASK_TEMPLATE
        test_script: uname -a && pact-mock-service --help
        DOCKER_ARGS_ARM64_TEMPLATE: &DOCKER_ARGS_ARM64_TEMPLATE
            docker_arguments:
            PACT_VERSION: $PACT_VERSION
            TARGET_ARCH: arm64
        DOCKER_ARGS_X64_TEMPLATE: &DOCKER_ARGS_X64_TEMPLATE
            docker_arguments:
            PACT_VERSION: $PACT_VERSION
            TARGET_ARCH: x86_64
        ```

##### Gotchas

1. You'll need at least 50gb to 100gb to run macOS instance tests locally, as they pull down a ventura virtual machine
2. If you get stuck on the steps for CI, you can boot a virtual macOS or linux machine, perform all the steps you need, test them out, then script them up
