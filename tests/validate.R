
library(anytime)

input <- "2016-09-01 10:11:12"

tz <- "America/Chicago"
output <- format(as.POSIXct(input, tz=tz), tz=tz)
#stopifnot(format(anytime(input)) == output)
cat(format(anytime(input)), output, "\n")

tz <- "Europe/Berlin"
output <- format(as.POSIXct(input, tz=tz), tz=tz)
#stopifnot(format(anytime(input)) == output)
cat(format(anytime(input)), output, "\n")

tz <- "Japan"
output <- format(as.POSIXct(input, tz=tz), tz=tz)
#stopifnot(format(anytime(input)) == output)
cat(format(anytime(input)), output, "\n")
