
input <- "2019-07-05 09:37:58"

Sys.setenv("TZ"="Japan")

library(anytime)

n1 <- as.numeric(anytime(input, useR = TRUE))
n2 <- as.numeric(anytime(input))
n3 <- as.numeric(as.POSIXct("2019-07-05 09:37:58"))

expect_equal(n1, n2, tol=1.0e-4) # low tolerance needed eg for Windows
expect_equal(n1, n3, tol=1.0e-4)
expect_equal(n2, n3, tol=1.0e-4)
