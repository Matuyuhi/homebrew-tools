# Template for Matuyuhi/homebrew-tools/Casks/usage-hud.rb.
# Values are substituted and pushed by Matuyuhi/usage-hud (.github/workflows/release.yml) on each release.

cask "usage-hud" do
  version "1.1.1"
  sha256 "4665c8c2915b039677d49a2dafc7f6d04a64545fb22327fa64b001475de399bc"

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
