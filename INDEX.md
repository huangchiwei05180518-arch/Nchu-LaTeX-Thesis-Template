# 📚 LaTeX 碩士論文模板 - 文件索引

## 📖 文件導覽

### 快速導航

| 需要... | 查看文件 | 用途 |
|--------|--------|------|
| 🚀 快速上手 | `QUICKSTART.md` | 5分鐘快速開始指南 |
| 📘 詳細說明 | `README.md` | 完整使用手冊 |
| 🎨 格式規範 | `FORMAT_SPEC.md` | 論文格式详细规范 |
| 🔧 系統設置 | `SETUP.md` | 安裝與配置說明 |
| 📋 此文件 | `INDEX.md` | 文件導覽與索引 |

---

## 📁 完整文件結構

```
LaTeX_Thesis_Template/
└─ 論文/
   ├── 📄 主要文件
   │   ├── main.tex           ⭐ 主文件（論文集成）
   │   ├── nchuthesis.cls     📦 格式類定義
   │   ├── nchusetup.tex      ⚙️  論文資訊配置
   │   └── latexmkrc          ⚙️  編譯配置
   │
   ├── 📚 前置資料（Front Matter）
   │   └── front/
   │       ├── abstract.tex           摘要
   │       └── acknowledgement.tex    致謝
   │
   ├── 📖 正文內容（Main Contents）
   │   └── contents/
   │       ├── chapter01.tex    第一章：緒論
   │       ├── chapter02.tex    第二章：文獻回顧
   │       ├── chapter03.tex    第三章：研究方法
   │       ├── chapter04.tex    第四章：結果分析
   │       └── chapter05.tex    第五章：結論
   │
   ├── 📑 後置資料（Back Matter）
   │   └── back/
   │       ├── references.bib      參考文獻
   │       ├── appendix01.tex      附錄 A
   │       └── appendix02.tex      附錄 B
   │
   ├── 🖼️  資源（Resources）
   │   ├── figures/            圖片存放
   │   │   ├── chapter01/
   │   │   ├── chapter02/
   │   │   ├── chapter03/
   │   │   └── chapter04/
   │   └── fonts/              字體存放
   │       ├── chinese/
   │       └── english/
   │
   └── 📋 文檔與說明
       ├── README.md           完整使用手冊
       ├── QUICKSTART.md       快速開始指南
       ├── FORMAT_SPEC.md      格式規範說明
       ├── SETUP.md            系統設置指南
       └── INDEX.md            此文件
```

---

## 🎯 根據目的快速查找

### 初次使用？
1. 先讀 **QUICKSTART.md** - 5 分鐘了解基本操作
2. 修改 `nchusetup.tex` 填入論文資訊
3. 按照 QUICKSTART 中的步驟開始撰寫

### 需要詳細說明？
- 查看 **README.md**：完整的功能介紹和使用說明
- 查看 **FORMAT_SPEC.md**：論文格式规范和規則

### 遇到問題？
- **編譯問題** → 查看 README.md 中的「常見問題」
- **格式問題** → 查看 FORMAT_SPEC.md 中的「模板與格式對應」
- **配置問題** → 查看 SETUP.md 中的「自訂與擴展」

### 需要特定功能？
- **插入圖片** → QUICKSTART.md「第四步：插入圖片」
- **添加參考文獻** → QUICKSTART.md「第五步：管理參考文獻」
- **修改字體** → FORMAT_SPEC.md「常見微調」
- **添加新章節** → SETUP.md「自訂與擴展」

---

## 📝 各文件詳細說明

### 1️⃣ **QUICKSTART.md** - 快速開始指南
**何時閱讀**：第一次使用本模板
**主要內容**：
- 6 個快速開始步驟
- 常用 LaTeX 語法
- 文件位置參考表

**典型例子**：「25分鐘建立可編譯的論文」

---

### 2️⃣ **README.md** - 完整使用手冊
**何時閱讀**：深入學習模板功能
**主要內容**：
- 完整的目錄結構說明
- 按步驟的詳細使用指南
- 重要注意事項
- 常見問題解答
- 文檔類別選項說明

**典型例子**：「了解目錄結構和各文件作用」

---

### 3️⃣ **FORMAT_SPEC.md** - 格式規範詳細說明
**何時閱讀**：需要了解論文格式規範
**主要內容**：
- NCHU 論文格式規範詳解
- 頁面排版規則
- 字體與字型規範
- 頁碼規則
- 參考文獻格式

**典型例子**：「確保論文格式完全符合中興大規範」

---

### 4️⃣ **SETUP.md** - 系統設置與進階說明
**何時閱讀**：需要自訂配置或安裝指導
**主要內容**：
- 模板功能特點
- 系統需求
- 快速開始步驟
- 支援的編譯方式
- 自訂與擴展方法

**典型例子**：「修改行距或使用自訂字體」

---

### 5️⃣ **INDEX.md** - 本文件
**用途**：快速導覽和查找
**包含**：完整文件導覽、快速查找表、文件詳解

---

## 🔍 主要配置文件說明

### ⚙️ nchusetup.tex
**用途**：設定論文的基本資訊
**首先修改這個文件**

```latex
\nchusetup{
  university = {國立中興大學},      # 學校名稱
  institute = {您的系所},           # 系所名稱
  title = {您的論文中文題目},       # 論文題目
  title* = {Your Thesis Title},    # 英文題目
  author = {您的名字},              # 作者名字
  author* = {Your Name},           # 英文名字
  advisor = {教授名字},             # 指導教授
  advisor* = {Advisor Name},       # 教授英文名
  date = {2026-08},                # 完成年月
  keywords = {關鍵字一, 關鍵字二}  # 中文關鍵字
  keywords* = {Keyword 1, Keyword 2} # 英文關鍵字
}
```

