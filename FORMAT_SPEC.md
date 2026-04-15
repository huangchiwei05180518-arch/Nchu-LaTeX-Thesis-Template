# 模板格式規範說明

本文件只保留「格式要求」與「模板中對應的調整位置」，不再重複快速開始與安裝步驟。若你是第一次使用模板，請先看 [README.md](README.md)。

## 核心規範總覽

| 項目 | 規範 |
|------|------|
| 紙張大小 | A4 |
| 頁邊距 | 上下左右各 3 cm |
| 行距 | 1.6 倍 |
| 內文字級 | 12pt |
| 編譯器 | XeLaTeX |
| 裝訂與版面 | 雙面列印、章節可從奇數頁開始 |

## 頁碼與文件順序

模板目前在 `main.tex` 的安排如下：

1. 封面
2. 空白頁
3. 書名頁
4. 審核頁與授權頁（預留，可自行啟用）
5. 致謝
6. 摘要、目錄、圖目錄、表目錄
7. 正文章節
8. 參考文獻
9. 附錄

頁碼規則：

- 封面與書名頁不顯示頁碼
- 摘要、目錄、圖表目錄使用羅馬數字
- 正文從 `\mainmatter` 後切換為阿拉伯數字
- 附錄延續正文頁碼，章節編號改為附錄 A、B

對應實作：

```latex
\pagenumbering{roman}
...
\mainmatter
```

## 封面與摘要

### 封面資訊來源

封面與書名頁內容來自 `nchusetup.tex`：

- `university`
- `institute`
- `title` / `title*`
- `author` / `author*`
- `advisor` / `advisor*`
- `date`

### 摘要建議

- 中文摘要：建議 150 到 300 字
- 英文摘要：建議 150 到 300 words
- 摘要後方附上中英文關鍵字

## 章節、目錄、附錄

### 章節層級

- 建議使用 `\chapter`、`\section`、`\subsection`
- 模板預設支援到三級標題的編號與目錄呈現

### 附錄格式

附錄標題格式由 `nchuthesis.cls` 控制，使用方式如下：

```latex
\appendix{A}{附錄A標題}
\input{back/appendix01}
```

顯示形式會接近：

```text
附錄 A --- 附錄A標題
```

附錄檔本身只放內容即可，不需要再次寫 `\appendix{...}`。

## 圖、表、公式與引用

### 圖片

- 圖說放在圖片下方
- 以 `\label` + `\ref` 交叉引用
- 檔案建議放在 `figures/chapterXX/`

範例：

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.7\textwidth]{figures/chapter01/example.png}
    \caption{圖片說明}
    \label{fig:example}
\end{figure}
```

### 表格

- 表題通常放在表格上方
- 可使用 `booktabs`、`multirow`、`longtable` 等套件

### 公式

建議使用 `equation` 環境並搭配 `\label`：

```latex
\begin{equation}
    E = mc^2
    \label{eq:einstein}
\end{equation}
```

### 參考文獻

- 使用 BibTeX 管理
- 正文用 `\cite{key}`
- `main.tex` 目前使用：

```latex
\bibliographystyle{plain}
\bibliography{back/references}
```

## 模板中的對應位置

| 想調整的內容 | 主要位置 |
|--------------|----------|
| 封面、作者、題目、日期 | `nchusetup.tex` |
| 語言、字體組、浮水印、DOI | `main.tex` 的 `\documentclass` |
| 頁碼切換、章節輸入順序、是否啟用附錄 | `main.tex` |
| 邊界、字體、章節樣式、目錄樣式 | `nchuthesis.cls` |
| 文獻風格 | `main.tex` 的 `\bibliographystyle{...}` |

## 常見微調

### 修改語言或字體組

在 `main.tex`：

```latex
\documentclass[
  language  = chinese,
  fontset   = system,
  watermark = false,
  doi       = false,
]{nchuthesis}
```

可用選項：

- `language = chinese` 或 `english`
- `fontset = system`、`overleaf`、`template`、`default`

其中：

- `system` 是目前最貼近模板預設的本機字體設定
- `overleaf` 適合雲端環境
- `template` 目前等同 `system`

### 修改行距

在 `nchuthesis.cls` 找 `\setstretch{...}`。

### 修改頁邊距

在 `nchuthesis.cls` 找 `\geometry{...}`。

### 修改中英文字體

在 `nchuthesis.cls` 找 `\setCJKmainfont{...}` 與 `\setmainfont{...}`。

### 關閉或開啟浮水印

在 `main.tex` 的 `\documentclass` 設定：

```latex
watermark = false
```

### 更換參考文獻風格

在 `main.tex`：

```latex
\bibliographystyle{plain}
```

可依需求改為 `apalike`、`unsrt` 等樣式。

## 使用提醒

- 若學校或系所有更新版規範，請以官方公告或原始 PDF 為準。
- 如果你只是要開始寫論文，請先看 [README.md](README.md)；本文件主要給需要校對格式或微調模板的人。
