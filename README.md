# homebrew-tap

[Sage](https://github.com/YIHSUAN603/Sage) 的 Homebrew tap。

## 安裝

```bash
brew tap YIHSUAN603/tap
brew install --cask --no-quarantine sage
```

> `--no-quarantine` 不可省略：Sage 目前未經 Apple 簽章，加上此參數安裝後即可直接開啟，
> 否則 macOS Gatekeeper 會顯示「已損毀，無法打開」。

## 更新

```bash
brew upgrade --cask --no-quarantine sage
```

## 移除

```bash
brew uninstall --cask sage        # 移除 App
brew uninstall --cask --zap sage  # 連同設定檔一併移除
```
