##' Converts its input to type \code{Date} (or \code{POSIXct}), and asserts
##' that the content is in fact of suitable type by checking for remaining
##' \code{NA}
##'
##' Note that these functions \emph{just check for \code{NA}} and cannot
##' check for semantic correctness.
##' @title Convert to Date (or POSIXct) and assert successful conversion
##' @param x An input object suitable for \code{anydate} or \code{anytime}
##' @return A vector of \code{Date} or \code{POSIXct} objects. As a side
##' effect, an error ##' will be thrown in any of the input was not convertible.
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
