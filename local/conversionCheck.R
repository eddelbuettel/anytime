
suppressMessages({
    library(anytime)
    library(data.table)
    library(Rcpp)
})

## this is inherently non-portable, and may need a -L switch
Sys.setenv("PKG_LIBS"="-lboost_date_time")

#cppFunction("std::string ptime2string(double d) { return boost::posix_time::to_simple_string(boost::posix_time::from_time_t(d)); }", includes="#include <boost/date_time/posix_time/posix_time.hpp>")#, verbose=TRUE)

cppFunction("Rcpp::CharacterVector ptime2string(Rcpp::NumericVector dvec) {
    int n = dvec.size();
    Rcpp::CharacterVector cvec(n);
    for (int i=0; i<n; i++) {
        boost::posix_time::ptime pt = boost::posix_time::from_time_t(dvec[i]);
        cvec[i] = boost::posix_time::to_simple_string(pt);
    }
    return cvec;
}", includes="#include <boost/date_time/posix_time/posix_time.hpp>")



set.seed(1)
DT <- data.table(pt = round(runif(100000L,
                                  min=as.numeric(anytime("1950-01-01 00:00:00")),
                                  max=as.numeric(anytime("2030-01-01 00:00:00")))),
                 key="pt")
DT[, dt1 := ptime2string(pt)]
DT[, pt2 := as.numeric(utctime(dt1))]
DT[abs(pt2-pt)>1][,delta:=as.numeric(pt2-pt)][]


## 1902 also works
set.seed(1)
DT <- data.table(pt = round(runif(10000L,
                                  min=as.numeric(anytime("1902-01-01 00:00:00")),
                                  max=as.numeric(anytime("2030-01-01 00:00:00")))),
                 key="pt")
DT[, dt1 := ptime2string(pt)]
DT[, pt2 := as.numeric(utctime(dt1))]
DT[abs(pt2-pt)>1][,delta:=as.numeric(pt2-pt)][]

## before 1902 we need to protect against overflow
