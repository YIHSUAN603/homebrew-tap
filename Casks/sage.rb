cask "sage" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "0b111fda646df3306c2cd39fdb6447f097ada9c0e3c9859cf176d3335cfade6f",
         intel: "ceb64adec28014dfc97a794f8a5290da6ba45536052293afbc82a65475743400"

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
