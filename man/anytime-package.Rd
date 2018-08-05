\name{anytime-package}
\alias{anytime-package}
\docType{package}
\title{\packageTitle{anytime}}
\description{\packageDescription{anytime}}
\details{
  R excels at computing with dates, and times.  Using \emph{typed}
  representation for your data is highly recommended not only because of
  the functionality offered but also because of the added safety
  stemming from proper representation.

  But there is a small nuisance cost in interactive work as well as in
  programming. How often have we told \code{as.POSIXct()} that the
  origin is (of course) the
  \href{https://en.wikipedia.org/wiki/Unix_time}{epoch}. Do we really
  have to say it again? Similarly, when parsing dates that are
  \emph{somewhat} in YYYYMMDD format, do we really need to bother
  converting from integer or numeric or character or factor or ordered
  with one of dozen separators and/or month forms: YYYY-MM-DD, YYYY/MM/DD, YYYYMMDD,
  YYYY-mon-DD and so on?

  So there may have been a need for a \emph{general purpose} converter
  returning a proper \code{POSIXct} (or \code{Date}) object no matter the
  input (provided it was somewhat parseable). \code{anytime()} tries to
  be that function.

  The actual conversion is done by a combination of
  \href{http://www.boost.org/doc/libs/1_61_0/doc/html/boost_lexical_cast.html}{Boost lexical_cast} to go
  from \emph{(almost) anything} to string representation which is then parsed by
  \href{http://www.boost.org/doc/libs/1_61_0/doc/html/date_time.html}{Boost Date_Time}.

  Conversion is done by looping over a fixed set of formats until a
  matching one is found, or returning an error if none is found.  The
  current set of conversion formulae is accessible in the
  \href{https://github.com/eddelbuettel/anytime/blob/master/src/anytime.cpp#L43-L106}{source code},
  and can now also be accessed in R via \code{getFormats()}. Formats can
  be added via the \code{addFormats()} function.

  Details on the Boost date format symbols are provided by the
  \href{http://www.boost.org/doc/libs/1_61_0/doc/html/date_time/date_time_io.html#date_time.format_flags}{Boost
  date_time documentation} and similar (but not identical) to what
  \code{\link{strftime}} uses.
}
\references{
  Boost date_time: \url{http://www.boost.org/doc/libs/1_61_0/doc/html/date_time.html}

  Formats used: \url{https://github.com/eddelbuettel/anytime/blob/master/src/anytime.cpp#L30-L70}

  Boost format documentation: \url{http://www.boost.org/doc/libs/1_61_0/doc/html/date_time/date_time_io.html#date_time.format_flags}
}
\author{\packageAuthor{anytime}}
\keyword{package}
\examples{
  library(anytime)
  options(digits.secs=6)                ## for fractional seconds below
  Sys.setenv(TZ=anytime:::getTZ())      ## helper function to try to get TZ

  ## integer
  anytime(20160101L + 0:2)

  ## numeric
  anytime(20160101 + 0:2)

  ## factor
  anytime(as.factor(20160101 + 0:2))

  ## ordered
  anytime(as.ordered(20160101 + 0:2))

  ## Dates: Character
  anytime(as.character(20160101 + 0:2))

  ## Dates: alternate formats
  anytime(c("20160101", "2016/01/02", "2016-01-03"))

  ## Datetime: ISO with/without fractional seconds
  anytime(c("2016-01-01 10:11:12", "2016-01-01 10:11:12.345678"))

  ## Datetime: ISO alternate (?) with 'T' separator
  anytime(c("20160101T101112", "20160101T101112.345678"))

  ## Short month '%b' (and full month is supported too)
  anytime(c("2016-Sep-01 10:11:12", "Sep/01/2016 10:11:12", "Sep-01-2016 10:11:12"))

  ## Datetime: Mixed format (cf http://stackoverflow.com/questions/39259184)
  anytime(c("Thu Sep 01 10:11:12 2016", "Thu Sep 01 10:11:12.345678 2016"))
}
