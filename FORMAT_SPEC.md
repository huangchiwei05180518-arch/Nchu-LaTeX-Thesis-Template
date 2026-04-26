# 模板格式規範對照

本文件整理模板目前採用的格式、對應程式位置，以及與國立中興大學「F2-65 學位論文格式規範（111.4.21 修訂）」相關的提醒。若學校或系所有更新公告，請以最新官方文件為準。

官方參考來源：

- 教務處註冊組表格下載：https://oaa.nchu.edu.tw/zh-tw/rs-form/download-list.82.20
- 學位論文格式規範 PDF：https://www.me.nchu.edu.tw/uploads/others/20241010025915_F2-65%E5%AD%B8%E4%BD%8D%E8%AB%96%E6%96%87%E6%A0%BC%E5%BC%8F%E8%A6%8F%E7%AF%84-%E4%B8%AD%E6%96%87%E7%89%88.pdf

## 核心規範

| 項目 | 模板設定 | 主要位置 |
|------|----------|----------|
| 紙張大小 | A4 | `nchuthesis.cls` 的 `\LoadClass[a4paper, 12pt]{report}` |
| 頁邊距 | 上下左右各 3 cm | `nchuthesis.cls` 的 `\geometry{...}` |
| 內文字級 | 12pt | `nchuthesis.cls`、`main.tex` |
| 行距 | 1.6 倍 | `nchuthesis.cls` 的 `\setstretch{1.6}` |
| 編譯器 | XeLaTeX | `nchuthesis.cls` 會檢查 XeLaTeX |
| 頁碼 | 前置頁羅馬數字、正文起阿拉伯數字 | `main.tex` |
| 參考文獻 | BibTeX + `plain` | `main.tex`、`back/references.bib` |

## 文件順序

模板在 `main.tex` 目前安排如下：

1. 封面
2. 空白頁
3. 書名頁
4. 審核頁與授權頁入口
5. 致謝
6. 中文摘要
7. 英文摘要
8. 目錄
9. 表目次
10. 圖目次
11. 正文章節
12. 參考文獻
13. 附錄

官方規範將英文書名頁列為非必備頁面，並要求審核頁與授權頁依學校或系所提供格式處理。本模板預留 PDF 插入位置，但不附任何個人化掃描檔。

## 封面與書名頁

封面資訊來自 `nchusetup.tex`：

- `university`
- `institute`
- `title` / `title*`
- `author` / `author*`
- `advisor` / `advisor*`
- `date`

官方格式重點：

- 封面上下左右邊界各 3 cm。
- 系所、論文類別、題目、指導教授、研究生、日期置中。
- 題目過長時應控制行數，中文題目建議不超過三行。
- 完成日期使用民國年月。

## 摘要、目錄與頁碼

- 中文摘要與英文摘要分別使用 `front/abstract.tex` 的 `abstract` 與 `abstract*` 環境。
- 摘要到圖表目次使用小寫羅馬數字頁碼。
- 正文從 `\mainmatter` 後重新以阿拉伯數字 `1` 起算。
- 參考文獻與附錄延續正文頁碼。

對應實作：

```latex
\pagenumbering{roman}
...
\mainmatter
```

## 章節層級

建議使用：

- `\chapter`
- `\section`
- `\subsection`

模板預設支援到三級標題的編號與目錄呈現。若需要更深層級，請調整 `nchuthesis.cls` 裡的 `tocdepth` 與 `secnumdepth`。

## 表、圖與公式

官方規範要求表題置於表上方，圖題置於圖下方，且在文中明確引用表圖編號。模板已透過 `caption` 設定表題與圖題位置。

表格範例：

```latex
\begin{table}[htbp]
  \centering
  \caption{表格說明}
  \label{tab:example}
  \begin{tabular}{lll}
    \toprule
    欄位一 & 欄位二 & 欄位三 \\
    \midrule
    A & B & C \\
    \bottomrule
  \end{tabular}
\end{table}
```

圖片範例：

```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.7\textwidth]{figures/chapter01/example.png}
  \caption{圖片說明}
  \label{fig:example}
\end{figure}
```

公式範例：

```latex
\begin{equation}
  E = mc^2
  \label{eq:einstein}
\end{equation}
```

## 參考文獻

目前使用 BibTeX：

```latex
\bibliographystyle{plain}
\bibliography{back/references}
```

若系所有特定引用格式，請修改 `\bibliographystyle{...}`，或改用系所要求的 BibTeX / BibLaTeX 設定。官方規範允許依學門慣用格式安排參考書目。

## 附錄

在 `main.tex` 取消註解即可啟用：

```latex
% \appendix{A}{附錄A標題}
% \input{back/appendix01}
```

附錄檔本身只放內容，不需要再次呼叫 `\appendix{...}`。

## 常見微調位置

| 想調整的內容 | 主要位置 |
|--------------|----------|
| 封面、作者、題目、日期 | `nchusetup.tex` |
| 論文類型、語言、字體組 | `main.tex` 的 `\documentclass` |
| 文件順序、章節輸入、附錄啟用 | `main.tex` |
| 邊界、字體、章節樣式、目錄樣式 | `nchuthesis.cls` |
| 參考文獻樣式 | `main.tex` |
| 使用者自訂套件 | `nchusetup.tex` 下半部 |

## 送出前提醒

- 各系所可能有比校級規範更細的要求。
- 審核頁與授權頁通常需使用學校或系所提供的最新表件。
- 若要公開到 GitHub，請勿提交含簽名、學號、身分證字號或未公開論文內容的 PDF。
