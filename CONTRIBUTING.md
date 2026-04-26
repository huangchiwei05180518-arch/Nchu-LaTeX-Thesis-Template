# Contributing

謝謝你願意改善這份 NCHU 論文模板。這個 repository 主要維護「可編譯、可讀、容易改」的 LaTeX 範例，因此每次修改請盡量保持範圍小而清楚。

## 回報問題

請在 issue 中附上：

- 使用的作業系統與 LaTeX 發行版，例如 Windows + MiKTeX、macOS + MacTeX、Ubuntu + TeX Live、Overleaf。
- 編譯方式，例如 `latexmk -xelatex main.tex` 或手動 `xelatex` / `bibtex`。
- 錯誤訊息中最靠近失敗點的 20 到 40 行。
- 若是格式問題，請附上對應的學校或系所公告連結。

請不要上傳含簽名、學號、身分證字號、未公開論文全文或授權書個資的 PDF。

## 修改原則

- 優先維持 XeLaTeX 可編譯。
- 盡量把使用者需要填寫的資料放在 `nchusetup.tex`。
- `nchuthesis.cls` 只放模板格式與共用命令。
- 範例章節保留簡潔示範，不放真實研究資料。
- 若更動格式，請同步更新 `README.md` 與 `FORMAT_SPEC.md`。
- 若新增編譯產物，請確認 `.gitignore` 已忽略。

## 驗證方式

建議至少執行：

```bash
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

或使用：

```bash
latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex
```

成功後請檢查 `main.pdf` 的封面、摘要、目錄、表目次、圖目次、正文頁碼與參考文獻。
