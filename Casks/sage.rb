cask "sage" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.8"
  sha256 arm:   "68cacda0cab90777fcfc8e468f6edbcd5acb7c256c05457e3d066e72123e60cf",
         intel: "61a9bf1a90abd34eed9d016082cad2892c0e09789b75418ad461f5c6bdfa903b"

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
