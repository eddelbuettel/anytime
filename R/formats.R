#' Format a Datatime object according to ISO 8601
#'
#' ISO 8601 is a standard for date and time representation covering the
#' date and time (usually excluding possible fractional seconds)..
#' It is described in TODO
#'
#' @param pt A Datetime object
#'
#' @return A character object
#' @examples
#' iso8601(anytime("2016-09-01 10:11:12.123456"))
#' iso8601(anydate("2016-Sep-01"))
iso8601 <- function(pt) {
    if (inherits(pt, "POSIXt"))
        return(format.POSIXct(as.POSIXct(pt), "%Y-%m-%d %H:%M:%S"))
    else if (inherits(pt, "Date"))
        return(format.Date(pt, "%Y-%m-%d"))


    warning("Inapplicable object: ", pt)
    invisible(NULL)
}

#' Format a Datatime object according to RFC 2822
#'
#' RFC 3339 is a standard for date and time representation covering
#' the weekday, date, time (including possible fractional seconds) and
#' a timezone offset.  It is described in TODO
#'
#' @param pt A Datetime object
#'
#' @return A character object
#' @examples
#' rfc2822(anytime("2016-09-01 10:11:12.123456"))
#' rfc2822(anydate("2016-Sep-01"))
rfc2822 <- function(pt) {
    if (inherits(pt, "POSIXt"))
        return(format.POSIXct(pt, "%a, %d %b %Y %H:%M:%OS %z"))
    else if (inherits(pt, "Date"))
        return(format.Date(pt, "%a, %d %b %Y"))

    warning("Inapplicable object: ", pt)
    invisible(NULL)
}

#' Format a Datatime object according to RFC 3339
#'
#' RFC 3339 is a standard for date and time representation covering the
#' date, time (including possible fractional seconds) and a timezone offset.
#' It is described in TODO
#'
#' @param pt A Datetime object
#'
#' @return A character object
#' @examples
#' rfc3339(anytime("2016-09-01 10:11:12.123456"))
#' rfc3339(anydate("2016-Sep-01"))
rfc3339 <- function(pt) {
    if (inherits(pt, "POSIXt"))
        return(format.POSIXct(pt, "%Y-%m-%dT%H:%M:%OS%z"))
    else if (inherits(pt, "Date"))
        return(format.Date(pt, "%Y-%m-%d"))

    warning("Inapplicable object: ", pt)
    invisible(NULL)
}

