

# 

## Description

## Details

R excels at computing with dates, and times. Using <em>typed</em>
representation for your data is highly recommended not only because of
the functionality offered but also because of the added safety stemming
from proper representation.

But there is a small nuisance cost in interactive work as well as in
programming. How often have we told <code>as.POSIXct()</code> that the
origin is (of course) the
<a href="https://en.wikipedia.org/wiki/Unix_time">epoch</a>. Do we
really have to say it again? Similarly, when parsing dates that are
<em>somewhat</em> in YYYYMMDD format, do we really need to bother
converting from integer or numeric or character or factor or ordered
with one of dozen separators and/or month forms: YYYY-MM-DD, YYYY/MM/DD,
YYYYMMDD, YYYY-mon-DD and so on?

So there may have been a need for a <em>general purpose</em> converter
returning a proper <code>POSIXct</code> (or <code>Date</code>) object no
matter the input (provided it was somewhat parseable).
<code>anytime()</code> tries to be that function.

The actual conversion is done by a combination of
<a href="https://www.boost.org/doc/libs/1_70_0/doc/html/boost_lexical_cast.html">Boost
lexical_cast</a> to go from <em>(almost) anything</em> to string
representation which is then parsed by
<a href="https://www.boost.org/doc/libs/1_70_0/doc/html/date_time.html">Boost
Date_Time</a>. An alternate method using the corresponding R functions
is also available as a fallback.

Conversion is done by looping over a fixed set of formats until a
matching one is found, or returning an error if none is found. The
current set of conversion formulae is accessible in the
<a href="https://github.com/eddelbuettel/anytime/blob/master/src/anytime.cpp#L43-L106">source
code</a>, and can now also be accessed in R via
<code>getFormats()</code>. Formats can be added and removed via the
<code>addFormats()</code> and <code>removeFormats{}</code> functions.

Details on the Boost date format symbols are provided by the
<a href="https://www.boost.org/doc/libs/1_70_0/doc/html/date_time/date_time_io.html#date_time.format_flags">Boost
date_time documentation</a> and similar (but not identical) to what
<code>strftime</code> uses.

## Author(s)

## References

Boost date_time:
<a href="https://www.boost.org/doc/libs/1_70_0/doc/html/date_time.html">https://www.boost.org/doc/libs/1_70_0/doc/html/date_time.html</a>

Formats used:
<a href="https://github.com/eddelbuettel/anytime/blob/master/src/anytime.cpp#L43-L106">https://github.com/eddelbuettel/anytime/blob/master/src/anytime.cpp#L43-L106</a>

Boost format documentation:
<a href="https://www.boost.org/doc/libs/1_61_0/doc/html/date_time/date_time_io.html#date_time.format_flags">https://www.boost.org/doc/libs/1_61_0/doc/html/date_time/date_time_io.html#date_time.format_flags</a>

## Examples

``` r
library("anytime")

  Sys.setenv(TZ=anytime:::getTZ())      ## helper function to try to get TZ
  options(digits.secs=6)                ## for fractional seconds below

  library(anytime)                      ## load package, caches TZ information

  ## integer
  anydate(20160101L + 0:2)
```

    [1] "2016-01-01" "2016-01-02" "2016-01-03"

``` r
  ## numeric
  anydate(20160101 + 0:2)
```

    [1] "2016-01-01" "2016-01-02" "2016-01-03"

``` r
  ## factor
  anydate(as.factor(20160101 + 0:2))
```

    [1] "2016-01-01" "2016-01-02" "2016-01-03"

``` r
  ## ordered
  anydate(as.ordered(20160101 + 0:2))
```

    [1] "2016-01-01" "2016-01-02" "2016-01-03"

``` r
  ## Dates: Character
  anydate(as.character(20160101 + 0:2))
```

    [1] "2016-01-01" "2016-01-02" "2016-01-03"

``` r
  ## Dates: alternate formats
  anydate(c("20160101", "2016/01/02", "2016-01-03"))
```

    [1] "2016-01-01" "2016-01-02" "2016-01-03"

``` r
  ## Datetime: ISO with/without fractional seconds
  anytime(c("2016-01-01 10:11:12", "2016-01-01 10:11:12.345678"))
```

    [1] "2016-01-01 10:11:12.000000 UTC" "2016-01-01 10:11:12.345678 UTC"

``` r
  ## Datetime: ISO alternate (?) with 'T' separator
  anytime(c("20160101T101112", "20160101T101112.345678"))
```

    [1] "2016-01-01 UTC" "2016-01-01 UTC"

``` r
  ## Short month '%b' (and full month is supported too)
  anytime(c("2016-Sep-01 10:11:12", "Sep/01/2016 10:11:12", "Sep-01-2016 10:11:12"))
```

    [1] "2016-09-01 10:11:12 UTC" "2016-09-01 10:11:12 UTC"
    [3] "2016-09-01 10:11:12 UTC"

``` r
  ## Datetime: Mixed format (cf https://stackoverflow.com/questions/39259184)
  anytime(c("Thu Sep 01 10:11:12 2016", "Thu Sep 01 10:11:12.345678 2016"))
```

    [1] "2016-09-01 10:11:12.000000 UTC" "2016-09-01 10:11:12.345678 UTC"
