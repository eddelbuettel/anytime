
isSolaris <- Sys.info()[["sysname"]] == "SunOS"
isWindows <- Sys.info()[["sysname"]] == "Windows"

## We turn off tests on Solaris with some regret, yet firmly, as the
## combined inability of CRAN to provide us a test platform (to
## examine test failures) along with the insistence on running these
## tests gives us no choice
##
## These tests now also puke on Windows (where they passed before). I do
## not have a Windows machine.
##
## Anybody who would like to contribute please get in touch.
if (!isSolaris && !isWindows) {

    options(digits.secs=6)

    library(anytime)

    refT <- as.POSIXct(as.POSIXlt(format(as.Date("2016-01-01")+0:2)))
    refD <- as.Date("2016-01-01")+0:2

    ## Dates: Integer
    stopifnot(refD == anydate(20160101L + 0:2))
    stopifnot(refT == anytime(20160101L + 0:2, oldHeuristic=TRUE))

    ## Dates: Numeric
    stopifnot(refD == anydate(20160101 + 0:2))
    stopifnot(refT == anytime(20160101 + 0:2, oldHeuristic=TRUE))

    ## Dates: Factor
    stopifnot(refD == anydate(as.factor(20160101 + 0:2)))
    stopifnot(refT == anytime(as.factor(20160101 + 0:2)))

    ## Dates: Ordered
    stopifnot(refD == anydate(as.ordered(20160101 + 0:2)))
    stopifnot(refT == anytime(as.ordered(20160101 + 0:2)))

    ## Dates: Character
    stopifnot(refD == anydate(as.character(20160101 + 0:2)))
    stopifnot(refT == anytime(as.character(20160101 + 0:2)))

    ## Dates: alternate formats
    stopifnot(refD == anydate(c("20160101", "2016/01/02", "2016-01-03")))
    stopifnot(refT == anytime(c("20160101", "2016/01/02", "2016-01-03")))

    ## Datetime: ISO with/without fractional seconds
    refPt <- format(as.POSIXct(c("2016-01-01 10:11:12", "2016-01-01 10:11:12.345678"),
                               "%Y-%m-%d %H:%M:%0S"))
    stopifnot(refPt == anytime(c("2016-01-01 10:11:12", "2016-01-01 10:11:12.345678")))

    ## Datetime: ISO alternate (?) with 'T' separator
    ## Only works with ' '
    stopifnot(refPt == anytime(c("20160101 101112", "20160101 101112.345678")))

    ## Datetime: textual month formats
    ref3 <- rep(as.POSIXct("2016-09-01 10:11:12"), 3)
    stopifnot(ref3 == anytime(c("2016-Sep-01 10:11:12", "Sep/01/2016 10:11:12", "Sep-01-2016 10:11:12")))

    ## Datetime: Mixed format (cf http://stackoverflow.com/questions/39259184)
    stopifnot(refPt == anytime(c("Thu Jan 01 10:11:12 2016", "Thu Jan 01 10:11:12.345678 2016")))

    ## Datetime: pre/post DST
    anytime(c("2016-01-31 12:13:14", "2016-08-31 12:13:14"))
    anytime(c("2016-01-31 12:13:14", "2016-08-31 12:13:14"), tz="UTC")  # important: catches change

    ## Datetime: factor and ordered (#44)
    refD <- as.Date("2016-09-01")
    stopifnot(refD == anydate(as.factor("2016-09-01")))
    stopifnot(refD == anydate(as.ordered("2016-09-01")))
    stopifnot(refD == utcdate(as.factor("2016-09-01")))
    stopifnot(refD == utcdate(as.ordered("2016-09-01")))

    iso8601(anytime("2016-Sep-01 10:11:12"))
    iso8601(anydate("2016-Sep-01"))
    iso8601("this won't work")

    rfc2822(anytime("2016-Sep-01 10:11:12"))
    rfc2822(anydate("2016-Sep-01"))
    rfc2822("this won't work")

    rfc3339(anytime("2016-Sep-01 10:11:12"))
    rfc3339(anydate("2016-Sep-01"))
    rfc3339("this won't work")

    ## Datetime from (integer) Datetime
    stopifnot(anytime( as.integer(refT) ) == refT)

    ## Date from (smaller) numeric
    stopifnot(anydate( as.numeric(refD) ) == refD)
    stopifnot(anytime( as.numeric(refT) ) == refT)

    ## Date from (smaller) integer
    epochplusone <- as.Date("1971-01-01") + 0:2
    stopifnot(anydate(365L + 0:2) == epochplusone)

    ## Format test
    stopifnot(yyyymmdd(refD) == format(refD, "%Y%m%d"))

    ## Date from POSIXct
    stopifnot(anydate(refT) == as.Date(refT))
    stopifnot(utcdate(refT) == as.Date(refT))
}
