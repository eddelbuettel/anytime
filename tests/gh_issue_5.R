
notOnWindows <-  (Sys.info()[["sysname"]] != "Windows")

Sys.setenv("TZ"="Australia/Sydney")
library(anytime)
refD <- as.Date("2015-01-01")
refT <- as.POSIXct(as.POSIXlt("2015-01-01"))
stopifnot(refD == anydate(20150101))
stopifnot(refD == anydate("2015/01/01"))
if (notOnWindows) stopifnot(refT == anytime(20150101, oldHeuristic=TRUE))
if (notOnWindows) stopifnot(refT == anytime("2015/01/01"))
stopifnot(refD == anydate("2015/01/01", tz="CET"))
stopifnot(refD == anydate("2015/01/01", tz="Australia/Sydney"))
