cask "sage" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.3"
  sha256 arm:   "ecdde18daa1afe78787bf8a8354d70e02a84fbdfda67a8afdd84dae6541e253c",
         intel: "313216a1c63d5e02d15d74688e5288e2dd277147b798d9d7a504de9251687018"

  url "https://github.com/YIHSUAN603/Sage/releases/download/v#{version}/sage_#{version}_#{arch}.dmg"
  name "Sage"
  desc "桌面 AI 小夥伴"
  homepage "https://github.com/YIHSUAN603/Sage"

  app "sage.app"

  # 未經 Apple 簽章，安裝後自動移除隔離標記（Homebrew 6 已移除 --no-quarantine）
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/sage.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.sage.app",
  ]
end
