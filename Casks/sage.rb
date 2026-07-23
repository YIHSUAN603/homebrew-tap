cask "sage" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.2"
  sha256 arm:   "bac33a3175da5990c27e40433423238237fe4f3c9f3608b7e072da5e7556cf36",
         intel: "c285f3b705af9658e9b814a8f88c7b7e639c37d2ff5509a813a96c0ebce40daa"

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
