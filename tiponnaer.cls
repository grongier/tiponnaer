% MIT License

% Copyright (c) 2022 Guillaume Rongier

% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:

% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tiponnaer}

% tiponnaer (se): se pomponner en normand


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Base class

\newcommand\@style{}
\DeclareOption{transitional}{\renewcommand\@style{transitional}} 
\DeclareOption{oldstyle}{\renewcommand\@style{oldstyle}}
\DeclareOption{magazine}{\renewcommand\@style{magazine}}
\ExecuteOptions{transitional}
% KOMA script options for the scrartcl class. 
% DIV defines the margin size. With calc, it is computed automatically depending
% on the text size.
\PassOptionsToClass{
    fontsize=10pt,
    DIV=26,
    twocolumn=yes,
    numbers=noenddot,
}{scrartcl}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
\LoadClass{scrartcl}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Packages

% To insert if, then, else conditions.
\RequirePackage{ifthen}
\usepackage{ifluatex}

% ARTICLE STRUCTURE
% To add affiliations to the authors.
\RequirePackage{authblk}
% To limit the float positioning with \floatbarrier. 
\RequirePackage{placeins}
% To change headers and footers.
\RequirePackage{scrlayer-scrpage}
% To add an appendix environment and add appendix in the toc.
\RequirePackage[title]{appendix}
% To add a bibliography.
\RequirePackage{natbib}

% FLOATS
% To insert figures.
\RequirePackage{graphicx}
% To insert tables.
\RequirePackage{array}
% To insert table of a given width.
\RequirePackage{tabularx}
% To use bold table lines for better tables.
\RequirePackage{booktabs}
% To merge several rows in a table.
\RequirePackage{multirow}
% To align numbers in a column on the decimal point.
\RequirePackage{dcolumn}
% To define the figure and table captions.
\RequirePackage[
    format=plain,
    justification=justified,
    font=small,
    labelfont={bf},
    labelsep=quad,
]{caption}

% TEXT ENHANCEMENT
% To define new colors.
\RequirePackage{xcolor}
% To enhance LaTeX's mathematical typesetting.
\RequirePackage{amsmath}
% To generate English ordinal numbers with \nth{number}.
\RequirePackage[super]{nth}
% To add and highlight links in the text (load at the end).
% With natbib.
\RequirePackage[
    % pdfpagelayout=TwoPageRight,
    plainpages=false,
    backref=page
]{hyperref}
% To enhance lists.
\RequirePackage{enumitem}
% To reverse the numbering of lists.
\usepackage{etaremune}
% To balance the columns of the last page.
\RequirePackage[checkfootnote,checkfloat]{flushend}
% To add hyphenation with dash linked words.
\RequirePackage[shortcuts]{extdash}
% To add line numbers.
%\RequirePackage[switch]{lineno}
% To use the Font Awesome icon set.
\RequirePackage{fontawesome5}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonts

