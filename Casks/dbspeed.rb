cask "dbspeed" do
  arch arm: "arm64", intel: "amd64"

  version "0.10.0-rc.0"
  sha256 arm:   "0d4f994c6a0729157c87271198218dda51b84277aaab128f8d0d18bb3980b121",
         intel: "059c244a658522be53cd91af3eb1a09dfe8693caab79569269bc75605ee3c0ad"

  url "https://github.com/ericphamm/dbflux/releases/download/v#{version}/dbflux-macos-#{arch}.dmg"
  name "DBSpeed"
  desc "Keyboard-first database client, a fork of DBFlux"
  homepage "https://github.com/ericphamm/dbflux"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on :macos

  app "DBSpeed.app"

  # The builds are not notarized, so macOS would refuse to open a quarantined copy.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/DBSpeed.app"],
        writable_paths: ["DBSpeed.app"],
        writable_base:  :appdir
  end

  uninstall quit: "io.github.ericphamm.dbspeed"
end
