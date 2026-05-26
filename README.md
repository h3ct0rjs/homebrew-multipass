# homebrew-multipass

[![Autobump](https://github.com/h3ct0rjs/homebrew-multipass/actions/workflows/autobump.yml/badge.svg)](https://github.com/h3ct0rjs/homebrew-multipass/actions/workflows/autobump.yml)

Homebrew tap for [Multipass](https://github.com/canonical/multipass/) — tracks **all** releases including release candidates.

## Install

```sh
brew tap h3ct0rjs/multipass
brew install multipass
```

This tap follows the **most recently published release**, whether that is a stable release or a release candidate. Check which version is currently in the cask before installing:

```sh
brew info h3ct0rjs/multipass/multipass
```

## Installing a specific version

Each release — stable and RC — gets its own versioned cask in this tap, so you can install any of them directly:

```sh
brew install h3ct0rjs/multipass/multipass@1.16.2
brew install h3ct0rjs/multipass/multipass@1.16.3-rc2
```

To list all available versions:

```sh
brew search h3ct0rjs/multipass/multipass
```

## Staying on stable only

If you only want stable releases and never RCs, use the official [homebrew-cask](https://github.com/Homebrew/homebrew-cask) tap instead:

```sh
brew install --cask multipass
```

## Upgrading

```sh
brew upgrade h3ct0rjs/multipass/multipass
```

## Autobump

A GitHub Actions workflow checks for new Multipass releases every 6 hours. When a new version with macOS assets is found — stable or RC — it opens a pull request to bump the cask. Releases that are tagged but have no uploaded binaries yet are skipped until the assets are available.
