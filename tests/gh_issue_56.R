
library(anytime)

## used to fail, also see http://stackoverflow.com/questions/42316895/why-does-anytime-return-na-in-some-cases
anytime(1483228800L)                    

## these work
anytime(20170101L)
anydate(20170101L)

## these are (with the default cutoff of 29991231) interpreted as seconds-since-epoch
res <- anytime:::setMaxIntAsYYYYMMDD(39991231L)
anytime(30010203L)
anydate(30010203L)

