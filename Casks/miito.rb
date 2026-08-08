cask "miito" do
  version "0.1.0"
  sha256 "901c804650b06d8313c8a1e7ef5138b4c621b6b8fb64c6847b308f70e5371e55"

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
    Miito is ad-hoc signed and not yet notarised, so Gatekeeper will block the
    first launch. Homebrew quarantines casks by default, so either:

      xattr -dr com.apple.quarantine /Applications/Miito.app

    or reinstall without the quarantine flag:

      brew reinstall --cask --no-quarantine cypressai/tap/miito

    You only need to do this once. Notarised builds will not need it at all.
  EOS
end
