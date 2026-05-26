# homebrew-multipass

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

Homebrew casks do not support installing arbitrary older versions directly, but you can pin to a specific release by editing the cask locally:

```sh
# 1. Find the cask file
brew edit h3ct0rjs/multipass/multipass

# 2. Change `version` and `sha256` to the target release, then install
brew install h3ct0rjs/multipass/multipass
```

SHA256 checksums for every release are listed on the [Multipass releases page](https://github.com/canonical/multipass/releases).

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
