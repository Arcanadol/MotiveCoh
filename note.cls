\LoadClass[a4paper, titlepage, fontset=fandol, punct=CCT, twocolumn]{ctexart}
\newcommand{\notes}{N\kern -.36em{\sbox \z@ T\vbox to\ht \z@ {\hbox {\check@mathfonts \fontsize \sf@size \z@ \math@fontsfalse \selectfont O}\vss }}\kern -.15emT\kern -.1667em\lower .5ex\hbox {E}\kern -.125emS}
\setlength{\columnsep}{40pt}
\newcommand{\lkh}[1]{\kern-0.4em〔\kern-0.1em#1\kern-0.1em〕\kern-0.4em}
\newcommand{\fyh}[1]{「#1」}
\RequirePackage{xeCJK}
\ProvidesClass{note}
\RequirePackage[left = 0.8cm, right = 0.8cm, top = 1cm, bottom = 1cm, centering]{geometry}
\RequirePackage{xeCJKfntef}
\RequirePackage[leqno]{amsmath}
\RequirePackage{euscript, amsthm, amssymb, mathrsfs, mismath}
\AtBeginEnvironment{cases}{\linespread{1}\selectfont}
\RequirePackage[dvipsnames]{xcolor}
\definecolor{defcolor}{RGB}{220,20,59}
\definecolor{myorange}{RGB}{255,127,80}
\definecolor{myyellow}{RGB}{240,230,140}
\definecolor{thmcolor}{RGB}{32,130,54}
\definecolor{exmcolor}{RGB}{70,130,180}
\definecolor{prpcolor}{RGB}{6,95,167}
\definecolor{mypink1}{RGB}{255,192,203}
\definecolor{colcolor}{RGB}{255,182,193}
\definecolor{mypink}{RGB}{255,105,180}
\definecolor{mybrown1}{RGB}{139,69,19}
\definecolor{mybrown2}{RGB}{139,69,19}
\definecolor{rmkcolor}{RGB}{188,143,143}
\definecolor{mygray}{RGB}{119,136,153}
\definecolor{lemcolor}{RGB}{62,175,228}
\definecolor{pagcolor}{RGB}{20,80,50}
% \definecolor{pagcolor}{RGB}{15,68,35}
\definecolor{altcolor}{RGB}{255,0,0}
\definecolor{seccolor}{RGB}{15,68,35}
\RequirePackage[inline]{enumitem}
\setlist[enumerate]{nosep, leftmargin = 8pt, labelwidth = 0.5em, label=\textcolor{pagcolor}{\roman*)},itemjoin={{; }}, itemjoin*={{, and }}}
\setlist[itemize]{itemsep=0pt, parsep=0pt,leftmargin=0pt, left=0pt}

\RequirePackage{unicode-math}
\setoperatorfont{\mathsfup}
\usepackage{xfp}
\usepackage{ulem}
\usepackage{footmisc}
% \DefineFNsymbols*{panfoot}{\dagger\ddagger\S\P\|{**}{\dagger\dagger}{\ddagger\ddagger}}
\usepackage{fancyhdr}
\fancyhf{}
\fancyfoot[RO]{\vfootline\hskip\linepagesep\Large\thepage}
\fancyfoot[LE]{\thepage\hskip\linepagesep\vfootline}
\renewcommand\headrulewidth{0pt}
\newskip\linepagesep\linepagesep 5pt\relax
\def\vfootline{%
  \begingroup\color{pagcolor}\rule[-990pt]{1pt}{1000pt}\endgroup}
\pagestyle{fancy}
\RequirePackage[
  colorlinks,
  % anchorcolor = black,
  % filecolor = black,
  % urlcolor = black,
  % citecolor = black,
  % linkcolor = black,
  hyperfootnotes = true,
  breaklinks = true,
  bookmarks = true
]{hyperref}
\newcommand{\panref}[3]{{\color{#1color}\hyperlink{#1:#2}{#3}}}
% \newcommand{\pref}[2]{{\color{#1color}\hyperlink{#1:#2}{#3}}}
\newcounter{ndhcounter}\stepcounter{ndhcounter}
\newcommand{\ndhflag}{\textcolor{red}{\framebox{{\scshape Not Done Here }\thendhcounter}}}
\newcounter{ndhitemcounter}\stepcounter{ndhitemcounter}
\newcommand{\ndh}[1][\empty]{%
  \hypertarget{ndh:\thendhcounter}{\ndhflag}%
  \ifx#1\empty\else%
    \textsuperscript{#1}%
    \expandafter\def\csname disc:\the\value{ndhcounter}\endcsname{#1}%
  \fi%
  \stepcounter{ndhcounter}%
}
\newcommand{\listndh}{{\color{red}%
      \section*{{待施工列表}}%
      \begin{itemize}%
        \loop
        \ifnum\value{ndhitemcounter}<\value{ndhcounter}%
        \item%
        \protect\hyperlink{ndh:\the\value{ndhitemcounter}}{待施工\the\value{ndhitemcounter}}%
        \ifcsname disc:\the\value{ndhitemcounter}\endcsname%
          \textcolor{blue}{: \csname disc:\the\value{ndhitemcounter}\endcsname}%
        \fi%
        \stepcounter{ndhitemcounter}
        \repeat
      \end{itemize}}%
}
\renewcommand{\qedsymbol}{\color{pagcolor}Q.E.D.}
\renewcommand{\proofname}{\kern-10pt\color{pagcolor}\textup{\scshape\bf Proof.}}
\newcommand{\sr}[1]{\smash{\fontsize{18}{0}\selectfont\fontspec{QTLinostroke.otf}#1}}
\RequirePackage{tcolorbox}\tcbuselibrary{most}
\tcbset{breakable,
  before={\medskip\par\noindent},
  theorem full label supplement={hypertarget={#1}},
  sharp corners,
  textstyle/.style= {
    enhanced,
    oversize,
    left=22pt,
    right=5pt,
    },
  mathstyles/.style={
    oversize,
    enhanced,
    % theorem name
    description delimiters={\kern-0.4em〔\kern-0.1em}{\kern-0.1em〕\kern-0.4em},
    boxsep=1mm,
    frame hidden,
    separator sign none,
    detach title,
    top = 0pt,
    bottom = 0pt,
    coltitle = #1color,
    colback=lightgray!1,
    borderline west = {2pt}{-0.5pt}{#1color},
    borderline west = {0.5pt}{2.5pt}{#1color},
    before upper = {\renewcommand\thempfootnote{\fnsymbol{mpfootnote}}\textcolor{#1color!50!black}{\mathversion{bold}\kern-10pt\bfseries\textsc{\tcbtitletext}}~\linespread{1}\selectfont},
    }
}
\newenvironment{remark}{\itshape\color{rmkcolor}\faBell}{}
\newenvironment{alert}{\itshape\color{altcolor}\faExclamationTriangle}{}

\newcounter{pancounter}

\newtcbtheorem[use counter = pancounter, number within = section]{theorem}{}{%
  mathstyles = thm}{thm}
\newcommand{\more}[2]{\stepcounter{pancounter}\textcolor{#1color!50!black}{\kern-10pt\bfseries{\thepancounter~}\lkh{\textsc{#2}}}~}
\newtcbtheorem[use counter = pancounter, number within = section]{definition}{}{mathstyles = def}{def}
\newtcbtheorem[use counter = pancounter, number within = section]{proposition}{}{mathstyles = prp}{prp}
\newtcbtheorem[use counter = pancounter, number within = section]{lemma}{}{mathstyles = lem}{lem}
\newtcbtheorem[use counter = pancounter, number within = section]{corollary}{}{mathstyles=col}{col}
\newtcbtheorem[use counter = pancounter, number within = section]{example}{}{mathstyles = exm}{exm}
\newtcolorbox{pic}[1][]{%
  enhanced,
  colframe=pagcolor,
  colback=white,
  top=4pt,
  bottom=4pt,
  left=4pt,
  right=4pt,
  frame hidden,
  fonttitle=\bfseries,
  attach title to upper,
  borderline horizontal = {1pt}{-6pt}{pagcolor},
  #1
}
\renewcommand\implies{\DOTSB \,\Longrightarrow \,}
\renewcommand\setminus{\,\mathord{\mathchar"226E}\,}
\newcommand\dif{\mathrel{\triangle}}
\RequirePackage{fixdif}
\renewcommand\mathcal[1]{\EuScript{#1}}
\newcommand \given{}
\newcommand \setskip{\mathchoice{\,}{\,}{\mkern1mu}{\mkern1mu}}
\newcommand \SetSymbol[1][]{%
  \mkern1mu\nonscript\setskip#1\vert
  \allowbreak
  \nonscript\setskip\mkern1mu
  \mathopen{}}
\DeclarePairedDelimiterX\@set[1]{\{}{\}}%
% \DeclarePairedDelimiterX\@set[1]{\left\{}{\right\}}%
{\renewcommand\given{\SetSymbol[\delimsize]}%
  \setskip#1\setskip\mathopen{}}
\DeclareDocumentCommand{\@set@nostar}{O{}O{\mathchoice{\,}{\,}{\mkern1mu}{\mkern1mu}}m}{%
\renewcommand{\setskip}{#2}\@set[#1]{#3}}
\DeclareDocumentCommand{\@set@star}{O{\mathchoice{\,}{\,}{\mkern1mu}{\mkern1mu}}m}{%
\renewcommand{\setskip}{#1}\@set∗{#2}}
\newcommand\set{\@ifstar\@set@star\@set@nostar}
\DeclarePairedDelimiterX\@angle[1]{\langle}{\rangle}{#1}
\DeclareDocumentCommand{\@angle@nostar}{O{}m}
{\@angle[#1]{#2}}
\DeclareDocumentCommand{\@angle@star}{m}{\@angle∗{#1}}
\newcommand\<{\@ifstar\@angle@star\@angle@nostar}
\newcommand\omits{\,.\,.\,.\,.\,.\,.\,}
\makeatletter
\newlength{\rubytempleng}
\def\simpleruby#1#2{%
  \settowidth{\rubytempleng}{#1}%
  \mbox{#1}%
  \kern-.5\rubytempleng%
  \makebox[0pt]{\raise\ccwd\hbox{\makebox[0pt][c]{\expandafter\fontsize{\fpeval{.7*\f@size}}{0}\selectfont #2}}}%
  \kern.5\rubytempleng%
}
\makeatother
\xeCJKsetup{
  CJKecglue = {\hskip 0.2em plus 0.08\baselineskip},
  % CJKecglue = true,
}
\include{font}

\def\newfrac#1#2{\ifmmode\def\tempa##1{\ifx##1\displaystyle\raise.45ex\hbox{$\scriptstyle#1$}\kern-.05em/\kern-.11em\lower.25ex\hbox{$\scriptstyle#2$}\kern.05em\else\ifx##1\textstyle\raise.45ex\hbox{$\scriptscriptstyle#1$}\kern-.05em/\kern-.11em\lower.25ex\hbox{$\scriptscriptstyle#2$}\kern.05em\else\ifx##1\scriptscriptstyle\hbox{\tiny$\scriptscriptstyle#1$}/\hbox{\tiny$\scriptscriptstyle#2$}\kern.04em\else\raise.45ex\hbox{\tiny$\scriptscriptstyle#1$}\kern-.em\fracslash\lower.05ex\hbox{\tiny$\scriptscriptstyle#2$}\kern.05em\fi\fi\fi}\mathpalette\tempa{}\else\leavevmode\raise.45ex\hbox{$\scriptstyle#1$}\kern-.05em/\kern-.11em\lower.25ex\hbox{$\scriptstyle#2$}\kern.05em\fi}

\usepackage{titlesec}
\usepackage{tocloft}
\titleformat{\section}[block]{\rule[-5pt]{\linewidth}{3pt}\\\smash{\makebox[0pt][l]{\rule[16pt]{\linewidth}{1pt}}}\normalfont\Large \bfseries}{\thesection~}{0pt}{}
% \titleformat{\section}[block]%
%   {\makebox[0pt][l]{\titlerule[1pt]{.}}\normalfont\Large\bfseries\centering}%
%   {}%
%   {0pt}% 间距
%   {}% 标题前的代码
% 获取当前section 的标题和序号用 \thesection 和 

% \@startsection {section}{1}{\z@ }{-3.5ex \@plus -1ex \@minus -.2ex}{2.3ex \@plus .2ex}{\normalfont \Large \bfseries #1}
% \titleformat{\subsection}[block]{\sffamily\bfseries\large}{\thesubsection}{1em}{}
% \titleformat{\subsubsection}[block]{\sffamily\bfseries\normalsize}{\thesubsubsection}{1em}{}
% \titlespacing*{\section}{0pt}{\baselineskip}{\baselineskip}
% \titlespacing*{\subsection}{0pt}{\baselineskip}{\baselineskip}
% \titlespacing*{\subsubsection}{0pt}{\baselineskip}{\baselineskip}
% \titleformat{\section}[block]{\sffamily\Large}{\thesection}{1em}{}
% \titleformat{\subsection}[block]{\sffamily\bfseries\large}{\thesubsection}{1em}{}
% \titleformat{\subsubsection}[block]{\sffamily\bfseries\normalsize}{\thesubsubsection}{1em}{}
% \titlespacing*{\section}{0pt}{\baselineskip}{\baselineskip}
% \titlespacing*{\subsection}{0pt}{\baselineskip}{\baselineskip}
% \titlespacing*{\subsubsection}{0pt}{\baselineskip}{\baselineskip}
% \renewcommand \cfttoctitlefont{\hspace*{3\ccwd}\normalsize\bfseries}
% \renewcommand \cftaftertoctitle{\vspace{-\baselineskip - \ccwd}}
% \renewcommand \cftsecleader{~~\color{seccolor!10!white}\leavevmode\cleaders\hbox to 0.05em{\hss\rule[-0.1em]{0.1em}{0.8em}\hss}\hfill\kern0pt}
% \renewcommand{\cftdotsep}{\cftnodots}
% \renewcommand{\cftsecfont}{\bfseries\sffamily}
% \renewcommand{\cftsecpagefont}{\sffamily}
% \renewcommand{\cftsubsecfont}{\sffamily}
% \renewcommand{\cftsubsecpagefont}{\sffamily}
% \renewcommand{\cftsecindent}{4em}

% \renewcommand{\contentsname}{}

% \cftsetpnumwidth{6em}

% \renewcommand \cftsecpagefont{\color{seccolor!10!white}\leavevmode\cleaders\hbox to 0.05em{\hss \rule[-0.1em]{0.1em}{0.8em}\hss }\hfill\kern0pt~~\color{black}\Huge\sffamily\hypersetup{linkcolor=seccolor!10!white}}
% \renewcommand \cftsecafterpnum{\thispagestyle{empty}\kern4em}
\RequirePackage{mathtools}
\newcommand{\inserttext}[1]{\intertext{#1\vspace*{-\dimexpr\baselineskip + \abovedisplayskip\relax}}}
\makeatletter
\newcommand{\leqnomode}{\tagsleft@true}
\newcommand{\reqnomode}{\tagsleft@false}
\makeatother
\RequirePackage{etoolbox}
\makeatletter
\newif\if@gather@prefix
\preto\place@tag@gather{% 
  \if@gather@prefix\iftagsleft@
      \kern-\gdisplaywidth@
      \rlap{\gather@prefix}% 
      \kern\gdisplaywidth@
    \fi\fi
}
\appto\place@tag@gather{% 
  \if@gather@prefix\iftagsleft@\else
      \kern-\displaywidth
      \rlap{\gather@prefix}% 
      \kern\displaywidth
    \fi\fi
  \global\@gather@prefixfalse
}
\preto\place@tag{% 
  \if@gather@prefix\iftagsleft@
      \kern-\gdisplaywidth@
      \rlap{\gather@prefix}% 
      \kern\displaywidth@
    \fi\fi
}
\appto\place@tag{% 
  \if@gather@prefix\iftagsleft@\else
      \kern-\displaywidth
      \rlap{\gather@prefix}% 
      \kern\displaywidth
    \fi\fi
  \global\@gather@prefixfalse
}
\def\math@cr@@@align{%
  \ifst@rred\nonumber\fi
  \if@eqnsw \global\tag@true \fi
  \global\advance\row@\@ne
  \add@amps\maxfields@
  \omit
  \kern-\alignsep@
  \if@gather@prefix\tag@true\fi
  \iftag@
    \setboxz@h{\@lign\strut@{\make@display@tag}}%
    \place@tag
  \fi
  \ifst@rred\else\global\@eqnswtrue\fi
  \global\lineht@\z@
  \cr
}
\newcommand*{\beforetext}[1]{% 
  \ifmeasuring@\else
    \gdef\gather@prefix{#1}% 
    \global\@gather@prefixtrue
  \fi
}
\makeatother
\RequirePackage{tikz-cd}