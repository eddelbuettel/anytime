
library(anytime)

dtchar <- "13/13/2023" # ambivalent input, should result in warning
expect_warning(anytime(dtchar))
