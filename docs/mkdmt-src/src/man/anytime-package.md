
## Anything to 'POSIXct' or 'Date' Converter

### Description

Convert input in any one of character, integer, numeric, factor, or
ordered type into 'POSIXct' (or 'Date') objects, using one of a number
of predefined formats, and relying on Boost facilities for date and time
parsing.

### Details

R excels at computing with dates, and times. Using *typed*
representation for your data is highly recommended not only because of
the functionality offered but also because of the added safety stemming
from proper representation.

But there is a small nuisance cost in interactive work as well as in
programming. How often have we told `as.POSIXct()` that the origin is
(of course) the [epoch](https://en.wikipedia.org/wiki/Unix_time). Do we
really have to say it again? Similarly, when parsing dates that are
*somewhat* in YYYYMMDD format, do we really need to bother converting
from integer or numeric or character or factor or ordered with one of
dozen separators and/or month forms: YYYY-MM-DD, YYYY/MM/DD, YYYYMMDD,
YYYY-mon-DD and so on?

So there may have been a need for a *general purpose* converter
returning a proper `POSIXct` (or `Date`) object no matter the input
(provided it was somewhat parseable). `anytime()` tries to be that
function.

The actual conversion is done by a combination of [Boost
lexical_cast](https://www.boost.org/doc/libs/1_70_0/doc/html/boost_lexical_cast.html)
to go from *(almost) anything* to string representation which is then
parsed by [Boost
Date_Time](https://www.boost.org/doc/libs/1_70_0/doc/html/date_time.html).
An alternate method using the corresponding R functions is also
available as a fallback.

Conversion is done by looping over a fixed set of formats until a
matching one is found, or returning an error if none is found. The
current set of conversion formulae is accessible in the [source
code](https://github.com/eddelbuettel/anytime/blob/master/src/anytime.cpp#L43-L106),
and can now also be accessed in R via `getFormats()`. Formats can be
added and removed via the `addFormats()` and `removeFormats{}`
functions.

Details on the Boost date format symbols are provided by the [Boost
date_time
documentation](https://www.boost.org/doc/libs/1_70_0/doc/html/date_time/date_time_io.html#date_time.format_flags)
and similar (but not identical) to what `strftime` uses.

### Author(s)

Dirk Eddelbuettel

### References

Boost date_time:
<https://www.boost.org/doc/libs/1_70_0/doc/html/date_time.html>

Formats used:
<https://github.com/eddelbuettel/anytime/blob/master/src/anytime.cpp#L43-L106>

Boost format documentation:
<https://www.boost.org/doc/libs/1_61_0/doc/html/date_time/date_time_io.html#date_time.format_flags>

### Examples

``` R
  Sys.setenv(TZ=anytime:::getTZ())      ## helper function to try to get TZ
  options(digits.secs=6)                ## for fractional seconds below

  library(anytime)                      ## load package, caches TZ information

  ## integer
  anydate(20160101L + 0:2)

  ## numeric
  anydate(20160101 + 0:2)

  ## factor
  anydate(as.factor(20160101 + 0:2))

  ## ordered
  anydate(as.ordered(20160101 + 0:2))

  ## Dates: Character
  anydate(as.character(20160101 + 0:2))

  ## Dates: alternate formats
  anydate(c("20160101", "2016/01/02", "2016-01-03"))

  ## Datetime: ISO with/without fractional seconds
  anytime(c("2016-01-01 10:11:12", "2016-01-01 10:11:12.345678"))

  ## Datetime: ISO alternate (?) with 'T' separator
  anytime(c("20160101T101112", "20160101T101112.345678"))

  ## Short month '%b' (and full month is supported too)
  anytime(c("2016-Sep-01 10:11:12", "Sep/01/2016 10:11:12", "Sep-01-2016 10:11:12"))

  ## Datetime: Mixed format (cf https://stackoverflow.com/questions/39259184)
  anytime(c("Thu Sep 01 10:11:12 2016", "Thu Sep 01 10:11:12.345678 2016"))
```

