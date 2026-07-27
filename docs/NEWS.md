

# News for Package <span class="pkg">anytime</span>

## Changes in anytime version 0.3.13 (2026-04-14)

<ul>
<li>

Continuous integration has received minor updates

</li>
<li>

The vignette now use the <code>Rcpp::asis()</code> driver, and
references have been refreshed

</li>
<li>

Stateful ‘where are we running’ detection is now more robust, and has
been moved from running on each startup to a cached ‘as needed’ case

</li>
</ul>

## Changes in anytime version 0.3.12 (2025-07-14)

<ul>
<li>

Continuous integration now uses r-ci action with embedded bootstrap

</li>
<li>

The versioned depends on <span class="pkg">Rcpp</span> now requires
1.0.8 or newer to support use of the updated header file structure

</li>
<li>

The corner-case of an empty (numeric or integer) vector argument is now
addressed, new tests have been added
(<a href="https://github.com/eddelbuettel/anytime/issues/135">[#135](https://github.com/eddelbuettel/anytime/issues/135)</a>)

</li>
</ul>

## Changes in anytime version 0.3.11 (2024-12-18)

<ul>
<li>

Skip one test file under another operating system

</li>
</ul>

## Changes in anytime version 0.3.10 (2024-12-02)

<ul>
<li>

A new documentation site was added.

</li>
<li>

Continuous Integration now uses <code>run.sh</code> from
<span class="pkg">r-ci</span> with <span class="pkg">bspm</span>

</li>
<li>

Logical input vectors are now recognised as an error
(<a href="https://github.com/eddelbuettel/anytime/issues/121">[#121](https://github.com/eddelbuettel/anytime/issues/121)</a>)

</li>
<li>

Additional dot-separated format ’

</li>
<li>

Other small updates were made throughout the package

</li>
<li>

No longer set a C++ compilation standard as the default choices by R are
sufficient for the package

</li>
<li>

Switch Rcpp include file to Rcpp/Lightest

</li>
<li>

We recommend <code>~/.R/Makevars</code> compiler flag options
<code>-Wno-ignored-attributes -Wno-nonnull -Wno-parentheses</code>

</li>
<li>

The <span class="pkg">tinytest</span> runner was simplified

</li>
<li>

<code>NA</code> values from conversion now trigger a warning

</li>
</ul>

## Changes in anytime version 0.3.9 (2020-08-26)

<ul>
<li>

Skip one test file that is impossible to run across different CRAN
setups, and life is definitely too short for these games.

</li>
<li>

Change remaining http:// to https:// because, well, you know.

</li>
</ul>

## Changes in anytime version 0.3.8 (2020-07-23)

<ul>
<li>

A small utility function was added to detect the Linux distribution used
in order to fine-tune tests once more.

</li>
<li>

Travis now uses Ubuntu ‘bionic’ and R 4.0.\*.

</li>
</ul>

## Changes in anytime version 0.3.7 (2020-01-20)

<ul>
<li>

Test and possibly condition away one more test file.

</li>
<li>

Small enhancement for compilation by setting <code>no-rtti</code> define
via Rcpp.

</li>
<li>

New option <code>calcUnique</code> for speed-up by parseing only unique
timestamps (Stephen Froehlich in
<a href="https://github.com/eddelbuettel/anytime/pull/110">[#110](https://github.com/eddelbuettel/anytime/issues/110)</a>
fixing
<a href="https://github.com/eddelbuettel/anytime/pull/109">[#109](https://github.com/eddelbuettel/anytime/issues/109)</a>).

</li>
</ul>

## Changes in anytime version 0.3.6 (2019-08-29)

<ul>
<li>

Added, and then removed, required file for JOSS; added ‘unworthy’ badge
as we earned a desk reject (cf [#1605](https://github.com/eddelbuettel/anytime/issues/1605) there).

</li>
<li>

Renamed internal helper function format() to fmt() to avoid clashes with
base::format() (Dirk in
<a href="https://github.com/eddelbuettel/anytime/pull/104">[#104](https://github.com/eddelbuettel/anytime/issues/104)</a>).

</li>
<li>

Use S3 dispatch and generics for key functions (Dirk in
<a href="https://github.com/eddelbuettel/anytime/pull/106">[#106](https://github.com/eddelbuettel/anytime/issues/106)</a>).

</li>
<li>

Continued to tweak tests as we find some of the rhub platform to behave
strangely (Dirk via commits,
<a href="https://github.com/eddelbuettel/anytime/pull/107">[#107](https://github.com/eddelbuettel/anytime/issues/107)</a>, and
<a href="https://github.com/eddelbuettel/anytime/pull/108">[#108](https://github.com/eddelbuettel/anytime/issues/108)</a>).

</li>
<li>

Added <code>%e</code> format for single-digit day parsing by Boost (Dirk
addressing at least
<a href="https://github.com/eddelbuettel/anytime/issues/24">[#24](https://github.com/eddelbuettel/anytime/issues/24)</a>,
<a href="https://github.com/eddelbuettel/anytime/issues/70">[#70](https://github.com/eddelbuettel/anytime/issues/70)</a> and
<a href="https://github.com/eddelbuettel/anytime/issues/99">[#99](https://github.com/eddelbuettel/anytime/issues/99)</a>).

</li>
<li>

Expansed and updated vignette with benchmark comparisons.

</li>
<li>

Updated unit tests using <span class="pkg">tinytest</span> which remains
a pleasure to use; versioned Suggests: is now ‘\>= 1.0.0’.

</li>
</ul>

## Changes in anytime version 0.3.5 (2019-07-28)

<ul>
<li>

Fix use of <code>Rcpp::Function</code>-accessed
<code>Sys.setenv()</code>, name all arguments in call to C++ (Christoph
Sax in
<a href="https://github.com/eddelbuettel/anytime/pull/95">[#95](https://github.com/eddelbuettel/anytime/issues/95)</a>).

</li>
<li>

Relax constraint on Windows testing in several test files (Christoph Sax
in <a href="https://github.com/eddelbuettel/anytime/pull/97">[#97](https://github.com/eddelbuettel/anytime/issues/97)</a>).

</li>
<li>

Fix an issue related to <code>TZ</code> environment variable setting
(Dirk in
<a href="https://github.com/eddelbuettel/anytime/pull/101">[#101](https://github.com/eddelbuettel/anytime/issues/101)</a>).

</li>
<li>

Change <code>useR=TRUE</code> behaviour by directly calling R via
<span class="pkg">Rcpp</span> (Dirk in
<a href="https://github.com/eddelbuettel/anytime/pull/103">[#103](https://github.com/eddelbuettel/anytime/issues/103)</a>
fixing
<a href="https://github.com/eddelbuettel/anytime/issues/96">[#96](https://github.com/eddelbuettel/anytime/issues/96)</a>).

</li>
<li>

Several updates to unit testing files aiming for more robust behaviour
across platforms.

</li>
<li>

Updated documentation in manual pages, README and vignette.

</li>
</ul>

## Changes in anytime version 0.3.4 (2019-06-18)

<ul>
<li>

Documentation was updated about a ‘Europe/London’ conversion issue
(<a href="https://github.com/eddelbuettel/anytime/issues/84">[#84](https://github.com/eddelbuettel/anytime/issues/84)</a>,
inter alia).

</li>
<li>

The package is now compiled under the C++11 standard.

</li>
<li>

The package now uses <span class="pkg">tinytest</span> for unit tests.

</li>
<li>

The <code>iso8601()</code> function now places a ‘T’ between date and
time; an option switches to prior format using a space.

</li>
<li>

The vignette is now pre-made and included as-is in a Sweave document
reducing the number of suggested packages.

</li>
</ul>

## Changes in anytime version 0.3.3 (2018-11-13)

<ul>
<li>

Vignette build quirkyness on Windows resolved so vignette reinstated.

</li>
<li>

Documentation updated showing correct use of <code>anydate</code> (and
not <code>anytime</code>) on input like ‘2016010’ following the 0.3.0
release heuristic change.

</li>
<li>

Set <code>#define</code> for Boost to make compilation more quiet.

</li>
</ul>

## Changes in anytime version 0.3.2 (2018-11-05)

<ul>
<li>

Added a new vignette introducing the <span class="pkg">anytime</span>
package. Seemingly it cannot be compiled on Windows so included
prebuilt.

</li>
<li>

Some more tests for <code>anydate</code> were added along with so code
coverage tags.

</li>
<li>

The C++ code was robustified in two places to not trigger
<code>rchk</code> warnings
(<a href="https://github.com/eddelbuettel/anytime/pull/79">[#79](https://github.com/eddelbuettel/anytime/issues/79)</a>).

</li>
<li>

Three unit test files which fail on Solaris are now skipping this os as
we cannot reproduce or test on this OS
(<a href="https://github.com/eddelbuettel/anytime/pull/80">[#80](https://github.com/eddelbuettel/anytime/issues/80)</a>).

</li>
</ul>

## Changes in anytime version 0.3.1 (2018-07-03)

<ul>
<li>

Numeric input is now preserved rather than silently cast to the return
object type
(<a href="https://github.com/eddelbuettel/anytime/pull/69">[#69](https://github.com/eddelbuettel/anytime/issues/69)</a>
fixing
<a href="https://github.com/eddelbuettel/anytime/issues/68">[#68](https://github.com/eddelbuettel/anytime/issues/68)</a>).

</li>
<li>

New assertion function <code>assertDate()</code> and
<code>assertTime()</code>.

</li>
<li>

Unit tests were expanded for the new functions, for conversion from
integer as well as for <code>yyyymmdd()</code>.

</li>
</ul>

## Changes in anytime version 0.3.0 (2017-06-05)

<ul>
<li>

Numeric input is now always an offset to epoch, with
<code>anytime()</code> using seconds, and <code>anydate()</code> using
dates.
(<a href="https://github.com/eddelbuettel/anytime/pull/65">[#65](https://github.com/eddelbuettel/anytime/issues/65)</a>
fixing
<a href="https://github.com/eddelbuettel/anytime/issues/63">[#63](https://github.com/eddelbuettel/anytime/issues/63)</a>).

</li>
<li>

Old behaviour can be re-enabled with an option also supporting a global
setting <code>getOption(“anytimeOldHeuristic”)</code>

</li>
<li>

RStudio versions 1.1.129 or later can run all functions without fear of
crashing due to a change in their use of Boost.

</li>
<li>

Replaced <code>init.c</code> with registration code inside of
<code>RcppExports.cpp</code> thanks to Rcpp 0.12.11.

</li>
</ul>

## Changes in anytime version 0.2.2 (2017-03-21)

<ul>
<li>

Address corner case of integer-typed (large) values corresponding to
<code>POSIXct</code> time (PR
<a href="https://github.com/eddelbuettel/anytime/pull/57">[#57](https://github.com/eddelbuettel/anytime/issues/57)</a>
closing
<a href="https://github.com/eddelbuettel/anytime/issues/[#56](https://github.com/eddelbuettel/anytime/issues/56)">#[#56](https://github.com/eddelbuettel/anytime/issues/56)</a>)

</li>
<li>

Add special case for ‘Europe/London’ and 31 Oct 1971 BST change to avoid
a one-hour offset error
(<a href="https://github.com/eddelbuettel/anytime/pull/58">[#58](https://github.com/eddelbuettel/anytime/issues/58)</a>
fixing
<a href="https://github.com/eddelbuettel/anytime/issues/36">[#36](https://github.com/eddelbuettel/anytime/issues/36)</a> and
<a href="https://github.com/eddelbuettel/anytime/issues/51">[#51](https://github.com/eddelbuettel/anytime/issues/51)</a>)

</li>
<li>

Address another corner case of numeric values corresponding to
<code>Date</code> types which are now returned as <code>Date</code>

</li>
<li>

Added file <code>init.c</code> with calls to
<code>R_registerRoutines()</code> <code>and
R_useDynamicSymbols()</code>; already used
<code>.registration=TRUE</code> in <code>useDynLib</code> in
<code>NAMESPACE</code>

</li>
</ul>

## Changes in anytime version 0.2.1 (2017-02-09)

<ul>
<li>

The new <code>DatetimeVector</code> class from
<a href="https://CRAN.R-project.org/package=Rcpp"><span class="pkg">Rcpp</span></a>
is now used, and proper versioned Depends: have been added (PR
<a href="https://github.com/eddelbuettel/anytime/pull/43">[#43](https://github.com/eddelbuettel/anytime/issues/43)</a>)

</li>
<li>

The <code>anydate</code> and <code>utcdate</code> functions convert
again from factor and ordered (PR
<a href="https://github.com/eddelbuettel/anytime/pull/46">[#46](https://github.com/eddelbuettel/anytime/issues/46)</a>
closing
<a href="https://github.com/eddelbuettel/anytime/issues/44">[#44](https://github.com/eddelbuettel/anytime/issues/44)</a>)

</li>
<li>

A format similar to RFC 28122 but with additonal timezone text can now
be parsed (PR
<a href="https://github.com/eddelbuettel/anytime/pull/48">[#48](https://github.com/eddelbuettel/anytime/issues/48)</a>
closing
<a href="https://github.com/eddelbuettel/anytime/issues/47">[#47](https://github.com/eddelbuettel/anytime/issues/47)</a>)

</li>
<li>

Conversion from <code>POSIXt</code> to <code>Date</code> now also
respect the timezone (PR
<a href="https://github.com/eddelbuettel/anytime/pull/50">[#50](https://github.com/eddelbuettel/anytime/issues/50)</a>
closing
<a href="https://github.com/eddelbuettel/anytime/issues/49">[#49](https://github.com/eddelbuettel/anytime/issues/49)</a>)

</li>
<li>

The internal <code>.onLoad</code> functions was updated

</li>
<li>

The Travis setup uses https to fetch the run script

</li>
</ul>

## Changes in anytime version 0.2.0 (2016-12-24)

<ul>
<li>

Added (exported) helper functions iso8601(), rfc2822() and rfc3339() to
format date(time) objects according to standards

</li>
<li>

Conversion to dates is now more robust thanks to improved internal
processing (PR
<a href="https://github.com/eddelbuettel/anytime/pull/39">[#39](https://github.com/eddelbuettel/anytime/issues/39)</a>
closing
<a href="https://github.com/eddelbuettel/anytime/issues/36">[#36](https://github.com/eddelbuettel/anytime/issues/36)</a>)

</li>
<li>

The ISO 8601 format is now recognised, however the timezone information
is not parsed by Boost Date_Time (which is a known upstream limitation)
(PR <a href="https://github.com/eddelbuettel/anytime/pull/38">[#38](https://github.com/eddelbuettel/anytime/issues/38)</a>
closing
<a href="https://github.com/eddelbuettel/anytime/issues/37">[#37](https://github.com/eddelbuettel/anytime/issues/37)</a>)

</li>
<li>

The ‘allFormats.R’ test script was significantly strengthened
(<a href="https://github.com/eddelbuettel/anytime/pull/40">[#40](https://github.com/eddelbuettel/anytime/issues/40)</a>)

</li>
<li>

Test scripts like ‘simpleTests.R’ have as also been strengthened
(<a href="https://github.com/eddelbuettel/anytime/pull/41">[#41](https://github.com/eddelbuettel/anytime/issues/41)</a>); on
Windows and in one file two tests need to be skipped.

</li>
<li>

A new ‘bulkTest.R’ test script was added testing parsing against what R
returns

</li>
</ul>

## Changes in anytime version 0.1.2 (2016-12-13)

<ul>
<li>

The (internal) string processing and splitting now uses Boost algorithm
functions which avoids a (bizarre) bug on Windows.
(<a href="https://github.com/eddelbuettel/anytime/issues/33">[#33](https://github.com/eddelbuettel/anytime/issues/33)</a>)

</li>
<li>

Test coverage was increased.

</li>
</ul>

## Changes in anytime version 0.1.1 (2016-11-27)

<ul>
<li>

Both <code>anydate()</code> and <code>utcdate()</code> no longer attempt
to convert an input value that is already of type <code>Date</code>.

</li>
<li>

The string splitter (needed for the ‘all-digits’ formats extending Boost
Date_time) is now more defensive about the input argument and more
robust. Thanks to Bob Jansen for the heads-up (PR
<a href="https://github.com/eddelbuettel/anytime/pull/30">[#30](https://github.com/eddelbuettel/anytime/issues/30)</a>
closing issue
<a href="https://github.com/eddelbuettel/anytime/issues/29">[#29](https://github.com/eddelbuettel/anytime/issues/29)</a>).

</li>
<li>

Code coverage reporting has been added (PR
<a href="https://github.com/eddelbuettel/anytime/pull/31">[#31](https://github.com/eddelbuettel/anytime/issues/31)</a>).

</li>
</ul>

## Changes in anytime version 0.1.0 (2016-11-06)

<ul>
<li>

New functions <code>utctime()</code> and <code>utcdate()</code> were
added to parse input as coordinated universal time; the functionality is
also available in <code>anytime()</code> and <code>anydate()</code> via
a new argument <code>asUTC</code> (PR
<a href="https://github.com/eddelbuettel/anytime/pull/22">[#22](https://github.com/eddelbuettel/anytime/issues/22)</a>)

</li>
<li>

New (date)time format for RFC822-alike dates, and expanded existing
datetime formats to all support fractional seconds (PR
<a href="https://github.com/eddelbuettel/anytime/pull/21">[#21](https://github.com/eddelbuettel/anytime/issues/21)</a>)

</li>
<li>

Extended functionality to support not only ‘YYYYMMDD’ (without a
separator, and not covered by Boost) but also with ‘HHMM’, ‘HHMMSS’ and
‘HHMMSS.ffffff’ (PR
<a href="https://github.com/eddelbuettel/anytime/pull/30">[#30](https://github.com/eddelbuettel/anytime/issues/30)</a> fixing
issue
<a href="https://github.com/eddelbuettel/anytime/issues/29">[#29](https://github.com/eddelbuettel/anytime/issues/29)</a>)

</li>
<li>

Extended functionality to support ‘HHMMSS\[.ffffff\]’ following other
date formats.

</li>
<li>

Documentation and tests have been expanded; typos corrected

</li>
<li>

New (unexported) helper functions <code>setTZ</code>,
<code>testOutput</code>, <code>setDebug</code>

</li>
<li>

The <code>testFormat</code> (and <code>testOutput</code>) functions
cannot be called under RStudio (PR
<a href="https://github.com/eddelbuettel/anytime/pull/27">[#27](https://github.com/eddelbuettel/anytime/issues/27)</a> fixing
issue
<a href="https://github.com/eddelbuettel/anytime/issues/25">[#25](https://github.com/eddelbuettel/anytime/issues/25)</a>).

</li>
<li>

More robust support for non-finite values such as <code>NA</code>,
<code>NaN</code> or <code>Inf</code> (Fixing issue
<a href="https://github.com/eddelbuettel/anytime/issues/16">[#16](https://github.com/eddelbuettel/anytime/issues/16)</a>)

</li>
</ul>

## Changes in anytime version 0.0.4 (2016-10-20)

<ul>
<li>

Before converting via <code>lexical_cast</code>, assign to atomic type
via template logic to avoid an UBSAN issue (PR
<a href="https://github.com/eddelbuettel/anytime/pull/15">[#15](https://github.com/eddelbuettel/anytime/issues/15)</a>
closing issue
<a href="https://github.com/eddelbuettel/anytime/issues/14">[#14](https://github.com/eddelbuettel/anytime/issues/14)</a>)

</li>
<li>

More robust initialization and timezone information gathering.

</li>
<li>

More robust processing of non-finite input also coping with non-finite
values such as <code>NA</code>, <code>NaN</code> and <code>Inf</code>
which all return <code>NA</code>

</li>
<li>

Allow numeric <code>POSIXt</code> representation on input, also creating
proper <code>POSIXct</code> (or, if requested, <code>Date</code>)

</li>
</ul>

## Changes in anytime version 0.0.3 (2016-10-13)

<ul>
<li>

Added (non-exported) helper function <code>testFormat()</code>

</li>
<li>

Do not access <code>tm_isdst</code> on Windows for dates before the
epoch (pull request
<a href="https://github.com/eddelbuettel/anytime/pull/13">[#13](https://github.com/eddelbuettel/anytime/issues/13)</a> fixing
issue
<a href="https://github.com/eddelbuettel/anytime/issues/12">[#12](https://github.com/eddelbuettel/anytime/issues/12)</a>);
added test as well

</li>
</ul>

## Changes in anytime version 0.0.2 (2016-09-15)

<ul>
<li>

Refactored to use a simple class wrapped around two vector with (string)
formats and locales; this allow for adding formats; also adds accessor
for formats
(<a href="https://github.com/eddelbuettel/anytime/pull/4">[#4](https://github.com/eddelbuettel/anytime/issues/4)</a>, closes
<a href="https://github.com/eddelbuettel/anytime/issues/1">[#1](https://github.com/eddelbuettel/anytime/issues/1)</a> and
<a href="https://github.com/eddelbuettel/anytime/issues/3">[#3](https://github.com/eddelbuettel/anytime/issues/3)</a>).

</li>
<li>

New function <code>addFormats()</code> and <code>getFormats()</code>.

</li>
<li>

Relaxed one tests which showed problems on some platforms.

</li>
<li>

Added <code>as.POSIXlt()</code> step to <code>anydate()</code> ensuring
all <code>POSIXlt</code> components are set
(<a href="https://github.com/eddelbuettel/anytime/pull/6">[#6](https://github.com/eddelbuettel/anytime/issues/6)</a> fixing
<a href="https://github.com/eddelbuettel/anytime/issues/5">[#5](https://github.com/eddelbuettel/anytime/issues/5)</a>).

</li>
</ul>

## Changes in anytime version 0.0.1 (2016-09-12)

<ul>
<li>

Initial release with <code>anytime()</code> and <code>anydate</code>

</li>
</ul>