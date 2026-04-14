# LaTeX 碩士論文模板（基於NCHU格式）

## 簡介
本模板基於國立中興大學碩士學位學程論文格式規範，使用 XeLaTeX 編譯器，支援中文與英文。

## 目錄結構

```
論文/
├── main.tex                 # 主文件 - 集合所有內容
├── nchuthesis.cls          # LaTeX 文檔類別定義（NCHU格式）
├── nchusetup.tex           # 論文基本資訊設定（需要修改）
├── latexmkrc               # LaTeX Make 配置文件
│
├── front/                  # 前置資料夾
│   ├── abstract.tex        # 中英文摘要
│   └── acknowledgement.tex  # 致謝
│
├── contents/               # 本文內容資料夾
│   ├── chapter01.tex       # 第一章：緒論
│   ├── chapter02.tex       # 第二章：文獻回顧
│   ├── chapter03.tex       # 第三章：研究方法
│   ├── chapter04.tex       # 第四章：實驗結果與分析
│   └── chapter05.tex       # 第五章：結論與未來工作
│
├── back/                   # 後置資料夾
│   ├── references.bib      # BibTeX 參考文獻
│   ├── appendix01.tex      # 附錄 A
│   └── appendix02.tex      # 附錄 B
│
├── figures/                # 圖片資料夾
│   ├── chapter01/          # 第一章圖片
│   ├── chapter02/          # 第二章圖片
│   ├── chapter03/          # 第三章圖片
│   └── chapter04/          # 第四章圖片
│
└── fonts/                  # 字體資料夾（支援本地字體）
    ├── chinese/            # 中文字體
    └── english/            # 英文字體
```

## 使用步驟

### 1. 配置基本資訊
編輯 `nchusetup.tex` 文件，修改以下資訊：

```latex
\nchusetup{
  university      = {國立中興大學},
  institute       = {您的系所名稱}, 
  title           = {您的論文中文題目}, 
  title*          = {Your Thesis Title in English},
  author          = {您的名字},
  author*         = {Your Name},
  advisor         = {指導教授名字},
  advisor*        = {Advisor Name},
  date            = {2026-08},           % 格式: YYYY-MM
  keywords        = {關鍵字一, 關鍵字二, 關鍵字三},
  keywords*       = {Keyword 1, Keyword 2, Keyword 3},
}
```

### 2. 撰寫各章節內容
- 編輯 `front/abstract.tex` - 撰寫中英文摘要
- 編輯 `front/acknowledgement.tex` - 撰寫致謝
- 編輯 `contents/chapter*.tex` - 撰寫各章節內容
- 編輯 `back/references.bib` - 添加參考文獻

### 3. 插入圖片
將圖片放入 `figures/chapterXX/` 文件夾，使用以下命令插入：

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.7\textwidth]{figures/chapter01/image-name.png}
    \caption[圖片簡短名稱]{圖片完整說明}
    \label{fig:label-name}
\end{figure}
```

### 4. 編譯文檔

#### 使用 XeLaTeX 編譯
```bash
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

#### 使用 latexmk 編譯（推薦）
```bash
latexmk -xelatex main.tex
```

#### 使用 VS Code 編譯
1. 安装 LaTeX Workshop 扩展
2. 在 VS Code 中打开 `main.tex`
3. 按 Ctrl+Alt+B 或点击 Build LaTeX project

## 重要注意事項

### 格式規範
- **頁邊距**：上下左右各 3cm
- **行距**：1.6 倍行距（約 2.0 倍）
- **字體大小**：內文 12pt
- **編譯器**：XeLaTeX（必須）

### 文獻引用
使用 BibTeX 格式管理參考文獻：

```latex
在文中引用：\cite{example2020}

在 references.bib 中定義：
@article{example2020,
  title={Title},
  author={Author},
  journal={Journal},
  year={2020}
}
```

### 章節與附錄
- 在 `main.tex` 中適當位置啟用/註釋附錄的 `\input` 命令
- 確保所有 `.tex` 文件都包含 `% !TeX root = ../main.tex` 註解

### 語言選擇
編輯 `main.tex` 的 `\documentclass` 選項：
- `language = chinese` - 中文論文
- `language = english` - 英文論文

## 常見問題

### 問題 1: 編譯失敗，找不到字體
**解決方案**：
- 確保字體文件放在 `fonts/chinese/` 和 `fonts/english/` 目錄
- 在 `nchuthesis.cls` 中修改 `fontset = template` 或 `fontset = overleaf`

### 問題 2: 中文顯示錯誤
**解決方案**：
- 確保使用 XeLaTeX 編譯器（不要用 pdfLaTeX）
- 檢查文件編碼為 UTF-8

### 問題 3: 頁碼格式不正確
**解決方案**：
- 檢查 `main.tex` 中的 `\pagenumbering{roman}` 和 `\pagenumbering{arabic}` 位置
- 前置資料（摘要等）使用羅馬數字，正文使用阿拉伯數字

## 文檔類別選項

在 `main.tex` 的 `\documentclass` 中可設定：

```latex
\documentclass[
  twoside,       % 雙面印刷
  openright,     % 新章節從奇數頁開始
  degree=master, % master (碩士) 或 doctor (博士)
  language=chinese,  % chinese 或 english
  fontset=template,  % default, system, overleaf, template
  watermark=false,   % 是否顯示浮水印
  doi=false,     % 是否顯示 DOI
]{nchuthesis}
```

## 建議工作流程

1. 複製此模板到新項目資料夾
2. 修改 `nchusetup.tex` 設定論文基本資訊
3. 逐章撰寫 `contents/chapter*.tex`
4. 定期編譯預覽
5. 完成時添加參考文獻到 `references.bib`
6. 最終編譯生成 PDF

## 相關資源

- **XeLaTeX 文檔**：https://ctan.org/pkg/xetex
- **CTeX 中文支持**：https://ctan.org/pkg/xecjk
- **BibTeX 參考**：https://www.ctan.org/pkg/bibtex

## 聯絡與支持

如有問題，請參考原始論文格式規範或聯絡您的系所教務。

---

模板最後更新：2026年4月
適用於國立中興大學碩士學位論文
