# 快速開始指南

## 第一步：修改論文基本資訊

打開 `nchusetup.tex`，修改以下部分（第 5-20 行）：

```latex
\nchusetup{
  university      = {國立中興大學},              % 學校名稱
  institute       = {您的系所名稱},              % 修改為您的系所
  title           = {您的碩士論文題目},          % 修改為您的論文題目
  title*          = {Title of Your Thesis},      % 英文題目
  author          = {您的名字},                  % 修改為您的名字
  author*         = {Your Name},                 % 英文名字
  advisor         = {指導教授名字},              % 修改為教授名字
  advisor*        = {Advisor Name},              % 英文名字
  date            = {2026-08},                   % 完成年月 (YYYY-MM)
  keywords        = {關鍵字一, 關鍵字二, 關鍵字三},
  keywords*       = {Keyword 1, Keyword 2, Keyword 3},
}
```

## 第二步：撰寫摘要

編輯 `front/abstract.tex`：

```latex
\begin{abstract}
在此撰寫您的中文摘要（150-300字）...
\end{abstract}

\begin{abstract*}
Write your English abstract here (150-300 words)...
\end{abstract*}
```

## 第三步：撰寫各章節

### 第一章（緒論）- `contents/chapter01.tex`
- \section{前言}
- \section{研究動機與背景}
- \section{研究目標}
- \section{論文架構}

### 第二章（文獻回顧）- `contents/chapter02.tex`
- 整理相關研究

### 第三章（研究方法）- `contents/chapter03.tex`
- 說明您的方法

### 第四章（結果與分析）- `contents/chapter04.tex`
- 呈現實驗結果

### 第五章（結論）- `contents/chapter05.tex`
- 總結貢獻
- 未來工作

## 第四步：插入圖片

1. 將圖片放入 `figures/chapter01/` 等資料夾
2. 在文中使用：

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.7\textwidth]{figures/chapter01/my-image.png}
    \caption{圖片說明}
    \label{fig:my-image}
\end{figure}

引用圖片：如圖 \ref{fig:my-image} 所示...
```

## 第五步：管理參考文獻

編輯 `back/references.bib`：

```bibtex
@article{smith2020,
  title={Article Title},
  author={Smith, John},
  journal={Journal Name},
  volume={10},
  pages={100-110},
  year={2020}
}

@book{doe2021,
  title={Book Title},
  author={Doe, Jane},
  publisher={Publisher},
  year={2021}
}
```

在文中引用：`\cite{smith2020}` 或 `\cite{doe2021}`

## 第六步：編譯並生成 PDF

### 方法 1：使用命令行（推薦）
```bash
cd 論文
latexmk -xelatex main.tex
```

### 方法 2：使用 VS Code
1. 安裝 LaTeX Workshop 擴展
2. 打開 `main.tex`
3. 點擊"Build LaTeX project"或按 Ctrl+Alt+B

### 方法 3：使用文字編輯器編譯
```bash
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

## 完成時的檢查清單

- [ ] 修改了 `nchusetup.tex` 的論文資訊
- [ ] 撰寫了 `abstract.tex` 中英文摘要
- [ ] 撰寫了 `acknowledgement.tex` 致謝
- [ ] 補充了各章節內容（chapter01-05）
- [ ] 添加了參考文獻到 `references.bib`
- [ ] 在 `figures/` 中放入所有圖片
- [ ] 使用 XeLaTeX 成功編譯
- [ ] 檢查了 PDF 的頁碼、目錄、圖片是否正確

## 常用 LaTeX 語法

### 標題
```latex
\chapter{第一章標題}
\section{一級標題}
\subsection{二級標題}
\subsubsection{三級標題}
```

### 列表
```latex
\begin{itemize}
    \item 項目一
    \item 項目二
\end{itemize}

\begin{enumerate}
    \item 第一項
    \item 第二項
\end{enumerate}
```

### 表格
```latex
\begin{table}[htbp]
    \centering
    \caption{表格標題}
    \begin{tabular}{|c|c|c|}
        \hline
        列 1 & 列 2 & 列 3 \\
        \hline
        資料 & 資料 & 資料 \\
        \hline
    \end{tabular}
    \label{tab:label}
\end{table}
```

### 數學公式
```latex
行內公式：$E = mc^2$

獨立公式：
\[
    E = mc^2
\]

帶編號：
\begin{equation}
    E = mc^2
    \label{eq:einstein}
\end{equation}

引用：根據方程式 \ref{eq:einstein}...
```

## 需要幫助？

1. 檢查 README.md 中的常見問題
2. 查看原始 `新興大學論文格式規範.pdf`
3. 參考 nchuthesis.cls 的註解說明

---

## 文件位置參考

| 項目 | 文件位置 |
|------|--------|
| 論文基本資訊 | `nchusetup.tex` |
| 中英文摘要 | `front/abstract.tex` |
| 致謝 | `front/acknowledgement.tex` |
| 緒論 | `contents/chapter01.tex` |
| 文獻回顧 | `contents/chapter02.tex` |
| 研究方法 | `contents/chapter03.tex` |
| 實驗結果 | `contents/chapter04.tex` |
| 結論 | `contents/chapter05.tex` |
| 參考文獻 | `back/references.bib` |
| 附錄 A | `back/appendix01.tex` |
| 附錄 B | `back/appendix02.tex` |
| 圖片庫 | `figures/chapter*/` |

祝您論文撰寫順利！