### 📄 main.tex
**用途**：論文的主文件，集成所有內容
**包含**：
- 文檔類別選項
- 前置資料的 `\input` 命令
- 正文各章節的引入
- 參考文獻和附錄的引入

### 📦 nchuthesis.cls
**用途**：LaTeX 類別定義，實現 NCHU 格式規範
**包含**：
- 頁面排版設置
- 章節標題格式
- 目錄格式
- 字體配置
- 自訂命令

### ⚙️ latexmkrc
**用途**：LaTeX Make 的配置文件
**功能**：自動化編譯流程

---

## 📑 章節文件模板

### front/ 目錄
- **abstract.tex** - 中英文摘要模板
- **acknowledgement.tex** - 致謝頁面

### contents/ 目錄可編輯的5個章節
| 文件 | 建議內容 |
|------|--------|
| chapter01.tex | 緒論、研究動機、目標、論文架構 |
| chapter02.tex | 文獻回顧、相關研究 |
| chapter03.tex | 研究方法、提案方法 |
| chapter04.tex | 實驗結果、分析與討論 |
| chapter05.tex | 結論、貢獻、未來工作 |

### back/ 目錄
- **references.bib** - BibTeX 參考文獻
- **appendix01.tex** - 附錄 A
- **appendix02.tex** - 附錄 B

---

## 🎨 資源文件夾

### figures/ 圖片存放
```
figures/
├── chapter01/   第一章的圖片
├── chapter02/   第二章的圖片
├── chapter03/   第三章的圖片
└── chapter04/   第四章的圖片
```

在文中引用：
```latex
\includegraphics[width=0.7\textwidth]{figures/chapter01/image.png}
```

### fonts/ 字體文件
```
fonts/
├── chinese/     中文字體（如 BiauKai.ttf）
└── english/     英文字體（如 Times New Roman.ttf）
```

---

## 📊 快速參考表

### 常見操作
| 操作 | 位置 | 命令/語法 |
|------|------|---------|
| 修改論文資訊 | nchusetup.tex | `\nchusetup{...}` |
| 輸入新章節 | main.tex | `\input{contents/chapterXX}` |
| 插入圖片 | contentsXX.tex | `\includegraphics{...}` |
| 引用圖片 | contentsXX.tex | `\ref{fig:label}` |
| 添加參考文獻 | back/references.bib | BibTeX 格式 |
| 引用文獻 | contentsXX.tex | `\cite{key}` |
| 建立表格 | contentsXX.tex | `\begin{table}...\end{table}` |
| 建立方程式 | contentsXX.tex | `\begin{equation}...\end{equation}` |

### 常見 LaTeX 語法
```latex
\chapter{...}           # 章標題
\section{...}           # 節標題
\subsection{...}        # 小節標題
\textbf{...}            # 粗體
\textit{...}            # 斜體
\cite{key}              # 引用文獻
\ref{label}             # 引用編號
\includegraphics{...}   # 插入圖片
\footnote{...}          # 腳註
```

---

## 🚀 推薦工作流程

### 第一天：設置
1. ✅ 複製模板
2. ✅ 讀 QUICKSTART.md
3. ✅ 修改 nchusetup.tex
4. ✅ 編譯 main.tex 測試

### 第二天-第 N 天：撰寫
1. ✅ 撰寫 front/abstract.tex 摘要
2. ✅ 撰寫 front/acknowledgement.tex 致謝
3. ✅ 逐章撰寫 contents/chapterXX.tex
4. ✅ 定期編譯驗證

### 最後一天：完成
1. ✅ 添加所有參考文獻到 back/references.bib
2. ✅ 檢查內容、图片、页码
3. ✅ 最終編譯生成 PDF
4. ✅ 打印與裝訂

---

## 💡 提示與技巧

### 編譯加速
使用 `latexmk` 自動編譯：
```bash
latexmk -xelatex main.tex
```

### 預覽編輯
在 VS Code 中安裝 LaTeX Workshop 擴展，實時預覽

### 備份重要
定期備份 `contents/` 和 `references.bib`

### 使用版本控制
```bash
git init
git add .
git commit -m "Initial commit"
```

### 檢查編譯日誌
若編譯失敗，查看 `main.log` 文件中的錯誤訊息

---

## 📞 獲取幫助

### 問題分類與解決

**❓ 我不知道從哪開始**
→ 讀 QUICKSTART.md 的「第一步」

**❓ 編譯失敗了**
→ 查看 README.md 的「常見問題」部分

**❓ 排版不符合規範**
→ 查看 FORMAT_SPEC.md 進行對比

**❓ 想自訂某個功能**
→ 查看 SETUP.md 的「自訂與擴展」

**❓ 找不到某個文件**
→ 查看本文件 INDEX.md 的「完整文件結構」

---

## 版本與更新

**當前版本**：1.0
**建立日期**：2026-04-14
**適用於**：國立中興大學碩士學位論文

---

## 快速連結

📍 **立即開始**：[QUICKSTART.md](QUICKSTART.md)
📖 **完整說明**：[README.md](README.md)
🎨 **格式規範**：[FORMAT_SPEC.md](FORMAT_SPEC.md)
🔧 **系統設置**：[SETUP.md](SETUP.md)

---

**祝您論文撰寫順利！**

如有任何疑問，請先查閱相應的文檔。

---
*這個索引文件幫助您快速找到所需的信息。請根據您的需要選擇合適的文檔閱讀。*
