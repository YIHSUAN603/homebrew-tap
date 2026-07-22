cask "sage" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.5"
  sha256 arm:   "ff8ee2dee3bbf6c0af280e3d4bbe53ab3efe4e5f68961845d482d57818a90aea",
         intel: "2085e165c692b1d26eab723b67ee96492ae4811cc00eaebf7a4ddac8632a6f25"

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
