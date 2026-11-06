cask "miito" do
  arch arm: "arm64", intel: "x64"

  version "0.1.43"
  sha256 arm:   "f96db58e3aeca968728afbe249bb827d8262eb03cab14575d16366a2080435af",
         intel: "483c080815ce3e1e500dd1a95cc8119cb42ef220af0793d808ca5061969cce20"

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
