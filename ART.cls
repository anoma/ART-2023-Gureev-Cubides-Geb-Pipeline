%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Anoma Research Topics template v1.0
% Template based on extarticle and pi-article.cls, v4.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ART}[19/08/2023, v1.0]
\RequirePackage{etoolbox}         % a necessity

%%%%%%%%%%%%%%%%%%%%%% Class options and conditionals

%% Toggles for various conditions and options
\newtoggle{SI}                    % switching to SI format
\newtoggle{shortintro}            % will not include abstract in the title page
\newtoggle{tocfig}                % small figure next to the abstract
\newtoggle{twocolumn}             % text will be laid out in two column
\newtoggle{toprule}               % large line at the top
\toggletrue{toprule}              % on by default
\newtoggle{linenumbers}           % including line numbers
\newtoggle{affiltop}              % author affiliation at the top
\newtoggle{footdate}              % add current date in footer
\toggletrue{footdate}             % on by default
\newtoggle{footpreprint}          % add a "Preprint" text in footer
\toggletrue{footpreprint}         % on by default
\newtoggle{debug}                 % debugging activated

% Option for type of article
\newcommand{\arttype}{ARTICLE}
\DeclareOption{techreport}{\renewcommand{\arttype}{TECHNICAL REPORT}}
\DeclareOption{commun}{\renewcommand{\arttype}{COMMUNICATION}}
\DeclareOption{review}{\renewcommand{\arttype}{REVIEW}}
\DeclareOption{persp}{\renewcommand{\arttype}{PERSPECTIVE}}

% Option for switching to SI format
\DeclareOption{SI}{\toggletrue{SI}}

% Option for two column format
\DeclareOption{twocolumn}{
  \toggletrue{twocolumn}
  \PassOptionsToClass{twocolumn}{extarticle}
}

% Option for line numbers
\DeclareOption{lineno}{\toggletrue{linenumbers}}

% Option for footer
\DeclareOption{nofootdate}{\togglefalse{footdate}}
\DeclareOption{nofootprint}{\togglefalse{footpreprint}}

% Option for affiliation location
\DeclareOption{affiltop}{\toggletrue{affiltop}}

% Option for toc image
\DeclareOption{tocfig}{\toggletrue{tocfig}}

% Option for debugging format
\DeclareOption{debug}{\toggletrue{debug}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}  % pass other options to base class
\ProcessOptions*\relax                                            % finish options
\LoadClass{extarticle}

%%%%%%%%%%%%%%%%%%%%%% Global settings for SI format

