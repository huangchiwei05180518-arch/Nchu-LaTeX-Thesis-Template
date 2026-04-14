# LaTeX 碩士論文模板 - 完整建立清單

## 模板概述
本模板已根據國立中興大學碩士學位學程論文格式規範完整建立。使用 XeLaTeX 編譯器，完全支援中文排版。

**位置**：`c:\Users\huang\Documents\research\LaTeX_Thesis_Template\論文\`

## 已建立的文件清單

### 核心文件
✅ `main.tex` - 主文件（論文集成文件）
✅ `nchuthesis.cls` - LaTeX 文檔類別定義（NCHU 格式規範）
✅ `nchusetup.tex` - 論文基本資訊配置
✅ `latexmkrc` - LaTeX Make 配置

### 前置資料（Front Matter）
✅ `front/abstract.tex` - 中英文摘要模板
✅ `front/acknowledgement.tex` - 致謝模板

### 正文內容（Main Contents）
✅ `contents/chapter01.tex` - 第一章：緒論
✅ `contents/chapter02.tex` - 第二章：文獻回顧
✅ `contents/chapter03.tex` - 第三章：研究方法
✅ `contents/chapter04.tex` - 第四章：實驗結果與分析
✅ `contents/chapter05.tex` - 第五章：結論與未來工作

### 後置資料（Back Matter）
✅ `back/appendix01.tex` - 附錄 A 模板
✅ `back/appendix02.tex` - 附錄 B 模板
✅ `back/references.bib` - BibTeX 參考文獻模板

### 目錄結構
✅ `figures/chapter01/` - 第一章圖片存放
✅ `figures/chapter02/` - 第二章圖片存放
✅ `figures/chapter03/` - 第三章圖片存放
✅ `figures/chapter04/` - 第四章圖片存放
✅ `fonts/chinese/` - 中文字體目錄
✅ `fonts/english/` - 英文字體目錄

### 文檔與說明
✅ `README.md` - 詳細使用說明文檔
✅ `QUICKSTART.md` - 快速開始指南
✅ `FORMAT_SPEC.md` - 格式規範詳細說明
✅ `SETUP.md` - 此文件

## 模板功能特點

### 1. 格式規範遵循
- ✅ 符合 NCHU 碩士論文格式要求
- ✅ 自動編頁碼規則（羅馬數字 + 阿拉伯數字）
- ✅ 自動生成目錄、圖目錄、表目錄
- ✅ 正確的邊距設置（3cm × 3cm）
- ✅ 標準行距（1.6 倍行距）

### 2. 中英文支持
- ✅ 完整中文排版支援
- ✅ 英文字體配置
- ✅ 中英文摘要模板
- ✅ 語言切換選項

### 3. 自動化功能
- ✅ 自動生成封面和書名頁
- ✅ 自動章節編號與中文數字
- ✅ 自動圖表編號與交叉引用
- ✅ 自動參考文獻格式化（BibTeX）

### 4. 易用界面
- ✅ 簡單的 `nchusetup.tex` 配置
- ✅ 清晰的章節模板
- ✅ 豐富的註解和說明
- ✅ 包含快速開始指南

## 快速開始步驟

### 第 1 步：修改論文基本資訊
編輯 `nchusetup.tex`，修改以下內容：
```latex
\nchusetup{
  university = {國立中興大學},
  institute = {您的系所},
  title = {您的論文題目},
  author = {您的名字},
  advisor = {指導教授},
  date = {2026-08},
}
```

### 第 2 步：撰寫摘要
編輯 `front/abstract.tex`，填寫中英文摘要

### 第 3 步：撰寫各章節
編輯 `contents/chapter0X.tex` 文件撰寫各章內容

### 第 4 步：添加圖片
1. 將圖片放入 `figures/chapter0X/` 
2. 在文中使用 `\includegraphics` 命令

### 第 5 步：管理參考文獻
編輯 `back/references.bib`，使用 BibTeX 格式添加參考文獻

### 第 6 步：編譯生成 PDF
```bash
latexmk -xelatex main.tex
```

## 支援的編譯方式

### 方式 1：命令行（推薦）
```bash
cd "論文" 
latexmk -xelatex main.tex
```

### 方式 2：VS Code + LaTeX Workshop
1. 安裝 LaTeX Workshop 擴展
2. 打開 main.tex
3. 點擊 "Build LaTeX project" 或按 Ctrl+Alt+B

### 方式 3：手動編譯
```bash
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

