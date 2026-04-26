% --------------------------------------------------
% 01 類別宣告（Class Declaration）
% --------------------------------------------------

% 告知編譯器當前的 LaTeX 版本
\NeedsTeXFormat{LaTeX2e}

% 定義類別名稱與敘述
\ProvidesClass{nchuthesis}[2026/04/26 v2.1 NCHU thesis template]

% --------------------------------------------------
% 02 基礎設定（Basic Settings）
% --------------------------------------------------

% [引入套件]
\RequirePackage{kvdefinekeys, kvsetkeys, kvoptions}
\RequirePackage{iftex}
\RequirePackage{ifthen}

% [定義變數]

% 變數: 路徑
% Variables: Path
\newcommand{\nchu@path@font}{./fonts/english/}
\newcommand{\nchu@path@cjkfont}{./fonts/chinese/}

% 變數: 中文翻譯
\newcommand{\nchu@verificationletter@zh}{口試委員審定書}
\newcommand{\nchu@tableofcontents@zh}{目錄}
\newcommand{\nchu@listoffigures@zh}{圖目錄}
\newcommand{\nchu@listoftables@zh}{表目錄}
\newcommand{\nchu@bibliography@zh}{參考文獻}
\newcommand{\nchu@acknowledgement@zh}{致謝}
\newcommand{\nchu@abstract@zh}{摘要}
\newcommand{\nchu@keyword@zh}{關鍵字：}
\newcommand{\nchu@kwsymbol@zh}{、}
\newcommand{\nchu@appendix@zh}{附錄}

\newcommand{\nchu@titlechapter@zh}{第\CJKnumber{\thechapter}章}
\newcommand{\nchu@titlechaptertoc@zh}{第\CJKnumber{\thecontentslabel}章}

% 變數: 英文翻譯
\newcommand{\nchu@verificationletter@en}{Verification Letter from the Oral Examination Committee}
\newcommand{\nchu@tableofcontents@en}{Contents}
\newcommand{\nchu@listoffigures@en}{List of Figures}
\newcommand{\nchu@listoftables@en}{List of Tables}
\newcommand{\nchu@bibliography@en}{References}
\newcommand{\nchu@acknowledgement@en}{Acknowledgements}
\newcommand{\nchu@abstract@en}{Abstract}
\newcommand{\nchu@keyword@en}{Keywords:~}
\newcommand{\nchu@kwsymbol@en}{,~}
\newcommand{\nchu@appendix@en}{Appendix}
\newcommand{\nchu@titlechapter@en}{Chapter~\thechapter}
\newcommand{\nchu@titlechaptertoc@en}{Chapter~\thecontentslabel}

% 變數: 版面設定
\newcommand{\nchu@geometry@main}{top=3cm, bottom=3cm, left=3cm, right=3cm}
\newcommand{\nchu@geometry@cover}{top=3cm, bottom=3cm, left=3cm, right=3cm}

\newcommand{\nchu@tocvspace}{1em}
\newcommand{\nchu@tocchaptersize@zh}{4.5em}
\newcommand{\nchu@tocchaptersize@en}{5.5em}

\newcommand{\nchu@tocsecindent@zh}{1.5em}
\newcommand{\nchu@tocsecnumwidth@zh}{3.0em}
\newcommand{\nchu@tocsubsecindent@zh}{3.0em}
\newcommand{\nchu@tocsubsecnumwidth@zh}{3.0em}

\newcommand{\nchu@tocsecindent@en}{2.5em}
\newcommand{\nchu@tocsecnumwidth@en}{3.0em}
\newcommand{\nchu@tocsubsecindent@en}{3.0em}
\newcommand{\nchu@tocsubsecnumwidth@en}{3.0em}

% [定義命令]

