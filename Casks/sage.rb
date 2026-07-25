cask "sage" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.7"
  sha256 arm:   "e27f605a76017796e5c1f86cfe2b6124fd288a4e1c2c89d4d010fd0c0d429893",
         intel: "d1227bdfd853981e305059386834f0b3efa587fb8c5099303c9a3f285e3f9461"

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
