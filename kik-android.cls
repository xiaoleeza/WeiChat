% kik-android.cls
%   by Brian Jacobs.
%   April 11, 2015
%
% This document class emulates the user interface of the Kik messaging
% application running on an android Moto X.

\ProvidesClass{kik-android}
\makeatletter
% Load all necessary packages
\usepackage{varwidth}
\LoadClass{article}
\usepackage[UTF8]{ctex}
\usepackage{xeCJK}
\xeCJKsetup{
  AutoFakeSlant = true
  }
\xeCJKsetslantfactor{0.17}
%\usepackage{fontspec}

\setCJKmainfont{Adobe Heiti Std}
\usepackage{tikz}
\usetikzlibrary{calc}

% Start with article. Eventually this should be removed,
% because I'm not actually using it for much of anything


% Set up the page so that it matches phone size.
\usepackage[top=.55in,         bottom=.55in,
            right=.015in,      left=.015in,
            paperwidth=3.308in,paperheight=6.103in]{geometry}

% Style the page
\pagestyle{empty}
\setmainfont{Adobe Garamond Pro}
\setlength{\parindent}{0pt}
% Color Definitions
\usepackage{xcolor}
\definecolor{backgroundgray}{RGB}{238,238,238}
\definecolor{linegray}{RGB}{212,212,212}
\definecolor{circgray}{RGB}{199,199,199}
\definecolor{circdarkgray}{RGB}{117,117,117}
\definecolor{arrowgray}{RGB}{107,107,107}
\definecolor{msggreen}{RGB}{185,224,97}
\definecolor{androidgray}{RGB}{191,191,191}
\definecolor{repwiregreen}{RGB}{71,146,53}
\definecolor{kikblue}{RGB}{103,142,233}
\definecolor{kiktimepalegray}{RGB}{158,169,184}
\definecolor{kiktimedarkgray}{RGB}{122,133,151}

\usepackage{fontawesome}
% Customization Flags
\def\@hours{12}
\def\@minutes{11}
\def\@partnerName{Sample Name}

\def\@Message{就算两千万也不能}

% Macros to draw the background
\def\@statusbar#1{
  \def\c{androidgray}
  \fill[\c]
    let \p1 = (current page.north east) in
      (\x1 - .42in - #1in, \y1 - 0.0415in - #1in) rectangle (\x1 - .43in -#1in, \y1 - 0.1409 in);
}

% Background Macro

\def\@drawBackground{
  \begin{tikzpicture}[remember picture, overlay]
    % Background
    \fill[backgroundgray] (current page.north east) rectangle (current page.south west);
    \fill[black]
    let \p1 = (current page.north east) in
    let \p2 = (current page.north west) in
    (\x1,\y1) rectangle (\x2,\y2 - 0.1667in);
    \fill[black]
    let \p1 = (current page.south east) in
    let \p2 = (current page.south west) in
    (\x1,\y1) rectangle (\x2,\y2 + 0.3141in);
    \fill[white]
    let \p1 = (current page.north east) in
    let \p2 = (current page.north west) in
    (\x1,\y1 - 0.1667in) rectangle (\x2,\y2 - .5289in);
    \draw[thick,linegray]
    let \p1 = (current page.north east) in
    let \p2 = (current page.north west) in
    (\x1,\y1 - .5289in) -- (\x2,\y2 - .5289in);
    \fill[white]
    let \p1 = (current page.south east) in
    let \p2 = (current page.south west) in
    (\x1,\y1 + 0.3141in) rectangle (\x2,\y2 + .6090in);
    \draw[thick,linegray]
    let \p1 = (current page.south east) in
    let \p2 = (current page.south west) in
    (\x1,\y1 + .6090in) -- (\x2,\y2 + .6090in);

    % Kik Top bar decorations
      % Circles
    \fill[circgray]
      let \p1 = (current page.north east) in
        (\x1 -.1987in,\y1-.359in) circle (0.04065in);
    \fill[circdarkgray]
      let \p1 = (current page.north east) in
        (\x1 -.15805in,\y1-.31835in) circle (0.04065in);

      % Name
    \draw
      let \p1 = (current page.north west) in
        (\x1 + .4647in, \y1 - .3481in) node[anchor=west] {\@partnerName};

      % Arrow
    \draw[thick,circdarkgray]
      let \p1 = (current page.north west) in
        (\x1 + .1314in, \y1 - .3397in) -- (\x1 + .2179in , \y1 - .3397in);
    \draw[thick,circdarkgray]
      let \p1 = (current page.north west) in
        (\x1 + .1795in, \y1 - .2981in) -- (\x1 + .1314in, \y1 - .3397in) --
        (\x1 + .1795in, \y1 - .3846in);

    % Kik Bottom Bar Decorations
      % Type a message...
    \draw
      let \p1 = (current page.south west) in
        (\x1 + .3141in, \y1 + .5524in) node[anchor=north west,scale=.85] {\color{androidgray}Type a message...};

      % Plus
    \draw[thick, androidgray]
      let \p1 = (current page.south west) in
        (\x1 + .1538in, \y1 + .5321in) -- (\x1 + .1538in,\y1 + .4135in);
    \draw[thick, androidgray]
      let \p1 = (current page.south west) in
        (\x1 + .0906in, \y1 + .4728in) -- (\x1 + .2088in, \y1 + .4728in);

    % Android Top Bar Decorations
      % Time
    \draw
      let \p1 = (current page.north east) in
        (\x1,\y1-0.01in) node[anchor=north east,scale=0.75] {\color{androidgray}\faBluetooth~5G\faSignal~\faBatteryThreeQuarters~\@hours:\@minutes};

    \draw
      let \p1 = (current page.north west) in
        (\x1,\y1-0.01in) node[anchor=north west,scale=0.75] {\color{androidgray}\faWifi};

      % Republic Wireless 
    %\draw[very thick,repwiregreen]
    %  let \p1 = (current page.north west) in
    %    (\x1 + .0701in, \y1 - .0801in) to[bend left=90] (\x1 + .1603in, \y1 - .0801in);

      % Battery Indicator
    %\fill[androidgray]
     % let \p1 = (current page.north east) in
      %  (\x1 - .3974in, \y1 - .1406in) rectangle (\x1 - .3213in,\y1 - .0509in);
    %\fill[androidgray]
     % let \p1 = (current page.north east) in
      %  (\x1 - .3784in, \y1 - .0515in) rectangle (\x1 - .3403in,\y1 - .0379in);

      % Status Bars
      %\@statusbar{0}
      %\@statusbar{.02}
      %\@statusbar{.04}
      %\@statusbar{.06}
      %\@statusbar{.08}

    % Android Bottom Bar Decorations
    % Home
    \draw[very thick,androidgray]
      let \p1 = (current page.south) in
        (\x1 - .1186in, \y1 + .08974in) -- (\x1 + .1186in, \y1 + .08974in) --
        (\x1 + .1186in, \y1 + .1795in)  -- (\x1, \y1 + .2115in) --
        (\x1 - .1186in, \y1 + .1795in) -- cycle;

    % Pages
    \draw[very thick,androidgray]
      let \p1 = (current page.south east) in
        (\x1 - .4391in, \y1 + .1058in) rectangle (\x1 - .6026in, \y1 + .1795in);
    \draw[very thick,androidgray]
      let \p1 = (current page.south east) in
        (\x1 - .3974in, \y1 + .1346in) -- (\x1 - .3974in, \y1 + .2219in) --
        (\x1 - .5545in, \y1 + .2219in);

    % Back arrow
    \draw[very thick,androidgray]
      let \p1 = (current page.south west) in
        (\x1 + .4199in, \y1 + 0.1635in) -- (\x1 + .5833in, \y1 + 0.1635in) to[bend left=90]
        (\x1 + .5833in, \y1 + .0993in) -- (\x1 + .5032in, \y1 + .0993in);
    \draw[very thick,androidgray]
      let \p1 = (current page.south west) in
        (\x1 + .4487in, \y1 + .1987in) -- (\x1 + .4199in, \y1 + .1635in) -- (\x1 + .4487in, \y1 + .1282in);

  \end{tikzpicture}
}

