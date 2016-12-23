
options(digits.secs=6)

library(anytime)

ref <- as.POSIXct(as.POSIXlt(format(as.Date("2016-01-01")+0:2)))

## Dates: Integer
stopifnot(ref == anytime(20160101L + 0:2))

## Dates: Numeric
stopifnot(ref == anytime(20160101 + 0:2))

## Dates: Factor
stopifnot(ref == anytime(as.factor(20160101 + 0:2)))

## Dates: Ordered
stopifnot(ref == anytime(as.ordered(20160101 + 0:2)))

## Dates: Character
stopifnot(ref == anytime(as.character(20160101 + 0:2)))

## Dates: alternate formats
stopifnot(ref == anytime(c("20160101", "2016/01/02", "2016-01-03")))

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


iso8601(anytime("2016-Sep-01 10:11:12"))
iso8601(anydate("2016-Sep-01"))
iso8601("this won't work")

rfc3339(anytime("2016-Sep-01 10:11:12"))
rfc3339(anydate("2016-Sep-01"))
rfc3339("this won't work")
