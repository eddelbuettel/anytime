## See discussion in #84 -- this is more likely an issue with Europe/London
##
## si <- sessionInfo()
## if (!grepl("Fedora", si$running, ignore.case=TRUE)) {
##     expected <- "2018-10-01"
##     stopifnot(expected == format(anytime::utctime("2018-10", tz = "UTC")))
##     stopifnot(expected == format(anytime::utctime("2018-10-01", tz = "UTC")))
##     stopifnot(expected == format(anytime::utctime("2018-10-01 00", tz = "UTC")))
##     stopifnot(expected == format(anytime::utctime("2018-10-01 00:00", tz = "UTC")))
##     stopifnot(expected == format(anytime::utctime("2018-10-01 00:00:00", tz = "UTC")))
## }

Sys.setenv(TZ = "UTC")
library(anytime)

x <- c("2016-01-01 00:00", "2016-10-01 00:00",
       "2016-12-09 00:00", "2016-12-09 10:00")
anytime::utctime(x, tz = "UTC")
anytime::utctime(x, tz = "UTC", useR=TRUE)

Sys.setenv(TZ = "UTC")
x <- c("2016-07-01 00:00", "2016-07-01 00:00",
       "2016-12-09 00:00", "2016-12-09 10:00")
anytime::utctime(x, tz = "UTC")
anytime::utctime(x, tz = "UTC", useR=TRUE)

Sys.setenv(TZ = "Australia/Melbourne")
x <- c("2016-01-01 00:00", "2016-10-01 00:00",
       "2016-12-09 00:00", "2016-12-09 10:00")
anytime::utctime(x, tz = "UTC")
anytime::utctime(x, tz = "UTC", useR=TRUE)
