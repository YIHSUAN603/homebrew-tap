cask "sage" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.2"
  sha256 arm:   "1c8f15e4dbd0a5e9d5eab39ea7758bf7d49c6e1e1302b84b8889a525c3847eaf",
         intel: "ba2d7284be903d98a9d81234da7f98ce773ae92eca10af146920b1bb8c457c5c"

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
