###  2025 

2025-07-14  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.3.12 
 
        * README.md: Add note about bogus benchmark comparison 
 
2025-05-27  Dirk Eddelbuettel  <edd@debian.org> 
 
        * configure: Echo hint about desirable compiler flags 
 
2025-05-25  Dirk Eddelbuettel  <edd@debian.org> 
 
        * inst/tinytest/test_gh_issue_135.R: Add tests for #135 
 
2025-05-21  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version and date 
 
        * R/anytime.R (anytime.default,anydate.default): Tolerate 
        cornercase of zero-length numeric or integer vector 
 
2025-03-12  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Imports, LinkingTo): Increase versioned depends on 
        Rcpp to the already three-year old 1.0.8 release 
 
###  2024 

2024-12-20  Dirk Eddelbuettel  <edd@debian.org> 
 
        * .github/workflows/ci.yaml: Simplify to r-ci with included bootstrap 
 
2024-12-18  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.3.11 
 
        * .Rbuildignore: Added inst/tinytest/test_simple.R 
 
2024-12-02  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.3.10 
 
2024-08-01  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Authors@R): Added 
 
2024-06-13  Dirk Eddelbuettel  <edd@debian.org> 
 
        * .github/workflows/ci.yaml (jobs): Update to r-ci-setup actions 
 
2024-06-12  Dirk Eddelbuettel  <edd@debian.org> 
 
        * README.md: Add DOI badge 
 
2024-05-16  Dirk Eddelbuettel  <edd@debian.org> 
 
        * README.md: Use tinyverse.netlify.app for dependency badge 
 
###  2023 

2023-09-18  Dirk Eddelbuettel  <edd@debian.org> 
 
        * .github/workflows/ci.yaml (jobs): Update to actions/checkout@v4 
 
