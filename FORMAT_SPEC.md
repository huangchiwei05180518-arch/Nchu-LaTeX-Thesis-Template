# 模板格式規範說明

## NCHU 碩士論文格式規範

本模板基於國立中興大學碩士學位學程論文格式，以下為主要規範：

### 1. 頁面排版

| 項目 | 規範 |
|------|------|
| 紙張大小 | A4 |
| 上邊距 | 3 cm |
| 下邊距 | 3 cm |
| 左邊距 | 3 cm |
| 右邊距 | 3 cm |
| 行距 | 1.6 倍（約 2.0 倍） |
| 裝訂方式 | 雙面印刷，右側裝訂 |

### 2. 字體與字型

| 部分 | 中文字體 | 英文字體 | 大小 |
|------|---------|---------|------|
| 內文 | BiauKai（標楷體） | Times New Roman | 12pt |
| 封面 | BiauKai | Times New Roman | 20pt |
| 章標題 | BiauKai（粗體） | Times New Roman | 大號 |
| 節標題 | BiauKai | Times New Roman | 標準 |

### 3. 頁碼規則

論文頁碼分為兩部分：

#### 前置資料（Front Matter）
- 使用**羅馬數字** (i, ii, iii, ...)
- 包括：摘要、致謝、目錄、圖目錄、表目錄
- 第一頁（封面）：**不編頁碼**

#### 正文與後置資料（Main Matter & Back Matter）
- 使用**阿拉伯數字** (1, 2, 3, ...)
- 包括：各章節、參考文獻、附錄
- 從第一章開始編號

**實現方式**（已在 main.tex 中配置）：
```latex
% 前置資料：
\pagenumbering{roman}

% 正文開始：
\mainmatter  % 自動轉換為 \pagenumbering{arabic}
```

### 4. 封面與書名頁

**內容順序**：
1. 校系名稱（國立中興大學 + 系所名稱）
2. 學位類別（碩士學位論文 或 博士學位論文）
3. 論文題目（中文）
4. 論文題目（英文，使用 Times New Roman）
5. 空白行
6. 指導教授（中文名稱 ~ 英文名稱）
7. 研究生（中文名稱 ~ 英文名稱）
8. 完成日期（中華民國 XXX 年 XX 月）

### 5. 目錄與圖表目錄

- **目錄深度**：顯示至三級標題（章、節、小節）
- **編號深度**：編號至三級標題
- **格式**：
  - 章節名稱左對齐，頁碼右對齐
  - 章節號使用中文數字（第一章、第二章...）
  - 各級標題有適當縮進

### 6. 摘要格式

#### 中文摘要
- 標題：**摘要**（置中）
- 內容：150-300 字
- 結尾：
  - **關鍵字：** 〈關鍵字一〉、〈關鍵字二〉、〈關鍵字三〉

#### 英文摘要
- 標題：**Abstract**（置中）
- 內容：150-300 words
- 結尾：
  - **Keywords:** Keyword 1, Keyword 2, Keyword 3

### 7. 章節標題格式

```
第 X 章  （置中，粗體，大字型）
章標題

1.1  節標題 （段落式編號）
1.1.1 小節標題

內文開始...
```

### 8. 圖片與表格

#### 圖片（Figure）
- **標題位置**：圖片下方
- **標題格式**：`圖 X.Y  描述`（X 為章號，Y 為圖號）
- **引用格式**：`如圖 \ref{fig:label} 所示...`
- **排版**：置中，上下各留空白

#### 表格（Table）
- **標題位置**：表格上方
- **標題格式**：`表 X.Y  描述`（X 為章號，Y 為表號）
- **引用格式**：`如表 \ref{tab:label} 所示...`
- **字體大小**：可稍小於內文，但保持清晰

### 9. 參考文獻

#### 引用方式
- 使用 **BibTeX** 管理參考文獻
- 在文中使用 `\cite{key}` 引用
- 自動排序和格式化

#### 參考文獻格式
- **期刊文章**：作者、年份、文章題名、期刊名、卷數、期數、頁碼
- **書籍**：作者、年份、書名、出版社、版次
- **會議論文**：類似期刊，加上會議名稱
- **網路資源**：作者/單位、年份、標題、網址、查閱日期

範例：
```bibtex
@article{Author2020,
  title={Paper Title},
  author={Author, A.},
  journal={Journal Name},
  volume={10},
  number={2},
  pages={100-110},
  year={2020}
}
```

### 10. 附錄

- **標題格式**：`附錄 X — 附錄名稱`
- **編號方式**：使用大寫英文字母（附錄 A、附錄 B...）
- **章節編號**：附錄內的小節以附錄號開頭（A.1、A.2...）

### 11. 致謝（Acknowledgement）

- **標題**：`致謝`（置中）
- **位置**：放在摘要之前
- **頁碼**：通常不編頁碼或使用羅馬數字

### 12. 特殊元素

#### 方程式
```latex
\begin{equation}
    E = mc^2
    \label{eq:einstein}
\end{equation}

引用：根據方程式 \eqref{eq:einstein}...
```

#### 代碼/程式
建議使用 `listings` 或 `minted` 套件：
```latex
\usepackage{listings}
\lstinputlisting[language=Python]{code/example.py}
```

#### 注腳
```latex
\footnote{注腳內容}
```

## 模板與原始格式的對應

| 模板功能 | 實現方式 | 相關文件 |
|---------|--------|--------|
| 章節格式 | titlesec 套件 | nchuthesis.cls |
| 目錄格式 | titletoc 套件 | nchuthesis.cls |
| 頁首頁尾 | fancyhdr 套件 | nchuthesis.cls |
| 中文支持 | xeCJK 套件 | nchuthesis.cls |
| 參考文獻 | natbib + BibTeX | back/references.bib |
| 封面生成 | \makecover 命令 | nchuthesis.cls |
| 目錄生成 | \maketableofcontents 等 | nchuthesis.cls |

## 常見微調

### 修改行距
在 nchuthesis.cls 末尾找到：
```latex
\setstretch{1.6}  % 改為其他值，如 1.5 或 2.0
```

### 修改邊距
在 nchuthesis.cls 中找到：
```latex
\geometry{
  top=3cm,
  bottom=3cm,        
  left=3cm,
  right=3cm
}
```

### 改變字體
在「字體設定」部分修改：
```latex
\setmainfont{Times New Roman}
\setCJKmainfont{BiauKai}
```

### 啟用/禁用浮水印
在 main.tex 的 `\documentclass` 中：
```latex
watermark=false,  % 改為 true 激活浮水印
```

## 進階配置

### 自訂 BibTeX 風格
在 main.tex 中修改：
```latex
\bibliographystyle{plain}  % 改為 apalike, unsrt 等
```

### 調整圖表間距
在 nchuthesis.cls 中找到「圖表標題」部分修改

### 多位指導教授
修改 nchusetup.tex 的 `advisor` 和 `advisor*`：
```latex
advisor = {教授一、教授二},
advisor* = {Prof. One, Prof. Two},
```

---

更多細節請參考：
- 原始 `中興大學論文格式規範.pdf`
- NCHU 教務處官方規範
- LaTeX 官方文檔
