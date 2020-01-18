
library(anytime)

now <- Sys.time()
times <- sample(format(now + 1:10), 1000, replace=TRUE)
expect_equal(anytime(times), anytime(times, calcUnique=TRUE))
expect_equal(utctime(times), utctime(times, calcUnique=TRUE))

today <- Sys.Date()
dates <- sample(format(today + 1:10), 1000, replace=TRUE)
expect_equal(anytime(dates), anytime(dates, calcUnique=TRUE))
expect_equal(utctime(dates), utctime(dates, calcUnique=TRUE))
