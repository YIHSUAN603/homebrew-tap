cask "sage" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "4accf895c0b3cd3ef831d4b0e38f9aacffdd66c271754d0c67dee4c1263ebf14",
         intel: "31af39e7d86349b6100527e4213262113d4be0021ac154772042a7ecb1bb35d2"

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
