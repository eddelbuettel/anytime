options(digits.secs=6, width=70)

library(anytime)

anytime(c("2016-09-01 10:11:12", "2016-09-01 10:11:12.345678"))
anytime(c("2016-09-01 101112",   "2016-09-01 101112.345678"))
anytime(c("2016/09/01 10:11:12", "2016/09/01 10:11:12.345678"))
anytime(c("20160901 101112",     "20160901 101112.345678"))
anytime(c("20160901 10:11:12",   "20160901 10:11:12.345678"))
anytime(c("09/01/2016 10:11:12", "09/01/2016 10:11:12.345678"))
anytime(c("09-01-2016 10:11:12", "09-01-2016 10:11:12.345678"))
# anytime(c("01.09.2016 10:11:12", "01.09.2016 10:11:12.345678")) # European format gets confused with m/d/y

cat("\n")
anytime(c("2016-Sep-01 10:11:12", "2016-Sep-01 10:11:12.345678"))
anytime(c("2016/Sep/01 10:11:12", "2016/Sep/01 10:11:12.345678"))
anytime(c("2016Sep01 101112",     "2016Sep01 101112.345678"))
anytime(c("2016Sep01 10:11:12",   "2016Sep01 10:11:12.345678"))
anytime(c("Sep/01/2016 10:11:12", "Sep/01/2016 10:11:12.345678"))
anytime(c("Sep-01-2016 10:11:12", "Sep-01-2016 10:11:12.345678"))

cat("\n")
anytime(c("01.Sep.2016 10:11:12", "01.Sep.2016 10:11:12.345678"))
anytime(c("01Sep2016 101112",     "01Sep2016 101112.345678"))
anytime(c("01Sep2016 10:11:12",   "01Sep2016 10:11:12.345678"))
anytime(c("01-Sep-2016 101112",   "01-Sep-2016 101112.345678"))
anytime(c("01-Sep-2016 10:11:12", "01-Sep-2016 10:11:12.345678"))

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
anytime(c("Thu 01 Sep 2016 10:11:12", "Thu 01 Sep 2016 10:11:12.345678"))

cat("\n")
anytime(c("2016-09-01", "20160901", "09/01/2016", "09-01-2016"))

cat("\n")
anytime(c("2016-Sep-01", "2016Sep01", "Sep/01/2016", "Sep-01-2016"))

cat("\n")
anytime(c("01SEP2016", "01-Sep-2016"))

cat("\n")
anytime(c("2016-September-01", "2016September01", "September/01/2016", "September-01-2016"))

cat("\n")                               # special case of non-finite NA reals
anytime(c(NA, NaN, Inf, as.numeric(as.POSIXct("2016-09-01 10:11:12"))))

cat("\n")                               # special case of no separators
anytime(c("20160911", "20160911 1011", "20160911 101112", "20160911 101112.345678"))


anytime("NA") 				# String NA
anytime(Sys.time())                     # POSIXt pass-through
anytime(Sys.Date())			# Date pass-through
utcdate(Sys.Date())                     # Date pass-through

cat("Next call will tickle exception\n")
try(anytime(TRUE))                      # tickles unsupported type -- and exception, hence try()

cat("All done!\n")
