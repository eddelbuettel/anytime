
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

    library(anytime)

    options(digits.secs=6)
    oldtz <- anytime:::getTZ()
    anytime:::setTZ("America/Chicago")

    refT <- as.POSIXct(as.POSIXlt(format(as.Date("2016-01-01")+0:2)))
    attr(refT, "tzone") <- NULL  # to suppress a warning
    refD <- as.Date("2016-01-01")+0:2

    ## Dates: Integer
    expect_equivalent(refD, anydate(20160101L + 0:2))
    if (!isWindows) expect_equivalent(refT, anytime(20160101L + 0:2, oldHeuristic=TRUE))

    ## Dates: Numeric
    expect_equivalent(refD, anydate(20160101 + 0:2))
    if (!isWindows) expect_equivalent(refT, anytime(20160101 + 0:2, oldHeuristic=TRUE))

    ## Dates: Factor
    expect_equivalent(refD, anydate(as.factor(20160101 + 0:2)))
    expect_equivalent(refT, anytime(as.factor(20160101 + 0:2)))

    ## Dates: Ordered
    expect_equivalent(refD, anydate(as.ordered(20160101 + 0:2)))
    expect_equivalent(refT, anytime(as.ordered(20160101 + 0:2)))

    ## Dates: Character
    expect_equivalent(refD, anydate(as.character(20160101 + 0:2)))
    expect_equivalent(refT, anytime(as.character(20160101 + 0:2)))

    ## Dates: alternate formats
    expect_equivalent(refD, anydate(c("20160101", "2016/01/02", "2016-01-03")))
    expect_equivalent(refT, anytime(c("20160101", "2016/01/02", "2016-01-03")))

    ## Datetime: ISO with/without fractional seconds
    refPt <- as.POSIXct(c("2016-01-01 10:11:12", "2016-01-01 10:11:12.345678"))
    expect_equivalent(refPt, anytime(c("2016-01-01 10:11:12", "2016-01-01 10:11:12.345678")))

    ## Datetime: ISO alternate (?) with 'T' separator
    ## Only works with ' '
    expect_equivalent(refPt, anytime(c("20160101 101112", "20160101 101112.345678")))

    ## Datetime: textual month formats
    ref3 <- rep(as.POSIXct("2016-09-01 10:11:12"), 3)
    expect_equivalent(ref3,
                      anytime(c("2016-Sep-01 10:11:12", "Sep/01/2016 10:11:12",
                                "Sep-01-2016 10:11:12")))

    ## Datetime: Mixed format (cf http://stackoverflow.com/questions/39259184)
    expect_equivalent(refPt,
                      anytime(c("Thu Jan 01 10:11:12 2016", "Thu Jan 01 10:11:12.345678 2016")))

    ## Datetime: pre/post DST
    anytime(c("2016-01-31 12:13:14", "2016-08-31 12:13:14"))
    anytime(c("2016-01-31 12:13:14", "2016-08-31 12:13:14"), tz="UTC")  # important: catches change

    ## Datetime: factor and ordered (#44)
    refD <- as.Date("2016-09-01")
    expect_true(refD == anydate(as.factor("2016-09-01")))
    expect_true(refD == anydate(as.ordered("2016-09-01")))
    expect_true(refD == utcdate(as.factor("2016-09-01")))
    expect_true(refD == utcdate(as.ordered("2016-09-01")))

    iso8601(anytime("2016-Sep-01 10:11:12"))
    iso8601(anydate("2016-Sep-01"))
    ignore(expect_warning)(iso8601("this won't work"))

    rfc2822(anytime("2016-Sep-01 10:11:12"))
    rfc2822(anydate("2016-Sep-01"))
    ignore(expect_warning)(rfc2822("this won't work"))

    rfc3339(anytime("2016-Sep-01 10:11:12"))
    rfc3339(anydate("2016-Sep-01"))
    ignore(expect_warning)(rfc3339("this won't work"))

    ## Datetime from (integer) Datetime
    expect_equivalent(anytime( as.integer(refT) ), refT)

    ## Date from (smaller) numeric
    expect_equivalent(anydate( as.numeric(refD) ), refD)
    expect_equivalent(anytime( as.numeric(refT) ), refT)

    ## Date from (smaller) integer
    epochplusone <- as.Date("1971-01-01") + 0:2
    expect_equivalent(anydate(365L + 0:2), epochplusone)

    ## Format test
    expect_true(yyyymmdd(refD) == format(refD, "%Y%m%d"))

    ## Date from POSIXct
    #expect_true(anydate(refT) == as.Date(refT))
    #expect_true(utcdate(refT) == as.Date(refT))

    anytime:::setTZ(oldtz)
}
