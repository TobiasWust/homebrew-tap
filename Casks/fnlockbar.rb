cask "fnlockbar" do
  version "1.3.0"
  sha256 "27dcfb35a9f01ea499c83eef72927ecb4a14dda83d650ab3dc9ded8e05f4d5be"

  url "https://github.com/TobiasWust/FnLockBar/releases/download/v#{version}/FnLockBar.zip"
  name "FnLockBar"
  desc "Menu bar indicator and per-app switcher for the fn key mode"
  homepage "https://github.com/TobiasWust/FnLockBar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "FnLockBar.app"

  # The app is ad-hoc signed, not notarized; without this Gatekeeper blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/FnLockBar.app"],
        writable_paths: ["FnLockBar.app"],
        writable_base:  :appdir
  end

  uninstall quit: "de.tobiaswust.FnLockBar"

  zap trash: "~/Library/Preferences/de.tobiaswust.FnLockBar.plist"
end
