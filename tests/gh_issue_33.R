
library(anytime)

dtchar <- c("01-Jul-2015 00:15:00", "01-Jul-2015 00:30:00")
anytime:::setDebug(TRUE)
anytime(dtchar)
anytime(dtchar)
stopifnot(sum(!is.na(anytime(dtchar))) == 2)
stopifnot(sum(!is.na(anytime(dtchar))) == 2)
