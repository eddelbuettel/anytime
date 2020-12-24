## anytime: Anything to 'POSIXct' or 'Date' Converter

[![Build Status](https://travis-ci.org/eddelbuettel/anytime.svg)](https://travis-ci.org/eddelbuettel/anytime)
[![CI](https://github.com/eddelbuettel/anytime/workflows/ci/badge.svg)](https://github.com/eddelbuettel/anytime/actions?query=workflow%3Aci)
[![License](https://eddelbuettel.github.io/badges/GPL2+.svg)](https://www.gnu.org/licenses/gpl-2.0.html)
[![CRAN](https://www.r-pkg.org/badges/version/anytime)](https://cran.r-project.org/package=anytime)
[![Dependencies](https://tinyverse.netlify.com/badge/anytime)](https://cran.r-project.org/package=anytime)
[![CRAN use](https://jangorecki.gitlab.io/rdeps/anytime/CRAN_usage.svg?sanitize=true)](https://cran.r-project.org/package=anytime)
[![Downloads](https://cranlogs.r-pkg.org/badges/anytime?color=brightgreen)](https://www.r-pkg.org/pkg/anytime)
[![Code Coverage](https://codecov.io/gh/eddelbuettel/anytime/graph/badge.svg)](https://codecov.io/gh/eddelbuettel/anytime)
[![Last Commit](https://img.shields.io/github/last-commit/eddelbuettel/anytime)](https://github.com/eddelbuettel/anytime)
[![Documentation](https://img.shields.io/badge/documentation-is_here-blue)](https://eddelbuettel.github.io/anytime/)
[![JOSS](https://img.shields.io/badge/JOSS-Not%20Worthy-lightgrey)](https://github.com/openjournals/joss-reviews/issues/1605#issuecomment-517055652)

### Motivation

R excels at computing with dates, and times.  Using _typed_ representation for your data is highly
recommended not only because of the functionality offered but also because of the added safety
stemming from proper representation.

But there is a small nuisance cost in interactive work as well as in programming. Users must have
told `as.POSIXct()` about a million times that the origin is (of course) the
[epoch](https://en.wikipedia.org/wiki/Unix_time). Do we really have to say it a million more times?
Similarly, when parsing dates that are _some form_ of YYYYMMDD format, do we really have to manually
convert from `integer` or `numeric` or `factor` or `ordered` to character? Having one of several
common separators and/or date / time month forms (YYYY-MM-DD, YYYY/MM/DD, YYYYMMDD, YYYY-mon-DD and
so on, with or without times), do we really need a format string? Or could a smart converter
function do this?

`anytime()` aims to be that _general purpose_ converter returning a proper `POSIXct` (or `Date`)
object no matter the input (provided it was somewhat parseable), relying on
[Boost date_time](https://www.boost.org/doc/libs/1_61_0/doc/html/date_time.html) for the (efficient,
performant) conversion. `anydate()` is an additional wrapper returning a `Date` object instead.

### Documentation

Package documentation, help pages, a vignette, and more is available
[here](https://eddelbuettel.github.io/anytime/).

### Examples

We show some simple examples on `Date` types.

(Note that in the first few examples, and for numeric conversion in this range we now
only use `anydate` as `anytime` is consistent in computing seconds since epoch. If you want the
behaviour of version older than 0.3.0, set `oldHeuristic=TRUE`, see `help(anytime)` for more.)

#### From Integer or Numeric or Factor or Ordered

```r
library(anytime)                      ## also caches TZ in local env
options(digits.secs=6)                ## for fractional seconds below

## integer
anydate(20160101L + 0:2)              ## older version used anytime for this too
[1] "2016-01-01 CST" "2016-01-02 CST" "2016-01-03 CST"

## numeric
anydate(20160101 + 0:2)
[1] "2016-01-01 CST" "2016-01-02 CST" "2016-01-03 CST"

## factor
anydate(as.factor(20160101 + 0:2))
[1] "2016-01-01 CST" "2016-01-02 CST" "2016-01-03 CST"

## ordered
anydate(as.ordered(20160101 + 0:2))
[1] "2016-01-01 CST" "2016-01-02 CST" "2016-01-03 CST"
```

#### Character: Simple

```r
## Dates: Character
anydate(as.character(20160101 + 0:2))
[1] "2016-01-01 CST" "2016-01-02 CST" "2016-01-03 CST"

## Dates: alternate formats
anydate(c("20160101", "2016/01/02", "2016-01-03"))
[1] "2016-01-01 CST" "2016-01-02 CST" "2016-01-03 CST"
```

#### Character: ISO

```r
## Datetime: ISO with/without fractional seconds
anytime(c("2016-01-01 10:11:12", "2016-01-01 10:11:12.345678"))
[1] "2016-01-01 10:11:12.000000 CST" "2016-01-01 10:11:12.345678 CST"

## Datetime: ISO alternate (?) with 'T' separator
anytime(c("20160101T101112", "20160101T101112.345678"))
[1] "2016-01-01 10:11:12.000000 CST" "2016-01-01 10:11:12.345678 CST"
```

#### Character: Textual month formats

```r
## ISO style
anytime(c("2016-Sep-01 10:11:12", "Sep/01/2016 10:11:12", "Sep-01-2016 10:11:12"))
[1] "2016-09-01 10:11:12 CDT" "2016-09-01 10:11:12 CDT" "2016-09-01 10:11:12 CDT"

## Datetime: Mixed format (cf https://stackoverflow.com/questions/39259184)
anytime(c("Thu Sep 01 10:11:12 2016", "Thu Sep 01 10:11:12.345678 2016"))
[1] "2016-09-01 10:11:12.000000 CDT" "2016-09-01 10:11:12.345678 CDT"
```


#### Character: Dealing with DST

This shows an important aspect. When not working localtime (by overriding to `UTC`) the _changing
difference_ UTC is correctly covered (which the underlying
[Boost Date_Time](https://www.boost.org/doc/libs/1_61_0/doc/html/date_time.html) library does not by
itself).


```r
## Datetime: pre/post DST
anytime(c("2016-01-31 12:13:14", "2016-08-31 12:13:14"))
[1] "2016-01-31 12:13:14 CST" "2016-08-31 12:13:14 CDT"
anytime(c("2016-01-31 12:13:14", "2016-08-31 12:13:14"), tz="UTC")  # important: catches change
[1] "2016-01-31 18:13:14 UTC" "2016-08-31 17:13:14 UTC"
```

### Technical Details

The heavy lifting is done by a combination of
[Boost lexical_cast](https://www.boost.org/doc/libs/1_70_0/doc/html/boost_lexical_cast.html) to go
from _anything_ to string representation which is then parsed by
[Boost Date_Time](https://www.boost.org/doc/libs/1_70_0/doc/html/date_time.html).  We use the
[BH package](https://dirk.eddelbuettel.com/code/bh.html) to access [Boost](https://www.boost.org), and
rely on [Rcpp](https://dirk.eddelbuettel.com/code/rcpp.html) for a seamless C++ interface to and from
[R](https://www.r-project.org).

Further, as the [Boost
Date_Time](https://www.boost.org/doc/libs/1_70_0/doc/html/date_time.html)
library cannot resolve timezones on the Windows platform (where timezone information is typically provided by R itself for its use), we offer a fallback of calling into R (via facilities from
[Rcpp](https://dirk.eddelbuettel.com/code/rcpp.html)); see the help for
the `useR` argument for more details.

### Status

The package should work as expected.

### Example Uses

Currently, just over ten different [CRAN](https://cran.r-project.org) packages import this package. Among them are the following research-focused packages:
 - [AGread](https://cran.r-project.org/package=AGread) by Hibbing _et al_ which reads and transforms ActiGraph physical activity measures;
 - [cqcr](https://cran.r-project.org/package=AGread) by Odell accesses 'Care Quality Commission' data from the health and adult social care regulator for England;
 - [E4tools](https://cran.r-project.org/package=E4tools) by Kleiman which reads data from Empatica wearable physiology monitors;
 - [RDS](https://cran.r-project.org/package=RDS) by Handcock _et al_ which is part of the "RDS Ananlyst" suite for analysing respondent-driven sampling data;
 - [tsbox](https://cran.r-project.org/package=tsbox) by Sax for format-agnostic time series data representation and conversions;
 - [tsibble](https://cran.r-project.org/package=tsibble) by Wang _et al_ for temporal data in an explicit data- and model-oriented format.

### Changes

See the NEWS.Rd file on [CRAN](https://cran.r-project.org/package=anytime/news.html) or
[GitHub](https://github.com/eddelbuettel/anytime/blob/master/inst/NEWS.Rd).  In particular, version 0.3.0 corrects
an overly optimistic heuristic for integer or numeric arguments and now behaves more like R itself. Specifically,
epoch offsets are interpreted as seconds for datetime objects, and days for date objects.  The prior behaviour can
be restored with an option which also be be set globally, see the help page for details.

### Installation

The package is now on [CRAN](https://cran.r-project.org) and can be installed
via a standard

```r
install.packages("anytime")
```

### Continued Testing

As we rely on the [tinytest](https://cran.r-project.org/package=tinytest) package, the
already-installed package can also be verified via

```r
tinytest::test_package("anytime")
```

at any later point.


### Contributing

Any problems, bug reports, or features requests for the package can be submitted and
handled most conveniently as [Github
issues](https://github.com/eddelbuettel/anytime/issues) in the repository.

Before submitting pull requests, it is frequently preferable to first discuss
need and scope in such an issue ticket.  See the file
[Contributing.md](https://github.com/RcppCore/Rcpp/blob/master/Contributing.md) (in the
[Rcpp](https://github.com/RcppCore/Rcpp) repo) for a brief discussion.


### Author

Dirk Eddelbuettel

### License

GPL (>= 2)
