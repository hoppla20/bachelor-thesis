%% LaTeX2e class for student theses
%% sdthesis.cls
%%
%% Karlsruhe Institute of Technology
%% Institute for Program Structures and Data Organization
%% Chair for Software Design and Quality (SDQ)
%%
%% Dr.-Ing. Erik Burger
%% burger@kit.edu
%%
%% See https://sdq.kastel.kit.edu/wiki/Dokumentvorlagen
%%
%% Version 1.3.6, 2022-09-28

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sdqthesis}[2022-09-28 v1.3.6 Student thesis class]
\DeclareOption{english}{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions\relax
% Used to detect language families
\RequirePackage{translations}

%% ---------------------------------------------------------------
%% | Based on KOMAscript by Markus Kohm http://www.komascript.de |
%% ---------------------------------------------------------------
\LoadClass{scrbook}

%% --------------
%% | Typography |
%% --------------

% T1 font encoding
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

% serif type: Linux Libertine
\RequirePackage{libertine}
% Linux Libertine in math mode
\RequirePackage[libertine]{newtxmath}

% grotesque type: Adobe Source Sans Pro
\RequirePackage[scaled=.92]{sourcesanspro}

% monospace type: Bera Mono
\RequirePackage[scaled=.78]{beramono}

% semi-bold type (for subsections and paragraphs)
\newcommand*{\sbdefault}{sb}
\DeclareRobustCommand{\sbseries}{%
  \not@math@alphabet\sbseries\relax
  \fontseries\sbdefault\selectfont}

\DeclareTextFontCommand{\textsb}{\sbseries}

\addtokomafont{subsection}{\sbseries}
\addtokomafont{subsubsection}{\sbseries}
\addtokomafont{paragraph}{\sbseries}

% microtype for nicer typography
\RequirePackage[protrusion=true,expansion=true]{microtype}

% commands for code and model keywords in text
\newcommand{\code}[1]{\texttt{\hyphenchar\font45\relax #1}}
\newcommand{\model}[1]{\textsf{#1}}

% nicer spacing for enumerations
\RequirePackage{enumitem}
\setlist{itemsep=0pt}
\setlist[description]{font=\small\textsb,style=nextline}

% roman capital numbers
\newcommand{\goalRef}[1]{\textbf{\MakeUppercase{\romannumeral #1}}}
\newcommand{\subGoalRef}[2]{\textbf{\MakeUppercase{\romannumeral #1}.\symbol{\numexpr96+#2}}}

%% -----------
%% | Spacing |
%% -----------

% more flexible spacing for paragraphs
\RedeclareSectionCommands[
    beforeskip= .7em plus .6em minus .3em
]{paragraph}


%% ---------------
%% | Page Layout |
%% ---------------

% draft mode
\RequirePackage{ifdraft}
\RequirePackage{ifthen}

\KOMAoptions{
   fontsize=12pt,
   paper=a4,
   titlepage=true,
   headinclude=true,
   footinclude=false,
}

% Margins
\ifdraft{
  \typearea[0mm]{10} % draft
}{
  \typearea[10mm]{15}
}
\RequirePackage[headsepline,draft=false]{scrlayer-scrpage}
\pagestyle{scrheadings}

\clubpenalty=10000 %prevent orphans
\widowpenalty=10000 %prevent widows


%% --------------
%% | Title page |
%% --------------

% Logos
\titlehead{%
\includegraphics[height=1.8cm]{logos/kitlogo_en_cmyk}
\hfill
% SDQ logo
\ThisCenterWallPaper{1}{title-background.pdf}
}

%
\setkomafont{title}{\huge\sffamily\bfseries}
\setkomafont{subtitle}{\normalfont\large}

%% variables for title page
\newcommand{\theinstitute}{Institute for \dots}
\newcommand{\thethesistype}{}
\newcommand{\thereviewerone}{}
\newcommand{\thereviewertwo}{}
\newcommand{\theadvisorone}{}
\newcommand{\theadvisortwo}{}
\newcommand{\theeditstart}{}
\newcommand{\theeditend}{}

%% formatting commands for titlepage
\newcommand{\thesistype}[1]{\subtitle{\vskip2em #1 \ifcurrentbaselanguage{English}{of}{von}}%
\renewcommand{\thethesistype}{#1}}
\newcommand{\myinstitute}[1]{\renewcommand{\theinstitute}{#1}}
\newcommand{\reviewerone}[1]{\renewcommand{\thereviewerone}{#1}}
\newcommand{\reviewertwo}[1]{\renewcommand{\thereviewertwo}{#1}}
\newcommand{\advisorone}[1]{\renewcommand{\theadvisorone}{#1}}
\newcommand{\advisortwo}[1]{\renewcommand{\theadvisortwo}{#1}}

\newcommand{\editingtime}[2]{%
\renewcommand{\theeditstart}{#1}%
\renewcommand{\theeditend}{#2}%
%% do not show the date
\date{}
}

\newcommand{\settitle}{%
\publishers{%
\large
at the Department of Informatics\\
\theinstitute\\[2em]
\begin{tabular}{l l}
  Reviewer: & \thereviewerone\\
  Second reviewer: & \thereviewertwo\\
  Advisor: &  \theadvisorone\\
  % if there is no second advisor, do not output this line
  \ifthenelse{\equal{\theadvisortwo}{}}{}{%
  Second advisor: & \theadvisortwo\\
  }
\end{tabular}
\vskip2em
\theeditstart{} -- \theeditend
}
}

%% -----------------------------
%% | Abstract/Acknowledgements |
%% -----------------------------

\newcommand{\abstract}[1][\abstractname]{\chapter*{#1}}
\newcommand{\Abstract}[1][\abstractname]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}}

\def\ackname{Acknowledgments}
\def\abstractname{Abstract}

\newcommand{\includeabstract}{
\input{sections/abstract_en.tex}
}

%% ------------
%% | Packages |
%% ------------

% enumerate subsections
\setcounter{secnumdepth}{3}

% wallpaper for title page (KIT-Frame)
\RequirePackage{wallpaper}

% subimport of files
\RequirePackage{import}

% languages
\RequirePackage{babel}
\RequirePackage{csquotes}

% hyphenation for compound words
\RequirePackage[shortcuts]{extdash}

% nice tables
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{array}

% show graphics in draft mode
\RequirePackage{graphicx}
\setkeys{Gin}{draft=false,width=0.8\linewidth}

% appendix
\RequirePackage[toc,title,header]{appendix}
\noappendicestocpagenum

% PDF specific packages
\RequirePackage[hyphens]{url}
\RequirePackage[breaklinks,colorlinks=false,final]{hyperref}
\newcommand\setpdf{
    \hypersetup{%
    pdftitle={\thethesistype},%
    pdfsubject={\@title},%
    pdfauthor={\@author},%
    pdfborder={0 0 0},%
    }%
    \let\theauthor\@author
}
