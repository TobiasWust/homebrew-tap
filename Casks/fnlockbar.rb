cask "fnlockbar" do
  version "1.3.2"
  sha256 "7a069895709bee9e7393029d4d1c976e33399b5096ed84904817830d0277c425"

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

  uninstall quit: "de.tobiaswust.FnLockBar"

  zap trash: "~/Library/Preferences/de.tobiaswust.FnLockBar.plist"
end
