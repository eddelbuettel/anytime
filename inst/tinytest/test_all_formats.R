#tz <- "America/Chicago"
#Sys.setenv("TZ"=tz)
library(anytime)
#anytime:::setTZ(tz)

isSolaris <- Sys.info()[["sysname"]] == "SunOS"
isWindows <- Sys.info()[["sysname"]] == "Windows"
isRelease <- length(unclass(utils::packageVersion("anytime"))[[1]]) == 3

## We turn off tests on Solaris with some regret, yet firmly, as the
## combined inability of CRAN to provide us a test platform (to
## examine test failures) along with the insistence on running these
## tests gives us no choice

## We also simplify somewhat by computing the reference solution 'ref'
## directly from anytime() or anydate() -- there are two machines on
## rhub which would not otherwise pass no matter what we tried.  They
## may lack zoneinfo or something else that is basic and expect.

ref <- anytime("2016-09-01 10:11:12")

if (isSolaris || isWindows || isRelease) exit_file("Skipping Solaris or Windows or Release")

options(digits.secs=6, width=70)

##ref <- format(as.POSIXct(c("2016-09-01 10:11:12", "2016-09-01 10:11:12.345678")))
##expect_equal(ref, format(anytime(c("2016-09-01 10:11:12", "2016-09-01 10:11:12.345678"))))
ref <- anytime("2016-09-01 10:11:12")
expect_equal(ref, anytime("2016-09-01 101112"))
expect_equal(ref, anytime("2016/09/01 10:11:12"))
expect_equal(ref, anytime("20160901 101112"))
expect_equal(ref, anytime("20160901 10:11:12"))
expect_equal(ref, anytime("09/01/2016 10:11:12"))
expect_equal(ref, anytime("09-01-2016 10:11:12"))
#expect_equal(ref, anytime("01.09.2016 10:11:12"))
expect_equal(ref, anytime("2016-Sep-01 10:11:12"))
expect_equal(ref, anytime("2016/Sep/01 10:11:12"))
expect_equal(ref, anytime("2016Sep01 101112"))
expect_equal(ref, anytime("2016Sep01 10:11:12"))
expect_equal(ref, anytime("Sep/01/2016 10:11:12"))
expect_equal(ref, anytime("Sep-01-2016 10:11:12"))
expect_equal(ref, anytime("2016-Sep-01 10:11:12"))
expect_equal(ref, anytime("2016/Sep/01 10:11:12"))
expect_equal(ref, anytime("2016Sep01 101112"))
expect_equal(ref, anytime("2016Sep01 10:11:12"))
expect_equal(ref, anytime("Sep/01/2016 10:11:12"))
expect_equal(ref, anytime("Sep-01-2016 10:11:12"))
expect_equal(ref, anytime("2016-September-01 10:11:12"))
expect_equal(ref, anytime("2016/September/01 10:11:12"))
expect_equal(ref, anytime("2016September01 101112"))
expect_equal(ref, anytime("2016September01 10:11:12"))
expect_equal(ref, anytime("September/01/2016 10:11:12"))
expect_equal(ref, anytime("September-01-2016 10:11:12"))
expect_equal(ref, anytime("01.September.2016 10:11:12"))
expect_equal(ref, anytime("Thu Sep 01 10:11:12 2016"))
expect_equal(ref, anytime("Thu 01 Sep 2016 10:11:12"))
expect_equal(ref, anytime("2016-09-01T10:11:12 -05:00"))
expect_equal(ref, anytime("2016-09-01T10:11:12 -0500"))
expect_equal(ref, anytime("2016-09-01T10:11:12 CDT"))
expect_equal(ref, anytime("Thu Sep 01 10:11:12 CDT 2016"))


