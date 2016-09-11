
library(anytime)

input <- "2016-09-01 10:11:12"

tz <- "America/Chicago"
output <- format(as.POSIXct(input, tz=tz), tz=tz)
stopifnot(format(anytime(input)) == output)

tz <- "Europe/Berlin"
output <- format(as.POSIXct(input, tz=tz), tz=tz)
stopifnot(format(anytime(input)) == output)

tz <- "Japan"
output <- format(as.POSIXct(input, tz=tz), tz=tz)
stopifnot(format(anytime(input)) == output)
