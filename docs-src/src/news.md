### Version 0.3.9 (2020-08-26)

-   Skip one test file that is impossible to run across different CRAN
    setups, and life is definitely too short for these games.

-   Change remaining http:// to https:// because, well, you know.

### Version 0.3.8 (2020-07-23)

-   A small utility function was added to detect the Linux distribution
    used in order to fine-tune tests once more.

-   Travis now uses Ubuntu \'bionic\' and R 4.0.\*.

### Version 0.3.7 (2020-01-20)

-   Test and possibly condition away one more test file.

-   Small enhancement for compilation by setting `no-rtti` define via
    Rcpp.

-   New option `calcUnique` for speed-up by parseing only unique
    timestamps (Stephen Froehlich in
    [\#110](https://github.com/eddelbuettel/anytime/pull/110) fixing
    [\#109](https://github.com/eddelbuettel/anytime/pull/109)).

### Version 0.3.6 (2019-08-29)

-   Added, and then removed, required file for JOSS; added \'unworthy\'
    badge as we earned a desk reject (cf \#1605 there).

-   Renamed internal helper function format() to fmt() to avoid clashes
    with base::format() (Dirk in
    [\#104](https://github.com/eddelbuettel/anytime/pull/104)).

-   Use S3 dispatch and generics for key functions (Dirk in
    [\#106](https://github.com/eddelbuettel/anytime/pull/106)).

-   Continued to tweak tests as we find some of the rhub platform to
    behave strangely (Dirk via commits,
    [\#107](https://github.com/eddelbuettel/anytime/pull/107), and
    [\#108](https://github.com/eddelbuettel/anytime/pull/108)).

-   Added `%e` format for single-digit day parsing by Boost (Dirk
    addressing at least
    [\#24](https://github.com/eddelbuettel/anytime/issues/24),
    [\#70](https://github.com/eddelbuettel/anytime/issues/70) and
    [\#99](https://github.com/eddelbuettel/anytime/issues/99)).

-   Expansed and updated vignette with benchmark comparisons.

-   Updated unit tests using `tinytest` which remains a pleasure to use;
    versioned Suggests: is now \'\>= 1.0.0\'.

### Version 0.3.5 (2019-07-28)

-   Fix use of `Rcpp::Function`-accessed `Sys.setenv()`, name all
    arguments in call to C++ (Christoph Sax in
    [\#95](https://github.com/eddelbuettel/anytime/pull/95)).

-   Relax constraint on Windows testing in several test files (Christoph
    Sax in [\#97](https://github.com/eddelbuettel/anytime/pull/97)).

-   Fix an issue related to `TZ` environment variable setting (Dirk in
    [\#101](https://github.com/eddelbuettel/anytime/pull/101)).

-   Change `useR=TRUE` behaviour by directly calling R via `Rcpp` (Dirk
    in [\#103](https://github.com/eddelbuettel/anytime/pull/103) fixing
    [\#96](https://github.com/eddelbuettel/anytime/issues/96)).

-   Several updates to unit testing files aiming for more robust
    behaviour across platforms.

-   Updated documentation in manual pages, README and vignette.

### Version 0.3.4 (2019-06-18)

-   Documentation was updated about a \'Europe/London\' conversion issue
    ([\#84](https://github.com/eddelbuettel/anytime/issues/84), inter
    alia).

-   The package is now compiled under the C++11 standard.

-   The package now uses `tinytest` for unit tests.

-   The `iso8601()` function now places a 'T' between date and time; an
    option switches to prior format using a space.

-   The vignette is now pre-made and included as-is in a Sweave document
    reducing the number of suggested packages.

### Version 0.3.3 (2018-11-13)

-   Vignette build quirkyness on Windows resolved so vignette
    reinstated.

-   Documentation updated showing correct use of `anydate` (and not
    `anytime`) on input like '2016010' following the 0.3.0 release
    heuristic change.

-   Set `#define` for Boost to make compilation more quiet.

### Version 0.3.2 (2018-11-05)

-   Added a new vignette introducing the `anytime` package. Seemingly it
    cannot be compiled on Windows so included prebuilt.

-   Some more tests for `anydate` were added along with so code coverage
    tags.

-   The C++ code was robustified in two places to not trigger `rchk`
    warnings ([\#79](https://github.com/eddelbuettel/anytime/pull/79)).

-   Three unit test files which fail on Solaris are now skipping this os
    as we cannot reproduce or test on this OS
    ([\#80](https://github.com/eddelbuettel/anytime/pull/80)).

### Version 0.3.1 (2018-07-03)

-   Numeric input is now preserved rather than silently cast to the
    return object type
    ([\#69](https://github.com/eddelbuettel/anytime/pull/69) fixing
    [\#68](https://github.com/eddelbuettel/anytime/issues/68)).

-   New assertion function `assertDate()` and `assertTime()`.

-   Unit tests were expanded for the new functions, for conversion from
    integer as well as for `yyyymmdd()`.

### Version 0.3.0 (2017-06-05)

-   Numeric input is now always an offset to epoch, with `anytime()`
    using seconds, and `anydate()` using dates.
    ([\#65](https://github.com/eddelbuettel/anytime/pull/65) fixing
    [\#63](https://github.com/eddelbuettel/anytime/issues/63)).

-   Old behaviour can be re-enabled with an option also supporting a
    global setting `getOption("anytimeOldHeuristic")`

-   RStudio versions 1.1.129 or later can run all functions without fear
    of crashing due to a change in their use of Boost.

-   Replaced `init.c` with registration code inside of `RcppExports.cpp`
    thanks to Rcpp 0.12.11.

### Version 0.2.2 (2017-03-21)

-   Address corner case of integer-typed (large) values corresponding to
    `POSIXct` time (PR
    [\#57](https://github.com/eddelbuettel/anytime/pull/57) closing
    [\#\#56](https://github.com/eddelbuettel/anytime/issues/#56))

-   Add special case for 'Europe/London' and 31 Oct 1971 BST change to
    avoid a one-hour offset error
    ([\#58](https://github.com/eddelbuettel/anytime/pull/58) fixing
    [\#36](https://github.com/eddelbuettel/anytime/issues/36) and
    [\#51](https://github.com/eddelbuettel/anytime/issues/51))

-   Address another corner case of numeric values corresponding to
    `Date` types which are now returned as `Date`

-   Added file `init.c` with calls to `R_registerRoutines()`
    `and R_useDynamicSymbols()`; already used `.registration=TRUE` in
    `useDynLib` in `NAMESPACE`

### Version 0.2.1 (2017-02-09)

-   The new `DatetimeVector` class from
    [[Rcpp]{.pkg}](https://CRAN.R-project.org/package=Rcpp) is now used,
    and proper versioned Depends: have been added (PR
    [\#43](https://github.com/eddelbuettel/anytime/pull/43))

-   The `anydate` and `utcdate` functions convert again from factor and
    ordered (PR [\#46](https://github.com/eddelbuettel/anytime/pull/46)
    closing [\#44](https://github.com/eddelbuettel/anytime/issues/44))

-   A format similar to RFC 28122 but with additonal timezone text can
    now be parsed (PR
    [\#48](https://github.com/eddelbuettel/anytime/pull/48) closing
    [\#47](https://github.com/eddelbuettel/anytime/issues/47))

-   Conversion from `POSIXt` to `Date` now also respect the timezone (PR
    [\#50](https://github.com/eddelbuettel/anytime/pull/50) closing
    [\#49](https://github.com/eddelbuettel/anytime/issues/49))

-   The internal `.onLoad` functions was updated

-   The Travis setup uses https to fetch the run script

### Version 0.2.0 (2016-12-24)

-   Added (exported) helper functions iso8601(), rfc2822() and rfc3339()
    to format date(time) objects according to standards

-   Conversion to dates is now more robust thanks to improved internal
    processing (PR
    [\#39](https://github.com/eddelbuettel/anytime/pull/39) closing
    [\#36](https://github.com/eddelbuettel/anytime/issues/36))

-   The ISO 8601 format is now recognised, however the timezone
    information is not parsed by Boost Date\_Time (which is a known
    upstream limitation) (PR
    [\#38](https://github.com/eddelbuettel/anytime/pull/38) closing
    [\#37](https://github.com/eddelbuettel/anytime/issues/37))

-   The \'allFormats.R\' test script was significantly strengthened
    ([\#40](https://github.com/eddelbuettel/anytime/pull/40))

-   Test scripts like \'simpleTests.R\' have as also been strengthened
    ([\#41](https://github.com/eddelbuettel/anytime/pull/41)); on
    Windows and in one file two tests need to be skipped.

-   A new \'bulkTest.R\' test script was added testing parsing against
    what R returns

### Version 0.1.2 (2016-12-13)

-   The (internal) string processing and splitting now uses Boost
    algorithm functions which avoids a (bizarre) bug on Windows.
    ([\#33](https://github.com/eddelbuettel/anytime/issues/33))

-   Test coverage was increased.

### Version 0.1.1 (2016-11-27)

-   Both `anydate()` and `utcdate()` no longer attempt to convert an
    input value that is already of type `Date`.

-   The string splitter (needed for the \'all-digits\' formats extending
    Boost Date\_time) is now more defensive about the input argument and
    more robust. Thanks to Bob Jansen for the heads-up (PR
    [\#30](https://github.com/eddelbuettel/anytime/pull/30) closing
    issue [\#29](https://github.com/eddelbuettel/anytime/issues/29)).

-   Code coverage reporting has been added (PR
    [\#31](https://github.com/eddelbuettel/anytime/pull/31)).

### Version 0.1.0 (2016-11-06)

-   New functions `utctime()` and `utcdate()` were added to parse input
    as coordinated universal time; the functionality is also available
    in `anytime()` and `anydate()` via a new argument `asUTC` (PR
    [\#22](https://github.com/eddelbuettel/anytime/pull/22))

-   New (date)time format for RFC822-alike dates, and expanded existing
    datetime formats to all support fractional seconds (PR
    [\#21](https://github.com/eddelbuettel/anytime/pull/21))

-   Extended functionality to support not only 'YYYYMMDD' (without a
    separator, and not covered by Boost) but also with 'HHMM', 'HHMMSS'
    and 'HHMMSS.ffffff' (PR
    [\#30](https://github.com/eddelbuettel/anytime/pull/30) fixing issue
    [\#29](https://github.com/eddelbuettel/anytime/issues/29))

-   Extended functionality to support 'HHMMSS\[.ffffff\]' following
    other date formats.

-   Documentation and tests have been expanded; typos corrected

-   New (unexported) helper functions `setTZ`, `testOutput`, `setDebug`

-   The `testFormat` (and `testOutput`) functions cannot be called under
    RStudio (PR [\#27](https://github.com/eddelbuettel/anytime/pull/27)
    fixing issue
    [\#25](https://github.com/eddelbuettel/anytime/issues/25)).

-   More robust support for non-finite values such as `NA`, `NaN` or
    `Inf` (Fixing issue
    [\#16](https://github.com/eddelbuettel/anytime/issues/16))

### Version 0.0.4 (2016-10-20)

-   Before converting via `lexical_cast`, assign to atomic type via
    template logic to avoid an UBSAN issue (PR
    [\#15](https://github.com/eddelbuettel/anytime/pull/15) closing
    issue [\#14](https://github.com/eddelbuettel/anytime/issues/14))

-   More robust initialization and timezone information gathering.

-   More robust processing of non-finite input also coping with
    non-finite values such as `NA`, `NaN` and `Inf` which all return
    `NA`

-   Allow numeric `POSIXt` representation on input, also creating proper
    `POSIXct` (or, if requested, `Date`)

### Version 0.0.3 (2016-10-13)

-   Added (non-exported) helper function `testFormat()`

-   Do not access `tm_isdst` on Windows for dates before the epoch (pull
    request [\#13](https://github.com/eddelbuettel/anytime/pull/13)
    fixing issue
    [\#12](https://github.com/eddelbuettel/anytime/issues/12)); added
    test as well

### Version 0.0.2 (2016-09-15)

-   Refactored to use a simple class wrapped around two vector with
    (string) formats and locales; this allow for adding formats; also
    adds accessor for formats
    ([\#4](https://github.com/eddelbuettel/anytime/pull/4), closes
    [\#1](https://github.com/eddelbuettel/anytime/issues/1) and
    [\#3](https://github.com/eddelbuettel/anytime/issues/3)).

-   New function `addFormats()` and `getFormats()`.

-   Relaxed one tests which showed problems on some platforms.

-   Added `as.POSIXlt()` step to `anydate()` ensuring all `POSIXlt`
    components are set
    ([\#6](https://github.com/eddelbuettel/anytime/pull/6) fixing
    [\#5](https://github.com/eddelbuettel/anytime/issues/5)).

### Version 0.0.1 (2016-09-12)

-   Initial release with `anytime()` and `anydate`
