#!/bin/sh

## In 1970, R and Boost Date_Time agree.  For Europe/London we are an hour early, for UTC
## we are at zero as we should be
TZ=Europe/London r -lanytime -p \
  -e'c(as.numeric(as.POSIXct("1970-01-01 00:00:00")), as.numeric(anytime("1970-01-01")))'

TZ=UTC r -lanytime -p \
  -e'c(as.numeric(as.POSIXct("1970-01-01 00:00:00")), as.numeric(anytime("1970-01-01")))'


## However, in 1980, R and Boost Date_Time differ for London, though they still agree
## on UTC
TZ=Europe/London r -lanytime -p \
  -e'c(as.numeric(as.POSIXct("1980-01-01 00:00:00")), as.numeric(anytime("1980-01-01")))'

TZ=UTC r -lanytime -p \
  -e'c(as.numeric(as.POSIXct("1980-01-01 00:00:00")), as.numeric(anytime("1980-01-01")))'


## Same in 1990
TZ=Europe/London r -lanytime -p \
  -e'c(as.numeric(as.POSIXct("1990-01-01 00:00:00")), as.numeric(anytime("1990-01-01")))'

TZ=UTC r -lanytime -p \
  -e'c(as.numeric(as.POSIXct("1990-01-01 00:00:00")), as.numeric(anytime("1990-01-01")))'