\ifluatex
    % To set languages.
    \RequirePackage{polyglossia}
    \setdefaultlanguage{american}
    % To set fonts.
    \RequirePackage{fontspec}
    \ifthenelse{\equal{\@style}{oldstyle}}{
        % Serif body font
        \setmainfont{TeXGyrePagella}
        % Title fonts
        \newfontfamily\bookman{TeXGyreBonum}
        \newfontfamily\schoolbook{TeXGyreScholaX}
        \newcommand{\stylizetitle}[1]{\huge \bookman \itshape \MakeUppercase{#1}}
        \newcommand{\stylizeabstract}[1]{\small \schoolbook \bfseries #1}
        \newcommand{\stylizesection}[1]{\large \schoolbook #1}
        \newcommand{\stylizesubsection}[1]{\normalsize \schoolbook #1}
        \newcommand{\stylizesubsubsection}[1]{\small \schoolbook #1}
        \newcommand{\stylizeparagraph}[1]{\small \schoolbook #1}
    }{
        \ifthenelse{\equal{\@style}{magazine}}{
            % Serif body font
            \setmainfont{QTCaslan}
            % Title fonts
            \newfontfamily\franklin{LibreFranklin}
            \newcommand{\stylizetitle}[1]{\LARGE \franklin \MakeUppercase{#1}}
            \newcommand{\stylizeabstract}[1]{\footnotesize \franklin \MakeUppercase{#1}}
            \newcommand{\stylizesection}[1]{\large \franklin \mdseries \MakeUppercase{#1}}
            \newcommand{\stylizesubsection}[1]{\normalsize \franklin \mdseries \MakeUppercase{#1}}
            \newcommand{\stylizesubsubsection}[1]{\footnotesize \franklin \mdseries \MakeUppercase{#1}}
            \newcommand{\stylizeparagraph}[1]{\footnotesize \franklin \mdseries \MakeUppercase{#1}}
        }{
            % Serif body font
            \setmainfont{XCharter}
            % Title fonts
            \newfontfamily\franklin{LibreFranklin}
            \newcommand{\stylizetitle}[1]{\huge \franklin \bfseries #1}
            \newcommand{\stylizeabstract}[1]{\small \franklin \bfseries #1}
            \newcommand{\stylizesection}[1]{\large \franklin \bfseries #1}
            \newcommand{\stylizesubsection}[1]{\normalsize \franklin \bfseries #1}
            \newcommand{\stylizesubsubsection}[1]{\small \franklin \bfseries #1}
            \newcommand{\stylizeparagraph}[1]{\small \franklin \bfseries #1}
        }%
    }%
    % Sans-serif font
    \setsansfont{sourcesanspro}
    % Monospaced font
    \setmonofont{sourcecodepro}
\else
    % To let babel use the macro xspace when necessary.
    \RequirePackage{xspace}
    % To set languages.
    \RequirePackage[american]{babel}
    % To use directly accents in the tex file (load before fontenc).
    \RequirePackage[utf8]{inputenc}
    % To display accents in the pdf file.
    \RequirePackage[T1]{fontenc}
    \ifthenelse{\equal{\@style}{oldstyle}}{
        % Serif body font
        \RequirePackage{tgpagella}
        % Title fonts
        \newcommand{\stylizetitle}[1]{\huge \fontfamily{qbk}\selectfont \itshape \MakeUppercase{#1}}
        \newcommand{\stylizeabstract}[1]{\small \fontfamily{TeXGyreScholaX-TLF}\selectfont \bfseries #1}
        \newcommand{\stylizesection}[1]{\large \fontfamily{TeXGyreScholaX-TLF}\selectfont #1}
        \newcommand{\stylizesubsection}[1]{\normalsize \fontfamily{TeXGyreScholaX-TLF}\selectfont \bfseries #1}
        \newcommand{\stylizesubsubsection}[1]{\small \fontfamily{TeXGyreScholaX-TLF}\selectfont \bfseries #1}
        \newcommand{\stylizeparagraph}[1]{\small \fontfamily{TeXGyreScholaX-TLF}\selectfont \bfseries #1}
    }{
        % Serif body font
        \RequirePackage{XCharter}
        % Math font
        \RequirePackage[charter, expert]{mathdesign}
        % Title fonts
        \newcommand{\stylizetitle}[1]{\huge \fontfamily{LibreFranklin-TLF}\selectfont \bfseries #1}
        \newcommand{\stylizeabstract}[1]{\small \fontfamily{LibreFranklin-TLF}\selectfont \bfseries #1}
        \newcommand{\stylizesection}[1]{\large \fontfamily{LibreFranklin-TLF}\selectfont \bfseries #1}
        \newcommand{\stylizesubsection}[1]{\normalsize \fontfamily{LibreFranklin-TLF}\selectfont \bfseries #1}
        \newcommand{\stylizesubsubsection}[1]{\small \fontfamily{LibreFranklin-TLF}\selectfont \bfseries #1}
        \newcommand{\stylizeparagraph}[1]{\small \fontfamily{LibreFranklin-TLF}\selectfont \bfseries #1}
    }%
    % Sans-serif font
    \RequirePackage{sourcesanspro}
    % Monospaced font
    \RequirePackage{sourcecodepro}
\fi
% To provide some refinements to the typography.
% activate={true,nocompatibility} - activate protrusion and expansion
% final - enable microtype; use "draft" to disable
% tracking=true, kerning=true, spacing=true - activate these techniques
% factor=1100 - add 10% to the protrusion amount (default is 1000)
% stretch=10, shrink=10 - reduce stretchability/shrinkability (default is 20/20)      
\RequirePackage[
    activate={true, nocompatibility},
    tracking=true,
    % kerning=true,
    % spacing=true,
    factor=1100,
    stretch=10,
    shrink=10,
    letterspace=50,
    final,
    % babel=true,
]{microtype}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Style

% ARTICLE STRUCTURE
% Changes the author and affiliation styles. Needs the authblk package.
\renewcommand\Authfont{\large}
\renewcommand\Affilfont{\footnotesize \itshape}
% Needs the scrlayer-scrpage package.
\pagestyle{scrheadings}
% Modifies the section titles.
\setkomafont{section}{\stylizesection}
% Modifies the subsection titles.
\setkomafont{subsection}{\stylizesubsection}
% Modifies the subsubsection titles.
\setkomafont{subsubsection}{\stylizesubsubsection}
% Modifies the paragraph titles.
\setkomafont{paragraph}{\stylizeparagraph}
% Text size for the bibliography. Needs the natbib package.
\def\bibfont{\small}
\setlength{\bibsep}{0.15em plus 0.05em}
% Defines a style for the backref. Needs the natbib and hyperref packages.
\newcommand{\mapolicebackref}[1]{\mbox{\textit {#1}}}
% Handles the backref in the bibliography. Needs the natbib and hyperref packages.
\renewcommand*{\backref}[1]{}
\renewcommand*{\backrefalt}[4]{%
    \ifcase #1 \mapolicebackref{(Not cited)}
        \or \mapolicebackref{(Cited page #2)}
        \else \mapolicebackref{(Cited pages #2)}
    \fi
}

% FLOATS
% Enlarges space between columns in tables.
\setlength{\columnsep}{1.5em}
% Enlarges the space between table rows. Need the booktabs package.
\renewcommand{\arraystretch}{1.2}
% Source of floats
\newcommand{\source}[1]{\vspace{-0.85em}\caption*{\footnotesize \hfill #1}}

% TEXT ENHANCEMENT
% Needs the hyperref and color package.
\definecolor{colorlink}{RGB}{4,90,141}
\hypersetup{
    bookmarksnumbered = true,
    colorlinks        = true,      % Colors links instead of ugly boxes
    urlcolor          = colorlink, % Color for external hyperlinks
    linkcolor         = colorlink, % Color of internal links
    citecolor         = colorlink  % Color of citations
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% New commands

% Defines the article's reference entries.
\def\artjournal{}
\def\artvolume{}
\def\artnumber{}
\def\artpages{}
\def\artyear{}
\def\artdoi{}
\def\artabstract{}
\def\artkeywords{}
\def\arthighlights{}
\def\artfulltext{}
\def\artlicense{}
\def\artdisclaimer{}
\newcommand{\Journal}[1]{\def\artjournal{\textit{#1}}}
\newcommand{\Volume}[1]{\def\artvolume{#1}}
\newcommand{\Number}[1]{\def\artnumber{#1}}
\newcommand{\Pages}[2]{\def\artpages{#1--#2}}
\newcommand{\Year}[1]{\def\artyear{#1}}
\newcommand{\DOI}[1]{\def\artdoi{\href{http://dx.doi.org/#1}{#1}}}
\newcommand{\License}[1]{\def\artlicense{#1}}
\newcommand{\Abstract}[1]{\def\artabstract{#1}}
\def\sep{%
    \if@twocolumn
        \ifx\artabstract\empty
            \quad
        \else
            \\
        \fi
    \else
        \quad
    \fi
}
\newcommand{\Keywords}[1]{\def\artkeywords{%
    \if@twocolumn
        \begin{tabular}[t]{@{}l@{}}%
            \ifx\artabstract\empty
            \else
                {\stylizeabstract{Keywords}} \sep%
            \fi
            #1%
        \end{tabular}%
    \else
        #1%
    \fi
}}
\newcommand{\Highlights}[1]{\def\arthighlights{%
    \begin{minipage}[t]{\linewidth}%
        \begin{itemize}[noitemsep, topsep=0ex, leftmargin=*]
            #1%
        \end{itemize}%
    \end{minipage}%
}}
\newcommand{\FullText}[1]{\def\artfulltext{%
	\textbf{Full text freely available at:}  \href{#1}{#1}%
}}
\newcommand{\Disclaimer}{\def\artdisclaimer{%
    \textbf{This article is a non-peer-reviewed preprint}%
}}

% Defines the headline.
\newcommand\headline[3]{%
  \par\noindent\makebox[0pt][l]{#1}%
  \makebox[\textwidth][c]{#2}%
  \makebox[0pt][r]{#3}\par%
}

% Defines the articles title page.
\setlength{\affilsep}{1em}
\def\maketitle{\par
    \begingroup
        \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
        \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
        \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
        \if@twocolumn
            \twocolumn[{%
                \newpage%
                \global\@topnum\z@ % Prevents figures from going at top of page
                \@maketitle
                \begin{tabularx}{\linewidth}{@{}l@{}X@{}l@{}}%
                    \ifx\artfulltext\empty
                    \else
                        \multicolumn{3}{@{}l@{}}{\artfulltext} \\\addlinespace[1.75em]%
                    \fi
                    \ifx\arthighlights\empty
                    \else
                        {\stylizeabstract{Highlights}\quad} &
                        \multicolumn{2}{@{}X@{}}{\arthighlights} \\\addlinespace[1em]%
                    \fi
                    \ifx\artabstract\empty
                        \ifx\artkeywords\empty
                        \else
                            {\stylizeabstract{Keywords}\quad} & 
                            \multicolumn{2}{@{}X@{}}{\artkeywords} \\\addlinespace[1em]%
                         \fi
                    \else
                        \ifx\artkeywords\empty
                            {\stylizeabstract{Abstract}\quad} &
                            \multicolumn{2}{@{}X@{}}{\artabstract} \\\addlinespace[1em]%
                        \else
                            \multicolumn{2}{@{}X@{\quad}}{{\stylizeabstract{Abstract}\quad}{\artabstract}} &
                            {\artkeywords} \\\addlinespace[1em]%
                        \fi
                    \fi
                \end{tabularx}%
                \vskip 1.75em%
            }]%
        \else
            \newpage
            \global\@topnum\z@ % Prevents figures from going at top of page
            \@maketitle
            \begin{tabularx}{\linewidth}{@{}l@{}X@{}}%
                \ifx\artfulltext\empty
                \else
                    \multicolumn{2}{@{}l@{}}{\artfulltext} \\\addlinespace[1.75em]%
                \fi
                \ifx\arthighlights\empty
                \else
                    {\stylizeabstract{Highlights}\quad} &
                    {\arthighlights} \\\addlinespace[1em]%
                \fi
                \ifx\artabstract\empty
                \else
                    {\stylizeabstract{Abstract}\quad} & 
                    {\artabstract} \\\addlinespace[1em]%
                \fi
                \ifx\artkeywords\empty
                \else
                 {\stylizeabstract{Keywords}\quad} & 
                    {\artkeywords} \\\addlinespace[1em]%
                \fi
            \end{tabularx}%
            \vskip 1.75em%
        \fi
        \thispagestyle{plain}\@thanks
    \endgroup
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
}
\renewcommand{\@maketitle}{%
    {\footnotesize%
    \headline{%
        \ifthenelse{\equal{\artdisclaimer}{\empty}}{\phantom{phantom}}{\artdisclaimer}%
    }{%
        \ifthenelse{\equal{\artlicense}{\empty}}{\phantom{phantom}}{\artlicense}%
    }{%
        \ifthenelse{\equal{\artjournal}{\empty}}{\phantom{phantom}}{\artjournal}%
        \ifthenelse{\equal{\artvolume}{\empty}}{}{, \artvolume}%
        \ifthenelse{\equal{\artnumber}{\empty}}{}{(\artnumber)}%
        \ifthenelse{\equal{\artpages}{\empty}}{}{: \artpages}%
        \ifthenelse{\equal{\artyear}{\empty}}{}{, \artyear}}%
    }%
    {\footnotesize \raggedleft%
    \ifthenelse{\equal{\artdoi}{\empty}}{}{\artdoi} \par}%
    \vskip 1.75em%
    {\centering%
        {\let \footnote \thanks}%
        {\stylizetitle{\@title} \par}%
        {\vskip 1.75em \@author \par}%
    }%
    \vskip 1.75em%
}

% Abs symbol.
\delimitershortfall-1sp
\newcommand\abs[1]{\lvert#1\rvert}

% Column type with decimals. Needs the dcolumn package.
\newcolumntype{d}[1]{D{.}{.}{#1}}
% Centers the content of a single cell.
\newcommand\centercell[1]{\multicolumn{1}{c}{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Miscellaneous

% ARTICLE STRUCTURE
\date{}
% Needs the natbib package.
\bibliographystyle{abbrvnat}

% FLOATS
% Needs the graphicx package.
\graphicspath{ {}{Figures/} }

\endinput
