
library(anytime)

expect_silent(dv <- anydate(integer()))
expect_true(inherits(dv, "Date"))
expect_equal(length(dv), 0L)
expect_equal(dv, as.Date(double(), origin="1970-01-01")) # origin for R < 4.3.0

expect_silent(dv <- anydate(numeric()))
expect_true(inherits(dv, "Date"))
expect_equal(length(dv), 0L)
expect_equal(dv, as.Date(double(), origin="1970-01-01")) # origin for R < 4.3.0

expect_silent(dv <- anytime(integer()))
expect_true(inherits(dv, "POSIXct"))
expect_equal(length(dv), 0L)
expect_equal(dv, as.POSIXct(double(), origin="1970-01-01"))  # origin for R < 4.3.0

expect_silent(dv <- anytime(numeric()))
expect_true(inherits(dv, "POSIXct"))
expect_equal(length(dv), 0L)
expect_equal(dv, as.POSIXct(double(), origin="1970-01-01"))  # origin for R < 4.3.0
