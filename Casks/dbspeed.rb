cask "dbspeed" do
  arch arm: "arm64", intel: "amd64"

  version "0.10.0-rc.2"
  sha256 arm:   "65cd6e0eaf895b1d64e04a2225a5509e24a68e300e665c8de00bcb738a53de36",
         intel: "ff73e89c632ea73265dedae55040832e446b03502f52b4f854dc87ba39075556"

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
