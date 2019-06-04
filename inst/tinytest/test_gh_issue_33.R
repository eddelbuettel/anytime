
library(anytime)

dtchar <- c("01-Jul-2015 00:15:00", "01-Jul-2015 00:30:00")
#anytime:::setDebug(TRUE)
anytime(dtchar)
anytime(dtchar)
expect_true(sum(!is.na(anytime(dtchar))) == 2)
expect_true(sum(!is.na(anytime(dtchar))) == 2)
