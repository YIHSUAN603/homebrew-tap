cask "sage" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.1"
  sha256 arm:   "98acf9aa3f13bffb2ac4bf96811fc2de7b9c951326db7f39fbbde4db826e97a9",
         intel: "a14b819b136a881abd22ae94671fa4417e76d4cee01efb984864c65d95c8ecef"

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
