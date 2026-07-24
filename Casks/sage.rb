cask "sage" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.4"
  sha256 arm:   "8feb6308dc3b28571cf2fd098e78d07f181976ecc8d93de69a631ee119ac3981",
         intel: "c62fa0b900e2f97f85322d5dfab69796a38fc28d21d105d18c0f9ea02ac551f1"

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
