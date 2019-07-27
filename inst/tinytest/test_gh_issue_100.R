
tz <- "America/Chicago"
Sys.setenv("TZ"=tz)
library(anytime)
anytime:::setTZ(tz)

## show effect of tz argument
anytime("2001-02-03 04:05:06", tz="America/Chicago")
## adjust parsed time to given TZ argument
anytime("2001-02-03 04:05:06", tz="America/Los_Angeles")
## format to txt
t1 <- format(anytime("2001-02-03 04:05:06", tz="America/Los_Angeles"))
t1
## somewhat equvalent base R functionality
t2 <- format(anytime("2001-02-03 04:05:06"), tz="America/Los_Angeles")
t2

expect_equal(t1, t2)



## show effect of tz argument
anytime("2001-02-03 04:05:06", useR=TRUE, tz="America/Chicago")
## adjust parsed time to given TZ argument
anytime("2001-02-03 04:05:06", useR=TRUE, tz="America/Los_Angeles")
## format to txt
t1 <- format(anytime("2001-02-03 04:05:06", useR=TRUE, tz="America/Los_Angeles"))
t1
## somewhat equvalent base R functionality
t2 <- format(anytime("2001-02-03 04:05:06", useR=TRUE), tz="America/Los_Angeles")
t2

expect_equal(t1, t2)
