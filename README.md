# DBSpeed for Homebrew

A Homebrew tap for [DBSpeed](https://github.com/ericphamm/dbflux), a fork of DBFlux, on macOS.

## First install

### 1. Install Homebrew

Skip this step if `brew --version` already prints a version in Terminal.

Open **Terminal** (Applications → Utilities → Terminal) and run:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

The installer asks for your Mac password. Nothing is shown while you type it, which is
normal. If macOS offers to install the Command Line Tools, accept and wait for them.

At the end, the installer prints a **Next steps** section. On a Mac with Apple silicon
(M1 or newer), run the two commands it shows. They usually look like this:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
```

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Check that it works:

```bash
brew --version
```

### 2. Install DBSpeed

```bash
brew install --cask ericphamm/dbspeed/dbspeed
```

DBSpeed is installed in Applications. Start it from Launchpad or Spotlight.

The builds are not notarized by Apple. The cask removes the download quarantine, so macOS
opens the app without the "unidentified developer" warning.

### 3. Allow access to saved passwords

The first time DBSpeed connects after an install or an update, macOS asks whether
DBSpeed may use each saved password. Enter your Mac password and click **Always Allow**.
macOS asks again after every update, because each build is a new program to it.

## Update

```bash
brew upgrade --cask dbspeed
```

To update automatically in the background, turn on Homebrew's own autoupdate once:

```bash
brew tap homebrew/autoupdate
```

```bash
brew autoupdate start 86400 --upgrade --cleanup
```

It checks once a day (86400 seconds) and upgrades DBSpeed with your other packages.

## Without Homebrew

1. Open the [releases page](https://github.com/ericphamm/dbflux/releases) and, under the
   newest release, download `dbflux-macos-arm64.dmg` for a Mac with Apple silicon, or
   `dbflux-macos-amd64.dmg` for a Mac with an Intel processor.
2. Open the DMG and drag **DBSpeed** to Applications.
3. Because the build is not notarized, remove the download quarantine before the first
   start:

   ```bash
   xattr -dr com.apple.quarantine /Applications/DBSpeed.app
   ```

An install made this way does not update itself. DBSpeed shows a notice when a newer
release exists, and you download it the same way.

## How the cask is kept current

Every DBSpeed release updates `Casks/dbspeed.rb` with the new version and checksums.
Release candidates are included, so the cask always points to the newest build.
