cask "sage" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.4"
  sha256 arm:   "c68a103ad4ca8506fab138cfaaccf8d0ff42a98bc222451b65d5e640996e1408",
         intel: "5f8572860b473ba0099d94ef8c5d7704aad2ef559db99ff86e6334f0651f5869"

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
