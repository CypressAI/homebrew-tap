cask "miito" do
  version "0.1.18"
  sha256 "e91c209e622db4d9ff4066db98c09855715c4659d158af20539b7c242df579a4"

  url "https://github.com/CypressAI/miito-releases/releases/download/v#{version}/Miito-#{version}-arm64.dmg",
      verified: "github.com/CypressAI/miito-releases/"
  name "Miito"
  desc "Terminals, a browser, and coding agents in one window"
  homepage "https://cypressai.co/desktop"

  # Apple Silicon only for now, and the app targets Sonoma APIs.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Miito.app"

  # The app keeps its profile under the bundle id's usual places plus a shared
  # dotfile directory for the control-API token and loaded extensions.
  zap trash: [
    "~/Library/Application Support/miito-desktop",
    "~/Library/Preferences/co.cypressai.miito.plist",
    "~/Library/Saved Application State/co.cypressai.miito.savedState",
  ]

  caveats <<~EOS
    Sign in with email and password — Microsoft sign-in 403s on dev right now.

    This build points at https://dev.cypressai.co. To point it somewhere else,
    create ~/Library/Application Support/miito-desktop/config.json:

      {"workspaceUrl": "https://app.cypressai.co"}
  EOS
end
