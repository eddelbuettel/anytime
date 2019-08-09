
tz <- "Japan"
Sys.setenv("TZ"=tz)
library(anytime)
anytime:::setTZ(tz)

isWindows <- Sys.info()[["sysname"]] == "Windows"
isRelease <- length(unclass(utils::packageVersion("anytime"))[[1]]) == 3
## Explicit test for (at least) two of the machines at rhub which fail this
## (also see file test_all_formats.R) -- this should never be false as
## parsing plain ISO 8601 cannot go wrong. But does on those two (at least)
inp <- "2001-02-03 04:05:06"
isStupid <- as.POSIXct(inp) != anytime(inp)

input <- "2019-07-05 09:37:58"

n1 <- as.numeric(anytime(input, useR = TRUE))
n2 <- as.numeric(anytime(input))
n3 <- as.numeric(as.POSIXct(input))

if (!isWindows && !isRelease && !isStupid) {
    expect_equal(n1, n2)
    expect_equal(n1, n3)
    expect_equal(n2, n3)
}
