
## Parse POSIXct or Date objects from input data

### Description

These function use the Boost Date_Time library to parse datetimes (and
dates) from strings, integers, factors or even numeric values (which are
cast to strings internally). They return a vector of `POSIXct` objects
(or `Date` objects in the case of `anydate`). `POSIXct` objects
represent dates and time as (possibly fractional) seconds since the
‘epoch’ of January 1, 1970. A timezone can be set, if none is supplied
‘UTC’ is set.

### Usage

``` R
anytime(x, tz = getTZ(), asUTC = FALSE,
  useR = getOption("anytimeUseRConversions", FALSE),
  oldHeuristic = getOption("anytimeOldHeuristic", FALSE),
  calcUnique = FALSE)

anydate(x, tz = getTZ(), asUTC = FALSE,
  useR = getOption("anytimeUseRConversions", FALSE), calcUnique = FALSE)

utctime(x, tz = getTZ(), useR = getOption("anytimeUseRConversions", FALSE),
  oldHeuristic = getOption("anytimeOldHeuristic", FALSE),
  calcUnique = FALSE)

utcdate(x, tz = getTZ(), useR = getOption("anytimeUseRConversions", FALSE),
  calcUnique = FALSE)
```

### Arguments

|                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `x`            | A vector of type character, integer or numeric with date(time) expressions to be parsed and converted.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `tz`           | A string with the timezone, defaults to the result of the (internal) `getTZ` function if unset. The `getTZ` function returns the timezone values stored in local package environment, and set at package load time. Also note that this argument applies to the *output*: the returned object will have this timezone set. The timezone is *not* used for the parsing which will always be to localtime, or to UTC is the `asUTC` variable is set (as it is in the related functions `utctime` and `utcdate`). So one can think of the argument as ‘shift parsed time object to this timezone’. This is similar to what `format()` in base R does, but our return value is still a `POSIXt` object instead of a character value. |
| `asUTC`        | A logical value indicating if parsing should be to UTC; default is false implying localtime.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `useR`         | A logical value indicating if conversion should be done via code from R (via `Rcpp::Function`) instead of the default Boost routines. The default value is the value of the option `anytimeUseRConversions` with a fallback of `FALSE` if the option is unset. In other words, this will be false by default but can be set to true via an option.                                                                                                                                                                                                                                                                                                                                                                               |
| `oldHeuristic` | A logical value to enable behaviour as in version 0.2.2 or earlier: interpret a numeric or integer value that could be seen as a YYYYMMDD as a date. If the default value `FALSE` is seen, then numeric values are used as offsets dates (in `anydate` or `utcdate`), and as second offsets for datetimes otherwise. A default value can also be set via the `anytimeOldHeuristic` option.                                                                                                                                                                                                                                                                                                                                       |
| `calcUnique`   | A logical value with a default value of `FALSE` that tells the function to perform the `anytime()` or `anydate()` calculation only once for each unique value in the `x` vector. It results in no difference in inputs or outputs, but can result in a significant speed increases for long vectors where each timestamp appears more than once. However, it will result in a slight slow down for input vectors where each timestamp appears only once.                                                                                                                                                                                                                                                                         |

### Details

A number of fixed formats are tried in succession. These include the
standard ISO format ‘YYYY-MM-DD HH:MM:SS’ as well as different local
variants including several forms popular in the United States.
Two-digits years and clearly ambigous formats such as ‘03/04/05’ are
ignored. In the case of parsing failure a `NA` value is returned.

Fractional seconds are supported as well. As R itself only supports
microseconds, the Boost compile-time option for nano-second resolution
has not been enabled.

### Value

A vector of `POSIXct` elements, or, in the case of `anydate`, a vector
of `Date` objects.

### Notes

By default, the (internal) conversion to (fractional) seconds since the
epoch is relative to the locatime of this system, and therefore not
completely independent of the settings of the local system. This is to
strike a balance between ease of use and functionality. A more-full
featured conversion could be possibly be added with support for
arbitrary reference times, but this is (at least) currently outside the
scope of this package. See the <span class="pkg">RcppCCTZ</span> package
which offers some timezone-shifting and differencing functionality. As
of version 0.0.5 one can also parse relative to UTC avoiding the
localtime issue,

