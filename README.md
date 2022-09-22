<p align="center">
    <a href="https://github.com/ActionsToolbox/">
        <img src="https://cdn.wolfsoftware.com/assets/images/github/organisations/actionstoolbox/black-and-white-circle-256.png" alt="ActionsToolbox logo" />
    </a>
    <br />
    <a href="https://github.com/ActionsToolbox/gem-build-and-release-action/actions/workflows/cicd-pipeline.yml">
        <img src="https://img.shields.io/github/workflow/status/ActionsToolbox/gem-build-and-release-action/CICD%20Pipeline/master?style=for-the-badge" alt="Github Build Status">
    </a>
    <a href="https://github.com/ActionsToolbox/gem-build-and-release-action/releases/latest">
        <img src="https://img.shields.io/github/v/release/ActionsToolbox/gem-build-and-release-action?color=blue&label=Latest%20Release&style=for-the-badge" alt="Release">
    </a>
    <a href="https://github.com/ActionsToolbox/gem-build-and-release-action/releases/latest">
        <img src="https://img.shields.io/github/commits-since/ActionsToolbox/gem-build-and-release-action/latest.svg?color=blue&style=for-the-badge" alt="Commits since release">
    </a>
    <br />
    <a href=".github/CODE_OF_CONDUCT.md">
        <img src="https://img.shields.io/badge/Code%20of%20Conduct-blue?style=for-the-badge" />
    </a>
    <a href=".github/CONTRIBUTING.md">
        <img src="https://img.shields.io/badge/Contributing-blue?style=for-the-badge" />
    </a>
    <a href=".github/SECURITY.md">
        <img src="https://img.shields.io/badge/Report%20Security%20Concern-blue?style=for-the-badge" />
    </a>
    <a href="https://github.com/ActionsToolbox/gem-build-and-release-action/issues">
        <img src="https://img.shields.io/badge/Get%20Support-blue?style=for-the-badge" />
    </a>
    <br />
    <a href="https://wolfsoftware.com/">
        <img src="https://img.shields.io/badge/Created%20by%20Wolf%20Software-blue?style=for-the-badge" />
    </a>
</p>

## Overview

```yaml
name: Publish Gem

on:
  push:
    tags:
      - v*
jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2

      - name: Release Gem
        uses: ActionsToolbox/gem-build-and-release-action@master
        env:
          RUBYGEMS_API_KEY: ${{secrets.RUBYGEMS_API_KEY}}
          PUSH: false
```
