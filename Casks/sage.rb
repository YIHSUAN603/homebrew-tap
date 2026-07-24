cask "sage" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.6"
  sha256 arm:   "cd2f570995c26931e00fb6531f307471b363ecaf841788df80cd86e97f73e87f",
         intel: "d7bd7937c3540b214f219485f7fceb07d2eb17e02b4acc1e43af67a6928ae676"

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
