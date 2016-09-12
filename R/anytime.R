
##' These function use the Boost Date_Time library to parse
##' datetimes (and dates) from strings, integers, factors or even numeric values
##' (which are cast to strings internall). They return a vector of
##' \code{POSIXct} objects (or \code{Date} objects in the case of \code{anydate}).
##' \code{POSIXct} objects represent dates and time as (possibly
##' fractional) seconds since the \sQuote{epoch} of January 1, 1970.
##' A timezone can be set, if none is supplied \sQuote{UTC} is set.
##'
##' A number of fixed formats are tried in succession. These include
##' the standard ISO format \sQuote{YYYY-MM-DD HH:MM:SS} as well as
##' different local variants including several forms popular in the
##' United States.  Two-digits years and clearly ambigous formats such
##' as \sQuote{03/04/05} are ignored.  In the case of parsing failure
##' a \code{NA} value is returned.
##'
##' Fractional seconds are supported as well.  As R itself only supports
##' microseconds, the Boost compile-time option for nano-second resolution
##' has not been enabled.
##'
##' @section Notes:
##' The (internal) conversion to (fractional) seconds since the epoch is
##' relative to the locatime of this system, and therefore not completely
##' independent of the settings of the local system. This is to strike a
##' balance between ease of use and functionality.  A more-full featured
##' conversion could be possibly be added with support for arbitrary
##' reference times, but this is (at least) currently outside the scope of
##' this package. See the \pkg{RcppTZ} package which offers some
##' timezone-shifting and differencing functionality.
##'
##' Times and timezones can be tricky. This package offers a heuristic approach,
##' it is likely that some input formats may not be parsed, or worse, be parsed
##' incorrectly. This is not quite a \href{https://xkcd.com/327/}{Bobby Tables}
##' situation but care must always be taken with user-supplied input.  
##'
##' @title Parse POSIXct objects from input data
##' @param x A vector of type character, integer or numeric with
##' date(time) expressions to be parsed and converted.
##' @param tz A string with the timezone, defaults to \sQuote{UTC} if unset
##' @return A vector of \code{POSIXct} elements, or, in the case of \code{anydate},
##' a vector of \code{Date} objects.
##' @seealso \code{\link{anytime-package}}
##' @references This StackOverflow answer provided the initial idea:
##' \url{http://stackoverflow.com/a/3787188/143305}.
##' @author Dirk Eddelbuettel
##' @examples
##' ## See the source code for a full list of formats, and the
##' ## or the reference in help('anytime-package') for details
##' times <- c("2004-03-21 12:45:33.123456",
##'           "2004/03/21 12:45:33.123456",
##'           "20040321 124533.123456",
##'           "03/21/2004 12:45:33.123456",
##'           "03-21-2004 12:45:33.123456",
##'           "2004-03-21",
##'           "20040321",
##'           "03/21/2004",
##'           "03-21-2004",
##'           "20010101")
##' anytime(times)
##' anydate(times)
anytime <- function(x, tz=getTZ()) {

    if (inherits(x, "POSIXt")) {
        return(as.POSIXct(x, tz=tz))
    }

    if (inherits(x, "Date")) {
        ## we format and reparse to get proper midnight in TZ treatment
        ## if we used as.Date() we would get midnight at UTC which is rarely desired
        ## x <- format(x)
        ## or not -- stick with what R does
        return(as.POSIXct(x))
    }

    if (inherits(x, "factor")) {
        x <- as.character(x)
    }

    anytime_cpp(x, tz=tz)
}

##' @rdname anytime
anydate <- function(x, tz=getTZ()) {
    as.Date(anytime(x=x, tz=tz))
}
