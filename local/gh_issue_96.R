input <- "2019-07-05 09:37:58.541235"

#Sys.setenv("TZ"="Japan")
Sys.setenv("TZ"="Europe/Berlin")
library(anytime)
anytime(input, useR = TRUE)
anytime(input)
as.POSIXct(input)

n1 <- as.numeric(anytime(input, useR = TRUE))
n2 <- as.numeric(anytime(input))
n3 <- as.numeric(as.POSIXct(input))
print(n3,digits=16)

cat("n1 - n2: ", n1 - n2, "\n")
cat("n1 - n3: ", n1 - n3, "\n")
cat("n2 - n3: ", n2 - n3, "\n")
