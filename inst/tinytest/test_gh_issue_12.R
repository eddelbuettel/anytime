
library(anytime)

anydate("1969-01-01")    # crashed on Windows before tm_isdst diable for pre-epoch dates
anydate("1971-02-03")    # fine anywhere

## test for equivalent instead of equal because of TZ attribute returned by anydate
expect_equivalent(anydate("1969-01-01"), as.Date("1969-01-01"))
expect_equivalent(anydate("1971-02-03"), as.Date("1971-02-03"))
