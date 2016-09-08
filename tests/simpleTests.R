
Sys.setenv(TZ=Sys.timezone())
options(digits.secs=6)

library(anytime)

## Dates: Integer
anytime(20160101L + 0:2)

## Dates: Numeric
anytime(20160101 + 0:2)

## Dates: Character
anytime(as.character(20160101 + 0:2))

## Dates: alternate formats
anytime(c("20160101", "2016/01/02", "2016-01-03"))

## Datetime: ISO
anytime("2016-01-01 10:11:12")          # ISO
anytime("2016-01-01 10:11:12.345678")   # ISO

## Datetime: compact (crazy)
anytime("20160101T101112")              # crazy-er
anytime("20160101T101112.345678")       # works with fractional seconds

## Datetime: pre/post DST
anytime(c("2016-01-31 12:13:14", "2016-08-31 12:13:14"))
anytime(c("2016-01-31 12:13:14", "2016-08-31 12:13:14"), tz="UTC")
