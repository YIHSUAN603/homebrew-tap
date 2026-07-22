cask "sage" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.1"
  sha256 arm:   "282ce1fd0f8163ae76cacac7f3f6679a9bca32804fabcc00a30b50492556bc82",
         intel: "51c74b557b6aba6e0d3ae621012e80246b2242ebc24d8f32e7ad69cc33d16b2b"

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
