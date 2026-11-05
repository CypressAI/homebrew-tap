cask "miito" do
  arch arm: "arm64", intel: "x64"

  version "0.1.42"
  sha256 arm:   "930b67ee9cf445b46b8e0923d61b74c89f5e2d641fa09ad71ed21a2f7d31bfe0",
         intel: "85fd7968bc4d86f33085bc5c5e1694cb9ceac573c111f720b4ba195f6585ccd4"

  url "https://github.com/CypressAI/miito-releases/releases/download/v#{version}/Miito-#{version}-#{arch}.dmg",
      verified: "github.com/CypressAI/miito-releases/"
  name "Miito"
  desc "Terminals, a browser, and coding agents in one window"
  homepage "https://cypressai.co/desktop"

  # The app targets Sonoma APIs.
  depends_on macos: :sonoma

  auto_updates true

  app "Miito.app"

  # The app keeps its profile under the bundle id's usual places plus a shared
  # dotfile directory for the control-API token and loaded extensions.
  zap trash: [
    "~/Library/Application Support/miito-desktop",
    "~/Library/Preferences/co.cypressai.miito.plist",
    "~/Library/Saved Application State/co.cypressai.miito.savedState",
  ]
end
