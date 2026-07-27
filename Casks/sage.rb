cask "sage" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.2"
  sha256 arm:   "32292b1751b4d4e3c4dbd9a86c3379a9a73a16881cbcd55981c4e08b188742de",
         intel: "ae7867d9456cf791f4fb7f985361da4d39897b7dc89d61d251f32c80bfd3db7e"

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
