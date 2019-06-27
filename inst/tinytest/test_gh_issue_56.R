
library(anytime)

## used to fail, also see http://stackoverflow.com/questions/42316895/why-does-anytime-return-na-in-some-cases
expect_true(is.finite(anytime(1483228800L)))

## these work
expect_true(is.finite(anytime(20170101L)))
expect_true(is.finite(anydate(20170101L)))

## these are (with the default cutoff of 29991231) interpreted as seconds-since-epoch
anytime:::setMaxIntAsYYYYMMDD(39991231L)
expect_true(is.finite(anytime(30010203L)))
expect_true(is.finite(anydate(30010203L)))

anytime:::setMaxIntAsDate(199999L)
expect_true(is.finite(anytime(199998)))
expect_true(is.finite(anydate(199908)))
