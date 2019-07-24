## anytime: Use Boost Date_Time to convert date(time) data to POSIXt
##
## Copyright (C) 2017 - 2019  Dirk Eddelbuettel
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

##' Converts its input to type \code{Date} (or \code{POSIXct}), and asserts
##' that the content is in fact of suitable type by checking for remaining
##' \code{NA}
##'
##' Note that these functions \emph{just check for \code{NA}} and cannot
##' check for semantic correctness.
##' @title Convert to Date (or POSIXct) and assert successful conversion
##' @param x An input object suitable for \code{anydate} or \code{anytime}
##' @return A vector of \code{Date} or \code{POSIXct} objects. As a side
##' effect, an error will be thrown in any of the input was not convertible.
##' @author Dirk Eddelbuettel
##' @examples
##' assertDate(c("2001/02/03", "2001-02-03", "20010203"))
##' assertTime(c("2001/02/03 04:05:06", "2001-02-03  04:05:06", "20010203 040506"))
assertDate <- function(x) {
    y <- anydate(x)
    if (any(is.na(y)))
        stop("Input data '", paste(as.character(head(x)),collapse=","),  #nocov
             "' cannot be expressed as Date type", call.=FALSE)          #nocov
    invisible(y)
}

##' @rdname assertDate
assertTime <- function(x) {
    y <- anytime(x)
    if (any(is.na(y)))
        stop("Input data '", paste(as.character(head(x)),collapse=","),  #nocov
             "' cannot be expressed as POSIXct type", call.=FALSE)       #nocov
    invisible(y)
}
