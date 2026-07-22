# homebrew-tap

[Sage](https://github.com/YIHSUAN603/Sage) 的 Homebrew tap。

## 安裝

```bash
brew install --cask --no-quarantine YIHSUAN603/tap/sage
```

> - 必須使用完整名稱 `YIHSUAN603/tap/sage`：官方 homebrew-cask 已有同名的 `sage`（SageMath 數學軟體），只寫 `sage` 會裝錯。
> - `--no-quarantine` 不可省略：Sage 目前未經 Apple 簽章，加上此參數安裝後即可直接開啟，否則 macOS Gatekeeper 會顯示「已損毀，無法打開」。

## 更新

```bash
brew upgrade --cask --no-quarantine YIHSUAN603/tap/sage
```

## 移除

```bash
brew uninstall --cask sage        # 移除 App
brew uninstall --cask --zap sage  # 連同設定檔一併移除
```