## 系統需求

### 必須安裝
- **XeLaTeX** - LaTeX 發佈版本（推薦 TeX Live 或 MiKTeX）
- **BibTeX** - 參考文獻處理工具
- **必要套件**：
  - xeCJK（中文支援）
  - fontspec（字體設定）
  - geometry（版面設置）
  - titlesec、titletoc（章節與目錄）

### 推薦工具
- **VS Code** + LaTeX Workshop 擴展
- **Overleaf**（線上 LaTeX 編輯）
- **TeXStudio**（獨立 LaTeX 編輯器）

## 文件組織邏輯

```
主結構：
main.tex 集成所有內容
  ├─ 前置：nchusetup.tex 配置
  ├─ 前置資料：front/ 目錄
  │  ├─ abstract.tex（摘要）
  │  └─ acknowledgement.tex（致謝）
  ├─ 正文：contents/ 目錄
  │  ├─ chapter01-05.tex（各章節）
  ├─ 後置：back/ 目錄
  │  ├─ references.bib（參考文獻）
  │  ├─ appendix01-02.tex（附錄）
  │
  ├─ 資源：figures/ 和 fonts/ 目錄
  └─ 格式類和配置：nchuthesis.cls、latexmkrc
```

## 自訂與擴展

### 添加新章節
1. 複製 `contents/chapter01.tex` 並改名
2. 修改 `\chapter{標題}` 为新章节名
3. 在 `main.tex` 中添加 `\input{contents/chapterXX}`

### 修改格式
編輯 `nchuthesis.cls` 中的以下部分：
- **字體**：搜索「字體設定」
- **邊距**：搜索 `\geometry{...}`
- **行距**：搜索 `\setstretch{...}`
- **色彩**：搜索「顏色設定」

### 使用自訂字體
將字體文件放入 `fonts/chinese/` 或 `fonts/english/`，然後在 `nchuthesis.cls` 中修改：
```latex
\setCJKmainfont{字體名}
\setmainfont{Font Name}
```

## 常見問題解決

**Q：編譯失敗，顯示找不到套件？**
A：需要安裝完整的 TeX Live 或 MiKTeX。可運行：
```bash
xelatex main.tex  # 第一次編譯會自動下載缺失套件
```

**Q：中文顯示為亂碼？**
A：
1. 確認使用 XeLaTeX（不要用 pdfLaTeX）
2. 確認文件編碼為 UTF-8
3. 確認 nchuthesis.cls 中的字體設置正確

**Q：頁碼顯示不正確？**
A：檢查 main.tex 中：
- 前置資料區是否有 `\pagenumbering{roman}`
- 正文區是否有 `\mainmatter`

**Q：圖片無法顯示？**
A：
1. 確認圖片文件名正確且在 `figures/chapterXX/` 中
2. 使用相對路徑：`figures/chapter01/image.png`
3. 支援格式：.png、.jpg、.pdf

## 後續維護

### 定期備份
定期備份整個論文目錄，特別是 `contents/` 和 `back/references.bib`

### 版本管理
建議使用 Git 進行版本控制：
```bash
git init
git add .
git commit -m "Initial thesis template"
```

### 更新檢查
定期檢查 LaTeX 套件的更新並保持系統最新

## 技術支援

### 快速查詢
- **README.md** - 完整說明
- **QUICKSTART.md** - 快速指南
- **FORMAT_SPEC.md** - 格式規範

### 線上資源
- XeLaTeX 文檔：https://tug.org/xetex/
- CTeX 中文支援：https://github.com/CTeX-org/ctex-kit
- LaTeX 官方：https://www.latex-project.org/

### 尋求幫助
- 檢查 nchuthesis.cls 中的詳細註解
- 參考原始論文格式規範 PDF
- 聯絡系所教務處

## 更新日誌

### 版本 1.0（2026-04-14）
- ✅ 完整建立 LaTeX 碩士論文模板
- ✅ 實現 NCHU 格式規範
- ✅ 添加完整文檔和指南
- ✅ 包含所有必要的模板文件

## 許可證與使用條款

本模板基於國立中興大學論文格式規範，可自由使用與修改。

---

**祝您論文撰寫順利！**

如有問題或建議，歡迎反饋。

模板建立日期：2026 年 4 月 14 日
最後更新：2026 年 4 月 14 日
