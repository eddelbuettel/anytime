
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

.pkgenv <- new.env(parent = emptyenv())

.onLoad <- function(libname, pkgname) { 	#nocov start

    ## -- Task one: set a timezone value
    tz <- NULL

    ## Sys.timezone() queries enviroment variable TZ
    ## as well as per-OS system files where available
    tz <- Sys.timezone()

    ## if this didn't work (we had a case with a bad
    ## /etc/localtime) and if gettz is available, use it
    if (!isTRUE(nzchar(tz)) || is.na(tz)) {
        if (requireNamespace("gettz", quietly=TRUE)) {
            tz <- gettz::gettz()
        }
    }

    ## if there is still nothing, use UTC
    if (!isTRUE(nzchar(tz)) || is.na(tz) || is.null(tz)) {
        warning("No TZ information found. Falling back to UTC.")
        tz <- "UTC"
    }

    assign("tz", tz, envir=.pkgenv)



    ## -- Task two: see if we are inside RStudio
    isRStudio <- FALSE

    if (Sys.getenv("RSTUDIO", unset="0") == "1") {
        isRStudio <- TRUE
    }

    assign("isRStudio", isRStudio, envir=.pkgenv)

}						#nocov end
