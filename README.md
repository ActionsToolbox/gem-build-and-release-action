<!-- markdownlint-disable -->
<p align="center">
    <a href="https://github.com/ActionsToolbox/">
        <img src="https://cdn.wolfsoftware.com/assets/images/github/organisations/actionstoolbox/black-and-white-circle-256.png" alt="ActionsToolbox logo" />
    </a>
    <br />
    <a href="https://github.com/ActionsToolbox/gem-build-and-release-action/actions/workflows/cicd.yml">
        <img src="https://img.shields.io/github/actions/workflow/status/ActionsToolbox/gem-build-and-release-action/cicd.yml?branch=master&label=build%20status&style=for-the-badge" alt="Github Build Status" />
    </a>
    <a href="https://github.com/ActionsToolbox/gem-build-and-release-action/blob/master/LICENSE.md">
        <img src="https://img.shields.io/github/license/ActionsToolbox/gem-build-and-release-action?color=blue&label=License&style=for-the-badge" alt="License">
    </a>
    <a href="https://github.com/ActionsToolbox/gem-build-and-release-action">
        <img src="https://img.shields.io/github/created-at/ActionsToolbox/gem-build-and-release-action?color=blue&label=Created&style=for-the-badge" alt="Created">
    </a>
    <br />
    <a href="https://github.com/ActionsToolbox/gem-build-and-release-action/releases/latest">
        <img src="https://img.shields.io/github/v/release/ActionsToolbox/gem-build-and-release-action?color=blue&label=Latest%20Release&style=for-the-badge" alt="Release">
    </a>
    <a href="https://github.com/ActionsToolbox/gem-build-and-release-action/releases/latest">
        <img src="https://img.shields.io/github/release-date/ActionsToolbox/gem-build-and-release-action?color=blue&label=Released&style=for-the-badge" alt="Released">
    </a>
    <a href="https://github.com/ActionsToolbox/gem-build-and-release-action/releases/latest">
        <img src="https://img.shields.io/github/commits-since/ActionsToolbox/gem-build-and-release-action/latest.svg?color=blue&style=for-the-badge" alt="Commits since release">
    </a>
    <br />
    <a href="https://github.com/ActionsToolbox/gem-build-and-release-action/blob/master/.github/CODE_OF_CONDUCT.md">
        <img src="https://img.shields.io/badge/Code%20of%20Conduct-blue?style=for-the-badge" />
    </a>
    <a href="https://github.com/ActionsToolbox/gem-build-and-release-action/blob/master/.github/CONTRIBUTING.md">
        <img src="https://img.shields.io/badge/Contributing-blue?style=for-the-badge" />
    </a>
    <a href="https://github.com/ActionsToolbox/gem-build-and-release-action/blob/master/.github/SECURITY.md">
        <img src="https://img.shields.io/badge/Report%20Security%20Concern-blue?style=for-the-badge" />
    </a>
    <a href="https://github.com/ActionsToolbox/gem-build-and-release-action/issues">
        <img src="https://img.shields.io/badge/Get%20Support-blue?style=for-the-badge" />
    </a>
</p>

## Overview

This action works by executing the following commands:

- bundle install
- gem build --output=latest-release.gem
- gem push latest-release.gem
> Assuming `PUBLISH` is set to `true` which is the default.

We create and publish the gems this way for a few very specific reasons:

- We want to minimise the permissions that need to be given to the action.
- We do not want the action to make any changes to the existing repository.
- We want the action to only execute the minimum steps required to build and publish a gem.

There are many other gems available that work with `rake release` if this is your preferred method.
The 2 that we recommend are below:

- [Release gem](https://github.com/rubygems/release-gem)
- [Publish rubygems action](https://github.com/cadwallion/publish-rubygems-action)
> Our action is closely based on `publish rubygems action`.

## Publish 

```yaml
name: Publish Gem

on:
  push:
    tags:
      - 'v[0-9].[0-9]+.[0-9]+'
      - '!v[0-9].[0-9]+.[0-9]+rc[0-9]+'

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Release Gem
        uses: ActionsToolbox/gem-build-and-release-action@master
        env:
          RUBYGEMS_API_KEY: ${{secrets.RUBYGEMS_API_KEY}}
```

## Build but Don't Publish 

```yaml
name: Test Publish Gem

on:
  push:
    tags:
      - 'v[0-9].[0-9]+.[0-9]+rc[0-9]+'

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Release Gem
        uses: ActionsToolbox/gem-build-and-release-action@master
        env:
          RUBYGEMS_API_KEY: ${{secrets.RUBYGEMS_API_KEY}}
          PUBLISH: false
```

<br />
<p align="right"><a href="https://wolfsoftware.com/"><img src="https://img.shields.io/badge/Created%20by%20Wolf%20on%20behalf%20of%20Wolf%20Software-blue?style=for-the-badge" /></a></p>
