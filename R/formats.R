## anytime: Use Boost Date_Time to convert date(time) data to POSIXt
##
## Copyright (C) 2016 - 2019  Dirk Eddelbuettel
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

##' Format a Datetime object: ISO 8601, RFC 2822 or RFC 3339
##'
##'
##' ISO 8601, RFC 2822 and RFC 3339 are a standards for date and time representation covering the
##' formatting of date and time (with or without possible fractional seconds) and timezone
##' information.
##'
##' @section ISO 8601:
##' ISO 8601 is described in some detail in \url{https://en.wikipedia.org/wiki/ISO_8601} and covers
##' multiple date and time formats.
##'
##' Here, we interpret it more narrowly focussing on a single format each for datetimes
##' and dates.  We return datetime object formatted as \sQuote{2016-09-01T10:11:12}
##' and date object as \sQuote{2016-09-01}.
##'
##' If the option \code{anytime.oldISO8601format} is set to \code{TRUE}, then the previous
##' format (with a space instead of \sQuote{T} to separate date and time) is used.
##'
##' @section RFC 2822:
##' RFC 2822 is described in some detail in \url{https://www.ietf.org/rfc/rfc2822.txt}
##' and \url{https://en.wikipedia.org/wiki/Email#Internet_Message_Format}.  The Date and Time
##' formating cover only a subset of the specification in that RFC.
##'
##' Here, we use it to provide a single format each for datetimes
##' and dates.  We return datetime object formatted as
##' \sQuote{Thu, 01 Sep 2016 10:11:12.123456 -0500}
##' and date object as \sQuote{Thu, 01 Sep 2016}.
##'
##' @section RFC 3339:
##' RFC 3339 is described in some detail in \url{https://tools.ietf.org/html/rfc3339}
##' It refines both earlier standards.
##'
##' Here, we use it to format datetimes and dates as single and compact strings.
##' We return datetime object formatted as \sQuote{2016-09-01T10:11:12.123456-0500}
##' and date object as \sQuote{2016-09-01}.
##'
##' @section YYYYMMDD:
##' This is a truly terrible format which needs to die, but refuses to do so.  If you
##' are unfortunate enough to be forced to interoperate with code expecting it, you
##' can use this function. But it would be better to take a moment to rewrite such code.
##'
##' @param pt A \code{POSIXt} Datetime or a \code{Date} object
##'
##' @return A character object formatted according to ISO 8601, RFC 2822 or RFC 3339
##' @author Dirk Eddelbuettel
##' @references \url{https://en.wikipedia.org/wiki/ISO_8601},
##' \url{https://www.ietf.org/rfc/rfc2822.txt},
##' \url{https://en.wikipedia.org/wiki/Email#Internet_Message_Format},
##' \url{https://tools.ietf.org/html/rfc3339}
##' @examples
##' iso8601(anytime("2016-09-01 10:11:12.123456"))
##' iso8601(anydate("2016-Sep-01"))
##'
##' rfc2822(anytime("2016-09-01 10:11:12.123456"))
##' rfc2822(anydate("2016-Sep-01"))
##'
##' rfc3339(anytime("2016-09-01 10:11:12.123456"))
##' rfc3339(anydate("2016-Sep-01"))
##'
##' yyyymmdd(anytime("2016-09-01 10:11:12.123456"))
##' yyyymmdd(anydate("2016-Sep-01"))
iso8601 <- function(pt) {
    if (inherits(pt, "POSIXt")) {
        ## allow option to be set to return TRUE but default to FALSE
        if (getOption("anytime.oldISO8601format", FALSE)) {
            ## old format used up to release 0.3.3
            return(format.POSIXct(as.POSIXct(pt), "%Y-%m-%d %H:%M:%S"))
        } else {
            ## new format used from release 0.3.4
            return(format.POSIXct(as.POSIXct(pt), "%Y-%m-%dT%H:%M:%S"))
        }
    } else if (inherits(pt, "Date")) {
        return(format.Date(pt, "%Y-%m-%d"))
    }

    warning("Inapplicable object: ", pt)
    invisible(NULL)
}

##' @rdname iso8601
rfc2822 <- function(pt) {
    if (inherits(pt, "POSIXt"))
        return(format.POSIXct(pt, "%a, %d %b %Y %H:%M:%OS %z"))
    else if (inherits(pt, "Date"))
        return(format.Date(pt, "%a, %d %b %Y"))

    warning("Inapplicable object: ", pt)
    invisible(NULL)
}

##' @rdname iso8601
rfc3339 <- function(pt) {
    if (inherits(pt, "POSIXt"))
        return(format.POSIXct(pt, "%Y-%m-%dT%H:%M:%OS%z"))
    else if (inherits(pt, "Date"))
        return(format.Date(pt, "%Y-%m-%d"))

    warning("Inapplicable object: ", pt)
    invisible(NULL)
}


##' @rdname iso8601
yyyymmdd <- function(pt) {
    return(format.Date(assertDate(pt), "%Y%m%d"))
}
