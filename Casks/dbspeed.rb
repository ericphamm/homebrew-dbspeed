cask "dbspeed" do
  arch arm: "arm64", intel: "amd64"

  version "0.10.0-rc.1"
  sha256 arm:   "f1d05ce5f866f9697c32d50c14d2e7648d02a11f83abd9e35ef5cc0e84022223",
         intel: "a346d8ba64f58ef5e0fe656055d805b3209aa2b955b04f2f13e25e21329def50"

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
