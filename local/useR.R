

tz <- "UTC"
Sys.setenv("TZ"=tz)
library(anytime)
anytime:::setTZ(tz)

input <- "2001-02-03 04:05:06"

expect_equal <- function(a, b) {
    cat(sprintf("%20s - %20s | %12.0f - %12.0f\n", format(a), format(b), as.numeric(a), as.numeric(b)))
}

expect_equal(anytime(input), anytime(input, useR=TRUE))
expect_equal(anydate(input), anydate(input, useR=TRUE))
expect_equal(utctime(input), utctime(input, useR=TRUE))
expect_equal(utcdate(input), utcdate(input, useR=TRUE))
