# homebrew-multipass

Homebrew tap for [Multipass](https://github.com/canonical/multipass/) — tracks **all** releases including release candidates.

## Usage

```sh
brew tap h3ct0rjs/multipass
brew install multipass
```

## Autobump

A GitHub Actions workflow checks for new Multipass releases every 6 hours and opens a PR when a new version is found (stable and RC releases both trigger a bump).
