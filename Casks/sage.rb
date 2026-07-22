cask "sage" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.3"
  sha256 arm:   "2aff60ccb357a286fc84be33763224d57fc8c4eae77a9ccf332fa353d7fd0022",
         intel: "9344e3abb649d4c77510a7311fb04bd6ea8dcd93c35537cd7d93054b3d76f7ed"

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