% 命令: 錯誤訊息
\newcommand{\nchu@error}[1]{
  \ClassError{nchuthesis}{#1}{}
}

\newcommand{\nchu@warning}[1]{
  \ClassWarning{nchuthesis}{#1}
}

% 命令: 鍵值設定
\SetupKeyvalOptions{
  family=nchu,
  prefix=nchu@,
  setkeys=\kvsetkeys
}

% 定义所有需要的键值对
\newcommand{\nchu@setup@keys}{
  % 文檔類選項
  \define@key{nchu}{degree}{\gdef\nchu@degreeset{##1}}
  \define@key{nchu}{language}{\gdef\nchu@language{##1}}
  \define@key{nchu}{fontset}{\gdef\nchu@fontset{##1}}
  \define@key{nchu}{watermark}{\gdef\nchu@watermark{##1}}
  \define@key{nchu}{doi}{\gdef\nchu@doi{##1}}
  
  % 文檔信息
  \define@key{nchu}{university}{\gdef\nchu@university{##1}}
  \define@key{nchu}{university*}{\gdef\nchu@university@en{##1}}
  \define@key{nchu}{institute}{\gdef\nchu@institute{##1}}
  \define@key{nchu}{title}{\gdef\nchu@title{##1}}
  \define@key{nchu}{title*}{\gdef\nchu@title@en{##1}}
  \define@key{nchu}{advisor}{\gdef\nchu@advisor{##1}}
  \define@key{nchu}{advisor*}{\gdef\nchu@advisor@en{##1}}
  \define@key{nchu}{author}{\gdef\nchu@author{##1}}
  \define@key{nchu}{author*}{\gdef\nchu@author@en{##1}}
  \define@key{nchu}{keywords}{\gdef\nchu@keywords{##1}}
  \define@key{nchu}{keywords*}{\gdef\nchu@keywords@en{##1}}
  \define@key{nchu}{date}{\gdef\nchu@date{##1}}
  \define@key{nchu}{oral-date}{\gdef\nchu@oraldate{##1}}
}

% 初始化默認值
\gdef\nchu@degreeset{master}
\gdef\nchu@language{chinese}
\gdef\nchu@fontset{system}
\gdef\nchu@watermark{false}
\gdef\nchu@doi{false}
\gdef\nchu@university{國立中興大學}
\gdef\nchu@university@en{National Chung Hsing University}
\gdef\nchu@institute{系所全名}
\gdef\nchu@title{論文題目}
\gdef\nchu@title@en{Title}
\gdef\nchu@advisor{指導教授}
\gdef\nchu@advisor@en{Advisor Name}
\gdef\nchu@author{研究生}
\gdef\nchu@author@en{Author Name}
\gdef\nchu@keywords{關鍵字}
\gdef\nchu@keywords@en{Keywords}
\gdef\nchu@date{\the\year-\two@digits{\month}-\two@digits{\day}}
\gdef\nchu@oraldate{\the\year-\two@digits{\month}-\two@digits{\day}}

% 設置所有鍵
\nchu@setup@keys

\newcommand{\nchusetup}{
  \kvsetkeys{nchu}
}

\newcommand{\nchu@define@key}[1]{
  \kvsetkeys{nchu}{#1}
}

% 命令: 鍵值陣列使用
\newcommand\nchu@clist@use[2]{%
  \def\nchu@@tmp{}%
  \kv@set@family@handler{nchu@clist}{%
    \ifx\nchu@@tmp\@empty
      \def\nchu@@tmp{#2}%
    \else
      #2%
    \fi
    ##1%
  }%
  \kvsetkeys@expandafter{nchu@clist}{#1}%
}

% 命令: 日期格式
\newcommand{\nchu@format@date}[2]{%
  \edef\nchu@@date{#2}%
  \def\nchu@@date@formatter{#1}%
  \expandafter\nchu@@process@date\nchu@@date--\@nil
}
\def\nchu@@process@date#1-#2-#3-#4\@nil{%
  \nchu@@date@formatter{#1}{#2}{#3}%
}
\newcommand\nchu@date@zh@short[3]{\the\numexpr#1-1911\relax~年~\number#2~月}
\newcommand\nchu@date@zh@digit[3]{\the\numexpr#1-1911\relax~年~\number#2~月}
\newcommand\nchu@date@zh@digit@short[3]{\the\numexpr#1-1911\relax~年~\number#2~月}
\newcommand\nchu@date@en@short[3]{\monthname[#2], #1}

\newcommand{\nchu@setgeometry}[1]{\expandafter\newgeometry\expandafter{#1}}

% --------------------------------------------------
% 03 編譯檢查（Compile Checking）
% --------------------------------------------------

\ifXeTeX\else
  \nchu@error{XeLaTeX is required to compile this document.}
\fi

% --------------------------------------------------
% 04 論文設定（Document Configs）
% --------------------------------------------------

% [文檔選項]
% *** 文档配置已通过 \define@key 完成上方定义 ***

% --------------------------------------------------
% 06 選項設定（Options Settings）
% --------------------------------------------------

% 繼承類別選項（將未定義的傳給基礎文檔）
\DeclareDefaultOption{
  \PassOptionsToClass{\CurrentOption}{report}
}

% 處理選項並載入基礎文檔
\ProcessKeyvalOptions*\relax
\LoadClass[a4paper, 12pt]{report}

% 根據設定值賦值變數
\ifthenelse{\equal{\nchu@degreeset}{master}}{
  \newcommand{\nchu@degree}{碩士學位}
  \newcommand{\nchu@degree@en}{Master}
  \newcommand{\nchu@type}{論文}
  \newcommand{\nchu@type@en}{Thesis}
}

\ifthenelse{\equal{\nchu@degreeset}{doctor}}{
  \newcommand{\nchu@degree}{博士學位}
  \newcommand{\nchu@degree@en}{Doctoral}
  \newcommand{\nchu@type}{論文}
  \newcommand{\nchu@type@en}{Dissertation}
}

\ifthenelse{\equal{\nchu@language}{chinese}}{
  % 設定中文
  \newcommand{\nchu@titlechapter}{\nchu@titlechapter@zh}
  \newcommand{\nchu@titlechaptertoc}{\nchu@titlechaptertoc@zh}
  \newcommand{\nchu@tocchaptersize}{\nchu@tocchaptersize@zh}
  \newcommand{\nchu@acknowledgement}{\nchu@acknowledgement@zh}
  \newcommand{\nchu@tableofcontents}{\nchu@tableofcontents@zh}
  \newcommand{\nchu@listoffigures}{\nchu@listoffigures@zh}
  \newcommand{\nchu@listoftables}{\nchu@listoftables@zh}
  \newcommand{\nchu@verificationletter}{\nchu@verificationletter@zh}
  \newcommand{\nchu@bibliography}{\nchu@bibliography@zh}
  \newcommand{\nchu@appendix}{\nchu@appendix@zh}

  % 設定單位
  \newcommand{\nchu@tocsecindent}{\nchu@tocsecindent@zh}
  \newcommand{\nchu@tocsecnumwidth}{\nchu@tocsecnumwidth@zh}
  \newcommand{\nchu@tocsubsecindent}{\nchu@tocsubsecindent@zh}
  \newcommand{\nchu@tocsubsecnumwidth}{\nchu@tocsubsecnumwidth@zh}
}

\ifthenelse{\equal{\nchu@language}{english}}{
  % 設定英文
  \newcommand{\nchu@titlechapter}{\nchu@titlechapter@en}
  \newcommand{\nchu@titlechaptertoc}{\nchu@titlechaptertoc@en}
  \newcommand{\nchu@tocchaptersize}{\nchu@tocchaptersize@en}
  \newcommand{\nchu@acknowledgement}{\nchu@acknowledgement@en}
  \newcommand{\nchu@tableofcontents}{\nchu@tableofcontents@en}
  \newcommand{\nchu@listoffigures}{\nchu@listoffigures@en}
  \newcommand{\nchu@listoftables}{\nchu@listoftables@en}
  \newcommand{\nchu@verificationletter}{\nchu@verificationletter@en}
  \newcommand{\nchu@bibliography}{\nchu@bibliography@en}
  \newcommand{\nchu@appendix}{\nchu@appendix@en}

  % 設定單位
  \newcommand{\nchu@tocsecindent}{\nchu@tocsecindent@en}
  \newcommand{\nchu@tocsecnumwidth}{\nchu@tocsecnumwidth@en}
  \newcommand{\nchu@tocsubsecindent}{\nchu@tocsubsecindent@en}
  \newcommand{\nchu@tocsubsecnumwidth}{\nchu@tocsubsecnumwidth@en}
}

% --------------------------------------------------
% 07 載入套件 (Include Packages)
% --------------------------------------------------

\RequirePackage{xparse}
\RequirePackage{xeCJK}
\RequirePackage{indentfirst}
\RequirePackage{fontspec}
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\RequirePackage{titletoc, tocloft}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{eso-pic}
\RequirePackage{pdfpages}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{diagbox}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{datetime}
\RequirePackage{CJKnumb}
\RequirePackage{fp, calc}
\RequirePackage{hyperref}
\RequirePackage{paralist}
\RequirePackage{footmisc}
\RequirePackage{caption}
\RequirePackage{subcaption}

% --------------------------------------------------
% 10 套件設定 (Package Settings)
% --------------------------------------------------

% [文章排版]
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt
\setlength{\parskip}{10pt}
\setlength{\parindent}{2em}

% [字體設定]
% 依序尋找常見字體，降低跨系統編譯時的失敗率。
\newcommand{\nchu@set@latinfont}{%
  \IfFontExistsTF{Times New Roman}{%
    \setmainfont{Times New Roman}%
  }{%
    \IfFontExistsTF{TeX Gyre Termes}{%
      \setmainfont{TeX Gyre Termes}%
      \nchu@warning{Times New Roman not found; using TeX Gyre Termes.}%
    }{%
      \nchu@warning{Times New Roman and TeX Gyre Termes not found; using default Latin font.}%
    }%
  }%
}

\newcommand{\nchu@set@sansfont}{%
  \IfFontExistsTF{Arial}{%
    \setsansfont{Arial}%
  }{%
    \IfFontExistsTF{Droid Sans}{%
      \setsansfont{Droid Sans}%
    }{}%
  }%
}

\newcommand{\nchu@set@monofont}{%
  \IfFontExistsTF{Courier New}{%
    \setmonofont{Courier New}%
  }{%
    \IfFontExistsTF{Latin Modern Mono}{%
      \setmonofont{Latin Modern Mono}%
    }{}%
  }%
}

\newcommand{\nchu@set@cjkfont}[2]{%
  \setCJKmainfont{#1}[AutoFakeBold = #2]%
  \gdef\nchu@cjkfontname{#1}%
}

\gdef\nchu@cjkfontname{}

\newcommand{\nchu@set@cjk@noto}{%
  \IfFontExistsTF{Noto Serif CJK TC}{%
    \nchu@set@cjkfont{Noto Serif CJK TC}{2}%
  }{%
    \IfFontExistsTF{Noto Serif CJK SC}{%
      \nchu@set@cjkfont{Noto Serif CJK SC}{2}%
    }{%
      \IfFontExistsTF{FandolSong-Regular}{%
        \nchu@set@cjkfont{FandolSong-Regular}{2}%
      }{%
        \IfFontExistsTF{FandolKai-Regular}{%
          \nchu@set@cjkfont{FandolKai-Regular}{2}%
        }{%
          \nchu@error{No supported CJK font found. Install Noto CJK fonts or choose another fontset.}%
        }%
      }%
    }%
  }%
}

\newcommand{\nchu@set@cjk@system}{%
  \IfFontExistsTF{DFKai-SB}{%
    \nchu@set@cjkfont{DFKai-SB}{2}%
  }{%
    \IfFontExistsTF{BiauKai}{%
      \nchu@set@cjkfont{BiauKai}{2}%
    }{%
      \IfFontExistsTF{KaiTi}{%
        \nchu@set@cjkfont{KaiTi}{2}%
      }{%
        \IfFontExistsTF{SimSun}{%
          \nchu@set@cjkfont{SimSun}{2}%
        }{%
          \nchu@set@cjk@noto
        }%
      }%
    }%
  }%
}

\nchu@set@latinfont
\nchu@set@sansfont
\nchu@set@monofont

\ifthenelse{\equal{\nchu@fontset}{overleaf}}{%
  \nchu@set@cjk@noto
}{%
  \nchu@set@cjk@system
}

\newcommand{\nchu@set@cjkmonofont}{%
  \ifx\nchu@cjkfontname\@empty\else
    \setCJKmonofont{\nchu@cjkfontname}[AutoFakeBold = 2]%
  \fi
}
\nchu@set@cjkmonofont

% [版面大小]
\RequirePackage{geometry}
\geometry{
  top=3cm,
  bottom=3cm,        
  left=3cm,
  right=3cm
}

% [連結設定]
\hypersetup{
  unicode=true,
  colorlinks=true,
  linkcolor=black,
  anchorcolor=black,
  citecolor=black,
  urlcolor=black,
  pdfstartview=FitH
}

\AtBeginDocument{%
  \hypersetup{%
    pdftitle={\nchu@title},
    pdfauthor={\nchu@author},
    pdfsubject={\nchu@university\space \nchu@degree\nchu@type},
    pdfkeywords={\nchu@keywords}%
  }%
}

% [目錄格式]
\addtocontents{toc}{~\hfill\textbf{Page}\par}

\titlecontents{chapter}[0em]
{\addvspace{0.5em}\normalsize\bfseries\protect}
{\fboxrule=0pt\fboxsep=0pt\framebox[\nchu@tocchaptersize][l]{\nchu@titlechaptertoc}}
{}
{\hfill\contentspage}

\setlength{\cftbeforesecskip}{8pt}
\setlength{\cftbeforesubsecskip}{8pt}

\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}

\cftsetindents{section}{\nchu@tocsecindent}{\nchu@tocsecnumwidth}
\cftsetindents{subsection}{\nchu@tocsubsecindent}{\nchu@tocsubsecnumwidth}

% [標題格式]
\titleformat{\chapter}
{\centering\Huge\bfseries}
{\nchu@titlechapter}
{1em}
{}

\titlespacing*{\chapter}{0pt}{0pt}{1\baselineskip}
\titlespacing*{\section}{0pt}{1\baselineskip}{0pt}
\titlespacing*{\subsection}{0pt}{0.5\baselineskip}{0pt}

% [圖表標題]
\setlength{\intextsep}{12bp \@plus4pt \@minus2pt}
\captionsetup{}
\captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[figure]{position=bottom,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[sub]{skip=6bp}

% --------------------------------------------------
% 08 自訂命令（Custom Commands）
% --------------------------------------------------

% [中文縮進]
\newcommand{\nchu@CJKChar@size}{\hskip \f@size \p@}
\newdimen{\nchu@CJKChar@size@dimen}
\settowidth{\nchu@CJKChar@size@dimen}{\nchu@CJKChar@size\CJKglue}

\newcommand{\CJKsetfontspace}{
  \settowidth\nchu@CJKChar@size@dimen{\nchu@CJKChar@size\CJKglue}
  \ifthenelse{\parindent=0pt}{\relax}{\parindent2\nchu@CJKChar@size@dimen}
}

\newcommand{\Eindent}{
  \CJKsetfontspace\parindent2\nchu@CJKChar@size@dimen
}

\newcommand{\Enoindent}{
  \parindent\z@
}

% [插入浮水印]
\newcommand{\makewatermark}[2]{
  \AddToShipoutPicture{
    \put(0,0){
      \parbox[b][\paperheight]{\paperwidth}{
        \vfill
        \centering
        \begin{tikzpicture}[remember picture, overlay]
          \coordinate (WM) at ([xshift=-4.325cm, yshift=-4.325cm] current page.north east);
          \node [scale=1] at (WM) {\includegraphics[width=3.65cm, height=3.65cm]{#2}};
          \filldraw [fill=white, opacity=1-\the\numexpr#1] (current page.north east) rectangle (current page.south west);
        \end{tikzpicture}
      \vfill
}}}}

% [生成封面/書名頁]
\newcommand{\makecover}{
  \begin{titlepage}
    \thispagestyle{empty}
    \begin{center}
      \fontsize{20pt}{24pt}\selectfont
      
      \nchu@university\nchu@institute\par
      \nchu@degree\nchu@type\par
      \vfill
      
      \nchu@title\par
      {\rmfamily\nchu@title@en}\par
      
      \vfill
      
      指導教授： \nchu@advisor ~ \nchu@advisor@en\par
      研 究 生： \nchu@author ~ \nchu@author@en\par
      
      \vfill
      
      中華民國~\nchu@format@date{\nchu@date@zh@digit@short}{\nchu@date}\par
      
    \end{center}
  \end{titlepage}
  \clearpage
}

% [生成目錄]
\renewcommand{\contentsname}{\centerline{\nchu@tableofcontents}}
\newcommand{\maketableofcontents}{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\nchu@tableofcontents}
  \tableofcontents
}

\renewcommand{\listfigurename}{\centerline{\nchu@listoffigures}}
\newcommand{\makelistoffigures}{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\nchu@listoffigures}
  \listoffigures
}

\renewcommand{\listtablename}{\centerline{\nchu@listoftables}}
\newcommand{\makelistoftables}{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\nchu@listoftables}
  \listoftables
}

% [正文開始]
\newcommand{\mainmatter}{
  \cleardoublepage
  \nchu@setgeometry{\nchu@geometry@main}
  \pagenumbering{arabic}
  \fontsize{12}{18}\selectfont
}

% [參考文獻]
\newcommand{\refmatter}{
  \cleardoublepage
  \phantomsection
  \renewcommand{\bibname}{\nchu@bibliography}
  \addcontentsline{toc}{chapter}{\nchu@bibliography}
}

% [附錄]
\renewcommand{\appendix}[2]{
  \chapter*{\nchu@appendix~{#1}~---~#2}
  \phantomsection
  \addcontentsline{toc}{chapter}{\nchu@appendix~{#1}~---~#2}
  \setcounter{section}{0}
  \renewcommand{\thechapter}{#1}
}

% --------------------------------------------------
% 09 自訂環境（Custom Environments）
% --------------------------------------------------

% [誌謝環境]
\newenvironment{acknowledgement}{
  \chapter*{\centering \nchu@acknowledgement}
  \fontsize{12}{18}\selectfont
}

% [摘要環境]
\renewenvironment{abstract}{
  \fontsize{12}{18}\selectfont
  \chapter*{\centering \nchu@abstract@zh}
  \addcontentsline{toc}{chapter}{\nchu@abstract@zh}
}{
  \bigbreak
  \noindent \textbf{\nchu@keyword@zh}
  \nchu@clist@use{\nchu@keywords}{\nchu@kwsymbol@zh}
}

\newenvironment{abstract*}{
  \fontsize{12}{24}\selectfont
  \chapter*{\centering \nchu@abstract@en}
  \addcontentsline{toc}{chapter}{\nchu@abstract@en}
}{
  \bigbreak
  \noindent \textbf{\nchu@keyword@en}
  \nchu@clist@use{\nchu@keywords@en}{\nchu@kwsymbol@en}
}

% --------------------------------------------------
% 10 文檔處理（Document Processing）
% --------------------------------------------------

% 設定行距 1.6: 2.0 倍行距
\setstretch{1.6}

\endinput
