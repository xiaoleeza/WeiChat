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

\setCJKmainfont{SimHei}
\usepackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{shapes.misc}
% Start with article. Eventually this should be removed,
% because I'm not actually using it for much of anything
\RequirePackage{xurl}
% Set up the page so that it matches phone size.
\RequirePackage[top=.55in,         bottom=.55in,
            right=.015in,      left=.015in,
            paperwidth=3.308in,paperheight=6.103in]{geometry}

% Style the page
\pagestyle{empty}
\setmainfont{Arial}
\setsansfont{Arial}
\setmonofont{Consolas}
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
\definecolor{Qblue}{RGB}{56,171,255}
\definecolor{Qmblue}{RGB}{127,180,255}
\definecolor{kiktimepalegray}{RGB}{158,169,184}
\definecolor{kiktimedarkgray}{RGB}{122,133,151}
\definecolor{kikyellow}{RGB}{254,248,226}
\definecolor{kikbrown}{RGB}{117,102,95}

%--------------------------------------------------
%            icon definition
%--------------------------------------------------

\newlength{\totalsize}
\newcommand{\QqGroup}[3][1cm]{%
\setlength{\totalsize}{#1}
\begin{tikzpicture}[x=\totalsize,y=\totalsize,line width=0.08\totalsize,line join=round,fill=#2,draw=#3]
\fill(-0.6,-0.6)rectangle(0.6,0.6);
\draw
    (-0.29 ,-0.41)--(0.56  ,-0.41)..controls(0.55  ,-0.26)and(0.43  ,-0.16)..(0.235 ,-0.13)--(0.235 ,-0.06)..controls(0.395 ,0.065)and(0.395 ,0.425)..(0.135 ,0.425)..controls(-0.125,0.425)and(-0.125,0.065)..(0.035 ,-0.06);
\filldraw
    (-0.175,-0.22)..controls(-0.37,-0.25)and(-0.49,-0.35)..(-0.5,-0.5)--
    (0.35,-0.5)..controls(0.34,-0.35)and(0.22,-0.25)..(0.025,-0.22)--
    (0.025,-0.15)..controls(0.185,-0.025)and(0.185,0.335)..(-0.075,0.335)..controls(-0.335,0.335)and (-0.335,-0.025)..(-0.175,-0.15)--cycle;
\end{tikzpicture}
}
\newcommand{\QqFriend}[3][1cm]{%
\setlength{\totalsize}{#1}
\begin{tikzpicture}[x=\totalsize,y=\totalsize,line width=0.08\totalsize,line join=round,fill=#2,draw=#3]
\fill(-0.6,-0.6)rectangle(0.6,0.6);
\filldraw
(-0.1  ,-0.1375)..controls
(-0.295,-0.1675)and
(-0.415,-0.2675)..
(-0.425,-0.4175)--
(0.425 ,-0.4175)..controls
(0.415 ,-0.2675)and
(0.295 ,-0.1675)..
(0.1   ,-0.1375)--
(0.1   ,-0.0675)..controls
(0.26  ,0.0575 )and
(0.26  ,0.4175 )..
(0     ,0.4175 )..controls
(-0.26 ,0.4175 )and 
(-0.26 ,0.0575 )..
(-0.1  ,-0.0675)--cycle;
\end{tikzpicture}
}

\newcommand{\QqCamera}[3][1cm]{%
\setlength{\totalsize}{#1}
\begin{tikzpicture}[x=\totalsize,y=\totalsize,line width=0.08\totalsize,line join=round,fill=#2,draw=#3]
    \fill(-0.6,-0.6)rectangle(0.6,0.6);
    \draw(-0.45,-0.35)--(0.45,-0.35)--(0.45,0.30)--(0.25,0.30)--(0.1,0.40)--(-0.1,0.40)--(-0.25,0.30)--(-0.45,0.30)--cycle;
    \fill[even odd rule,#3](0,0)circle(0.20)(45:0.10)circle(0.04);
\end{tikzpicture}
}

\newcommand{\QqMicphone}[3][1cm]{%
\setlength{\totalsize}{#1}
\begin{tikzpicture}[x=\totalsize,y=\totalsize,line width=0.08\totalsize,line join=round,line cap=round,fill=#2,draw=#3]
\fill(-0.6,-0.6)rectangle(0.6,0.6);
\draw(-0.2,-0.5)--(0.2,-0.5)(0,-0.5)--(0,-0.3);
\draw(-0.35,0.05)arc(180:360:0.35);
\fill[#3](0,0)circle(0.2);
\fill[#3](-0.2,0)rectangle(0.2,0.35);
\fill[#3,even odd rule](0,0.35)circle(0.2)(0.05,0.4)circle(0.05);
\end{tikzpicture}
}

\newcommand{\QqPicture}[3][1cm]{%
\setlength{\totalsize}{#1}
\begin{tikzpicture}[x=\totalsize,y=\totalsize,line width=0.08\totalsize,line join=round,fill=#2,draw=#3]
    \fill(-0.6,-0.6)rectangle(0.6,0.6);
    \draw(-0.45,-0.35)rectangle(0.45,0.35);
    \fill[#3](-0.28,0.12)circle(0.07);
    \fill[#3](-0.30,-0.35)--(0.15,0.08)--(0.45,-0.25)--(0.45,-0.35)--cycle;
\end{tikzpicture}
}

\newcommand{\QqMoney}[3][1cm]{%
\setlength{\totalsize}{#1}
\begin{tikzpicture}[x=\totalsize,y=\totalsize,line width=0.08\totalsize,line join=round,line cap=round,fill=#2,draw=#3]
\fill(-0.6,-0.6)rectangle(0.6,0.6);
\filldraw[#3](-0.375,-0.45)rectangle(0.375,0.45);
\draw[#2](-0.15,-0.3)--(0.15,-0.3)(-0.15,-0.15)--(0.15,-0.15)(0,-0.1)--(0,-0.4);
\draw[#2](0,-0.1)--+(135:0.2)(0,-0.1)--+(45:0.2);
\draw[#2](-0.4,0.3)..controls(0,0.20)..(0.4,0.3);
\end{tikzpicture}
}

\newcommand{\QqVideo}[3][1cm]{%
\setlength{\totalsize}{#1}
\begin{tikzpicture}[x=\totalsize,y=\totalsize,line width=0.08\totalsize,line join=round,fill=#2,draw=#3]
\fill(-0.6,-0.6)rectangle(0.6,0.6);
\draw(-0.5,-0.35)rectangle(0.35,0.35);
\filldraw[#3](0.35,0)--(0.55,0.25)--(0.55,-0.25)--cycle;
\node at(-0.1,0)[anchor=center,text=#3]{\resizebox{0.5\totalsize}{0.5\totalsize}{\bfseries\sffamily GIF}};
\end{tikzpicture}
}

\newcommand{\QqSmile}[3][1cm]{%
\setlength{\totalsize}{#1}
\begin{tikzpicture}[x=\totalsize,y=\totalsize,line width=0.08\totalsize,line join=round,line cap=round,fill=#2,draw=#3]
  \fill(-0.6,-0.6)rectangle(0.6,0.6);
  \draw(0,0)circle(0.5);
  \fill[#3](45:0.23)circle(0.09);
  \fill[#3](135:0.23)circle(0.09);
  \draw(220:0.2)arc(220:320:0.2);
\end{tikzpicture}
}

\newcommand{\QqPlus}[3][1cm]{%
\setlength{\totalsize}{#1}
\begin{tikzpicture}[x=\totalsize,y=\totalsize,line width=0.08\totalsize,line join=round,line cap=round,fill=#2,draw=#3]
\fill(-0.6,-0.6)rectangle(0.6,0.6);
\draw(0,0)circle(0.5);
\draw(0.3,0)--(-0.3,0)(0,0.3)--(0,-0.3);
\end{tikzpicture}
}

\newcommand{\QqSendMessage}[3][1cm]{%
\setlength{\totalsize}{#1}
\begin{tikzpicture}[x=\totalsize,y=\totalsize,line width=0.08\totalsize,line join=round,line cap=round,draw=#2,text=#2]
\node[rectangle,inner sep=7pt,rounded corners,draw,fill=#3]{\resizebox{!}{0.4\totalsize}{\bfseries 发送}};
\end{tikzpicture}
}


\newcommand{\QqNumber}[4][1cm]{%
\setlength{\totalsize}{#1}
\begin{tikzpicture}[x=\totalsize,y=\totalsize,line width=0.08\totalsize,line join=round,line cap=round,draw=#2,text=#3]
\node[rounded rectangle,inner sep=.3\totalsize,draw,fill=#2]{\resizebox{!}{0.7\totalsize}{\sffamily #4}};
\end{tikzpicture}
}

\newcommand{\QqTitle}[4][1cm]{%
\setlength{\totalsize}{#1}
\begin{tikzpicture}[x=0,y=0,line width=0.08\totalsize,line join=round,line cap=round,draw=#2,text=#2]
\node[rectangle,inner sep=.3\totalsize,rounded corners,draw,fill=#3]{\resizebox{!}{0.7\totalsize}{\bfseries #4}};
\end{tikzpicture}
}

%------------------------------------------------------
% mapping of titles
%------------------------------------------------------
\newcommand{\Qtitle}[1]{%
{\ifcase#1%
   \QqTitle[0.8em]{backgroundgray}{msggreen}{小白}%
   \or \QqTitle[1.6em]{backgroundgray}{msggreen}{种草达人}%
   \or \QqTitle[1.6em]{backgroundgray}{msggreen}{相声演员}%
   \or \QqTitle[1.6em]{backgroundgray}{msggreen}{本群守卫}%
   \or \QqTitle[1.6em]{backgroundgray}{msggreen}{翰林学士}%
   \or \QqTitle[1.6em]{backgroundgray}{msggreen}{三好学生}%
   \or \QqTitle[0.8em]{backgroundgray}{msggreen}{元老}%
   \or \QqTitle[0.8em]{backgroundgray}{msggreen}{管理}%
   \or \QqTitle[0.8em]{backgroundgray}{msggreen}{群主}%
   \or \QqTitle[1.6em]{backgroundgray}{msggreen}{江湖传说}%
   \or \QqTitle[0.8em]{backgroundgray}{msggreen}{博士}%
   \or \QqTitle[0.8em]{backgroundgray}{msggreen}{大佬}%
   \fi
}}

\usepackage{fontawesome}
% Customization Flags
\def\@hours{12}
\def\@minutes{11}
\def\@partnerName{Sample Name}

\def\@groupfriend{\QqGroup[1em]{Qblue}{white}}
\def\@Message{就算两千万也不能}
\def\@Status{5人在线}
\def\@InputMessage{我……}
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
    \fill[backgroundgray]
    let \p1 = (current page.south east) in
    let \p2 = (current page.south west) in
    (\x1,\y1) rectangle (\x2,\y2 + 0.3141in);
    \fill[Qblue]
    let \p1 = (current page.north east) in
    let \p2 = (current page.north west) in
    (\x1,\y1 - 0.1667in) rectangle (\x2,\y2 - .5289in);
    \draw[thick,linegray]
    let \p1 = (current page.north east) in
    let \p2 = (current page.north west) in
    (\x1,\y1 - .5289in) -- (\x2,\y2 - .5289in);
    \fill[white,rounded corners]
    let \p1 = (current page.south east) in
    let \p2 = (current page.south west) in
    (\x1-0.5in,\y1 + 0.3141in) rectangle (\x2+0.03in,\y2 + .6090in);

      % Name
    \draw[white]
      let \p1 = (current page.north) in
        (\x1, \y1 - .3in) node[anchor=center] {{\zihao{-5}\@partnerName}};
        
     \draw[white]
         let \p1 = (current page.north) in
             (\x1, \y1 - .45in) node[anchor=center] {{\zihao{6}\faCheckCircleO\ \@Status}};

      % group icon
        \draw
          let \p1 = (current page.north east) in
            (\x1, \y1 - .3481in) node[anchor=east] {\@groupfriend};
            
      % Arrow
      
      \draw
         let \p1 = (current page.north west) in
           (\x1, \y1 - .34in) node[anchor=west,white] {\faChevronLeft};
      \draw
         let \p1 = (current page.north west) in
           (\x1+0.07in, \y1 - .34in) node[anchor=west,white] {\QqNumber[2ex]{red}{white}{99}};
        
    \draw
      let \p1 = (current page.south east) in
        (\x1+0.06in, \y1 + .24in) node[anchor=south east,scale=1] {\QqSendMessage[2em]{backgroundgray}{Qblue}};
    

    \draw
      let \p1 = (current page.north west) in
        (\x1,\y1-0.01in) node[anchor=north west,scale=0.75] {\color{androidgray}\faWifi};

    % Android Bottom Bar Decorations
    \draw
       let \p1 = (current page.south west) in
         (\x1 - 0.05in, \y1 + .3in) node[anchor=north west,scale=1] {\QqMicphone[2.6ex]{backgroundgray}{gray}\hspace{1.1em} \QqPicture[2.6ex]{backgroundgray}{gray}\hspace{1.1em}\QqCamera[2.6ex]{backgroundgray}{gray}\hspace{1.1em} \QqMoney[2.6ex]{backgroundgray}{gray}\hspace{1.1em}\QqVideo[2.6ex]{backgroundgray}{gray}\hspace{1.1em}\QqSmile[2.6ex]{backgroundgray}{gray}\hspace{1.1em}\QqPlus[2.6ex]{backgroundgray}{gray}};

   \draw
       let \p1 = (current page.north east) in
          (\x1,\y1-0.01in) node[anchor=north east,scale=0.75] {\color{androidgray}\faBluetooth~5G\faSignal~\faBatteryThreeQuarters~\hspace*{5ex}};

  \end{tikzpicture}
}

% Make the background appear on every page
\usepackage{everypage}
\AddEverypageHook{\@drawBackground}

% System Time
\def\SysTime#1{%
\begin{tikzpicture}[remember picture, overlay]
     \draw
       let \p1 = (current page.north east) in
         (\x1,\y1-0.02in) node[anchor=north east,scale=0.75] {\color{androidgray}#1};
\end{tikzpicture}%
}

% Type a message...
\def\InputMessage#1{%
\begin{tikzpicture}[remember picture, overlay]
     \draw
       let \p1 = (current page.south west) in
         (\x1+0.05in, \y1 + .5524in) node[anchor=north west,scale=.85] {\color{androidgray}#1};
\end{tikzpicture}%
}

\def\myMessage#1{%
\begin{tikzpicture}[remember picture, overlay]
\draw
   let \p1 = (current page.north) in
      (\x1 - 1.5in, \y1) node[anchor=north west,scale=0.75] {\color{androidgray}#1};
\end{tikzpicture}
}

% Commands for use by the user.

\def\setStatus#1{%
\def\@Status{#1}%
}

\def\groupfriend#1{%
\def\@groupfriend{#1}%
}

\def\setPartnerName#1{%
\def\@partnerName{#1}%
}

\def\setPartnerPic#1{%
\def\@partnerPic{#1}%
}

\def\setMePic#1{%
\def\@MePic{#1}%
}

\def\setHours#1{%
\def\@hours{#1}%
}

\def\setMinutes#1{%
\def\@minutes{#1}%
}

\def\me#1#2{%
\hphantom{.}\hfill\begin{tikzpicture}
    \draw (0,0) node[anchor=north east,rectangle,rounded corners=2,fill=Qblue, scale=0.75,draw=circgray] (me) {
      \hspace{.1in}\begin{varwidth}{2.5in}
        \vphantom{.}
        \raggedright\zihao{-4} #2\\
        \tiny \color{msggreen}.
      \end{varwidth}
      \hspace{.1in}
    };
    \draw (0,1ex) node[anchor=east,gray] {\settowidth{\testxxla}{\zihao{6}#1}\zihao{6}#1};
    \fill[Qblue] (-0.01in,-0.06in) -- (0.06in,-0.12in) -- (-0.01in,-0.18in) -- cycle;
    \draw[circgray] (0,-0.06in) -- (0.06in,-0.12in) -- (0in,-0.18in);
    \ifdefined\@MePic
            \draw ([yshift=-3pt,xshift=.25in]me.north east) node[scale=1.825,circle, path picture={
                \node at (path picture bounding box.center){
                  \includegraphics[width=.25in]{\@MePic}
                };
              }
            ] {};
  \end{tikzpicture}%
\vspace{.05in}\\%
}
\usepackage{ifthen}

\newlength{\testxxla}

\def\you#1#2{%
\begin{tikzpicture}
    \ifdefined\@partnerPic
    \draw (-.6,-.3) node[scale=1.825,circle, path picture={
        \node at (path picture bounding box.center){
          \includegraphics[width=.25in]{\@partnerPic}
        };
      }
    ] {};
    \else\fill[black] (-.6,-.3) circle (.12in);\fi
    \draw (0,-.1) node[anchor=west,gray] {\settowidth{\testxxla}{\zihao{6}#1}\zihao{6}#1};
    \draw (0,-.3) node[remember picture,anchor=north west,rectangle,rounded corners=2,fill=white, scale=0.75,draw=linegray] (n1) {
      \hspace{.1in}
	  \begin{varwidth}[c]{2.5in}
        \vphantom{.}
        \raggedright\zihao{-4} #2\\
        \tiny \color{white}.
      \end{varwidth}
      \hspace{.1in}
    };
    \fill[white] (0.01in,-0.16in) -- (-0.06in,-0.22in) -- (0.01in,-0.28in) -- cycle;
    \draw[linegray] (0,-0.16in) -- (-0.06in,-0.22in) -- (0in,-0.28in);
	%\draw (n1) node[yshift=-10pt,xshift=\testxxla,anchor=south east,overlay] {\includegraphics[width=.25in]{eye.pdf}};
  \end{tikzpicture}%
\vspace{.05in}\\%
}

\def\mea#1#2{
  \hphantom{.}\hfill\begin{tikzpicture}
    \color{white}
    \draw (0,-.3) node[remember picture,anchor=north east,rectangle,rounded corners=5,fill=msggreen, scale=0.75,draw=linegray] (mea) {
      \hspace{.1in}\begin{varwidth}{2.5in}
        \vphantom{.}
        \raggedleft\zihao{-4} #2\\
        \tiny  \color{msggreen}.
      \end{varwidth}
      \hspace{.1in}
    };
    \draw (0,-.1) node[anchor=east,gray] {\settowidth{\testxxla}{\zihao{6}#1}\zihao{6}#1};
    \fill[msggreen] ([yshift=-5pt,xshift=-\pgflinewidth]mea.north east) to[bend right=15] ++(3mm,-3mm) to[bend left] ++(-3mm,1mm) --cycle;
    \ifdefined\@MePic
        \draw ([yshift=-3pt,xshift=.25in]mea.north east) node[scale=1.825,circle, path picture={
            \node at (path picture bounding box.center){
              \includegraphics[width=.25in]{\@MePic}
            };
          }
        ] {};
  \end{tikzpicture}
  \vspace{.01in}\\
}

\def\meb#1#2{
  \hphantom{.}\hfill\begin{tikzpicture}
    \color{black}
    \draw (0,-.3) node[remember picture,anchor=north east,rectangle,rounded corners=5,fill=kikyellow, scale=0.75,draw=kikbrown] (meb) {
      \hspace{.1in}\begin{varwidth}{2.5in}
        \vphantom{.}
        \raggedleft\zihao{-4}#2\\
        \tiny  \color{kikyellow}.
      \end{varwidth}
      \hspace{.1in}
    };
    \draw (0,-.1) node[anchor=east,kikbrown] {\settowidth{\testxxla}{\zihao{6}#1}\zihao{6}#1};
    \fill[kikyellow] ([yshift=-5pt,xshift=-\pgflinewidth]meb.north east) (-0.01in,-0.18in) -- (0.04in,-0.16in) -- (-0.01in,-0.25in) -- cycle;
     \draw[kikbrown] ([yshift=-5pt,xshift=-\pgflinewidth]meb.north east) (-0.005in,-0.18in) -- (0.04in,-0.16in) -- (-0.005in,-0.24in);
%    \fill[kikyellow] ([yshift=-5pt,xshift=-\pgflinewidth]mea.north east) to[bend right=15] ++(3mm,-3mm) to[bend left] ++(-3mm,1mm) --cycle;
    \ifdefined\@MePic
        \draw ([yshift=-3pt,xshift=.25in]meb.north east) node[scale=1.825,circle, path picture={
            \node at (path picture bounding box.center){
              \includegraphics[width=.25in]{\@MePic}
            };
          }
        ] {};
    \draw ([yshift=3pt,xshift=0.5ex]meb.south west) node[scale=1.825,path picture={
                  }
                ] {\includegraphics[width=.13in]{2615.pdf}};
  \end{tikzpicture}
  \vspace{.01in}\\
}

\def\youa#1#2{%
  \begin{tikzpicture}
  \ifdefined\@partnerPic
      \draw (-.6,-.3) node[scale=1.825,circle, path picture={
          \node at (path picture bounding box.center){
            \includegraphics[width=.25in]{\@partnerPic}
          };
        }
      ] {};
      \else\fill[black] (-.6,-.3) circle (.12in);\fi
    \node[anchor=north west,rectangle,rounded corners=5,fill=white, scale=0.75] (youa) {
      \hspace{.1in}\begin{varwidth}[c]{2.5in}
        \vphantom{.}
        \raggedright\zihao{-4} #2\\
        \tiny \color{white}.
      \end{varwidth}
      \hspace{.1in}
    };
    \draw (0,.2) node[anchor=west,gray] {\settowidth{\testxxla}{\zihao{6}#1}\zihao{6}#1};
    \fill[white] ([yshift=-5pt,xshift=\pgflinewidth]youa.north west) to[bend left=15] ++(-3mm,-3mm) coordinate (arrow) to[bend right] ++(3mm,1mm) -- cycle;
    \draw ([yshift=-0.5ex,xshift=-1ex]youa.north east) node[scale=1.825,path picture={
              }
            ] {\includegraphics[width=.15in]{eye.pdf}};
  \end{tikzpicture}
  \vspace{.05in}\\%
}

\def\youb#1#2{%
  \begin{tikzpicture}
  \ifdefined\@partnerPic
      \draw (-.6,-.0) node[scale=1.825,circle, path picture={
          \node at (path picture bounding box.center){
            \includegraphics[width=.25in]{\@partnerPic}
          };
        }
      ] {};
      \else\fill[black] (-.6,-.0) circle (.12in);\fi
    \node[anchor=north west,rectangle,rounded corners=5,fill=kikyellow, scale=0.75,draw=kikbrown] (youb) {
      \hspace{.1in}\begin{varwidth}[c]{2.5in}
        \vphantom{.}
        \raggedright\zihao{-4} #2\\
        \tiny \color{white}.
      \end{varwidth}
      \hspace{.1in}
    };
    \draw (0,.2) node[anchor=west,gray] {\settowidth{\testxxla}{\zihao{6}#1}\zihao{6}#1};
    \fill[kikyellow] (0.01in,-0.07in) -- (-0.05in,-0.05in) -- (0.01in,-0.13in) -- cycle;
    \draw[kikbrown] (0,-0.07in) -- (-0.05in,-0.05in) -- (0,-0.13in);
%    \fill[white] ([yshift=-3pt,xshift=\pgflinewidth]youa.north west) to[bend left=10] ++(-3mm,-3mm) coordinate (arrow) to[bend right] ++(3mm,1mm) -- cycle;
    \draw ([yshift=3pt,xshift=-1ex]youb.south east) node[scale=1.825,path picture={
              }
            ] {\includegraphics[width=.13in]{2615.pdf}};
  \end{tikzpicture}
  \vspace{.05in}\\%
}

\def\time#1{%
\hphantom{.}\hfil\begin{tikzpicture}
    \draw (0,0) node[scale=.65] {\color{kiktimedarkgray}#1};
  \end{tikzpicture}\hfil\\%
}

\makeatother
