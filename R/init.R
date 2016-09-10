
.pkgenv <- new.env(parent = emptyenv())

.onLoad <- function(libname, pkgname) {

    tz <- NULL

    ## Sys.timezone() queries enviroment variable TZ
    ## as well as per-OS system files where available
    tz <- Sys.timezone()

    ## if this didn't work (we had a case with a bad
    ## /etc/localtime) and if gettz is available, use it
    if (!isTRUE(nzchar(tz))) {
        if (requireNamespace("gettz", quietly=TRUE)) {
            tz <- gettz::gettz()
        }
    }

    ## if there is still nothing, use UTC
    if (!isTRUE(nzchar(tz))) {
        warning("No TZ information found. Falling back to UTC.")
        tz <- "UTC"
    }

    assign("tz", tz, envir=.pkgenv)

}
