
library(anytime)

input <- "2016-09-01 10:11:12"
s <- anytime(input)

anytime:::setDebug(TRUE)
anytime:::setDebug(FALSE)

anytime:::testOutput("%Y-%b-%d", "2016-Sep-09")
anytime:::testOutput("%Y-%b-%d %H:%M:%S", "2016-Sep-09 10:11:12")

anytime:::testFormat("%Y", "2016-09-01") # ISO format

addFormats("%Y")
getFormats()

anytime("NA")
