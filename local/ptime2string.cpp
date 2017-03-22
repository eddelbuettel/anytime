// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; indent-tabs-mode: nil; -*-

#include <boost/date_time/posix_time/posix_time.hpp>
#include <Rcpp.h>

// needs linking, ie Sys.setenv("PKG_LIBS"="-lboost_date_time")

// [[Rcpp::export]]
std::string ptime2string_single(double d) {
    boost::posix_time::ptime pt = boost::posix_time::from_time_t(d);
    return boost::posix_time::to_simple_string(pt);
}

// [[Rcpp::export]]
Rcpp::CharacterVector ptime2string(Rcpp::NumericVector dvec) {
    int n = dvec.size();
    Rcpp::CharacterVector cvec(n);
    for (int i=0; i<n; i++) {
        boost::posix_time::ptime pt = boost::posix_time::from_time_t(dvec[i]);
        cvec[i] = boost::posix_time::to_simple_string(pt);
    }
    return cvec;
}