% Make the background appear on every page
\usepackage{everypage}
\AddEverypageHook{\@drawBackground}

\def\myMessage#1{
  \begin{tikzpicture}[remember picture, overlay]
    \draw
      let \p1 = (current page.north) in
        (\x1 - 1.5in, \y1) node[anchor=north west,scale=0.75] {\color{androidgray}#1};
\end{tikzpicture}
}

% Commands for use by the user.

\def\setPartnerName#1{
  \def\@partnerName{#1}
}

\def\setPartnerPic#1{
  \def\@partnerPic{#1}
}

\def\setHours#1{
  \def\@hours{#1}
}

\def\setMinutes#1{
  \def\@minutes{#1}
}

\def\me#1{
  \hphantom{.}\hfill\begin{tikzpicture}
    \draw (0,0) node[anchor=north east,rectangle,rounded corners=2,fill=msggreen, scale=0.75,draw=circgray] {
      \hspace{.1in}\begin{varwidth}{2.5in}
        \vphantom{.}
        \raggedright\zihao{-4} #1\\
        \tiny \color{msggreen}.
      \end{varwidth}
      \hspace{.1in}
    };
    \fill[msggreen] (-0.01in,-0.06in) -- (0.06in,-0.12in) -- (-0.01in,-0.18in) -- cycle;
    \draw[circgray] (0,-0.06in) -- (0.06in,-0.12in) -- (0in,-0.18in);
  \end{tikzpicture}
  \vspace{.05in}\\
}

\def\you#1#2{
  \begin{tikzpicture}
    \ifdefined\@partnerPic
    \draw (-.6,-.3) node[scale=1.825,circle, path picture={
        \node at (path picture bounding box.center){
          \includegraphics[width=.24in]{\@partnerPic}
        };
      }
    ] {};
    \else\fill[black] (-.6,-.3) circle (.12in);\fi
    \draw (0,-.1) node[anchor=west,gray] {\itshape\bfseries\zihao{-5}#1};
    \draw (0,-.3) node[anchor=north west,rectangle,rounded corners=2,fill=white, scale=0.75,draw=linegray] {
      \hspace{.1in}\begin{varwidth}[c]{2.5in}
        \vphantom{.}
        \raggedright\zihao{-4} #2\\
        \tiny \color{white}.
      \end{varwidth}
      \hspace{.1in}
    };
    \fill[white] (0.01in,-0.16in) -- (-0.06in,-0.22in) -- (0.01in,-0.28in) -- cycle;
    \draw[linegray] (0,-0.16in) -- (-0.06in,-0.22in) -- (0in,-0.28in);
  \end{tikzpicture}
  \vspace{.05in}\\
}

\def\time#1#2{
  \hphantom{.}\hfil\begin{tikzpicture}
    \draw (0,0) node[scale=.65] {\color{kiktimepalegray}#1 \color{kiktimedarkgray}@ #2};
  \end{tikzpicture}\hfil\\
}

\makeatother
