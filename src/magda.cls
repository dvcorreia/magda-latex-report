% Latex Document Class used exclusively by Engenius UA 
% (c) 2018, Diogo Correia and João Santos, MIT Licensed
% Original Repository: https://github.com/dvcorreia/engenius-ua-latex-template
%

% Define Document preset and configurations ---------------------
\LoadClass[twocolumn]{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{magda}[2019/11/19 Magda Latex Class]

% Packages ------------------------------------------------------

\RequirePackage{hyperref}
\RequirePackage{blindtext}

% Page Layout
\RequirePackage{titlesec}

% Fonts and Language

% Output Font Encoding, add support to accented chars
\RequirePackage[T1]{fontenc}

% Allow User to type accented char directly from keyboard
\RequirePackage[utf8]{inputenc}

% Postscript Version of Latin Modern Default Font
\RequirePackage{kpfonts}

% Document Margins
\RequirePackage[left=0.75in,right=0.75in,top=0.75in,bottom=1in]{geometry}

% Header/Footers
\RequirePackage{fancyhdr}


% Column Uttility
\RequirePackage{multicol}
\RequirePackage{ragged2e}
\RequirePackage{datetime} \yyyymmdddate
\RequirePackage[nottoc]{tocbibind}

% Page Layout Definition -----------------------------------------
\titleformat{\section}{\Large\bfseries}{\thesection}{0.75em}{}%[\titlerule]
\titleformat{\subsection}{\large\bfseries}{\thesubsection}{0.5em}{}
\titleformat{\subsubsection}{\normalsize\bfseries}{\thesubsubsection}{0.5em}{}

% Department Identification Colors

\RequirePackage{color}

\newcommand{\barcolor}[3]{
    \def \barred {#1}
    \def \bargreen {#2}
    \def \barblue {#3}
}

\newcommand{\upperrighttag}[1]{\def \ttextA{#1}}

\def\dep@default{\def\dep@red{\barred}\def\dep@green{\bargreen}\def\dep@blue{\barblue}}

\DeclareOption{default}{\dep@default
  \let\dep@redT=\dep@red
  \let\dep@greenT=\dep@green
  \let\dep@blueT=\dep@blue
  \def\dep@textA{\ttextA}}

% Default
\ExecuteOptions{default}

\ProcessOptions

% Commands and Variables -----------------------------------------
\newcommand{\logoone}[1] {\def\vlogoone{assets/#1}}
\newcommand{\logotwo}[1] {\def\vlogotwo{assets/#1}}

\newif\ifdate
\datefalse
\newcommand{\showdate}{\datetrue}

\def\mydate{\leavevmode\hbox{\twodigits\day-\twodigits\month-\the\year}}
\def\twodigits#1{\ifnum#1<10 0\fi\the#1}

\newcommand{\email}[1]{\href{mailto:#1}{#1}}

\bibliographystyle{unsrt}

% Code snippets ----------------------------------------------------

\RequirePackage{minted}
\RequirePackage[skins,listings]{tcolorbox}

\newtcolorbox{codebox}[1]{
colback=white,colframe=black,fonttitle=\sffamily\bfseries\normalsize,
title=#1}

\setminted{fontsize=\footnotesize,breaklines,breakanywhere,fontfamily=helvetica}

% Page Header and Footer -----------------------------------------
\RequirePackage{graphicx}
\RequirePackage{scalerel}

% Define Header and Footer Style --------------------------
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{
    \includegraphics[height=0.25in]{\vlogoone}\space\space\space
    \includegraphics[height=0.25in]{\vlogotwo}
}
\fancyhead[R]{\large\dep@textA}
\fancyfoot[R]{\thepage}
\renewcommand{\footrulewidth}{0.5pt}

% Maketitle renewcommand -----------------------------------------

\newcommand{\titletwo}[1]{\gdef\@titletwo{#1}}

\renewcommand{\maketitle}{
\twocolumn[
    \begin{@twocolumnfalse}
    
    % Bar
    \smash{\rlap{\textcolor[RGB]{\dep@redT,\dep@greenT,\dep@blueT}{\vrule width \textwidth height 20.000mm depth -16mm}}}
    
    % Title
    \begin{multicols}{2}
    \begin{FlushLeft}
    {\LARGE \textbf{\@title} \\ \Large\textbf{\@titletwo}\columnbreak}
    \end{FlushLeft}
    
    % Date
    \ifdate
    \begin{FlushRight}
    {\LARGE \mydate \par}
    \end{FlushRight}
    \fi

    \end{multicols}
    
    % Authors
    \begin{center}
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}
    \end{center}

    \noindent\hrulefill
    \vspace*{1\baselineskip}
    
    \end{@twocolumnfalse}
]
}




