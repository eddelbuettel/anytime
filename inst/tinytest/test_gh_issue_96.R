
isWindows <- Sys.info()[["sysname"]] == "Windows"

input <- "2019-07-05 09:37:58"

Sys.setenv("TZ"="Japan")

library(anytime)

n1 <- as.numeric(anytime(input, useR = TRUE))
n2 <- as.numeric(anytime(input))
n3 <- as.numeric(as.POSIXct(input))

if (!isWindows) expect_equal(n1, n2)
if (!isWindows) expect_equal(n1, n3)
if (!isWindows) expect_equal(n2, n3)
