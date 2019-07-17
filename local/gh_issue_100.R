library(anytime)

## show effect of tz argument
anytime("2001-02-03 04:05:06")
## adjust parsed time to given TZ argument
anytime("2001-02-03 04:05:06", tz="America/Los_Angeles")
## somewhat equvalent base R functionality
format(anytime("2001-02-03 04:05:06"), tz="America/Los_Angeles")


## show effect of tz argument
anytime("2001-02-03 04:05:06", useR=TRUE)
## adjust parsed time to given TZ argument
anytime("2001-02-03 04:05:06", useR=TRUE, tz="America/Los_Angeles")
## somewhat equvalent base R functionality
format(anytime("2001-02-03 04:05:06", useR=TRUE), tz="America/Los_Angeles")
