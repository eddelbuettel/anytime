\name{NEWS}
\title{News for Package \pkg{anytime}}
\newcommand{\ghpr}{\href{https://github.com/eddelbuettel/anytime/pull/#1}{##1}}
\newcommand{\ghit}{\href{https://github.com/eddelbuettel/anytime/issues/#1}{##1}}

\section{Changes in anytime version 0.1.3 (2017-xx-yy)}{
  \itemize{
    \item ISO 8601 is now recognised, but the timezone information is
    not parsed by Boost Date_Time (PR \ghpr{38} closing \ghit{37}) 
  }
}

\section{Changes in anytime version 0.1.2 (2016-12-13)}{
  \itemize{
    \item The (internal) string processing and splitting now uses Boost
    algorithm functions which avoids a (bizarre) bug on Windows.
    \item Test coverage was increased.
  }
}

\section{Changes in anytime version 0.1.1 (2016-11-27)}{
  \itemize{
    \item Both \code{anydate()} and \code{utcdate()} no longer attempt
    to convert an input value that is already of type \code{Date}.
    \item The string splitter (needed for the 'all-digits' formats
    extending Boost Date_time) is now more defensive about the input
    argument and more robust. Thanks to Bob Jansen for the heads-up
    (PR \ghpr{30} closing issue \ghit{29}).
    \item Code coverage reporting has been added (PR \ghpr{31}).
  }
}

\section{Changes in anytime version 0.1.0 (2016-11-06)}{
  \itemize{
    \item New functions \code{utctime()} and \code{utcdate()} were
    added to parse input as coordinated universal time; the
    functionality is also available in \code{anytime()} and
    \code{anydate()} via a new argument \code{asUTC} (PR \ghpr{22})
    \item New (date)time format for RFC822-alike dates, and expanded
    existing datetime formats to all support fractional seconds (PR
    \ghpr{21}) 
    \item Extended functionality to support not only \sQuote{YYYYMMDD}
    (without a separator, and not covered by Boost) but also with
    \sQuote{HHMM}, \sQuote{HHMMSS} and \sQuote{HHMMSS.ffffff} (PR
    \ghpr{30} fixing issue \ghit{29})
    \item Extended functionality to support \sQuote{HHMMSS[.ffffff]}
    following other date formats.
    \item Documentation and tests have been expanded; typos corrected
    \item New (unexported) helper functions \code{setTZ},
    \code{testOutput}, \code{setDebug}
    \item The \code{testFormat} (and \code{testOutput}) functions cannot
    be called under RStudio (PR \ghpr{27} fixing issue \ghit{25}).
    \item More robust support for non-finite values such as \code{NA},
    \code{NaN} or \code{Inf} (Fixing issue \ghit{16})
  }
}

\section{Changes in anytime version 0.0.4 (2016-10-20)}{
  \itemize{
    \item Before converting via \code{lexical_cast}, assign to atomic
    type via template logic to avoid an UBSAN issue (PR \ghpr{15}
    closing issue \ghit{14})
    \item More robust initialization and timezone information gathering.
    \item More robust processing of non-finite input also coping with
    non-finite values such as \code{NA}, \code{NaN} and \code{Inf} which
    all return \code{NA} 
    \item Allow numeric \code{POSIXt} representation on input, also
    creating proper \code{POSIXct} (or, if requested, \code{Date})
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
