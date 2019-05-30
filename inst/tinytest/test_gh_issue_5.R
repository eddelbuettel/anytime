
notOnWindows <-  (Sys.info()[["sysname"]] != "Windows")

Sys.setenv("TZ"="Australia/Sydney")
library(anytime)
refD <- as.Date("2015-01-01")
refT <- as.POSIXct(as.POSIXlt("2015-01-01"))
expect_equivalent(refD, anydate(20150101))
expect_equivalent(refD, anydate("2015/01/01"))
if (notOnWindows) expect_equivalent(refT, anytime(20150101, oldHeuristic=TRUE))
if (notOnWindows) expect_equivalent(refT, anytime("2015/01/01"))
expect_equivalent(refD, anydate("2015/01/01", tz="CET"))
expect_equivalent(refD, anydate("2015/01/01", tz="Australia/Sydney"))
