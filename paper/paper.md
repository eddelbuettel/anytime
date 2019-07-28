---
title: 'anytime: Anything to Datetime or Date Converter'
tags:
 - R
 - date
 - datetime
 - conversion
authors:
 - name: Dirk Eddelbuettel
   orcid: 0000-0001-6419-907X
   affiliation: 1
affiliations:
 - name: University of Illinois, Urbana-Champaign
   index: 1
date: 28 July 2019
bibliography: paper.bib   
---

# Summary

[R](https://www.r-project.org) excels at computing with dates, and times.
Using a _typed_ representation for data is highly recommended not only
because of the functionality offered, but also because of the added safety
stemming from proper representation. 

But no create date or datetime types, there is often a small nuisance cost in
interactive work as well as in programming. Users must specify an 'origin'
for the `as.POSIXct()` function when using a numeric argument, or a default
`format` string when passing a character argument to `strptime()`. Similar,
inputs in a different type have to be converted to conform to either numeric
or character.

The `anytime()` function from the eponymous packages offers a more powerful
alternative. If needed, it first carefully converts the input data to conform
to the requirements and then relies on the [Boost
date_time](https://boost.org/libs/date_time) parser in a heuristic search
over a large-enough variety of potential inputs formats to _automatically_
convert from a wide variety of input formats to appropriately convert to a
datetime object -- or, in the case of `anydate()`, to a date object.

The [Rcpp](http://dirk.eddelbuettel.com/code/rcpp.html) package [@TAS:Rcpp;@CRAN:Rcpp]
provides the underlying C++ and R integration, and the
[BH](http://dirk.eddelbuettel.com/code/bh.html) package [@CRAN:BH] supplies
the Boost library utilised. The
[anytime](http://dirk.eddelbuettel.com/code/anytime.html) package
[@CRAN:anytime] integrates both to offer date and datetime conversions that
are at the same time fast (using underlying C++ code) and easy to use
(automatic conversion, no required formats). It has been on the
[CRAN](https://cran.r-project.org) network since 2016, and currently averages
[approximately 16k downloads per
month](http://cranlogs.r-pkg.org/downloads/daily/last-month/anytime).


# References

