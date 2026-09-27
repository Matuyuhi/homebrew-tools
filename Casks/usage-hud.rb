# Template for Matuyuhi/homebrew-tools/Casks/usage-hud.rb.
# Values are substituted and pushed by Matuyuhi/usage-hud (.github/workflows/release.yml) on each release.

cask "usage-hud" do
  version "1.1.3"
  sha256 "e662d8ff14ce88fcb88ce55796b02032f5675f14d0c3149574dd1e39c449d55a"

  url "https://github.com/Matuyuhi/usage-hud/releases/download/v#{version}/usage-hud.zip"
  name "Usage HUD"
  desc "Menu-less HUD for Copilot / Claude Code / Codex quota and system load"
  homepage "https://github.com/Matuyuhi/usage-hud"

  depends_on macos: :tahoe

  app "usage-hud.app"

  # ad-hoc 署名のため、quarantine が付いたままだと Gatekeeper に「壊れている」と判定される
  postflight_steps do
    run "xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/usage-hud.app"]
  end

  uninstall quit: "com.matuyuhi.usage-hud"

  zap trash: [
    "~/Library/Application Support/usage-hud",
    "~/Library/Caches/com.matuyuhi.usage-hud",
    "~/Library/Preferences/com.matuyuhi.usage-hud.plist",
  ]

  caveats <<~EOS
    ⌃⌥U でパネルを開閉します。ウィジェットは通知センターの「編集」から追加してください。

    使用量の取得には各 CLI のログインが必要です:
      Claude Code / codex / gh auth login
  EOS
end
