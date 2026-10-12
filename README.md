# DBSpeed for Homebrew

A Homebrew tap for [DBSpeed](https://github.com/ericphamm/dbflux), a fork of DBFlux.

## Install

```bash
brew install --cask ericphamm/dbspeed/dbspeed
```

DBSpeed is installed in Applications. The builds are not notarized by Apple, so the
cask removes the download quarantine. macOS then opens the app without the
"unidentified developer" warning.

## Update

```bash
brew upgrade --cask dbspeed
```

To update automatically in the background, turn on Homebrew's own autoupdate once:

```bash
brew tap homebrew/autoupdate
brew autoupdate start 86400 --upgrade --cleanup
```

It checks once a day (86400 seconds) and upgrades DBSpeed with your other packages.

## How the cask is kept current

Every DBSpeed release updates `Casks/dbspeed.rb` with the new version and checksums.
Release candidates are included, so the cask always points to the newest build.
