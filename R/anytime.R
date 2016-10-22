
## anytime: Use Boost Date_Time to convert date(time) data to POSIXt
##
## Copyright (C) 2015 - 2016  Dirk Eddelbuettel
##
## This file is part of anytime.
##
## anytime is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 2 of the License, or
## (at your option) any later version.
##
## anytime is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with anytime.  If not, see <http://www.gnu.org/licenses/>.

##' These function use the Boost Date_Time library to parse
##' datetimes (and dates) from strings, integers, factors or even numeric values
##' (which are cast to strings internally). They return a vector of
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
##' this package. See the \pkg{RcppCCTZ} package which offers some
##' timezone-shifting and differencing functionality.
##'
##' Times and timezones can be tricky. This package offers a heuristic approach,
##' it is likely that some input formats may not be parsed, or worse, be parsed
##' incorrectly. This is not quite a \href{https://xkcd.com/327/}{Bobby Tables}
##' situation but care must always be taken with user-supplied input.
##'
##' @section Issues:
##'
##' The Boost Date_Time library cannot parse single digit months or
##' days. So while \sQuote{2016/09/02} works (as expected),
##' \sQuote{2016/9/2} will not. Other non-standard formats may also
##' fail.
##'
##' The is a known issue (discussed at length in issue tick 5) where
##' Australian times are off by an hour. This seems to affect only
##' Windows, not Linux.
##'
##' @section Operating System Impact:
##' On Windows systems, accessing the \code{isdst} flag on dates or times
##' before January 1, 1970, can lead to a crash. Therefore, the lookup of this
##' value has been disabled for those dates and times, which could therefore be
##' off by an hour (the common value that needs to be corrected).
##' It should not affect dates, but may affect datetime objects.
##'
##' @title Parse POSIXct objects from input data
##' @param x A vector of type character, integer or numeric with
##' date(time) expressions to be parsed and converted.
##' @param tz A string with the timezone, defaults to \sQuote{UTC} if unset
##' @param asUTC A logical value indicating if parsing should be to UTC; default
##' is false implying localtime.
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
anytime <- function(x, tz=getTZ(), asUTC=FALSE) {

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

    anytime_cpp(x, tz=tz, asUTC=asUTC)
}

##' @rdname anytime
anydate <- function(x, tz=getTZ(), asUTC=FALSE) {
    as.Date(as.POSIXlt(anytime(x=x, tz=tz, asUTC=asUTC)))
}

##' @rdname anytime
utctime <- function(x, tz=getTZ()) {
    anytime(x=x, tz=tz, asUTC=TRUE)
}

##' @rdname anytime
utcdate <- function(x, tz=getTZ()) {
    as.Date(as.POSIXlt(utctime(x=x, tz=tz)))
}
