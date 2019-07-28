
tz <- "America/Chicago"
Sys.setenv("TZ"=tz)
library(anytime)
anytime:::setTZ(tz)

isWindows <- Sys.info()[["sysname"]] == "Windows"
isRelease <- length(unclass(utils::packageVersion("anytime"))[[1]]) == 3

input <- "2001-02-03 04:05:06"

if (!isWindows && !isRelease) {
    expect_equal(anytime(input), anytime(input, useR=TRUE))
    expect_equal(anydate(input), anydate(input, useR=TRUE))
    expect_equal(utctime(input), utctime(input, useR=TRUE))
    expect_equal(utcdate(input), utcdate(input, useR=TRUE))
}