Times and timezones can be tricky. This package offers a heuristic
approach, it is likely that some input formats may not be parsed, or
worse, be parsed incorrectly. This is not quite a [Bobby
Tables](https://xkcd.com/327/) situation but care must always be taken
with user-supplied input.

The Boost Date_Time library cannot parse single digit months or days. So
while ‘2016/09/02’ works (as expected), ‘2016/9/2’ will not. Other
non-standard formats may also fail.

There is a known issue (discussed at length in [issue ticket
5](https://github.com/eddelbuettel/anytime/issues/5)) where Australian
times are off by an hour. This seems to affect only Windows, not Linux.

When given a vector, R will coerce it to the type of the first element.
Should that be `NA`, surprising things can happen: `c(NA, Sys.Date())`
forces both values to `numeric` and the date will not be parsed
correctly (as its integer value becomes numeric before our code sees
it). On the other hand, `c(Sys.Date(), NA)` works as expected parsing as
type Date with one missing value. See [issue ticket
11](https://github.com/eddelbuettel/anytime/issues/11) for more.

Another known issue concerns conversion when the timezone is set to
‘Europe/London’, see GitHub issue tickets
[36](https://github.com/eddelbuettel/anytime/issues/36).
[51](https://github.com/eddelbuettel/anytime/issues/51).
[59](https://github.com/eddelbuettel/anytime/issues/59). and
[86](https://github.com/eddelbuettel/anytime/issues/86). As pointed out
in the comment in that last one, the `Sys.timezone` manual page suggests
several alternatives to using ‘Europe/London’ such as ‘GB’.

Yet another known issue arises on Windows due to designs in the Boost
library. While we can set the `TZ` library variable, Boost actually does
*not* consult it but rather relies only on the (Windows) tool `tzutil`.
This means that default behaviour should be as expected: dates and/or
times are parsed to the local settings. But testing different `TZ`
values (or more precisely, changes via the (unexported) helper function
`setTZ` function as we cache `TZ`) will only influence the behaviour on
Unix or Unix-alike operating systems and not on Windows. See the
discussion at [issue ticket
96](https://github.com/eddelbuettel/anytime/issues/96) for more. In
short, the recommendation for Windows user is to also set `useR=TRUE`
when setting a timezone argument.

### Operating System Impact

On Windows systems, accessing the `isdst` flag on dates or times before
January 1, 1970, can lead to a crash. Therefore, the lookup of this
value has been disabled for those dates and times, which could therefore
be off by an hour (the common value that needs to be corrected). It
should not affect dates, but may affect datetime objects.

### Old Heuristic

Up until version 0.2.2, numeric input smaller than an internal cutoff
value was interpreted as a date, even if `anytime()` was called. While
convenient, it is also inconsistent as we otherwise take numeric values
to be offsets to the epoch. Newer version are consistent: for `anydate`,
a value is taken as *date offset* relative to the epoch (of January 1,
1970). For `anytime`, it is taken as *seconds offset*. So `anytime(60)`
is one minute past the epoch, and `anydate(60)` is sixty days past it.
The old behaviour can be enabled by setting the `oldHeuristic` argument
to `anytime` (and `utctime`) to `TRUE`. Additionally, the default value
can be set via `getOption("anytimeOldHeuristic")` which can be set to
`TRUE` in startup file. Note that all other inputs such character,
factor or ordered are not affected.

### Warnings

As of version 0.3.10, a conversion from character resulting in a `NA`
will lead to a warning being emitted. At most one warning per call is
given: should numerous unparseable values be present on input, only one
warning will be show. R offers mechanism to either suppress warnings, or
convert them to errors as described in the help page for `options()`
under the entry for `warn`.

### Author(s)

Dirk Eddelbuettel

### References

This StackOverflow answer provided the initial idea:
<https://stackoverflow.com/a/3787188/143305>.

### See Also

`anytime-package`, `getFormats`

### Examples

``` R
## See the source code for a full list of formats, and the
## or the reference in help('anytime-package') for details
times <- c("2004-03-21 12:45:33.123456",
          "2004/03/21 12:45:33.123456",
          "20040321 124533.123456",
          "03/21/2004 12:45:33.123456",
          "03-21-2004 12:45:33.123456",
          "2004-03-21",
          "20040321",
          "03/21/2004",
          "03-21-2004",
          "20010101")
anytime(times)
anydate(times)
utctime(times)
utcdate(times)

## show effect of tz argument
anytime("2001-02-03 04:05:06")
## adjust parsed time to given TZ argument
anytime("2001-02-03 04:05:06", tz="America/Los_Angeles")
## somewhat equvalent base R functionality
format(anytime("2001-02-03 04:05:06"), tz="America/Los_Angeles")
```

