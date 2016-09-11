
options(digits.secs=6)

library(anytime)

## Dates: Integer
anytime(20160101L + 0:2)

## Dates: Numeric
anytime(20160101 + 0:2)

## Dates: Factor
anytime(as.factor(20160101 + 0:2))

## Dates: Ordered
anytime(as.ordered(20160101 + 0:2))

## Dates: Character
anytime(as.character(20160101 + 0:2))

## Dates: alternate formats
anytime(c("20160101", "2016/01/02", "2016-01-03"))

## Datetime: ISO with/without fractional seconds
anytime(c("2016-01-01 10:11:12", "2016-01-01 10:11:12.345678"))

## Datetime: ISO alternate (?) with 'T' separator
anytime(c("20160101T101112", "20160101T101112.345678"))

## Datetime: textual month formats
anytime(c("2016-Sep-01 10:11:12", "Sep/01/2016 10:11:12", "Sep-01-2016 10:11:12"))

## Datetime: Mixed format (cf http://stackoverflow.com/questions/39259184)
anytime(c("Thu Sep 01 10:11:12 2016", "Thu Sep 01 10:11:12.345678 2016"))

## Datetime: pre/post DST
anytime(c("2016-01-31 12:13:14", "2016-08-31 12:13:14"))
anytime(c("2016-01-31 12:13:14", "2016-08-31 12:13:14"), tz="UTC")  # important: catches change

