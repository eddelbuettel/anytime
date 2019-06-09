
library(anytime)

isWindows <- Sys.info()[["sysname"]] == "Windows"

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

anytime:::setTZ("America/Chicago")

if (!isWindows) expect_equal(anytime:::format(s), "2016-09-01 10:11:12.000000")
