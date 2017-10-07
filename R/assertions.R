
assertDate <- function(x) {
    y <- anydate(x)
    if (any(is.na(y)))
        stop("Input data '", paste(as.character(head(x)),collapse=","),
             "' cannot be expressed as Date type", call.=FALS)
    invisible(y)
}

assertTime <- function(x) {
    y <- anytime(x)
    if (any(is.na(y)))
        stop("Input data '", paste(as.character(head(x)),collapse=","),
             "' cannot be expressed as POSIXct type", call.=FALSE)
    invisible(y)
}