ref <- anytime("2016-09-01 10:11:12.345678")
expect_equal(ref, anytime("2016-09-01 101112.345678"))
expect_equal(ref, anytime("2016/09/01 10:11:12.345678"))
expect_equal(ref, anytime("20160901 101112.345678"))
expect_equal(ref, anytime("20160901 10:11:12.345678"))
expect_equal(ref, anytime("09/01/2016 10:11:12.345678"))
expect_equal(ref, anytime("09-01-2016 10:11:12.345678"))
#expect_equal(ref, anytime("01.09.2016 10:11:12.345678"))
expect_equal(ref, anytime("2016-Sep-01 10:11:12.345678"))
expect_equal(ref, anytime("2016/Sep/01 10:11:12.345678"))
expect_equal(ref, anytime("2016Sep01 101112.345678"))
expect_equal(ref, anytime("2016Sep01 10:11:12.345678"))
expect_equal(ref, anytime("Sep/01/2016 10:11:12.345678"))
expect_equal(ref, anytime("Sep-01-2016 10:11:12.345678"))
expect_equal(ref, anytime("2016-Sep-01 10:11:12.345678"))
expect_equal(ref, anytime("2016/Sep/01 10:11:12.345678"))
expect_equal(ref, anytime("2016Sep01 101112.345678"))
expect_equal(ref, anytime("2016Sep01 10:11:12.345678"))
expect_equal(ref, anytime("Sep/01/2016 10:11:12.345678"))
expect_equal(ref, anytime("Sep-01-2016 10:11:12.345678"))
expect_equal(ref, anytime("2016-September-01 10:11:12.345678"))
expect_equal(ref, anytime("2016/September/01 10:11:12.345678"))
expect_equal(ref, anytime("2016September01 101112.345678"))
expect_equal(ref, anytime("2016September01 10:11:12.345678"))
expect_equal(ref, anytime("September/01/2016 10:11:12.345678"))
expect_equal(ref, anytime("September-01-2016 10:11:12.345678"))
expect_equal(ref, anytime("01.September.2016 10:11:12.345678"))
expect_equal(ref, anytime("Thu Sep 01 10:11:12.345678 2016"))
expect_equal(ref, anytime("Thu 01 Sep 2016 10:11:12.345678"))
expect_equal(ref, anytime("2016-09-01T10:11:12.345678-05:00"))
expect_equal(ref, anytime("2016-09-01T10:11:12.345678-0500"))
expect_equal(ref, anytime("2016-09-01T10:11:12.345678 CDT"))
expect_equal(ref, anytime("Thu Sep 01 10:11:12.345678 CDT 2016"))


ref <- anytime("2016-09-01")
expect_equal(ref, anytime("2016-09-01"))
expect_equal(ref, anytime("20160901"))
expect_equal(ref, anytime("09/01/2016"))
expect_equal(ref, anytime("09-01-2016"))
expect_equal(ref, anytime("2016-Sep-01"))
expect_equal(ref, anytime("2016Sep01"))
expect_equal(ref, anytime("Sep/01/2016"))
expect_equal(ref, anytime("Sep-01-2016"))
expect_equal(ref, anytime("01SEP2016"))
expect_equal(ref, anytime("01-Sep-2016"))
expect_equal(ref, anytime("2016-September-01"))
expect_equal(ref, anytime("2016September01"))
expect_equal(ref, anytime("September/01/2016"))
expect_equal(ref, anytime("September-01-2016"))

## special case of non-finite NA reals
anytime(c(NA, NaN, Inf, as.numeric(as.POSIXct("2016-09-01 10:11:12"))))

anytime(c("20160911", "20160911 1011", "20160911 101112", "20160911 101112.345678"))

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


expect_equivalent(anydate("1970-01-01 00:00:00", useR=TRUE), anydate(0))
expect_equal(anytime:::fmt(anytime("1970-01-01 00:00:00")), "1970-01-01 00:00:00.000000")

expect_true(inherits(anytime(as.POSIXlt(Sys.time())), "POSIXt"))
expect_true(inherits(anytime(Sys.Date()), "POSIXt"))
expect_equal(class(utcdate(Sys.Date())), "Date")
