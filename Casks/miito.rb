cask "miito" do
  version "0.1.37"
  sha256 "81a8df0cf17b5051a80c38d604b5c08fb659dd8f593daf9eb485164d9aaf0d06"

  url "https://github.com/CypressAI/miito-releases/releases/download/v#{version}/Miito-#{version}-arm64.dmg",
      verified: "github.com/CypressAI/miito-releases/"
  name "Miito"
  desc "Terminals, a browser, and coding agents in one window"
  homepage "https://cypressai.co/desktop"

  # Apple Silicon only for now, and the app targets Sonoma APIs.
  depends_on arch: :arm64
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

  caveats <<~EOS
    Miito is ad-hoc signed and not yet notarised, so Gatekeeper blocks the first
    launch. Clear the quarantine flag once, and it will open normally after that:

      xattr -dr com.apple.quarantine /Applications/Miito.app

    Notarised builds will not need this at all.

    Sign in with email and password — Microsoft sign-in 403s on dev right now.

    This build points at https://dev.cypressai.co. To point it somewhere else,
    create ~/Library/Application Support/miito-desktop/config.json:

      {"workspaceUrl": "https://app.cypressai.co"}
  EOS
end
