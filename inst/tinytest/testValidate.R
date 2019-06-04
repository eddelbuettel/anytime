
library(anytime)

input <- "2016-09-01 10:11:12"

tz <- "America/Chicago"
Sys.setenv("TZ"=tz)

output <- format(as.POSIXct(input, tz=tz), tz=tz)
expect_equivalent(format(anytime(input),tz=tz), output)
#cat(format(anytime(input)), output, "\n")

tz <- "Europe/Berlin"
output <- format(as.POSIXct(input, tz=tz), tz=tz)
expect_equivalent(format(anytime(input)), output)
#cat(format(anytime(input)), output, "\n")

tz <- "Japan"
output <- format(as.POSIXct(input, tz=tz), tz=tz)
expect_equivalent(format(anytime(input)), output)
#cat(format(anytime(input)), output, "\n")


## when using UTC parse, and output format, we can we assurred
## a fixed result nomatter where this runs
tz <- "UTC"
output <- format(as.POSIXct(input, tz=tz), tz=tz)
expect_equivalent(format(utctime(input, tz=tz)), output)
#cat(format(utctime(input, tz=tz)), output, "\n")
