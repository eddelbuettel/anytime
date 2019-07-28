
tz <- "Japan"
Sys.setenv("TZ"=tz)
library(anytime)
anytime:::setTZ(tz)

isWindows <- Sys.info()[["sysname"]] == "Windows"
isRelease <- length(unclass(utils::packageVersion("anytime"))[[1]]) == 3

input <- "2019-07-05 09:37:58"

n1 <- as.numeric(anytime(input, useR = TRUE))
n2 <- as.numeric(anytime(input))
n3 <- as.numeric(as.POSIXct(input))

if (!isWindows && !isRelease) {
    expect_equal(n1, n2)
    expect_equal(n1, n3)
    expect_equal(n2, n3)
}
