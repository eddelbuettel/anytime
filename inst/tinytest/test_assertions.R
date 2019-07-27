tz <- "America/Chicago"
Sys.setenv("TZ"=tz)
library(anytime)
anytime:::setTZ(tz)

expect_equal(class(assertDate(c("2001/02/03", "2001-02-03", "20010203"))),
             "Date")

expect_equal(class(assertTime(c("2001/02/03 04:05:06", "2001-02-03  04:05:06", "20010203 040506"))),
             c("POSIXct", "POSIXt"))
