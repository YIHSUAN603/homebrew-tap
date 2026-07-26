cask "sage" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.1"
  sha256 arm:   "74d0edc29d0d8da2d2aa885c15194a1bb195ed8779955ecf6d4ac7ccbd030d2b",
         intel: "fec67491e12c8c82322f41182d6fa7bccbc7abd12319ffa738108ee5b4087335"

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
