\name{NEWS}
\title{News for Package \pkg{anytime}}
\newcommand{\ghpr}{\href{https://github.com/eddelbuettel/anytime/pull/#1}{##1}}
\newcommand{\ghit}{\href{https://github.com/eddelbuettel/anytime/issues/#1}{##1}}

\section{Changes in anytime version 0.0.4 (2016-xx-yy)}{
  \itemize{
    \item Before converting via \code{lexical_cast}, assign to atomic
    type via template logic to avoid an UBSAN issue (\ghit{14})
    \item More robust initialization also considering NA.
    \item More robust processing of non-finite input, returning NA.
  }
}

\section{Changes in anytime version 0.0.3 (2016-10-13)}{
  \itemize{
    \item Added (non-exported) helper function \code{testFormat()}
    \item Do not access \code{tm_isdst} on Windows for dates before the epoch
    (pull request \ghpr{13} fixing issue \ghit{12}); added test as well
  }
}

\section{Changes in anytime version 0.0.2 (2016-09-15)}{
  \itemize{
    \item Refactored to use a simple class wrapped around two vector
    with (string) formats and locales; this allow for adding formats;
    also adds accessor for formats (\ghpr{4}, closes \ghit{1} and
    \ghit{3}).
    \item New function \code{addFormats()} and \code{getFormats()}.
    \item Relaxed one tests which showed problems on some platforms.
    \item Added \code{as.POSIXlt()} step to \code{anydate()} ensuring
    all \code{POSIXlt} components are set (\ghpr{6} fixing \ghit{5}).
  }
}


\section{Changes in anytime version 0.0.1 (2016-09-12)}{
  \itemize{
    \item Initial release with \code{anytime()} and \code{anydate}
  }
}
