options(digits.secs=6)

## normal use:  Sys.setenv(TZ=anytime:::getTZ())
## to make tests reproducible, set a TZ
library(anytime)
Sys.setenv(TZ="America/Chicago")


anytime(c("2016-09-01 10:11:12", "2016-09-01 10:11:12.345678"))
anytime(c("2016/09/01 10:11:12", "2016/09/01 10:11:12.345678"))
anytime(c("20160901 101112",     "20160901 101112.345678"))     
anytime(c("20160901 10:11:12",   "20160901 10:11:12.345678"))
anytime(c("09/01/2016 10:11:12", "09/01/2016 10:11:12.345678"))
anytime(c("09-01-2016 10:11:12", "09-01-2016 10:11:12.345678"))
# anytime(c("01.09.2016 10:11:12", "01.09.2016 10:11:12.345678")) # European format gets confused to m/d/y

cat("\n")
anytime(c("2016-Sep-01 10:11:12", "2016-Sep-01 10:11:12.345678"))
anytime(c("2016/Sep/01 10:11:12", "2016/Sep/01 10:11:12.345678"))
anytime(c("2016Sep01 101112",     "2016Sep01 101112.345678"))   
anytime(c("2016Sep01 10:11:12",   "2016Sep01 10:11:12.345678"))
anytime(c("Sep/01/2016 10:11:12", "Sep/01/2016 10:11:12.345678"))
anytime(c("Sep-01-2016 10:11:12", "Sep-01-2016 10:11:12.345678"))
anytime(c("01.Sep.2016 10:11:12", "01.Sep.2016 10:11:12.345678"))

cat("\n")
anytime(c("2016-September-01 10:11:12", "2016-September-01 10:11:12.345678"))
anytime(c("2016/September/01 10:11:12", "2016/September/01 10:11:12.345678"))
anytime(c("2016September01 101112",     "2016September01 101112.345678"))   #
anytime(c("2016September01 10:11:12",   "2016September01 10:11:12.345678"))
anytime(c("September/01/2016 10:11:12", "September/01/2016 10:11:12.345678"))
anytime(c("September-01-2016 10:11:12", "September-01-2016 10:11:12.345678"))
anytime(c("01.September.2016 10:11:12", "01.September.2016 10:11:12.345678"))

cat("\n")
anytime(c("Thu Sep 01 10:11:12 2016", "Thu Sep 01 10:11:12.345678 2016"))

cat("\n")
anytime(c("2016-09-01", "20160901", "09/01/2016", "09-01-2016"))

cat("\n")
anytime(c("2016-Sep-01", "2016Sep01", "Sep/01/2016", "Sep-01-2016"))

cat("\n")
anytime(c("2016-September-01", "2016September01", "September/01/2016", "September-01-2016"))
