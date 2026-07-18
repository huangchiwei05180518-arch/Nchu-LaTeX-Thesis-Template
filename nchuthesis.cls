% --------------------------------------------------
% 01 類別宣告（Class Declaration）
% --------------------------------------------------

% 告知編譯器當前的 LaTeX 版本
\NeedsTeXFormat{LaTeX2e}

% 定義類別名稱與敘述
\ProvidesClass{nchuthesis}[2026/07/18 v2.2 NCHU thesis template]

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
  \define@key{nchu}{submission}{\gdef\nchu@submission{##1}}
  \define@key{nchu}{profile}{\gdef\nchu@profile{##1}}
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
\gdef\nchu@submission{electronic}
\gdef\nchu@profile{general}
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
\newcommand\nchu@date@zh@short[3]{%
  \expandafter\CJKnumber\expandafter{\number\numexpr#1-1911\relax}年%
  \expandafter\CJKnumber\expandafter{\number\numexpr#2\relax}月%
}
\newcommand\nchu@date@zh@digit[3]{\nchu@date@zh@short{#1}{#2}{#3}}
\newcommand\nchu@date@zh@digit@short[3]{\nchu@date@zh@short{#1}{#2}{#3}}
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

% 公開模式判斷，供 main.tex 安排紙本與電子版前置頁。
\newif\ifnchuprint
\newif\ifnchuelectronic
\ifthenelse{\equal{\nchu@submission}{print}}{%
  \nchuprinttrue
  \nchuelectronicfalse
}{%
  \ifthenelse{\equal{\nchu@submission}{electronic}}{%
    \nchuprintfalse
    \nchuelectronictrue
  }{%
    \nchu@error{Unknown submission mode '\nchu@submission'. Use electronic or print.}%
  }%
}

% 系所 profile。ee 依電機系公告使用中文 13pt、英文 12pt。
\gdef\nchu@cjkfontscale{1}
\ifthenelse{\equal{\nchu@profile}{ee}}{%
  \gdef\nchu@cjkfontscale{1.083333}%
}{%
  \ifthenelse{\equal{\nchu@profile}{general}}{}{%
    \nchu@error{Unknown profile '\nchu@profile'. Use general or ee.}%
  }%
}

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
  \setCJKmainfont{#1}[Scale = \nchu@cjkfontscale, AutoFakeBold = #2]%
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

\newcommand{\nchu@set@cjk@kai}{%
  \IfFontExistsTF{DFKai-SB}{%
    \nchu@set@cjkfont{DFKai-SB}{2}%
  }{%
    \IfFontExistsTF{BiauKai}{%
      \nchu@set@cjkfont{BiauKai}{2}%
    }{%
      \IfFontExistsTF{KaiTi}{%
        \nchu@set@cjkfont{KaiTi}{2}%
      }{%
        \IfFontExistsTF{FandolKai-Regular}{%
          \nchu@set@cjkfont{FandolKai-Regular}{2}%
        }{%
          \nchu@error{The ee profile requires a Kai font. Install DFKai-SB, BiauKai, KaiTi, or FandolKai.}%
        }%
      }%
    }%
  }%
}

\nchu@set@latinfont
\nchu@set@sansfont
\nchu@set@monofont

\ifthenelse{\equal{\nchu@profile}{ee}}{%
  \nchu@set@cjk@kai
}{%
  \ifthenelse{\equal{\nchu@fontset}{overleaf}}{%
    \nchu@set@cjk@noto
  }{%
    \nchu@set@cjk@system
  }%
}

\newcommand{\nchu@set@cjkmonofont}{%
  \ifx\nchu@cjkfontname\@empty\else
    \setCJKmonofont{\nchu@cjkfontname}[Scale = \nchu@cjkfontscale, AutoFakeBold = 2]%
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

% 發布前常見錯誤：保留範例欄位或中文題目超過校級規範的 60 字。
\ExplSyntaxOn
\cs_new_protected:Npn \nchu_validate_metadata:
  {
    \tl_set:Nx \l_tmpa_tl
      {
        \nchu@institute \nchu@title \nchu@title@en
        \nchu@author \nchu@author@en \nchu@advisor \nchu@advisor@en
      }
    \clist_map_inline:nn
      { 您的,學程名稱,系所全名,Your~Name,Advisor~Name,Title~of~Your }
      {
        \tl_if_in:VnT \l_tmpa_tl { ##1 }
          {
            \nchu@warning
              { Placeholder~metadata~remains~in~nchusetup.tex:~'##1'. }
          }
      }
    \tl_set:Nx \l_tmpa_tl { \nchu@title }
    \int_compare:nNnT { \tl_count:V \l_tmpa_tl } > { 60 }
      {
        \nchu@warning
          { The~Chinese~title~exceeds~60~characters;~the~official~limit~is~three~lines/60~characters. }
      }
  }
\cs_new_eq:NN \nchu@validatemetadata \nchu_validate_metadata:
\ExplSyntaxOff
\AtBeginDocument{\nchu@validatemetadata}

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

% 紙本封面後的空白頁；電子論文不得保留此頁。
\newcommand{\makeblankpage}{%
  \clearpage
  \thispagestyle{empty}%
  \null
  \clearpage
}

% 電子論文必須包含審定書；找不到時保留可編譯性並發出醒目警告。
\newcommand{\includeapprovalpage}[1]{%
  \IfFileExists{#1}{%
    \includepdf[pages=-,pagecommand={\thispagestyle{empty}}]{#1}%
  }{%
    \ifnchuelectronic
      \nchu@warning{Approval page '#1' not found. It is required in the final electronic PDF.}%
    \else
      \nchu@warning{Approval page '#1' not found. It is required in the final printed thesis.}%
    \fi
  }%
}

% 官方規範要求圖表的資料來源置於下方並靠左。
\newcommand{\figuresource}[1]{%
  \par\smallskip
  \begin{minipage}{\linewidth}\raggedright\small
    資料來源：#1
  \end{minipage}%
}
\newcommand{\tablesource}[1]{\figuresource{#1}}

% 紙本通常需附授權書影本；依圖書館最新規定與個人授權方式確認。
\newcommand{\includeauthorizationpage}[1]{%
  \IfFileExists{#1}{%
    \includepdf[pages=-,pagecommand={\thispagestyle{empty}}]{#1}%
  }{%
    \nchu@warning{Authorization page '#1' not found. Check whether it is required for the printed copy.}%
  }%
}

% 電子版只換頁；紙本模式可配合 openright 產生裝訂所需的偶數頁。
\newcommand{\nchuclearpage}{%
  \ifnchuprint\cleardoublepage\else\clearpage\fi
}

% [生成目錄]
\renewcommand{\contentsname}{\centerline{\nchu@tableofcontents}}
\newcommand{\maketableofcontents}{
  \nchuclearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{\nchu@tableofcontents}
  \tableofcontents
}

\renewcommand{\listfigurename}{\centerline{\nchu@listoffigures}}
\newcommand{\makelistoffigures}{
  \nchuclearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{\nchu@listoffigures}
  \listoffigures
}

\renewcommand{\listtablename}{\centerline{\nchu@listoftables}}
\newcommand{\makelistoftables}{
  \nchuclearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{\nchu@listoftables}
  \listoftables
}

% [正文開始]
\newcommand{\mainmatter}{
  \nchuclearpage
  \nchu@setgeometry{\nchu@geometry@main}
  \pagenumbering{arabic}
  \fontsize{12}{18}\selectfont
}

% [參考文獻]
\newcommand{\refmatter}{
  \nchuclearpage
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
  \fontsize{12}{18}\selectfont
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

% 12pt/18pt 為 1.5 倍行距；ee profile 的中文字形另縮放為 13pt。
\setstretch{1}

\endinput
