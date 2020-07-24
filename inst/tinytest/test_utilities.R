
tz <- "America/Chicago"
Sys.setenv("TZ"=tz)
library(anytime)
anytime:::setTZ(tz)

input <- "2016-09-01 10:11:12"
s <- anytime(input)

anytime:::setDebug(TRUE)
anytime:::setDebug(FALSE)

anytime:::testOutput("%Y-%b-%d", "2016-Sep-09")
anytime:::testOutput("%Y-%b-%d %H:%M:%S", "2016-Sep-09 10:11:12")

anytime:::testFormat("%Y", "2016-09-01") # ISO format

f1 <- getFormats()
addFormats("%Y")
f2 <- getFormats()
removeFormats("%Y")
f3 <- getFormats()
expect_true(identical(f1, f3))
expect_false(identical(f1, f2))

#anytime:::setTZ("America/Chicago")
#expect_equal(anytime:::format(s), "2016-09-01 10:11:12")

## to trigger these two helpers: need two as it "exits early"
expect_false(anytime:::.isDebian() && anytime:::.isUbuntu())
expect_false(anytime:::.isUbuntu() && anytime:::.isDebian())
