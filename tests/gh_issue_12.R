library(anytime)

anydate("1969-01-01")    # crashed on Windows before tm_isdst diable for pre-epoch dates
anydate("1971-02-03")    # fine anywhere

stopifnot(anydate("1969-01-01") == as.Date("1969-01-01"))
stopifnot(anydate("1971-02-03") == as.Date("1971-02-03"))
