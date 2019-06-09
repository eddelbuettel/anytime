isSolaris <- Sys.info()[["sysname"]] == "SunOS"
isWindows <- Sys.info()[["sysname"]] == "Windows"

## We turn off tests on Solaris with some regret, yet firmly, as the
## combined inability of CRAN to provide us a test platform (to
## examine test failures) along with the insistence on running these
## tests gives us no choice
## Ditto for Windoze
if (!isSolaris && !isWindows) {

    options(digits.secs=6, width=70)

    tz <- "UTC"
    Sys.setenv("TZ"=tz)

    library(anytime)
    anytime:::setTZ(tz)

    ref <- format(as.POSIXct(c("2016-09-01 10:11:12", "2016-09-01 10:11:12.345678")))
    expect_equal(ref, format(anytime(c("2016-09-01 10:11:12", "2016-09-01 10:11:12.345678"))))
    expect_equal(ref, format(anytime(c("2016-09-01 101112",   "2016-09-01 101112.345678"))))
    expect_equal(ref, format(anytime(c("2016/09/01 10:11:12", "2016/09/01 10:11:12.345678"))))
    expect_equal(ref, format(anytime(c("20160901 101112",     "20160901 101112.345678"))))
    expect_equal(ref, format(anytime(c("20160901 10:11:12",   "20160901 10:11:12.345678"))))
    expect_equal(ref, format(anytime(c("09/01/2016 10:11:12", "09/01/2016 10:11:12.345678"))))
    expect_equal(ref, format(anytime(c("09-01-2016 10:11:12", "09-01-2016 10:11:12.345678"))))
    ## anytime(c("01.09.2016 10:11:12", "01.09.2016 10:11:12.345678")) # European format gets confused with m/d/y

    expect_equal(ref, format(anytime(c("2016-Sep-01 10:11:12", "2016-Sep-01 10:11:12.345678"))))
    expect_equal(ref, format(anytime(c("2016/Sep/01 10:11:12", "2016/Sep/01 10:11:12.345678"))))
    expect_equal(ref, format(anytime(c("2016Sep01 101112",     "2016Sep01 101112.345678"))))
    expect_equal(ref, format(anytime(c("2016Sep01 10:11:12",   "2016Sep01 10:11:12.345678"))))
    expect_equal(ref, format(anytime(c("Sep/01/2016 10:11:12", "Sep/01/2016 10:11:12.345678"))))
    expect_equal(ref, format(anytime(c("Sep-01-2016 10:11:12", "Sep-01-2016 10:11:12.345678"))))

    expect_equal(ref, format(anytime(c("01.Sep.2016 10:11:12", "01.Sep.2016 10:11:12.345678"))))
    expect_equal(ref, format(anytime(c("01Sep2016 101112",     "01Sep2016 101112.345678"))))
    expect_equal(ref, format(anytime(c("01Sep2016 10:11:12",   "01Sep2016 10:11:12.345678"))))
    expect_equal(ref, format(anytime(c("01-Sep-2016 101112",   "01-Sep-2016 101112.345678"))))
    expect_equal(ref, format(anytime(c("01-Sep-2016 10:11:12", "01-Sep-2016 10:11:12.345678"))))

    expect_equal(ref, format(anytime(c("2016-September-01 10:11:12", "2016-September-01 10:11:12.345678"))))
    expect_equal(ref, format(anytime(c("2016/September/01 10:11:12", "2016/September/01 10:11:12.345678"))))
    expect_equal(ref, format(anytime(c("2016September01 101112",     "2016September01 101112.345678"))))
    expect_equal(ref, format(anytime(c("2016September01 10:11:12",   "2016September01 10:11:12.345678"))))
    expect_equal(ref, format(anytime(c("September/01/2016 10:11:12", "September/01/2016 10:11:12.345678"))))
    expect_equal(ref, format(anytime(c("September-01-2016 10:11:12", "September-01-2016 10:11:12.345678"))))
    expect_equal(ref, format(anytime(c("01.September.2016 10:11:12", "01.September.2016 10:11:12.345678"))))

    expect_equal(ref, format(anytime(c("Thu Sep 01 10:11:12 2016", "Thu Sep 01 10:11:12.345678 2016"))))

    expect_equal(ref, format(anytime(c("Thu 01 Sep 2016 10:11:12", "Thu 01 Sep 2016 10:11:12.345678"))))

    expect_equal(ref, format(anytime(c("2016-09-01T10:11:12 -05:00", "2016-09-01T10:11:12.345678-05:00"))))
    expect_equal(ref, format(anytime(c("2016-09-01T10:11:12 -0500",  "2016-09-01T10:11:12.345678-0500"))))
    expect_equal(ref, format(anytime(c("2016-09-01T10:11:12 CDT",   "2016-09-01T10:11:12.345678 CDT"))))

    expect_equal(ref, format(anytime(c("Thu Sep 01 10:11:12 CDT 2016", "Thu Sep 01 10:11:12.345678 CDT 2016"))))


    ref <- format(rep(as.Date("2016-09-01"), 4))
    expect_equal(ref, format(anytime(c("2016-09-01", "20160901", "09/01/2016", "09-01-2016"))))

    expect_equal(ref, format(anytime(c("2016-Sep-01", "2016Sep01", "Sep/01/2016", "Sep-01-2016"))))

    expect_equal(ref[1:2], format(anytime(c("01SEP2016", "01-Sep-2016"))))

    expect_equal(ref, format(anytime(c("2016-September-01", "2016September01", "September/01/2016", "September-01-2016"))))


    ## special case of non-finite NA reals
    anytime(c(NA, NaN, Inf, as.numeric(as.POSIXct("2016-09-01 10:11:12"))))

                                        #cat("\n")                               # special case of no separators
    anytime(c("20160911", "20160911 1011", "20160911 101112", "20160911 101112.345678"))

    cat("\n")
    anytime("NA") 			# String NA
    anytime(Sys.time())                 # POSIXt pass-through
    utctime(Sys.time())                 # POSIXt pass-through (doesn't do anything different for numeric input)
    anydate(Sys.Date())			# Date pass-through
    utcdate(Sys.Date())                 # Date pass-through
    anytime(Sys.Date())                 # oddball
    utctime(Sys.Date())                 # oddball, same result, tz does not enter

    anydate(20160901)
    utcdate(20160901)

    #cat("Next call will tickle exception\n")
    expect_error(anytime(TRUE))		# tickles unsupported type -- and exception, hence try()
}
