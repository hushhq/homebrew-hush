cask "hush" do
  # HUSHHQ-35. Homebrew Cask manifest template.
  # Update `version`, both `sha256` values, and verify the artifact
  # URL before submitting to a Homebrew tap.
  version "0.1.45-mvp"

  on_arm do
    sha256 "819fd292a1ffae87606f33ff8939e5324ec4a440a9acabde0f1211766897c276"
    url "https://github.com/hushhq/hush-desktop/releases/download/v#{version}/Hush-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "8d7ace5f60cf4adc825a5ba8fe862961e2cb352bca9f2b8ec5aadb3d0fae4158"
    url "https://github.com/hushhq/hush-desktop/releases/download/v#{version}/Hush-#{version}.dmg"
  end

  name "Hush"
  desc "End-to-end encrypted messenger"
  homepage "https://gethush.live"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Hush.app"

  zap trash: [
    "~/Library/Application Support/Hush",
    "~/Library/Preferences/live.gethush.desktop.plist",
    "~/Library/Logs/Hush",
    "~/Library/Saved Application State/live.gethush.desktop.savedState",
  ]
end
