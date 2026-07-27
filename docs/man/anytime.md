

# Parse POSIXct or Date objects from input data

[**Source code**](https://github.com/eddelbuettel/anytime/tree/master/R/#L)

## Description

These function use the Boost Date_Time library to parse datetimes (and
dates) from strings, integers, factors or even numeric values (which are
cast to strings internally). They return a vector of
<code>POSIXct</code> objects (or <code>Date</code> objects in the case
of <code>anydate</code>). <code>POSIXct</code> objects represent dates
and time as (possibly fractional) seconds since the ‘epoch’ of January
1, 1970. A timezone can be set, if none is supplied ‘UTC’ is set.

## Usage

<pre><code class='language-R'>anytime(x, tz = getTZ(), asUTC = FALSE,
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
</code></pre>

## Arguments

<table role="presentation">
<tr>
<td style="white-space: nowrap; font-family: monospace; vertical-align: top">
<code id="x">x</code>
</td>
<td>
A vector of type character, integer or numeric with date(time)
expressions to be parsed and converted.
</td>
</tr>
<tr>
<td style="white-space: nowrap; font-family: monospace; vertical-align: top">
<code id="tz">tz</code>
</td>
<td>
A string with the timezone, defaults to the result of the (internal)
<code>getTZ</code> function if unset. The <code>getTZ</code> function
returns the timezone values stored in local package environment, and set
at package load time. Also note that this argument applies to the
<em>output</em>: the returned object will have this timezone set. The
timezone is <em>not</em> used for the parsing which will always be to
localtime, or to UTC is the <code>asUTC</code> variable is set (as it is
in the related functions <code>utctime</code> and <code>utcdate</code>).
So one can think of the argument as ‘shift parsed time object to this
timezone’. This is similar to what <code>format()</code> in base R does,
but our return value is still a <code>POSIXt</code> object instead of a
character value.
</td>
</tr>
<tr>
<td style="white-space: nowrap; font-family: monospace; vertical-align: top">
<code id="asUTC">asUTC</code>
</td>
<td>
A logical value indicating if parsing should be to UTC; default is false
implying localtime.
</td>
</tr>
<tr>
<td style="white-space: nowrap; font-family: monospace; vertical-align: top">
<code id="useR">useR</code>
</td>
<td>
A logical value indicating if conversion should be done via code from R
(via <code>Rcpp::Function</code>) instead of the default Boost routines.
The default value is the value of the option
<code>anytimeUseRConversions</code> with a fallback of
<code>FALSE</code> if the option is unset. In other words, this will be
false by default but can be set to true via an option.
</td>
</tr>
<tr>
<td style="white-space: nowrap; font-family: monospace; vertical-align: top">
<code id="oldHeuristic">oldHeuristic</code>
</td>
<td>
A logical value to enable behaviour as in version 0.2.2 or earlier:
interpret a numeric or integer value that could be seen as a YYYYMMDD as
a date. If the default value <code>FALSE</code> is seen, then numeric
values are used as offsets dates (in <code>anydate</code> or
<code>utcdate</code>), and as second offsets for datetimes otherwise. A
default value can also be set via the <code>anytimeOldHeuristic</code>
option.
</td>
</tr>
<tr>
<td style="white-space: nowrap; font-family: monospace; vertical-align: top">
<code id="calcUnique">calcUnique</code>
</td>
<td>
A logical value with a default value of <code>FALSE</code> that tells
the function to perform the <code>anytime()</code> or
<code>anydate()</code> calculation only once for each unique value in
the <code>x</code> vector. It results in no difference in inputs or
outputs, but can result in a significant speed increases for long
vectors where each timestamp appears more than once. However, it will
result in a slight slow down for input vectors where each timestamp
appears only once.
</td>
</tr>
</table>

## Details

A number of fixed formats are tried in succession. These include the
standard ISO format ‘YYYY-MM-DD HH:MM:SS’ as well as different local
variants including several forms popular in the United States. Two-digit
years and clearly ambiguous formats such as ‘03/04/05’ are ignored. In
the case of parsing failure a <code>NA</code> value is returned.

Fractional seconds are supported as well. As R itself only supports
microseconds, the Boost compile-time option for nano-second resolution
has not been enabled.

## Value

A vector of <code>POSIXct</code> elements, or, in the case of
<code>anydate</code>, a vector of <code>Date</code> objects.

## Notes

By default, the (internal) conversion to (fractional) seconds since the
epoch is relative to the local time of this system, and therefore not
completely independent of the settings of the local system. This is to
strike a balance between ease of use and functionality. A more-full
featured conversion could be possibly be added with support for
arbitrary reference times, but this is (at least) currently outside the
scope of this package. See the <span class="pkg">RcppCCTZ</span> package
which offers some timezone-shifting and differencing functionality. As
of version 0.0.5 one can also parse relative to UTC avoiding the local
time issue.

Times and timezones can be tricky. This package offers a heuristic
approach, it is likely that some input formats may not be parsed, or
worse, be parsed incorrectly. This is not quite a
<a href="https://xkcd.com/327/">Bobby Tables</a> situation but care must
always be taken with user-supplied input.

The Boost Date_Time library cannot parse single digit months or days. So
while ‘2016/09/02’ works (as expected), ‘2016/9/2’ will not. Other
non-standard formats may also fail.

There is a known issue (discussed at length in
<a href="https://github.com/eddelbuettel/anytime/issues/5">issue ticket
5</a>) where Australian times are off by an hour. This seems to affect
only Windows, not Linux.

When given a vector, R will coerce it to the type of the first element.
Should that be <code>NA</code>, surprising things can happen:
<code>c(NA, Sys.Date())</code> forces both values to
<code>numeric</code> and the date will not be parsed correctly (as its
integer value becomes numeric before our code sees it). On the other
hand, <code>c(Sys.Date(), NA)</code> works as expected parsing as type
Date with one missing value. See
<a href="https://github.com/eddelbuettel/anytime/issues/11">issue ticket
11</a> for more.

Another known issue concerns conversion when the timezone is set to
‘Europe/London’, see GitHub issue tickets
<a href="https://github.com/eddelbuettel/anytime/issues/36">36</a>.
<a href="https://github.com/eddelbuettel/anytime/issues/51">51</a>.
<a href="https://github.com/eddelbuettel/anytime/issues/59">59</a>. and
<a href="https://github.com/eddelbuettel/anytime/issues/86">86</a>. As
pointed out in the comment in that last one, the
<code>Sys.timezone</code> manual page suggests several alternatives to
using ‘Europe/London’ such as ‘GB’.

Yet another known issue arises on Windows due to designs in the Boost
library. While we can set the <code>TZ</code> library variable, Boost
actually does <em>not</em> consult it but rather relies only on the
(Windows) tool <code>tzutil</code>. This means that default behaviour
should be as expected: dates and/or times are parsed to the local
settings. But testing different <code>TZ</code> values (or more
precisely, changes via the (unexported) helper function
<code>setTZ</code> function as we cache <code>TZ</code>) will only
influence the behaviour on Unix or Unix-alike operating systems and not
on Windows. See the discussion at
<a href="https://github.com/eddelbuettel/anytime/issues/96">issue ticket
96</a> for more. In short, the recommendation for Windows user is to
also set <code>useR=TRUE</code> when setting a timezone argument.

## Operating System Impact

On Windows systems, accessing the <code>isdst</code> flag on dates or
times before January 1, 1970, can lead to a crash. Therefore, the lookup
of this value has been disabled for those dates and times, which could
therefore be off by an hour (the common value that needs to be
corrected). It should not affect dates, but may affect datetime objects.

## Old Heuristic

Up until version 0.2.2, numeric input smaller than an internal cutoff
value was interpreted as a date, even if <code>anytime()</code> was
called. While convenient, it is also inconsistent as we otherwise take
numeric values to be offsets to the epoch. Newer version are consistent:
for <code>anydate</code>, a value is taken as <em>date offset</em>
relative to the epoch (of January 1, 1970). For <code>anytime</code>, it
is taken as <em>seconds offset</em>. So <code>anytime(60)</code> is one
minute past the epoch, and <code>anydate(60)</code> is sixty days past
it. The old behaviour can be enabled by setting the
<code>oldHeuristic</code> argument to <code>anytime</code> (and
<code>utctime</code>) to <code>TRUE</code>. Additionally, the default
value can be set via <code>getOption(“anytimeOldHeuristic”)</code> which
can be set to <code>TRUE</code> in startup file. Note that all other
inputs such character, factor or ordered are not affected.

## Warnings

As of version 0.3.10, a conversion from character resulting in a
<code>NA</code> will lead to a warning being emitted. At most one
warning per call is given: should numerous unparseable values be present
on input, only one warning will be show. R offers mechanism to either
suppress warnings, or convert them to errors as described in the help
page for <code>options()</code> under the entry for <code>warn</code>.

## Author(s)

Dirk Eddelbuettel

## References

This StackOverflow answer provided the initial idea:
<a href="https://stackoverflow.com/a/3787188/143305">https://stackoverflow.com/a/3787188/143305</a>.

## See Also

<code>anytime-package</code>, <code>getFormats</code>

## Examples

``` r
library("anytime")

# See the source code for a full list of formats, and the
# or the reference in help('anytime-package') for details
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
```

     [1] "2004-03-21 12:45:33 UTC" "2004-03-21 12:45:33 UTC"
     [3] "2004-03-21 12:45:33 UTC" "2004-03-21 12:45:33 UTC"
     [5] "2004-03-21 12:45:33 UTC" "2004-03-21 00:00:00 UTC"
     [7] "2004-03-21 00:00:00 UTC" "2004-03-21 00:00:00 UTC"
     [9] "2004-03-21 00:00:00 UTC" "2001-01-01 00:00:00 UTC"

``` r
anydate(times)
```

     [1] "2004-03-21" "2004-03-21" "2004-03-21" "2004-03-21" "2004-03-21"
     [6] "2004-03-21" "2004-03-21" "2004-03-21" "2004-03-21" "2001-01-01"

``` r
utctime(times)
```

     [1] "2004-03-21 12:45:33 UTC" "2004-03-21 12:45:33 UTC"
     [3] "2004-03-21 12:45:33 UTC" "2004-03-21 12:45:33 UTC"
     [5] "2004-03-21 12:45:33 UTC" "2004-03-21 00:00:00 UTC"
     [7] "2004-03-21 00:00:00 UTC" "2004-03-21 00:00:00 UTC"
     [9] "2004-03-21 00:00:00 UTC" "2001-01-01 00:00:00 UTC"

``` r
utcdate(times)
```

     [1] "2004-03-21" "2004-03-21" "2004-03-21" "2004-03-21" "2004-03-21"
     [6] "2004-03-21" "2004-03-21" "2004-03-21" "2004-03-21" "2001-01-01"

``` r
# show effect of tz argument
anytime("2001-02-03 04:05:06")
```

    [1] "2001-02-03 04:05:06 UTC"

``` r
# adjust parsed time to given TZ argument
anytime("2001-02-03 04:05:06", tz="America/Los_Angeles")
```

    [1] "2001-02-02 20:05:06 PST"

``` r
# somewhat equivalent base R functionality
format(anytime("2001-02-03 04:05:06"), tz="America/Los_Angeles")
```

    [1] "2001-02-02 20:05:06"