\iftoggle{SI}{
  \togglefalse{toprule}                               % no top rule
  \toggletrue{shortintro}                             % no abstract
  \toggletrue{twocolumn}                              % single column
  \def\thepage{S\arabic{page}}                        % pages as S1-SX
  \renewcommand*\thefigure{S\arabic{figure}}          % Figures as Fig. S1
  \renewcommand*\thetable{S\arabic{table}}            % Tables as Table S1
  \renewcommand*\theequation{S\arabic{equation}}      % Equations as Eq. S1
  \AtBeginDocument{%                                  % Bibliographies as Ref. S1
      \renewcommand*\citenumfont[1]{S#1}%
      \renewcommand*\bibnumfmt[1]{(S#1)}%
  }
}{}

%%%%%%%%%%%%%%%%%%%%%% Fonts and language

% Fonts
\RequirePackage{lmodern} % TODO check for Libertinus
\renewcommand*\familydefault{\sfdefault}

% Microtype
\AtEndOfClass{\RequirePackage{microtype}}

% Use \say command for quotation
\usepackage{dirtytalk}

% for double-brackets
\usepackage{stmaryrd}

%% Set up main page fonts
\newcommand{\headerfont}{\fontfamily{lmss}\color{gray}\bfseries\sffamily\fontsize{16pt}{20pt}\selectfont}
\newcommand{\footerfont}{\normalfont\sffamily\fontsize{7pt}{9pt}\selectfont}
\newcommand{\titlefont}{\fontfamily{lmss}\bfseries\fontsize{22pt}{24pt}\selectfont}
\newcommand{\subtitlefont}{\fontfamily{lmss}\bfseries\fontsize{15pt}{20pt}\selectfont}
\newcommand{\artypefont}{\fontfamily{lmss}\bfseries\fontsize{7pt}{9pt}\selectfont}
\newcommand{\contactfont}{\itshape\sffamily\fontsize{7pt}{9pt}\selectfont}
\newcommand{\absfont}{\normalfont\sffamily\fontsize{8pt}{11pt}\selectfont}
\newcommand{\keywordsfont}{\normalfont\sffamily\fontsize{8pt}{11pt}\selectfont}
\newcommand{\footnotefont}{\normalfont\sffamily\fontsize{7}{9}\selectfont}

% AMS maths packages
\RequirePackage{
  amsmath,
  amsfonts,
  amsthm,
  amssymb
}



% Additional maths packages
\RequirePackage{
  textcomp,
  mathtools,
  xparse,
  thmtools,
  thm-restate
}

% QED symbol
\renewcommand{\qedsymbol}{{ \(\square\)}}

\declaretheoremstyle[
	headfont=\normalfont\bfseries,
	% notebraces={[}{]},
	bodyfont=\normalfont,%\itshape,
	headpunct={},
	% postheadspace=\newline,
	% postheadhook={\textcolor{red}{\rule[.6ex]{\hfill}{0.4pt}}\\},
	% spacebelow=\topsep,
	% spaceabove=\topsep,
	% postfoothook={\vskip 0.35cm},
]{p-thm}

\declaretheoremstyle[
	headfont=\normalfont\bfseries,
	bodyfont=\normalfont,
	headpunct={},
	spacebelow=\topsep,
	spaceabove=\topsep,
]{p-example}
\declaretheorem[style=p-thm]{theorem}
\declaretheorem[sibling=theorem,style=p-thm]{lemma}
\declaretheorem[sibling=theorem,style=p-thm]{proposition}
\declaretheorem[sibling=theorem,style=p-thm]{corollary}
\declaretheorem[sibling=theorem,style=p-thm]{conjecture}
\declaretheorem[sibling=theorem,style=p-thm]{statement}
\declaretheorem[sibling=theorem,style=p-thm]{axiom}
\declaretheorem[sibling=theorem,style=p-thm]{construction}
\declaretheorem[sibling=theorem,style=p-thm]{definition}
\declaretheorem[sibling=theorem,style=p-thm]{remark}
\declaretheorem[sibling=theorem,style=p-thm]{notation}
\declaretheorem[sibling=theorem,style=p-example]{example}


%% Add bolding to math where needed
\g@addto@macro\bfseries{\boldmath}
% Natural deduction proofs
\RequirePackage{bussproofs}

% For listings
\RequirePackage{minted}

% Encodings
\RequirePackage{ifxetex,ifluatex}
\ifnum 0\ifxetex 1\fi\ifluatex 1\fi=0 % if pdftex
  \RequirePackage{cmap}
  \RequirePackage[TS1,T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
\else % if luatex or xelatex
  \ifxetex
    \usepackage{mathspec}
    % undo the wrong changes made by mathspec
    \let\RequirePackage\original@RequirePackage
    \let\usepackage\RequirePackage
  \else
    \usepackage{fontspec}
  \fi
  \defaultfontfeatures{Ligatures=TeX,Scale=MatchLowercase}
\fi

% Language
\ifnum 0\ifxetex 1\fi\ifluatex 1\fi=0 % if pdftex
  \RequirePackage[english]{babel}
\else
  \usepackage{polyglossia}
  \setmainlanguage[]{english}
\fi

%%%%%%%%%%%%%%%%%%%%%% General pagination setup and tools

\RequirePackage[
  a4paper,includeheadfoot,                    % paper size, head/foot included in geometry
  headheight=26pt,includeheadfoot,            % header height
  top=35pt,bottom=50pt,                       % top/bottom
  left=75pt,right=75pt,                       % left/right
  marginparwidth=2cm,                         % margins (used for line numbers)
  marginparsep=5pt,                           % margin separation
  headheight=20pt,                            % header height
  headsep=20pt,                               % text distance from header
  footskip=25pt
]{geometry}

\iftoggle{twocolumn}{                         % smaller margins if two-column
\geometry{
  top=25pt,bottom=35pt,                       % top/bottom
  left=55pt,right=55pt,                       % left/right
  headsep=10pt
}
}{}

\iftoggle{debug}{
\geometry{
  showframe,showcrop,                         % for debugging
}
}{}

\setlength{\columnsep}{13.5pt}                % Distance between the two columns of text
\setlength{\parindent}{12pt}                  % Paragraph indent

\RequirePackage{changepage}                   % change odd/even page at any point
\RequirePackage{lastpage}                     % Refer to last page of the document
\RequirePackage{afterpage}                    % execute a command on next page (useful for \clearpage flush)
\RequirePackage{enumitem}                     % For reducing bullet list item separation

%%%%%%%%%%%%%%%%%%%%%% Figures, tables, equations and listings

% Figures
\RequirePackage{graphicx}                     % include pictures
\RequirePackage{tikz}                         % drawing pictures
\RequirePackage{templates/ART/quiver}     % drawing quiver diagrams
\usetikzlibrary{svg.path}                     % TIKZ svg paths
\usetikzlibrary{calc}                         % TIKZ calculations
\RequirePackage[framemethod=tikz]{mdframed}   % breakable framed and coloured boxes

%% Set document color scheme
\RequirePackage{xcolor}                       % driver indepentent color extensions
\definecolor{black50}{gray}{0.5}              % 50% black for hrules
\definecolor{color0}{RGB}{0,0,0}              % Base
\definecolor{color1}{RGB}{59,90,198}          % author email, doi
\definecolor{anoma}{HTML}{AE3133}             % Anoma red
\definecolor{absshadecolor}{cmyk}{0,0,0,.12}

% Tables 
\RequirePackage{
  booktabs,                                   % overall nice table quality
  array,                                      % better column and row definitions
  longtable,                                  % for tables spanning multiple pages
  makecell,                                   % multilined table cells
  tabularx,                                   % width-expanding column (with 'x')
  multirow,                                   % for multirow cells (with \\)
  colortbl                                    % to add colours to table cells,
  % colortblarray,
  % array,                                      % for better column definitions 
}
% booktabs provide nice spacing, but rule widths and distances need modifying
\setlength{\heavyrulewidth}{0.5pt}            % wide rule
\setlength{\lightrulewidth}{0.5pt}            % light rule
\setlength{\aboverulesep}{1.5pt}              % blank space above rules
\setlength{\belowrulesep}{1.5pt}              % blank space below rules
\setlength{\belowbottomsep}{5pt}              % blank space below whole table
\newlength\q
\setlength\q{\dimexpr .5\textwidth -2\tabcolsep} % all width of tabularx columns

\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}

\AtBeginEnvironment{tabular}{%                % font inside tables will be small
  \sffamily\fontsize{7.5}{10}\selectfont
}
%% command we can use to add some text e.g. below the table
\newcommand{\addtabletext}[1]{{\setlength{\leftskip}{9pt}\fontsize{7}{9}\selectfont#1}}

% Equations
% placed in square brackets
\renewcommand\tagform@[1]{\maketag@@@ {[\ignorespaces #1\unskip \@@italiccorr ]}}
% For numbering just one line of an equation
\newcommand\numberthis{\addtocounter{equation}{1}\tag{\theequation}}

%%%%%%%%%%%%%%%%%%%%%% Floats, subfloats and their captions

\RequirePackage{float}                        % improved interface for floating objects
\RequirePackage{dblfloatfix}                  % fixes for twocolumn floats
\RequirePackage{placeins}            % for the floatbarrier macro

% distance between floats and text
\setlength{\textfloatsep}{6pt \@plus 2.0pt \@minus 2.0pt}
% distance between two floats
\setlength{\floatsep}{8pt \@plus 2.0pt \@minus 2.0pt}

% Better captions 
\RequirePackage[
  skip=3pt,                                   % vertical space between caption and figure
  labelfont={bf,sf},                          % we bold the caption label
  labelsep=colon,                             % periods after label (Fig. 1:)
  figurename=Fig.,                            % figure will be abbreviated
  % tablename=Tbl.,                             % table will be abbreviated
]{caption}
% overall font types (excluding label)
\DeclareCaptionFormat{fmt}{\normalfont\sffamily\fontsize{7}{9}\selectfont#1#2#3}
\captionsetup*{format=fmt}                        % for figures
\captionsetup*[table]{format=fmt,position=above}  % for tables

% Subfigures
\RequirePackage{subcaption}

% Sidecaptions
\RequirePackage[rightcaption]{sidecap}

%%%%%%%%%%%%%%%%%%%%%% Utilities

% Filler text
\RequirePackage{lipsum}

% Todo notes
\RequirePackage{todonotes}

%%%%%%%%%%%%%%%%%%%%%% Science-related packages

% In-line fractions
\RequirePackage{xfrac}

% The SIunitx package enables the \SI{}{} command.
\RequirePackage{siunitx}
\sisetup{
  detect-weight=true,
  detect-family=true,
  per-mode=reciprocal,
  range-units=single,       % brief SIrange
  range-phrase=--           % and using lines
}

% The mchem package for formula subscripts using \ce{}
\RequirePackage[version=4]{mhchem}

%%%%%%%%%%%%%%%%%%%%%% Bibliography, footnotes and their settings

% Natbib package for text references
\RequirePackage[
    % numbers,                % numbers as references
    merge,                  % merge multiple references in one
    super,                  % superscript
    sort&compress
]{natbib}

% Moves references after punctuation
\RequirePackage{natmove}
\renewcommand*{\natmovechars}{.}  % only after full stop

% Bibliography style
%% No separation between references
\setlength{\bibsep}{0.0pt}
%% Use ART-bib.bst as a style (if available) else fall back to unsrtnat
\IfFileExists{templates/ART/ART-bib.bst}{
  \bibliographystyle{templates/ART/ART-bib}
}{
  \IfFileExists{ART-bib.bst}{
  \bibliographystyle{ART-bib}
  }{
    \PackageWarning{ART-bib}{templates/ART/ART-bib.bst not found; must specify manually}
    \bibliographystyle{unsrt}
}}
%% set Bibliography font
\renewcommand\bibfont{\normalfont\sffamily\fontsize{6}{8}\selectfont}
%% Use "References" as bibliography title
\renewcommand{\bibname}{References}
\renewcommand{\refname}{References}
\AtEndOfClass{
  \renewcommand{\tocbibname}{References}
}
%% Remove brackets from label
\renewcommand\@biblabel[1]{ #1.}

% Footnotes
\RequirePackage[flushmargin,ragged,symbol*]{footmisc}
\renewcommand*{\footnotelayout}{\footnotefont}
\renewcommand{\footnoterule}{% Set the footnote hrule style
  \kern -3pt
  {\color{black50} \hrule width 72pt height 0.25pt}
  \kern 2.5pt
}

%%%%%%%%%%%%%%%%%%%%%% References and bookmarks

% Xr:
% To reference another document, in this case the SI
\RequirePackage{xr, xr-hyper}

% Hyperlinking
\RequirePackage[
  colorlinks=true,
  allcolors=anoma,
  pagebackref=false
]{hyperref}
%% Set URL link color & font
\renewcommand\UrlFont{\color{anoma}\sffamily}

% References
\RequirePackage[
  capitalise,
  nameinlink,
]{cleveref}

% Equation reference label has no brackets
\creflabelformat{equation}{#2\textup{#1}#3}

\RequirePackage{doi} % DOIs
\RequirePackage[nottoc]{tocbibind} % References section in TOC (for SI)

%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% Other Setup

%%%%%%%%%%%%%%%%%%%%%% Author and affiliation

% Keeps footnotes where they should be
\RequirePackage{titling}
\setlength\thanksmarkwidth{0em}
\setlength\thanksmargin{-\thanksmarkwidth}

% Typesetting for authors/affiliations
\RequirePackage{authblk}
\setlength{\affilsep}{8.5pt} % 16.5pts between base of author line and base of affil line
\renewcommand\Authfont{\color{color0}\normalfont\sffamily\bfseries\fontsize{9}{11}\selectfont}
\renewcommand\Affilfont{\color{color0}\footnotefont}
\renewcommand\AB@affilsepx{\newline\protect\Affilfont}
\renewcommand\Authands{, and }

%%%%%%%%%%%%%%%%%%%%%% Author and paper metadata

%% ORCID logo
\definecolor{orcidlogocol}{HTML}{A6CE39}
\tikzset{
  orcidlogo/.pic={
    \fill[orcidlogocol] svg{M256,128c0,70.7-57.3,128-128,128C57.3,256,0,198.7,0,128C0,57.3,57.3,0,128,0C198.7,0,256,57.3,256,128z};
    \fill[white] svg{M86.3,186.2H70.9V79.1h15.4v48.4V186.2z}
                 svg{M108.9,79.1h41.6c39.6,0,57,28.3,57,53.6c0,27.5-21.5,53.6-56.8,53.6h-41.8V79.1z M124.3,172.4h24.5c34.9,0,42.9-26.5,42.9-39.7c0-21.5-13.7-39.7-43.7-39.7h-23.7V172.4z}
                 svg{M88.7,56.8c0,5.5-4.5,10.1-10.1,10.1c-5.6,0-10.1-4.6-10.1-10.1c0-5.6,4.5-10.1,10.1-10.1C84.2,46.7,88.7,51.3,88.7,56.8z};
  }
x}

%% Article meta data additional fields
\newcommand{\pubdoi}[1]{\def\@pubdoi{#1}}                     % publication DOI
\newcommand{\keywords}[1]{\def\@keywords{#1}}                 % keywords
\newcommand{\sep}[0]{; }                                      % keyword separator
\newcommand{\contact}[1]{\def\@contact{#1}}                   % contact author
\newcommand{\leadauthor}[1]{\def\@leadauthor{#1}}             % lead (first) author
\newcommand{\equalcontrib}[1]{\def\@equalcontrib{#1}}         % equal contribution switch
\newcommand{\orcid}[1]{                                       % ORCID
  \href{https://orcid.org/#1}{\mbox{
    \begin{tikzpicture}[overlay,remember picture]
      \coordinate (A);
      \coordinate (B) at ($(A)-(6pt,-8pt)$);
    \end{tikzpicture}
    \begin{tikzpicture}[overlay,remember picture,yscale=-0.04,xscale=0.04,transform shape]
      \pic at (B) {orcidlogo};
    \end{tikzpicture}
    }{}}}

%%%%%%%%%%%%%%%%%%%%%% Headers and footers

%% Fancyhdr styling
\RequirePackage{fancyhdr}  % custom headers/footers
\pagestyle{fancy}          % Set all pagestyle to fancy

% Clear everything
\fancyhf{}

% Headers
\renewcommand{\headrulewidth}{0pt}                                      % No header rule normally

% Footers
\renewcommand{\footrulewidth}{0pt}                                      % No footer rule normally
\fancyfoot[R]{%                                                         % footer right side
  \iftoggle{SI}{
    \footerfont\textit{Supplementary Information}\hspace{7pt}|%         % we add SI as text
  }{
    \iftoggle{footpreprint}{
      \footerfont\textit{Anoma Research Topics}\hspace{7pt}|%                        % we add preprint text
    }{}
  }
  \iftoggle{footdate}{
    \hspace{7pt}\textbf{\today}\hspace{7pt}|%                           % add date
  }{}
  \hspace{7pt}\textbf{\thepage}}                                        % add page number
\fancyfoot[L]{%                                                         % footer left side
  \footerfont\@ifundefined{@pubdoi}{}{%
      \href{https://dx.doi.org/\@pubdoi}{DOI: \@pubdoi}}                % add DOI + hyperlink
% \footerfont\@ifundefined{@leadauthor}{}{\@leadauthor}%                  % lead author name
% \ifnum \value{authors} > 1\textit{ et al.}\fi%                          % and et.al.
}

% Modifying the plain style (applied automatically with title page)
\fancypagestyle{plain}{%
    \fancyhf{}                                                          % clear everything
    \iftoggle{toprule}{%                                                % if SI, we add a top rule
        \fancyhead[L]{%    
        $\vcenter{\hbox{{%
        \includegraphics[height=20pt]{templates/ART/logo/anoma-logo.pdf}%
      }}}%
      \vcenter{%  
        {\Large
        \textit{\textbf{Anoma Research Topics}}} | \textsf{Technical Report}
      }$ 
      % \hrule 
      }                            % article type  
        % \\                                             % Add article type and rule
          % \colorbox{black}{\parbox{18em}{\centering\color{white}\subtitlefont{\arttype}}}}
    }{}
    \fancyfoot[R]{                                                      % footer right side
    \iftoggle{SI}{
      \footerfont\textit{Supplementary Information}\hspace{7pt}|%       % we add SI as text
    }{
      \iftoggle{footpreprint}{
        \footerfont\textit{Anoma Research Topics}\hspace{7pt}|%                      % we add preprint text
      }{}
    }
    \iftoggle{footdate}{
      \hspace{7pt}\textbf{\today}\hspace{7pt}|%                         % add date
    }{}
      \hspace{7pt}\textbf{\thepage\textendash\pageref{LastPage}}}       % add page number
    \fancyfoot[L]{\footerfont\@ifundefined{@pubdoi}{}{%                 % footer left side
      \href{https://dx.doi.org/\@pubdoi}{DOI: \@pubdoi}}}               % add DOI + hyperlink
}

%%%%%%%%%%%%%%%%%%%%%% Line numbers

% Check switch for line numbers
\iftoggle{linenumbers}{
  % use lineno in switch mode if doublecolumn
  \iftoggle{twocolumn}{
    \RequirePackage[switch]{lineno}
    }{
    \RequirePackage{lineno}
  }
  \renewcommand\linenumberfont{\normalfont\tiny\sffamily}
  \linenumbers
}{}

%%%%%%%%%%%%%%%%%%%%%% Typesetting

%% Section/subsection/paragraph set-up
\RequirePackage[explicit]{titlesec}
\setcounter{secnumdepth}{5}

\titleformat{\section}
  {\large\sffamily\bfseries}
  {\thesection.}
  {0.5em}
  {#1}
  []
\titleformat{name=\section,numberless}
  {\large\sffamily\bfseries}
  {}
  {0em}
  {#1}
  []  
\titleformat{\subsection}[runin]
  {\sffamily\bfseries}
  {\thesubsection.}
  {0.5em}
  {#1. }
  []
\titleformat{\subsubsection}[runin]
  {\sffamily\bfseries}
  {\thesubsubsection.}
  {0.5em}
  {#1. }
  []
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1}
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{2pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{2pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{12pt}

%% Abstract formatting
\def\xabstract{abstract}
\long\def\abstract#1\end#2{
  \def\two{#2}
  \ifx\two\xabstract
    \long\gdef\theabstract{\ignorespaces#1}
    \def\go{\end{abstract}}
  \else
    \typeout{^^J^^J PLEASE DO NOT USE ANY \string\begin\space \string\end^^J COMMANDS WITHIN ABSTRACT^^J^^J}#1\end{#2}
    \gdef\theabstract{%
      \vskip12pt BADLY FORMED ABSTRACT: PLEASE DO NOT USE {\tt\string\begin...\string\end} COMMANDS WITHIN THE ABSTRACT\vskip12pt%
    }\let\go\relax
  \fi
\go}

% \RequirePackage{framed}

% Define an environment with abstract content and styling
\newcommand{\abscontent}{
  \noindent%
  {%
    \vskip3pt%
    \iftoggle{tocfig}{
      \begin{minipage}{0.56\linewidth}
        \absfont \theabstract
      \end{minipage}
      \begin{minipage}{0.4\linewidth}
        \raggedleft
        \IfFileExists{figs/tocfig.png}{% no good way of checking for extension
        \includegraphics[width=0.9\linewidth]{figs/tocfig}}
        {\IfFileExists{figs/tocfig.bmp}{
        \includegraphics[width=0.9\linewidth]{figs/tocfig}}
        {\IfFileExists{figs/tocfig.pdf}{
        \includegraphics[width=0.9\linewidth]{figs/tocfig}}
        }{\includegraphics[width=0.9\linewidth]{example-image}}}
      \end{minipage}%
    }{
      \begin{minipage}{\linewidth}
        \absfont \theabstract
      \end{minipage}
    }
  }%
  \vskip10pt%
  \noindent
  \@ifundefined{@abstractadd}{}{%
  {%
    \parbox{\linewidth}{%
    \abstractaddfont \@abstractadd}%
  }%
  \vskip10pt%
  }%
  \noindent
  \@ifundefined{@keywords}{}{%
  {%
    \parbox{\linewidth}{%
    \keywordsfont %
    \textbf{Keywords:} \@keywords}%
  }%
  \vskip10pt%
  % \newline
  }%
}

%% Manual adjustment of vertical distance, useful for overall formatting
\newlength\vert@adjust
\newcommand\verticaladjustment[1]{\setlength{\vert@adjust}{#1}}

%% Command to define an affiliation list in a footnote
\def\authaffil{%
  \iftoggle{affiltop}{
    \@author\par%
    % \vskip2pt
  }{
    \AB@authlist\par
    \protected@xdef\@thanks{\@thanks\protect\footnotetext[\the\c@footnote]{\AB@affillist\newline}}%
  }
}

%% Command to define a contact email switch
\def\contactswitch{%
  \contactfont\@ifundefined{@contact}{}{\textbf{\normalfont*}~E-Mail:~\@contact}\par%
  %
  \vskip3pt
}

%% Command to define an "equal contribution" switch
\def\equalcontribswitch{
  \footerfont\@ifundefined{@equalcontrib}{}{\textsuperscript{\textbf{\dag}}~These authors contributed equally}\par%
  %
  \vskip3pt
}

\newcommand{\colorboxTikz}[2]{%
\noindent%
  \begin{center}%
    \begin{tikzpicture}%
        \node[rectangle
              %  draw=#2
             , top color=#2!30
             , bottom color=#2!90
             , rounded corners=2pt
             , inner xsep=5pt
             , inner ysep=6pt
             , outer ysep=10pt]{
        \begin{minipage}{\linewidth}%
          {\absfont\bfseries\large Abstract}\\%
          #1\end{minipage}};%
    \end{tikzpicture}%
  \end{center}%
}

%%%% Custom title page
\renewcommand{\@maketitle}{%
\iftoggle{shortintro}
{% if short intro i.e. SI
  % patch author command to center section
  \patchcmd{\@author}{\raggedright}{\centering}{}{}
  %
  \topskip0pt
  \vspace*{\fill}%
  %
  {\centering\baselineskip=24pt\subtitlefont Supplementary Information for\par}%
  {\centering\baselineskip=24pt\titlefont \@title\par}%
  %
  \vskip10pt
  %
  % author names / addresses
  {\centering\authaffil{}}
  %
  \vskip8pt
  %
  % equal contribution
  {\centering\equalcontribswitch{}}
  % corresponding email
  {\centering\contactswitch{}}
  %
  \vspace*{\fill}%
}
{% else if complete paper
  %
  \vskip10pt%
  %
  {\raggedright\baselineskip=24pt\titlefont \@title\par}%
  %
  \vskip10pt
  %
  % author names / addresses
  \raggedright\authaffil{}
  %
  \vskip3pt
  %
  % equal contribution
  \raggedright\equalcontribswitch{}
  % corresponding email
  \raggedright\contactswitch{}
  % abstract / TOC section 
  % \raggedright{\abscontent{}}
  \colorboxTikz{\abscontent{}}{absshadecolor}
  \noindent % This is to remove indentation of minipage
  %
  % \noindent\makebox[\linewidth]{\rule{\linewidth}{0.4pt}}%
  %
  \vskip10pt%
}%
\@ifundefined{vert@adjust}{}{\vskip\vert@adjust}%
}%