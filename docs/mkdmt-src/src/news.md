<div class="container">
<div role="main">
<h3 id="version-0.3.10-2024-12-02">Version 0.3.10 (2024-12-02)</h3>
<ul>
<li><p>A new documentation site was added.</p></li>
<li><p>Continuous Integration now uses <code>run.sh</code> from
<code>r-ci</code> with <code>bspm</code></p></li>
<li><p>Logical input vectors are now recognised as an error (<a
href="https://github.com/eddelbuettel/anytime/issues/121">#121</a>)</p></li>
<li><p>Additional dot-separated format '</p></li>
<li><p>Other small updates were made throughout the package</p></li>
<li><p>No longer set a C++ compilation standard as the default choices
by R are sufficient for the package</p></li>
<li><p>Switch Rcpp include file to Rcpp/Lightest</p></li>
<li><p>We recommend <code>~/.R/Makevars</code> compiler flag options
<code>-Wno-ignored-attributes -Wno-nonnull -Wno-parentheses</code></p></li>
<li><p>The <code>tinytest</code> runner was simplified</p></li>
<li><p><code>NA</code> values from conversion now trigger a
warning</p></li>
</ul>
<h3 id="version-0.3.9-2020-08-26">Version 0.3.9 (2020-08-26)</h3>
<ul>
<li><p>Skip one test file that is impossible to run across different
CRAN setups, and life is definitely too short for these games.</p></li>
<li><p>Change remaining http:// to https:// because, well, you
know.</p></li>
</ul>
<h3 id="version-0.3.8-2020-07-23">Version 0.3.8 (2020-07-23)</h3>
<ul>
<li><p>A small utility function was added to detect the Linux
distribution used in order to fine-tune tests once more.</p></li>
<li><p>Travis now uses Ubuntu 'bionic' and R 4.0.*.</p></li>
</ul>
<h3 id="version-0.3.7-2020-01-20">Version 0.3.7 (2020-01-20)</h3>
<ul>
<li><p>Test and possibly condition away one more test file.</p></li>
<li><p>Small enhancement for compilation by setting <code>no-rtti</code>
define via Rcpp.</p></li>
<li><p>New option <code>calcUnique</code> for speed-up by parseing only
unique timestamps (Stephen Froehlich in <a
href="https://github.com/eddelbuettel/anytime/pull/110">#110</a> fixing
<a
href="https://github.com/eddelbuettel/anytime/pull/109">#109</a>).</p></li>
</ul>
<h3 id="version-0.3.6-2019-08-29">Version 0.3.6 (2019-08-29)</h3>
<ul>
<li><p>Added, and then removed, required file for JOSS; added 'unworthy'
badge as we earned a desk reject (cf #1605 there).</p></li>
<li><p>Renamed internal helper function format() to fmt() to avoid
clashes with base::format() (Dirk in <a
href="https://github.com/eddelbuettel/anytime/pull/104">#104</a>).</p></li>
<li><p>Use S3 dispatch and generics for key functions (Dirk in <a
href="https://github.com/eddelbuettel/anytime/pull/106">#106</a>).</p></li>
<li><p>Continued to tweak tests as we find some of the rhub platform to
behave strangely (Dirk via commits, <a
href="https://github.com/eddelbuettel/anytime/pull/107">#107</a>, and <a
href="https://github.com/eddelbuettel/anytime/pull/108">#108</a>).</p></li>
<li><p>Added <code>%e</code> format for single-digit day parsing by
Boost (Dirk addressing at least <a
href="https://github.com/eddelbuettel/anytime/issues/24">#24</a>, <a
href="https://github.com/eddelbuettel/anytime/issues/70">#70</a> and <a
href="https://github.com/eddelbuettel/anytime/issues/99">#99</a>).</p></li>
<li><p>Expansed and updated vignette with benchmark
comparisons.</p></li>
<li><p>Updated unit tests using <code>tinytest</code> which remains a
pleasure to use; versioned Suggests: is now '&gt;= 1.0.0'.</p></li>
</ul>
<h3 id="version-0.3.5-2019-07-28">Version 0.3.5 (2019-07-28)</h3>
<ul>
<li><p>Fix use of <code>Rcpp::Function</code>-accessed
<code>Sys.setenv()</code>, name all arguments in call to C++ (Christoph
Sax in <a
href="https://github.com/eddelbuettel/anytime/pull/95">#95</a>).</p></li>
<li><p>Relax constraint on Windows testing in several test files
(Christoph Sax in <a
href="https://github.com/eddelbuettel/anytime/pull/97">#97</a>).</p></li>
<li><p>Fix an issue related to <code>TZ</code> environment variable
setting (Dirk in <a
href="https://github.com/eddelbuettel/anytime/pull/101">#101</a>).</p></li>
<li><p>Change <code>useR=TRUE</code> behaviour by directly calling R via
<code>Rcpp</code> (Dirk in <a
href="https://github.com/eddelbuettel/anytime/pull/103">#103</a> fixing
<a
href="https://github.com/eddelbuettel/anytime/issues/96">#96</a>).</p></li>
<li><p>Several updates to unit testing files aiming for more robust
behaviour across platforms.</p></li>
<li><p>Updated documentation in manual pages, README and
vignette.</p></li>
</ul>
<h3 id="version-0.3.4-2019-06-18">Version 0.3.4 (2019-06-18)</h3>
<ul>
<li><p>Documentation was updated about a 'Europe/London' conversion
issue (<a
href="https://github.com/eddelbuettel/anytime/issues/84">#84</a>, inter
alia).</p></li>
<li><p>The package is now compiled under the C++11 standard.</p></li>
<li><p>The package now uses <code>tinytest</code> for unit
tests.</p></li>
<li><p>The <code>iso8601()</code> function now places a ‘T’ between date
and time; an option switches to prior format using a space.</p></li>
<li><p>The vignette is now pre-made and included as-is in a Sweave
document reducing the number of suggested packages.</p></li>
</ul>
<h3 id="version-0.3.3-2018-11-13">Version 0.3.3 (2018-11-13)</h3>
<ul>
<li><p>Vignette build quirkyness on Windows resolved so vignette
reinstated.</p></li>
<li><p>Documentation updated showing correct use of <code>anydate</code>
(and not <code>anytime</code>) on input like ‘2016010’ following the
0.3.0 release heuristic change.</p></li>
<li><p>Set <code>#define</code> for Boost to make compilation more
quiet.</p></li>
</ul>
<h3 id="version-0.3.2-2018-11-05">Version 0.3.2 (2018-11-05)</h3>
<ul>
<li><p>Added a new vignette introducing the <code>anytime</code>
package. Seemingly it cannot be compiled on Windows so included
prebuilt.</p></li>
<li><p>Some more tests for <code>anydate</code> were added along with so
code coverage tags.</p></li>
<li><p>The C++ code was robustified in two places to not trigger
<code>rchk</code> warnings (<a
href="https://github.com/eddelbuettel/anytime/pull/79">#79</a>).</p></li>
<li><p>Three unit test files which fail on Solaris are now skipping this
os as we cannot reproduce or test on this OS (<a
href="https://github.com/eddelbuettel/anytime/pull/80">#80</a>).</p></li>
</ul>
<h3 id="version-0.3.1-2018-07-03">Version 0.3.1 (2018-07-03)</h3>
<ul>
<li><p>Numeric input is now preserved rather than silently cast to the
return object type (<a
href="https://github.com/eddelbuettel/anytime/pull/69">#69</a> fixing <a
href="https://github.com/eddelbuettel/anytime/issues/68">#68</a>).</p></li>
<li><p>New assertion function <code>assertDate()</code> and
<code>assertTime()</code>.</p></li>
<li><p>Unit tests were expanded for the new functions, for conversion
from integer as well as for <code>yyyymmdd()</code>.</p></li>
</ul>
<h3 id="version-0.3.0-2017-06-05">Version 0.3.0 (2017-06-05)</h3>
<ul>
<li><p>Numeric input is now always an offset to epoch, with
<code>anytime()</code> using seconds, and <code>anydate()</code> using
dates. (<a
href="https://github.com/eddelbuettel/anytime/pull/65">#65</a> fixing <a
href="https://github.com/eddelbuettel/anytime/issues/63">#63</a>).</p></li>
<li><p>Old behaviour can be re-enabled with an option also supporting a
global setting <code>getOption("anytimeOldHeuristic")</code></p></li>
<li><p>RStudio versions 1.1.129 or later can run all functions without
fear of crashing due to a change in their use of Boost.</p></li>
<li><p>Replaced <code>init.c</code> with registration code inside of
<code>RcppExports.cpp</code> thanks to Rcpp 0.12.11.</p></li>
</ul>
<h3 id="version-0.2.2-2017-03-21">Version 0.2.2 (2017-03-21)</h3>
<ul>
<li><p>Address corner case of integer-typed (large) values corresponding
to <code>POSIXct</code> time (PR <a
href="https://github.com/eddelbuettel/anytime/pull/57">#57</a> closing
<a
href="https://github.com/eddelbuettel/anytime/issues/#56">##56</a>)</p></li>
<li><p>Add special case for ‘Europe/London’ and 31 Oct 1971 BST change
to avoid a one-hour offset error (<a
href="https://github.com/eddelbuettel/anytime/pull/58">#58</a> fixing <a
href="https://github.com/eddelbuettel/anytime/issues/36">#36</a> and <a
href="https://github.com/eddelbuettel/anytime/issues/51">#51</a>)</p></li>
<li><p>Address another corner case of numeric values corresponding to
<code>Date</code> types which are now returned as
<code>Date</code></p></li>
<li><p>Added file <code>init.c</code> with calls to
<code>R_registerRoutines()</code>
<code>and R_useDynamicSymbols()</code>; already used
<code>.registration=TRUE</code> in <code>useDynLib</code> in
<code>NAMESPACE</code></p></li>
</ul>
<h3 id="version-0.2.1-2017-02-09">Version 0.2.1 (2017-02-09)</h3>
<ul>
<li><p>The new <code>DatetimeVector</code> class from <a
href="https://CRAN.R-project.org/package=Rcpp"><span
class="pkg">Rcpp</span></a> is now used, and proper versioned Depends:
have been added (PR <a
href="https://github.com/eddelbuettel/anytime/pull/43">#43</a>)</p></li>
<li><p>The <code>anydate</code> and <code>utcdate</code> functions
convert again from factor and ordered (PR <a
href="https://github.com/eddelbuettel/anytime/pull/46">#46</a> closing
<a
href="https://github.com/eddelbuettel/anytime/issues/44">#44</a>)</p></li>
<li><p>A format similar to RFC 28122 but with additonal timezone text
can now be parsed (PR <a
href="https://github.com/eddelbuettel/anytime/pull/48">#48</a> closing
<a
href="https://github.com/eddelbuettel/anytime/issues/47">#47</a>)</p></li>
<li><p>Conversion from <code>POSIXt</code> to <code>Date</code> now also
respect the timezone (PR <a
href="https://github.com/eddelbuettel/anytime/pull/50">#50</a> closing
<a
href="https://github.com/eddelbuettel/anytime/issues/49">#49</a>)</p></li>
<li><p>The internal <code>.onLoad</code> functions was updated</p></li>
<li><p>The Travis setup uses https to fetch the run script</p></li>
</ul>
<h3 id="version-0.2.0-2016-12-24">Version 0.2.0 (2016-12-24)</h3>
<ul>
<li><p>Added (exported) helper functions iso8601(), rfc2822() and
rfc3339() to format date(time) objects according to standards</p></li>
<li><p>Conversion to dates is now more robust thanks to improved
internal processing (PR <a
href="https://github.com/eddelbuettel/anytime/pull/39">#39</a> closing
<a
href="https://github.com/eddelbuettel/anytime/issues/36">#36</a>)</p></li>
<li><p>The ISO 8601 format is now recognised, however the timezone
information is not parsed by Boost Date_Time (which is a known upstream
limitation) (PR <a
href="https://github.com/eddelbuettel/anytime/pull/38">#38</a> closing
<a
href="https://github.com/eddelbuettel/anytime/issues/37">#37</a>)</p></li>
<li><p>The 'allFormats.R' test script was significantly strengthened (<a
href="https://github.com/eddelbuettel/anytime/pull/40">#40</a>)</p></li>
<li><p>Test scripts like 'simpleTests.R' have as also been strengthened
(<a href="https://github.com/eddelbuettel/anytime/pull/41">#41</a>); on
Windows and in one file two tests need to be skipped.</p></li>
<li><p>A new 'bulkTest.R' test script was added testing parsing against
what R returns</p></li>
</ul>
<h3 id="version-0.1.2-2016-12-13">Version 0.1.2 (2016-12-13)</h3>
<ul>
<li><p>The (internal) string processing and splitting now uses Boost
algorithm functions which avoids a (bizarre) bug on Windows. (<a
href="https://github.com/eddelbuettel/anytime/issues/33">#33</a>)</p></li>
<li><p>Test coverage was increased.</p></li>
</ul>
<h3 id="version-0.1.1-2016-11-27">Version 0.1.1 (2016-11-27)</h3>
<ul>
<li><p>Both <code>anydate()</code> and <code>utcdate()</code> no longer
attempt to convert an input value that is already of type
<code>Date</code>.</p></li>
<li><p>The string splitter (needed for the 'all-digits' formats
extending Boost Date_time) is now more defensive about the input
argument and more robust. Thanks to Bob Jansen for the heads-up (PR <a
href="https://github.com/eddelbuettel/anytime/pull/30">#30</a> closing
issue <a
href="https://github.com/eddelbuettel/anytime/issues/29">#29</a>).</p></li>
<li><p>Code coverage reporting has been added (PR <a
href="https://github.com/eddelbuettel/anytime/pull/31">#31</a>).</p></li>
</ul>
<h3 id="version-0.1.0-2016-11-06">Version 0.1.0 (2016-11-06)</h3>
<ul>
<li><p>New functions <code>utctime()</code> and <code>utcdate()</code>
were added to parse input as coordinated universal time; the
functionality is also available in <code>anytime()</code> and
<code>anydate()</code> via a new argument <code>asUTC</code> (PR <a
href="https://github.com/eddelbuettel/anytime/pull/22">#22</a>)</p></li>
<li><p>New (date)time format for RFC822-alike dates, and expanded
existing datetime formats to all support fractional seconds (PR <a
href="https://github.com/eddelbuettel/anytime/pull/21">#21</a>)</p></li>
<li><p>Extended functionality to support not only ‘YYYYMMDD’ (without a
separator, and not covered by Boost) but also with ‘HHMM’, ‘HHMMSS’ and
‘HHMMSS.ffffff’ (PR <a
href="https://github.com/eddelbuettel/anytime/pull/30">#30</a> fixing
issue <a
href="https://github.com/eddelbuettel/anytime/issues/29">#29</a>)</p></li>
<li><p>Extended functionality to support ‘HHMMSS[.ffffff]’ following
other date formats.</p></li>
<li><p>Documentation and tests have been expanded; typos
corrected</p></li>
<li><p>New (unexported) helper functions <code>setTZ</code>,
<code>testOutput</code>, <code>setDebug</code></p></li>
<li><p>The <code>testFormat</code> (and <code>testOutput</code>)
functions cannot be called under RStudio (PR <a
href="https://github.com/eddelbuettel/anytime/pull/27">#27</a> fixing
issue <a
href="https://github.com/eddelbuettel/anytime/issues/25">#25</a>).</p></li>
<li><p>More robust support for non-finite values such as
<code>NA</code>, <code>NaN</code> or <code>Inf</code> (Fixing issue <a
href="https://github.com/eddelbuettel/anytime/issues/16">#16</a>)</p></li>
</ul>
<h3 id="version-0.0.4-2016-10-20">Version 0.0.4 (2016-10-20)</h3>
<ul>
<li><p>Before converting via <code>lexical_cast</code>, assign to atomic
type via template logic to avoid an UBSAN issue (PR <a
href="https://github.com/eddelbuettel/anytime/pull/15">#15</a> closing
issue <a
href="https://github.com/eddelbuettel/anytime/issues/14">#14</a>)</p></li>
<li><p>More robust initialization and timezone information
gathering.</p></li>
<li><p>More robust processing of non-finite input also coping with
non-finite values such as <code>NA</code>, <code>NaN</code> and
<code>Inf</code> which all return <code>NA</code></p></li>
<li><p>Allow numeric <code>POSIXt</code> representation on input, also
creating proper <code>POSIXct</code> (or, if requested,
<code>Date</code>)</p></li>
</ul>
<h3 id="version-0.0.3-2016-10-13">Version 0.0.3 (2016-10-13)</h3>
<ul>
<li><p>Added (non-exported) helper function
<code>testFormat()</code></p></li>
<li><p>Do not access <code>tm_isdst</code> on Windows for dates before
the epoch (pull request <a
href="https://github.com/eddelbuettel/anytime/pull/13">#13</a> fixing
issue <a
href="https://github.com/eddelbuettel/anytime/issues/12">#12</a>); added
test as well</p></li>
</ul>
<h3 id="version-0.0.2-2016-09-15">Version 0.0.2 (2016-09-15)</h3>
<ul>
<li><p>Refactored to use a simple class wrapped around two vector with
(string) formats and locales; this allow for adding formats; also adds
accessor for formats (<a
href="https://github.com/eddelbuettel/anytime/pull/4">#4</a>, closes <a
href="https://github.com/eddelbuettel/anytime/issues/1">#1</a> and <a
href="https://github.com/eddelbuettel/anytime/issues/3">#3</a>).</p></li>
<li><p>New function <code>addFormats()</code> and
<code>getFormats()</code>.</p></li>
<li><p>Relaxed one tests which showed problems on some
platforms.</p></li>
<li><p>Added <code>as.POSIXlt()</code> step to <code>anydate()</code>
ensuring all <code>POSIXlt</code> components are set (<a
href="https://github.com/eddelbuettel/anytime/pull/6">#6</a> fixing <a
href="https://github.com/eddelbuettel/anytime/issues/5">#5</a>).</p></li>
</ul>
<h3 id="version-0.0.1-2016-09-12">Version 0.0.1 (2016-09-12)</h3>
<ul>
<li><p>Initial release with <code>anytime()</code> and
<code>anydate</code></p></li>
</ul>
</div>
</div>