2023-09-14  Dirk Eddelbuettel  <edd@debian.org> 
 
        * docs/*: Updated 
 
2023-09-13  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (convertToTime): Warn if NA values resulting from 
        conversion to character (and only one warning will be give) 
        * R/anytime.R: Updated docs 
        * man/anytime.Rd: Idem 
 
2023-09-09  Dirk Eddelbuettel  <edd@debian.org> 
 
        * tests/tinytest.R: Simplified 
 
2023-04-17  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/Makevars: Delete unneeded filed 
        * src/Makevars.win: Idem 
 
2023-02-04  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/Makevars: No longer set a C++ standard 
        * src/Makevars.win: Idem 
 
2023-02-01  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version and date 
 
        * src/Makevars (CXX_STD): Set C++ standard to C++17 
        * src/Makevars.win (CXX_STD): Idem 
 
        * src/anytime.cpp: Set include header to Rcpp/Lightest 
 
        * inst/NEWS.Rd: Update NEWS.Rd 
 
        * cleanup: Remove src/symbols.rds 
 
2023-01-14  Dirk Eddelbuettel  <edd@debian.org> 
 
        * README.md: Correct URL for codecov.io badge 
 
###  2022 

2022-12-11  Dirk Eddelbuettel  <edd@debian.org> 
 
        * README.md: Update one URL 
        * R/formats.R: Update URL to RFC3339 
        * man/iso8601.Rd: Idem 
 
2022-10-31  Dirk Eddelbuettel  <edd@debian.org> 
 
        * .github/workflows/ci.yaml (jobs): Update to actions/checkout@v3 
 
2022-01-25  Dirk Eddelbuettel  <edd@debian.org> 
 
        * README.md: Add total downloads badge 
 
###  2021 

2021-11-04  Dirk Eddelbuettel  <edd@debian.org> 
 
         * README.md: Remove Travis badge 
        * .travis.yml: Remove Travis YAML config 
 
2021-06-09  Dirk Eddelbuettel  <edd@debian.org> 
 
        * anytime.Rproj: Removed 
 
2021-06-07  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * src/anytime.cpp (sformats): Support additional formats that are 
        dot-sepatated such as '%Y.%m.%d' and variants 
 
        * R/anytime.R: Add a 'see also' link to 'getFormats' 
        * man/anytime.Rd: Ditto 
 
2021-03-28  Dirk Eddelbuettel  <edd@debian.org> 
 
        * docs/mkdmt-src/: Moved mkdocs-material input 
 
2021-03-19  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (URL): List GitHub repo and package page 
 
2021-03-03  Dirk Eddelbuettel  <edd@debian.org> 
 
        * .editorconfig: Added 
        * README.md: Expanded list of packages using anytime 
 
2021-03-02  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * src/anytime.cpp (anytime_cpp): In case of a logical input vector, 
        error out with message 
        * inst/tinytest/test_all_formats.R: Add simple tests 
 
###  2020 

2020-12-30  Dirk Eddelbuettel  <edd@debian.org> 
 
        * .github/workflows/ci.yaml: Rename job from build to ci 
 
2020-12-24  Dirk Eddelbuettel  <edd@debian.org> 
 
        * .github/workflows/ci.yaml: Small tweaks to CI YAML file 
 
2020-12-10  Dirk Eddelbuettel  <edd@debian.org> 
 
        * .github/workflows/ci.yaml: Add CI runner using r-ci 
        * README.md: Add new CI badge 
 
2020-11-21  Dirk Eddelbuettel  <edd@debian.org> 
 
        * .travis.yml: Use renamed r-ci repository URL 
 
2020-11-18  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * .travis.yml: Switch to focal and bspm, activate macOS build 
 
        * inst/tinytest/test_all_formats.R: untabify a section 
 
2020-10-25  Dirk Eddelbuettel  <edd@debian.org> 
 
        * inst/tinytest/test_simple.R: Reactivate tests with added 
        check.tzone=FALSE 
 
2020-09-12  Dirk Eddelbuettel  <edd@debian.org> 
 
        * docs/: Added package website 
        * docs-src/: Added package website inputs 
 
        * README.md: Added badge and short paragraph linking to documentation 
 
2020-08-26  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.3.9 
 
        * inst/tinytest/test_simple.R: Giving up on CRAN as timezone 
        attributes are inconsistently set between machines 
 
        * R/anytime.R: Change http:// to https:// 
        * man/anytime.Rd: Idem 
        * man/anytime-package.Rd: Idem 
        * README.md: Idem 
 
2020-07-23  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.3.8 
 
2020-07-22  Dirk Eddelbuettel  <edd@debian.org> 
 
        * tests/tinytest.R: No longer call tests in parallel 
 
2020-07-20  Dirk Eddelbuettel  <edd@debian.org> 
 
        * .travis.yml: Switch to 'bionic' and R 4.0.* 
 
2020-07-12  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * R/init.R: Support OS detection for some flavours of Linux, add 
        predicates to test e.g. .isUbuntu() vs .isFedora() 
        * NAMESPACE: Import utils::read.table() for this 
 
        * inst/tinytest/test_simple.R: Also skip if on Fedora as the CRAN 
        tests apparently cannot be fixed 
 
2020-04-14  Dirk Eddelbuettel  <edd@debian.org> 
 
        * README.md (tinytest): Add 'last commit' badge 
 
2020-01-20  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.3.7 
 
        * cleanup: Partly rewritten to fall afoul of bashism tests 
 
2020-01-19  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * R/anytime.R: Minor code tightening for calcUnique 
        * inst/tinytest/test_calc_unique.R: Renamed from test_pr_110.R 
 
2020-01-18  Dirk Eddelbuettel  <edd@debian.org> 
 
        * inst/tinytest/test_pr_110.R: New test for PR 110 
 
        * R/anytime.R: Reassert proper line-endings, add nocov tags 
        * man/anytime.Rd: Re-run roxygenize() 
 
2020-01-18  Stephen Froehlich  <s.froehlich@cablelabs.com> 
 
        * R/anytime.R: Add new option 'calcUnique' for more efficient 
        processing of input with many repeated values 
        * man/anytime.Rd: Add documentation 
 
2020-01-10  Dirk Eddelbuettel  <edd@debian.org> 
 
        * README.md: Add another usage example 
 
###  2019 

2019-11-29  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/Makevars (PKG_CXXFLAGS): Use no-rtti define for Rcpp 
 
2019-10-12  Dirk Eddelbuettel  <edd@debian.org> 
 
        * README.md: Add CRAN usage badge 
 
2019-08-30  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * inst/tinytest/test_simple.R: Add new 'isStupid' test 
 
2019-08-29  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.3.6 
 
2019-08-24  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * DESCRIPTION: Suggests on tinytest now '(>= 1.0.0)' 
 
        * tests/tinytests.R: Check for tinytest '(>= 1.0.0)' 
 
        * inst/tinytest/test_simple.R: Add two more tests 
 
        * vignettes/rmd/anytime-intro.Rmd: Updated 
        * vignettes/anytime-intro.pdf: Idem 
 
2019-08-23  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (ptToDoubleUTC): One more #nocov tag 
 
2019-08-18  Dirk Eddelbuettel  <edd@debian.org> 
 
        * inst/tinytest/test_all_formats.R: Small refactoring 
 
2019-08-16  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION: Suggests on tinytest now '(>= 0.9.6.13)' 
 
        * tests/tinytest.R: Now with parallel execution and side effect 
 
        * inst/tinytest/test_all_formats.R: Now uses tinytest::exit_file() 
        * inst/tinytest/test_bulk.R: Idem 
        * inst/tinytest/test_simple.R: Idem 
 
2019-08-14  Dirk Eddelbuettel  <edd@debian.org> 
 
        * README.md: Add section on example uses 
 
2019-08-12  Dirk Eddelbuettel  <edd@debian.org> 
 
        * inst/tinytest/hide/test_r_format.R: Moved as zero active tests 
        * inst/tinytest/hide/test_gh_issues_36_51.R: Ditto 
 
2019-08-10  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp: Add missing commas in format definition 
 
        * vignettes/rmd/anytime-intro.Rmd: Some more edits 
        * vignettes/anytime-intro.pdf: Idem 
        * vignettes/rmd/anytime.bib: Added entries 
 
2019-08-09  Dirk Eddelbuettel  <edd@debian.org> 
 
        * inst/tinytest/hide/test_gh_issue_5.R: Temporarily moved test 
        which upsets two of the rhub builders 
        * inst/tinytest/hide/test_gh_issue_84.R: Ditto 
        * inst/tinytest/hide/test_gh_issue_96.R: Ditto 
        * inst/tinytest/hide/test_validate.R: Ditto 
 
2019-08-07  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * src/anytime.cpp: Complement existing sformats[] with '%e' variants 
        to allow single-digit days to be parse by Boost date_time 
 
2019-08-04  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * R/anytime.R (anytime,anydate,utcdate): Rewritten using S3 dispatch 
        * R/formats.R (iso8601,rfc2822,rfc3339): Ditto 
        * NAMESPACE: Register new S3 methods 
 
        * inst/tinytest/test_all_formats.R: Tweaking tests to accomodate rhub 
        * inst/tinytest/test_bulk.R: Idem 
        * inst/tinytest/test_gh_issue_96.R: Idem 
        * inst/tinytest/test_validate.R: Idem 
 
2019-07-30  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * src/anytime.cpp (fmt): Renamed from format() to avoid clashes 
        * src/RcppExports.cpp (_anytime_fmt): Idem 
        * R/RcppExports.R (fmt): Idem 
        * inst/tinytest/test_simple.R: Ditto in test use 
        * inst/tinytest/test_all_formats.R: Idem 
 
2019-07-29  Dirk Eddelbuettel  <edd@debian.org> 
 
        * inst/tinytest/test_simple.R: A few more simple tests 
 
2019-07-28  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.3.5 
 
        * vignettes/rmd/anytime-intro.Rmd: More edits 
        * vignettes/anytime-intro.pdf: Idem 
 
        * inst/tinytest/test_gh_issue_96.R: More polish 
        * inst/tinytest/test_useR.R: Idem 
 
        * local/test_useR.R: Deactivated as it fails at Travis 
 
2019-07-27  Dirk Eddelbuettel  <edd@debian.org> 
 
        * R/anytime.R (utctime): Account for difference to UTC when useR=TRUE 
        * inst/tinytest/test_useR.R: New test file for useR=TRUE 
 
        * inst/tinytest/test_all_formats.R: Condition a few more tests 
        * inst/tinytest/test_gh_issue_96.R: Lower 'tol' on two tests 
 
        * inst/tinytest/test_all_formats.R: Set TZ at start 
        * inst/tinytest/test_assertions.R: Idem 
        * inst/tinytest/test_bulk.R: Idem 
        * inst/tinytest/test_gh_issue_100.R: Idem 
        * inst/tinytest/test_utilities.R: Idem 
 
        * vignettes/rmd/anytime-intro.Rmd: Some edits 
 
2019-07-26  Dirk Eddelbuettel  <edd@debian.org> 
 
        * R/anytime.R (utctime, anydate, utcdate): Also use option for 
        possible useR default 
        * R/format.R: Documentation tweaks 
        * man/anytime-package.Rd: Idem 
        * man/iso8601.Rd: Idem 
        * README.md: Idem 
        * vignettes/rmd/anytime-introduction.Rmd: Idem 
 
2019-07-25  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (r_stringToTime): Correct 'useR' to date conversion 
 
2019-07-24  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * inst/tinytest/test_all_formats.R: Tweaks for Windows tests 
        * inst/tinytest/test_bulk.R: Idem 
 
        * .travis.yml (install): Simplified with two fewer required packages 
 
2019-07-23  Dirk Eddelbuettel  <edd@debian.org> 
 
        * R/anytime.R (anytime): The useR argument can now be set via an option 
        * man/anytime.Rd: Ditto 
 
2019-07-21  Dirk Eddelbuettel  <edd@debian.org> 
 
        * inst/tinytest/test_r_format.R: Deactivate test as it fails on Travis 
 
2019-07-20  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * src/anytime.cpp (r_stringToTime): Use Rcpp::Function to access R 
        functionality instead of using RApiDatetime 
 
        * DESCRIPTION: No longer import RApiDatetime 
        * NAMESPACE: Idem 
 
        * inst/tinytest/test_all_formats.R: Loosen Windows test restrictions 
        * inst/tinytest/test_gh_issue_96.R: Idem 
 
2019-07-17  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp: A few minor #nocov additions 
        * inst/tinytest/test_all_formats.R: Add test for anydate with useR 
 
2019-07-16  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * src/anytime.cpp (r_stringToTime): Skip tz argument, change 
        internal conversion logic and reflect optional asDate argument 
 
        * inst/tinytest/test_r_format.R: Skip for now 
        * inst/tinytest/test_bulk.R (fullPOSIXctEx): Set TZ once 
 
2019-07-14  Dirk Eddelbuettel  <edd@debian.org> 
 
        * R/anytime.R: Add a paragraph warning about possibly issue on 
        Windows due to Boost ignoring TZ (but using the tzutil program) 
 
        * tests/tinytest.R: Call as utils::packageVersions() 
        * inst/tinytest/test_all_formats.R: Idem 
        * inst/tinytest/test_bulk.R: Idem 
        * inst/tinytest/test_gh_issue_5.R: Idem 
        * inst/tinytest/test_utilities.R: Idem 
        * inst/tinytest/test_validate.R: Idem 
 
2019-07-08  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (ptToDouble): Another debug message 
 
2019-07-05  Dirk Eddelbuettel  <edd@debian.org> 
 
        * .travis.yml (install): Use r-cran-tinytest from PPA 
 
2019-06-27  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
2019-06-26  Christoph Sax  <christoph.sax@gmail.com> 
 
        * src/anytime.cpp: Correct use via Rcpp::Function imported 
        Sys.setenv on Windows 
        * R/anytime.R: Use all argument to anytime_cpp() 
 
        * inst/tinytest/test_gh_issue_56.R: Relax Windows test constraint 
        * inst/tinytest/test_gh_issue_84.R: Idem 
        * inst/tinytest/test_simple.R: Idem 
        * inst/tinytest/test_utilities.R: Idem 
 
2019-06-23  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * inst/tinytest/test_all_formats.R: Add three tests to complete 
        coverage 
 
        * src/anytime.cpp (convertToTime): Some #nocov attributes 
 
2019-06-18  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.3.4 
 
2019-06-17  Dirk Eddelbuettel  <edd@debian.org> 
 
        * inst/tinytest/test_all_formats.R: Do not run test for releases 
        * inst/tinytest/test_bulk.R: Idem 
        * inst/tinytest/test_gh_issue_5.R: Idem 
        * inst/tinytest/test_validate.R: Idem 
 
2019-06-16  Dirk Eddelbuettel  <edd@debian.org> 
 
        * vignettes/anytime-introduction.Rnw: Vignette wrapper with tip of 
        the hat to Mark van der Loo for his January 2019 blog post 
        * vignettes/rmd/anytime-intro.Rmd: Moved 
        * vignettes/rmd/anytime.bib: Idem 
 
        * vignettes/rmd/anytime-intro.Rmd: Updated 
        * vignettes/anytime-intro.pdf: Idem 
 
        * vignettes/anytime-intro.pdf: Ran compactPDF(gs_quality = "ebook") 
 
        * .codecov.yml (coverage): Make patch behaviour more quiet 
 
        * inst/tinytest/test_simple.R: Test old format 
 
2019-06-15  Dirk Eddelbuettel  <edd@debian.org> 
 
        * R/formats.R (iso8601): Switch format to ISO8601 use with T between 
        date and time; allow option to override for old behaviour. 
        * man/iso8601.Rd: Document new behaviour and option. 
 
2019-06-10  Dirk Eddelbuettel  <edd@debian.org> 
 
        * README.md (tinytest): Mention post-install testing 
 
2019-06-09  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * src/anytime.cpp (r_stringToTime): Use Sys.setenv() from R on 
        Windows as the latter OS remains "special" 
 
        * inst/tinytest/test_all_formats.R: Exempt Windows from some tests 
        * inst/tinytest/test_bulk.R: ditto 
        * inst/tinytest/test_gh_issue_5.R: ditto 
        * inst/tinytest/test_gh_issue_84.R: ditto 
        * inst/tinytest/test_r_format.R: ditto 
        * inst/tinytest/test_simple.R: ditto 
        * inst/tinytest/test_utilities.R: ditto 
        * inst/tinytest/test_validate.R: ditto 
 
2019-06-08  Dirk Eddelbuettel  <edd@debian.org> 
 
        * inst/tinytest/test_r_format.R: Renamed for consistency 
        * inst/tinytest/test_gh_issue_33.R: Idem 
        * inst/tinytest/test_gh_issue_12.R: Idem 
        * inst/tinytest/test_utilities.R: Idem 
 
2019-06-07  Dirk Eddelbuettel  <edd@debian.org> 
 
        * inst/tinytest/test_assertions.R: From tests/assertions.R 
        * inst/tinytest/test_bulk.R: tests/bulkTest.R 
        * inst/tinytest/test_gh_issue_56.R: tests/gh_issue_56.R 
        * inst/tinytest/test_gh_issue_84.R: tests/gh_issue_84.R 
        * inst/tinytest/test_gh_issues_36_51.R: tests/gh_issues_36_51.R 
 
2019-06-06  Dirk Eddelbuettel  <edd@debian.org> 
 
        * inst/tinytest/test_all_formats.R: From tests/testAllFormats.R 
        * inst/tinytest/test_assertions.R: From tests/testAssertions.R 
        * inst/tinytest/test_bulk.R: From tests/bulkTest.R 
        * inst/tinytest/test_gh_issue_56.R: From tests/gh_issue_56.R 
 
        * inst/tinytest/testSimpleTests.R: Tweaks for Travis 
        * inst/tinytest/testValidate.R: Idem 
        * inst/tinytest/test_gh_issue_5.R: Idem 
 
2019-06-05  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp: Added removeFormats() (also in TimeFormats) 
        * src/RcppExports.cpp: Updated 
        * R/RcppExports.R: Updated 
        * man/getFornats.Rd: Updated, added removeFormats help 
        * NAMESPACE: Export removeFormats() 
 
        * inst/tinytest/testUtilities.R: Added removeFormats() and format 
        comparison tests 
 
2019-06-04  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * inst/tinytest/testUtilities.R: Do not add format as it persists 
        across tests -- with thanks to Mark van der Loo for spotting this 
 
        * tests/tinytest.R: Depend on tinytest 0.9.4 (on CRAN "soon") 
 
        * src/anytime.cpp: Explicitly unset TZ variable in Rstrptime 
 
2019-06-02  Dirk Eddelbuettel  <edd@debian.org> 
 
        * inst/tinytest/test_gh_issue_12.R: From tests/test_gh_issue_12.R 
        * inst/tinytest/test_gh_issue_33.R: From tests/test_gh_issue_12.R 
 
2019-05-30  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * inst/tinytest/test_gh_issue_5.R: From tests/test_gh_issue_5.R 
 
2019-05-29  Dirk Eddelbuettel  <edd@debian.org> 
 
        * inst/tinytest/testSimpleTests.R: Converted from tests/simpleTests.R 
        * inst/tinytest/testR_Format.R: Converted from tests/r_anytime.R 
        * inst/tinytest/testUtilities.R: Converted from tests/utilities.R 
 
2019-05-28  Dirk Eddelbuettel  <edd@debian.org> 
 
        * tests/tinytest.R: New test driver using tinytest 
        * DESCRIPTION (Suggests): Added tinytest 
        * .travis.yml (install): Install tinytest 
 
        * inst/tinytest/testValidate.R: Converted from tests/validate.R 
 
2019-04-02  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * src/Makevars: Added to set C++11 avoiding a compiler warning 
        * src/Makevars.win: Idem 
 
###  2018 

2018-12-09  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Rolled minor version 
 
        * R/anytime.R: Add note (in roxygen code) about 'Europe/London' issue 
        with pointers to four GH issue tickets and possible alternative. 
        * man/anytime.Rd: Idem 
 
        * src/anytime.cpp: Only if undefined, define BOOST_NO_AUTO_PTR 
 
2018-11-29  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Rolled minor version 
 
        * tests/gh_issue_84.R: Added for apparent Fedora issue but more 
        likely a TZ=Europe/London issue 
        * .Rbuildignore: Added tests/gh_issue_84.R 
 
2018-11-13  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.3.3 
 
2018-11-08  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp: Minor update setting Boost define 
 
        * R/anytime.R: Two more #nocov tags 
 
2018-11-07  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Rolled minor version 
 
        * vignettes/anytime-introduction.Rmd: Restore vignette to vignettes/ 
        directory as builds succeed on Windows after several small changes 
        * inst/doc/anytime-introduction.pdf: Removed 
        * .Rbuildignore: Exclude vignettes/ directory 
 
        * README.md: Update showing use of anydate() on integer (and 
        alike) input correponding to the 0.3.0 release heuristic change 
        * man/anytime-package.Rd: Idem 
 
2018-11-05  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.3.2 
 
        * inst/doc/anytime-introduction.pdf: Include prebuilt 
 
        * .Rbuildignore: Exclude vignettes/ directory 
 
2018-11-04  Dirk Eddelbuettel  <edd@debian.org> 
 
        * tests/simpleTests.R: Disable two some tests 
 
        * src/anytime.cpp (ptToDouble): Small Windows refinement for DST 
        adjustment 
 
2018-11-01  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * vignettes/anytime-introduction.Rmd: Updated and extended 
 
2018-09-02  Dirk Eddelbuettel  <edd@debian.org> 
 
        * .travis.yml: Switch Travis CI to R 3.5 repo 
 
2018-08-30  Dirk Eddelbuettel  <edd@debian.org> 
 
        * tests/allFormats.R: Do not test on Solaris 
        * tests/bulkTest.R: Idem 
        * tests/simpleTests.R: Idem 
 
        * vignettes/anytime-introduction.Rmd: Vignette setup tweaks 
        * cleanup: Idem 
        * DESCRIPTION: Add VignetteBuilder: fields 
 
2018-08-29  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (r_stringToTime, anytime_cpp): Two uses each of 
        Rcpp::Shield<> to make rchk happy 
 
2018-08-19  Dirk Eddelbuettel  <edd@debian.org> 
 
        * tests/simpleTests.R: Added tests for anydate from POSIXt 
 
        * R/assertions.R: Add '#nocov' tags 
 
2018-08-07  Dirk Eddelbuettel  <edd@debian.org> 
 
        * vignettes/anytime-introduction.Rmd: More content 
 
2018-07-07  Dirk Eddelbuettel  <edd@debian.org> 
 
        * vignettes/anytime-introduction.Rmd: Initial commit 
        * DESCRIPTION (Suggests): Added 'knitr, rmarkdown, pinp' 
        * .travis.yml (install): Also install r-cran-pinp and its imports 
 
2018-07-03  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.3.1 
 
###  2017 

2017-10-11  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Rolled minor version 
 
        * tests/simpleTests.R: Additional test for yyyymmdd() 
 
2017-10-10  Dirk Eddelbuettel  <edd@debian.org> 
 
        * R/formats.R: Added yyyymmdd() converter even though it 
        represents a truly terrible format 
        * man/iso8601.Rd: Added documentation 
 
2017-10-09  Dirk Eddelbuettel  <edd@debian.org> 
 
        * tests/simpleTests.R: Additional test for anydate from integer 
 
2017-10-08  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Rolled minor version 
 
        * NAMESPACE: Export assertDate and assertTime 
 
        * tests/assertions.R: Added simple tests 
 
2017-10-07  Dirk Eddelbuettel  <edd@debian.org> 
 
        * man/assertDate.Rd: Added documentation 
        * tests/assertions.R (assertDate, assertTime): Idem 
 
2017-10-06  Dirk Eddelbuettel  <edd@debian.org> 
 
        * R/assertions.R (assertDate, assertTime): First drafts 
 
2017-06-24  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (anytime_cpp): Clone numeric inputs to preserve 
 
2017-06-05  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.3.0 
 
        * README.md: Use alternate for img.shields.io GPL-2+ badge 
 
2017-05-29  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/RcppExports.cpp (R_init_anytime): Registration now here 
        * src/init.c: Deleted as calls now made in RcppExports.cpp 
        * R/RcppExports.R: Updated by Rcpp 0.12.11 as well 
 
2017-05-12  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp: Numeric input now always interpreted as offset 
        to epoch, with 'anytime()' and 'anydate()' working more consistently 
 
        * R/anytime.R: Document new 'oldHeuristic' option to re-enable old 
        behaviour. 
        * man/anytime.Rd: Idem 
 
        * tests/simpleTests.R: Adjust for new behaviour, ie use oldHeuristic=TRUE 
 
2017-04-15  Dirk Eddelbuettel  <edd@debian.org> 
 
        * R/init.R (.onLoad): Typo fix 
 
2017-04-02  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Date, Version): Roll minor version 
 
        * src/anytime.cpp (r_anytime_cpp): Adding support for parsing 
        functionality from the C API for R via package RApiDatetime 
 
        * .editorconfig: Adding editorconfig supprt 
 
        * .travis.yml (install): Add r-cran-rapidatetime 
 
2017-03-31  Dirk Eddelbuettel  <edd@debian.org> 
 
        * R/init.R (.onLoad): The 'isRStudio' test has been refined to allow 
        RStudio versions 1.1.129 or later which no longer conflict with Boost 
        * R/anytime.R (testFormat, testOutput): Message reworded 
 
2017-03-21  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.2.2 
 
        * src/init.c (R_init_anytime): Call R_registerRoutines() 
        and R_useDynamicSymbols() 
 
        * src/anytime.cpp (setMaxIntAsDate): Added setter accessible via ::: 
        (setMaxIntAsYYYYMMDD): Made return type void 
 
2017-03-20  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (anytime_cpp): Minor refactoring 
 
2017-03-18  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * src/anytime.cpp (anytime_cpp): Another special case covering 
        numeric values in the possible range of Dates now returned as 
        Dates 
 
        * tests/simpleTests.R: Additional (simple) tests 
 
2017-03-05  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (convertToTime): Special case for Europe/London 
        post 1971-10-31 02:00 
        (setInitialTZ): New helper function to store initial setup time 
        zone 
 
        * R/init.R (.onLoad): Register initial setup timezone used by 
        Boost code 
 
        * tests/gh_issues_36_51.R: New illustration for #36 and #51 
 
2017-02-26  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (anytime_cpp): Convert large integer values in 
        the range of POSIXct values as well (whereas before only eg 
        20101112L worked) 
        (setMaxIntAsYYYYMMDD): New (unexported but R-accessible) helper to 
        set the cutoff value, leaving default at 29991231 
 
        * tests/gh_issue_56.R: Added simple test script 
 
2017-02-09  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.2.1 
 
        * R/anytime.R (anydate, utcdate): If converting from POSIXt, also use 
        timezone argument 
 
2017-02-04  Dirk Eddelbuettel  <edd@max.eddelbuettel.com> 
 
        * src/anytime.cpp (sformats[]): Add format with to-be-skipped 
        timezone string now parsing 'Thu Sep 01 10:11:12 CDT 2016' 
 
        * tests/allFormats.R: Added test for new format 
 
2017-02-03  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version 
 
        * R/anytime.R (anydate, utcdate): Convert factor or ordered if needed 
 
        * tests/simpleTests.R: New tests for anydate(), utcdate() and factors 
 
        * R/init.R (.onLoad): Minor editing / refactoring 
 
        * .travis.yml (before_install): Use https for curl fetch 
 
2017-01-22  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Date, Version): Roll minor version 
 
        * src/anytime.cpp (convertToTime): Use Rcpp's new Date(time)Vector 
 
        * DESCRIPTION: Versioned Imports and LinkingTo 'Rcpp (>= 0.12.9), 
        use versioned Depends 'R (>= 3.2.0) to ensure versioned LinkingTo 
 
###  2016 

2016-12-24  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Date, Version): Release 0.2.0 
 
        * inst/NEWS.Rd: Finalized for release 
 
        * test/bulkTest.R: New set of tests 
 
2016-12-23  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Date, Version): Roll minor version 
 
        * R/formats.R (iso8601, rfc2822, rfc3339): New helper functions 
 
        * man/iso8601.Rd: New documentation for the new functions 
 
        * NAMESPACE: Exporting new functions 
 
        * tests/simpleTests.R: New simple tests 
 
        * tests/gh_issue_5.R: Skip two tests if on Windows 
 
2016-12-22  Dirk Eddelbuettel  <edd@debian.org> 
 
        * R/anytime.R (anydate, utcdate): Ensure Date object is returned 
 
2016-12-21  Dirk Eddelbuettel  <edd@debian.org> 
 
        * tests/simpleTests.R: More tests 
        * tests/gh_issue_5.R: Idem 
 
2016-12-20  Dirk Eddelbuettel  <edd@debian.org> 
 
        * tests/allFormats.R: Significantly increased number of tests 
 
2016-12-19  Dirk Eddelbuettel  <edd@debian.org> 
 
        * tests/bulkTest.R: Improved testing for POSIXct and Date 
        * tests/gh_issue_12.R: Additional testing 
 
2016-12-18  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version and date 
 
        * src/anytime.cpp (anytime_cpp): New option asDate 
        (convertToTime): Idem 
        (stringToTime): Idem 
        (ptToDoubleUTC): Idem 
        (ptToDouble): Idem 
 
        * R/anytime.R (anydate): Now calls anytime_cpp with asDate=TRUE 
        (utcdate): Idem 
 
        * tests/allFormats.R: Minor fix, additional call 
 
        * tests/bulkTest.R (fullEx): New bulk formatting test 
 
2016-12-14  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (sformats[]): Add ISO8601 format 
 
        * tests/allFormats.R: Tests for ISO8601 format 
 
2016-12-13  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.1.2 
 
2016-12-06  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (isAtLeastGivenLengthAndAllDigits): Simplified 
        using Boost classification and predicate use 
 
2016-12-05  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (format): Condition only on Rcpp version 
 
        * tests/utilities.R: Call anytime:::format() 
 
2016-12-04  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll version and date 
 
        * src/anytime.cpp (stringSplitter): Correct small oversight and split 
        on actual 'spliton' argument 
 
        * tests/gh_issue_33.R: Added to test most of GH issue 
        * tests/allFormats.R: Minor edit 
 
2016-12-03  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (stringSplitter): Split string with 
        boost::algorithm instead of strtok which appears to fail on 64-bit 
        windows. 
 
2016-11-27  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.1.1 
 
2016-11-26  Dirk Eddelbuettel  <edd@debian.org> 
 
        * tests/utilities.R: Gaming coverage metrics by adding more calls 
        * tests/allFormats.R: Ditto 
 
        * src/anytime.cpp (anytime_cpp): Condition use of Rcpp::stop() on 
        having Rcpp 0.12.8.1 or later as 0.12.7 and 0.12.8 had a bug tickled 
        under older g++ versions such as Ubuntu 14.04 one used by Travis CI 
 
2016-11-25  Dirk Eddelbuettel  <edd@debian.org> 
 
        * .travis.yml (after_success): Launch coverage analysis 
        * .codecov.yml (comment): Added 
        * .Rbuildignore: Exclude .codecov.yml 
        * README.md: Added code coverage badge 
 
2016-11-19  Dirk Eddelbuettel  <edd@debian.org> 
 
        * R/anytime.R (anydate,utcdate): Check for input of class Date 
 
        * src/anytime.cpp (stringSplitter): Be more defensive about input string 
 
2016-11-07  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.1.0 
 
        * tests/validate.R: No call of stopifnot(); Windows always surprises 
 
2016-11-06  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (sformats[]): Remove one redundant entry present 
        twice, move one entry to related entries 
        (convertToTime): Another special case treatment for hhmmss 
 
        * tests/allFormats.R: Align with current formats 
 
2016-11-05  Bob Jansen <bobjansen@gmail.com> 
 
        * src/anytime.cpp (sformats[]): Add one 'no-separator' format 
 
2016-11-05  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (sformats[]): Add fractional seconds to four more 
        datetimes, also add one missing format; 
        (isAtLeastGivenLengthAndAllDigits): Another refinement, and generalized; 
        (setDebug): add simple debug routine 
 
2016-11-04  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (convertToTime): Add logic to cope with the extended 
        'yyyymmdd hhmm[ss[.fff]]' format which needs treatment before parsing 
        * tests/allFormats.R: Added tests 
 
2016-10-30  Dirk Eddelbuettel  <edd@debian.org> 
 
        * R/anytime.R (testOutput): New simple (unexported) string output function 
        * src/anytime.cpp (testOutput_impl): Implementation 
 
2016-10-24  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version): Rolled version and date 
 
        * R/anytime.R (testFormat): New layer around testFormat_impl testing for RStudio 
        * src/anytime.cpp (testFormat_impl): Renamed from testFormat 
        * R/utils.R (isRStudio): New helper function 
        * R/init.R (.onLoad): At startup, check if we are inside RStudio 
 
2016-10-23  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (sformats[]): New format for RFC 822 style date 
        * tests/allFormats.R: New test 
 
        * tests/validate.R: Added test for utcparse via stopifnot() 
 
2016-10-22  Dirk Eddelbuettel  <edd@debian.org> 
 
        * NAMESPACE: Adding utctime() and utcdate() to export() 
 
        * R/anytime.R: Expanded documentation in Notes section (also 
        merging the Issues section in); expand documentation of the tz 
        argument; expanded examples 
        * man/anytime.Rd: Ditto 
 
        * R/utils.R (setTZ): New (unexported) helper function 
 
2016-10-21  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (anytime_cpp): New option asUTC (defaulting to 
        false) which governs whether parsing is as localtime or UTC 
        (ptToDoubleUTC): New UTC conversion of ptime to double 
        (stringToTime): Dispatch to either ptToDouble or ptToDoubleUTC 
 
        * R/anytime.R (anytime): Document new option asUTC; 
        add and document new callers utctime() and utcdate() 
        * man/anytime.Rd: Document new options and functions 
 
2016-10-20  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.0.4 
 
2016-10-19  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (anytime_cpp): Also recognise as.numeric() 
        conversions of POSIXt objects 
 
        * R/anytime.R: Expand manual page text with section on Issues, correct 
        working on Notes. 
        * man/anytime.Rd: Ditto 
 
        * tests/allFormats.R: Additional tests 
 
        * README.md: Reformated code display slightly 
 
2016-10-17  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (convertToTime): Process non-finite values as well 
        and return NA 
 
        * R/init.R (.onLoad): Also test for NA to invoke gettz, and test for 
        NA and NULL before using fallback of UTC (with warning) 
 
2016-10-15  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (convertToTime): Templated conversion avoids UBSAN 
        on a temporary object created from SEXP; renamed from anytime_impl 
 
        * cleanup: New helper script 
 
2016-10-14  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (sformats[]): Add several new date(time) formats 
        of the 14OCT2016 variety, with and without hours/minutes 
 
        * tests/allFormats.R: Add new tests as well 
 
2016-10-13  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.0.3 
 
        * R/anytime.R: Added extra comment to help page 
 
        * tests/gh_issue_12.R: Small test for #12 
 
2016-10-10  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (ptToDouble): Do not access tm_isdst on Windows for 
        dates earlier than the epoch (bug report #12) 
 
2016-10-08  Dirk Eddelbuettel  <edd@debian.org> 
 
        * .travis.yml (install): Added 
 
2016-09-17  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (testFormat): Added (non-exported) helper function 
        to test one format on one input (and timezone) 
        (ptToDouble): Factored function now called from two places 
 
2016-09-15  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.0.2 
 
        * inst/NEWS.Rd: Ditto 
 
2016-09-14  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Roll minor version and date 
 
        * DESCRIPTION (Imports): Relax min. version costraint on Rcpp 
 
        * NAMESPACE: Make getFormats() and addFormat() public 
 
        * src/anytime.cpp: Added documentation for new functions getFormats() 
        and addFormats() 
        * man/getFormats.Rd: Ditto 
 
        * man/anytime-package.Rd: Mention getFormats() and addFormats() 
 
        * inst/NEWS.Rd: Added 
 
        * tests/validate.R: Loosen test removing stopifnot 
 
        * R/anytime.R (anydate): Call as.POSIXlt() before calling as.Date() 
        to ensure all sub-components of the tm structure are set (GH #4) 
        * tests/gh_issue_5.R: test case 
 
2016-09-13  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Rolled to (interim) version 0.0.1.1 
 
        * DESCRIPTION (Title, Description): Edited to mention anydate() 
 
        * src/anytime.cpp: Refactored so that formats are now simple 
        string kept in vector (from which locales are built in the ctor of 
        a simple container class); now new formats can be added (at the 
        front); formats get be retrieved as well 
 
        * README.md: Add badges and CRAN installation note 
 
2016-09-12  Dirk Eddelbuettel  <edd@debian.org> 
 
        * DESCRIPTION (Version, Date): Release 0.0.1 
 
        * DESCRIPTION (URL, BugReports): Added 
 
        * src/anytime.cpp (anytime_cpp): Remove roxygen chunk 
        * R/anytime.R (anytime): Add roxygen chunk 
        * man/anytime.Rd: New file (replacing man/anytime_cpp.Rd) 
 
        * NAMESPACE: Do not export anytime_cpp 
 
        * R/anytime.R: Add copyright header 
        * R/utils.R: Ditto 
        * R/init.R: Ditto 
 
2016-09-11  Dirk Eddelbuettel  <edd@debian.org> 
 
        * R/anytime.R (anydate): New function reducing to Date 
 
        * R/anytime.R (anytime): Support factors on input 
 
        * src/anytime.cpp: Extended format list, corrected one special case, 
        document 'anydate' and add roxygen alias, remove some unused code 
        useful only for comparison, added Notesrcp: section with some caveats 
 
        * NAMESPACE: Export anydate 
 
        * tests/simpleTests.R: Expanded 
        * tests/simpleTests.Rout.save: Initially added for proper comparison, 
        deactivated in package as local format make fixed comparison difficult 
 
        * tests/allFormats.R: Added test of all formats 
        * tests/simpleTests.Rout.save: Initially added for proper comparison, 
        deactivated in package as local format make fixed comparison difficult 
 
        * tests/validate.R: Added, full-cycle conversion + comparison with R 
 
        * man/anytime-package.Rd: Rewritten and expanded 
 
        * .Rbuildignore: Do not include *.Rout.save files as default format 
        method will fall back to local time which we cannot override 
 
2016-09-10  Dirk Eddelbuettel  <edd@debian.org> 
 
        * R/init.R (.onLoad): Use Sys.timezone(), and gettz::gettz() if 
        available and needed, to gather and cache timezone value 
 
        * R/utils.R (getTZ): New helper function to get cached TZ value 
 
        * R/anytime.R (anytime): Use getTZ() to get default value 
 
        * tests/simpleTests.R: Use getTZ(), some extensions 
 
        * src/anytime.cpp: small tweaks to formats 
 
        * README.md: Added 
 
2016-09-09  Dirk Eddelbuettel  <edd@debian.org> 
 
        * .travis.yml: Added, using run.sh from Travis CI 
 
2016-09-08  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp (cToPOSIXct): no longer exported; 
        (charToPOSIXct): Safer assignment for string, no longer export; 
 
        * man/charToPOSIXct.Rd: Removed 
        * man/cToPOSIXct.Rd: Ditto 
 
2016-09-07  Dirk Eddelbuettel  <edd@debian.org> 
 
        * src/anytime.cpp: Updated and expanded help texts 
        * man/cToPOSIXct.Rd: Ditto 
        * man/charToPOSIXct.Rd: Ditto 
 
        * tests/simpleTests.R: Some first (and simple) tests 
 
2016-09-06  Dirk Eddelbuettel  <edd@debian.org> 
 
        * R/anytime.R: Front-end R function testing for Date or POSIXt 
        before dispatching to C++-based converter 
 
        * DESCRIPTION (Package): First commit, using a set of files which 
        originated with the RcppBDT package 
