
##' @rdname anytime_cpp
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
