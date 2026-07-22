# 驗證自動更新用的暫時註解，workflow 跑過後會被移除
cask "sage" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "f3f7efb76f3a51fc95bc18b810284c0f9918c0e1012f38cd5a3ae63fa3a159df",
         intel: "844895c81db02eb596fdb0f5fdaec5984558e510ad3fb14122276d0c3f3c123c"

  url "https://github.com/YIHSUAN603/Sage/releases/download/v#{version}/sage_#{version}_#{arch}.dmg"
  name "Sage"
  desc "桌面 AI 小夥伴"
  homepage "https://github.com/YIHSUAN603/Sage"

  app "sage.app"

  zap trash: [
    "~/Library/Application Support/com.sage.app",
  ]
end