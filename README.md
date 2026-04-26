# NCHU Thesis LaTeX Template

國立中興大學學位論文 XeLaTeX 模板。這個專案整理了封面、書名頁、摘要、目錄、圖表目次、章節、參考文獻與附錄的基本結構，目標是讓研究生可以直接從一個可編譯的範例開始寫作。

本模板參照國立中興大學教務處註冊組的「F2-65 學位論文格式規範（111.4.21 修訂）」整理，但不是學校官方模板。送印與上傳前，請仍以教務處與系所最新公告為準：

- 教務處註冊組表格下載：https://oaa.nchu.edu.tw/zh-tw/rs-form/download-list.82.20
- 學位論文格式規範 PDF：https://www.me.nchu.edu.tw/uploads/others/20241010025915_F2-65%E5%AD%B8%E4%BD%8D%E8%AB%96%E6%96%87%E6%A0%BC%E5%BC%8F%E8%A6%8F%E7%AF%84-%E4%B8%AD%E6%96%87%E7%89%88.pdf

## 功能特色

- 使用 XeLaTeX，支援中文與英文內容。
- 以 `nchusetup.tex` 集中管理論文題目、作者、指導教授、日期與關鍵字。
- 內建封面、書名頁、致謝、中文摘要、英文摘要、目錄、表目次、圖目次、參考文獻與附錄入口。
- 支援 Windows、Overleaf 與常見 TeX Live 環境的字體 fallback。
- 內建 GitHub Actions workflow，可在推送與 pull request 時自動編譯範例 PDF。

## 快速開始

### 1. 安裝編譯環境

請先安裝一套 LaTeX 發行版：

- Windows：建議 MiKTeX 或 TeX Live。
- macOS：建議 MacTeX。
- Linux：建議 TeX Live，並安裝 CJK 字體套件，例如 Noto CJK。
- Overleaf：上傳整個專案後，將 compiler 設為 XeLaTeX。

若使用 VS Code，建議安裝：

- LaTeX Workshop
- PDF Viewer 或內建 PDF 預覽相關擴充套件

### 2. 修改論文基本資訊

編輯 `nchusetup.tex`，至少填入系所、題目、作者、指導教授、日期與關鍵字：

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
  date            = {2026-08},
  keywords        = {關鍵字一, 關鍵字二, 關鍵字三},
  keywords*       = {Keyword 1, Keyword 2, Keyword 3},
}
```

`date` 可填 `YYYY-MM` 或 `YYYY-MM-DD`。封面會轉成民國年月顯示。

### 3. 填寫內容

- `front/acknowledgement.tex`：致謝
- `front/abstract.tex`：中文摘要與英文摘要
- `contents/chapter01.tex` 到 `contents/chapter05.tex`：各章正文
- `back/references.bib`：BibTeX 參考文獻
- `back/appendix01.tex`、`back/appendix02.tex`：附錄範例

### 4. 編譯 PDF

最推薦使用 `latexmk`：

```bash
latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex
```

若 `latexmk` 無法使用，請改用手動流程：

```bash
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

在 Windows + MiKTeX 上，`latexmk` 需要 Perl；若尚未安裝 Perl，使用上面的手動流程即可。

### 5. 清理編譯暫存檔

```bash
latexmk -C
```

或刪除 `.aux`、`.bbl`、`.log`、`.toc`、`.lof`、`.lot`、`.out` 等產物。這些檔案已列入 `.gitignore`。

## 專案結構

| 路徑 | 用途 |
|------|------|
| `main.tex` | 主文件，依序串接封面、摘要、目錄、正文、參考文獻與附錄 |
| `nchusetup.tex` | 論文基本資訊與使用者額外套件設定 |
| `nchuthesis.cls` | 模板格式定義，控制字體、頁面、章節樣式、目錄樣式等 |
| `front/` | 前置資料，如致謝與摘要 |
| `contents/` | 正文章節內容 |
| `back/` | 參考文獻與附錄 |
| `figures/` | 圖片資源 |
| `FORMAT_SPEC.md` | 格式規範對照與微調位置 |
| `CONTRIBUTING.md` | 貢獻方式與維護建議 |

## 常用調整

### 切換論文類型與語言

在 `main.tex` 的 `\documentclass` 調整：

```latex
\documentclass[
  twoside,
  openright,
  degree   = master,
  language = chinese,
  fontset  = system,
]{nchuthesis}
```

可用選項：

- `degree = master` 或 `doctor`
- `language = chinese` 或 `english`
- `fontset = system`、`overleaf`、`template`、`default`

`system` 適合本機編譯，會優先使用 Windows 常見字體並 fallback 到 Noto CJK；`overleaf` 適合 Overleaf 或 Linux/TeX Live 環境。

### 插入圖片

將圖片放到 `figures/` 或其子資料夾後，在章節檔加入：

```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.7\textwidth]{figures/chapter01/example.png}
  \caption{圖片說明}
  \label{fig:example}
\end{figure}
```

### 插入表格

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

### 新增參考文獻

在 `back/references.bib` 新增條目，正文使用 `\cite{key}`：

```bibtex
@article{example2020,
  title   = {Paper Title},
  author  = {Author, A.},
  journal = {Journal Name},
  year    = {2020}
}
```

## 常見問題

### 中文顯示異常或亂碼

- 確認使用 XeLaTeX，不是 pdfLaTeX。
- 確認檔案編碼為 UTF-8。
- Linux 或 Overleaf 若找不到中文字體，先改用 `fontset = overleaf`。

### 找不到字體

模板會依序尋找常見中文字體。若仍失敗，請安裝 Noto CJK 字體，或在 `nchuthesis.cls` 的字體設定區加入你的系統字體名稱。

### 參考文獻沒有出現

請確認正文中有使用 `\cite{...}`，並依序執行：

```bash
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

### 頁碼不正確

請避免移除 `main.tex` 裡的 `\pagenumbering{roman}` 與 `\mainmatter`。摘要到目錄使用羅馬數字，正文開始後使用阿拉伯數字。

### 審核頁或授權頁要怎麼放

掃描或下載後放在專案根目錄，並在 `main.tex` 啟用：

```latex
% \includepdf{a4_approval.pdf}
% \includepdf{a4_authorization.pdf}
```

這些通常含有個人資料，不建議提交到公開 GitHub repository。

## 發佈前檢查清單

- `nchusetup.tex` 的作者、題目、系所、日期與關鍵字皆已更新。
- `main.tex` 能成功編譯。
- 目錄、表目次、圖目次與參考文獻頁碼正常。
- 審核頁、授權頁等個人資料未被 commit 到公開 repository。
- 已依系所最新公告確認格式要求。

## 維護資訊

- 模板整理與維護：黃哲韋，劉宇諾
- 最近整理日期：2026-04-26

## 授權

除學校格式規範、審核頁、授權頁掃描檔等不屬於本模板原創內容的資料外，本模板的程式與範例內容採用 [MIT License](LICENSE)。
