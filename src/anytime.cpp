// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; indent-tabs-mode: nil; -*-
//
// anytime: Use Boost Date_Time to convert date(time) data to POSIXt
//
// Copyright (C) 2015 - 2019  Dirk Eddelbuettel
//
// This file is part of anytime.
//
// anytime is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 2 of the License, or
// (at your option) any later version.
//
// anytime is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with anytime.  If not, see <http://www.gnu.org/licenses/>.

#if !defined(BOOST_NO_AUTO_PTR)
  #define BOOST_NO_AUTO_PTR
#endif
#include <boost/date_time.hpp>
#include <boost/date_time/local_time_adjustor.hpp>
#include <boost/date_time/c_local_time_adjustor.hpp>
#include <boost/lexical_cast.hpp>
#include <boost/algorithm/string/classification.hpp>
#include <boost/algorithm/string/predicate.hpp>
#include <boost/algorithm/string/split.hpp>

#define STRICT_R_HEADERS
#include <Rcpp.h>

#include <RApiDatetime.h>

namespace bt = boost::posix_time;
namespace ba = boost::algorithm;

static bool debug = false;              // set to true (from R, see below) for debug messages
static int maxIntAsYYYYMMDD = 29991231; // cutoff values below which we treat ints as YYYYMMDD
static int maxIntAsDate = 199999;       // cutoff values below which we treat ints as Dates

const std::string sformats[] = {
    "%Y-%m-%d %H:%M:%S%f",
    "%Y-%m-%d %H%M%S%f",
    "%Y/%m/%d %H:%M:%S%f",
    "%Y%m%d %H%M%S%f",
    "%Y%m%d %H:%M:%S%f",
    "%m/%d/%Y %H:%M:%S%f",
    "%m-%d-%Y %H:%M:%S%f",
    // "%d.%m.%Y %H:%M:%S%f",

    "%Y-%b-%d %H:%M:%S%f",
    "%Y/%b/%d %H:%M:%S%f",
    "%Y%b%d %H%M%S%F",
    "%Y%b%d %H:%M:%S%F",
    "%b/%d/%Y %H:%M:%S%f",
    "%b-%d-%Y %H:%M:%S%f",

    "%d.%b.%Y %H:%M:%S%f",
    "%d%b%Y %H%M%S%f",
    "%d%b%Y %H:%M:%S%f",
    "%d-%b-%Y %H%M%S%f",
    "%d-%b-%Y %H:%M:%S%f",

    "%Y-%B-%d %H:%M:%S%f",
    "%Y/%B/%d %H:%M:%S%f",
    "%Y%B%d %H%M%S%f",
    "%Y%B%d %H:%M:%S%f",
    "%B/%d/%Y %H:%M:%S%f",
    "%B-%d-%Y %H:%M:%S%f",
    "%d.%B.%Y %H:%M:%S%f",

    // see http://stackoverflow.com/questions/39259184/formatting-dates-with-r for next one
    "%a %b %d %H:%M:%S%F %Y",

    // see RFC 822 and standard Unix use eg mail headers (but no TZ or UTC offset on input :-/ )
    "%a %d %b %Y %H:%M:%S%F",

    // See the Boost documentation, tz specifications (%q %Q %z %Z) are _ignored_ on input
    // http://www.boost.org/doc/libs/1_62_0/doc/html/date_time/date_time_io.html#date_time.time_input_facet
    "%Y-%m-%d %H:%M:%S%Z",

    // Issue 47: support formats like "Thu Jan 17 09:29:10 EST 2013" by ignoring the three-char TZ
    // also support fractional seconds if present
    "%a %b %d %H:%M:%S%F xxx %Y",

    "%Y-%m-%d",
    "%Y%m%d",
    "%m/%d/%Y",
    "%m-%d-%Y",

    "%Y-%b-%d",
    "%Y%b%d",
    "%b/%d/%Y",
    "%b-%d-%Y",

    "%d%b%Y"
    "%d-%b-%Y"

    "%Y-%B-%d",
    "%Y%B%d",
    "%B/%d/%Y",
    "%B-%d-%Y"

};
const size_t nsformats = sizeof(sformats)/sizeof(sformats[0]);

// somewhat simplistic C++ class -- but enough to allow us to hold (and hide)
// two vectors of (string) formats and locale using the strings -- so that users
// can retrieve the strings, and add to them
class TimeFormats {
private:
    std::vector<std::string> formats;
    std::vector<std::locale> locales;
public:
    TimeFormats() {
        for (size_t i=0; i<nsformats; i++) {
            //Rcpp::Rcout << i << std::endl;
            formats.push_back(sformats[i]);
            locales.push_back(std::locale(std::locale::classic(),
                                          new bt::time_input_facet(sformats[i])));
        }
    }
    void addFormat(const char *txt) {
        formats.insert(formats.begin(), txt);
        locales.insert(locales.begin(), std::locale(std::locale::classic(),
                                                    new bt::time_input_facet(txt)));
    };
    void removeFormat(const char *txt) {
        auto fit = formats.begin();
        auto lit = locales.begin();
        std::string s(txt);
        while (fit != formats.end()) {
            if (*fit == s) {
                fit = formats.erase(fit);
                lit = locales.erase(lit);
            } else {
                fit++;
                lit++;
            }

        }
    }
    std::locale getLocale(int i) { return locales[i]; }
    std::string getFormat(int i) { return formats[i]; }
    size_t getN() { return formats.size(); }
    std::vector<std::string> getFormats() { return formats; }
};

static TimeFormats timeformats;
static std::string setupTZ;

// given a ptime object, return (fractional) seconds since epoch
// account for localtime, and also account for dst
double ptToDouble(const bt::ptime & pt, const bool asDate=false) {

    // This local adjustor depends on the machine TZ settings-- highly dangerous!
    typedef boost::date_time::c_local_adjustor<bt::ptime> local_adj;

    const bt::ptime timet_start(boost::gregorian::date(1970,1,1));
    const bt::ptime local_timet_start = local_adj::utc_to_local(timet_start);

    // seconds sincr epoch (in local time) -- misses DST adjustment
    bt::time_duration tdiff = pt - local_timet_start;
    if (debug) {
        Rcpp::Rcout << "tdiff in sec is " << tdiff.total_seconds()
                    << " and pt is " << pt << std::endl;
    }

    if (asDate) {
        if (debug) Rcpp::Rcout << "days " << pt.date().day_number() - timet_start.date().day_number() << std::endl;
        return static_cast<double>(pt.date().day_number()) - static_cast<double>(timet_start.date().day_number());
    }

    // hack-ish: go back to struct tm to use its tm_isdst field
    time_t secsSinceEpoch = tdiff.total_seconds();
    struct tm* localAsTm = localtime(&secsSinceEpoch);
    //Rcpp::Rcout << "Adj is " << localAsTm->tm_isdst << std::endl;

    // Define BOOST_DATE_TIME_POSIX_TIME_STD_CONFIG to use nanoseconds
    // (and then use diff.total_nanoseconds()/1.0e9;  instead)
    //
    // note dst correction here -- needed as UTC offset is correct but does not
    // contain the additional DST adjustment
    double totsec = tdiff.total_microseconds()/1.0e6, dstadj = 0;
#if defined(_WIN32)
    if (totsec > 0  &&                  // on Windows before 1970-01-01: segfault
       localAsTm->tm_year < 1100) {     // tm_year is year-1900, so year 3000 is it
        dstadj = localAsTm->tm_isdst*60*60;
    }
#else
    dstadj = localAsTm->tm_isdst*60*60;
#endif
    if (debug) Rcpp::Rcout << "totsec secs is " << std::setprecision(16) << totsec << " and dstadj is " << dstadj << std::endl;
    return totsec - dstadj;
}

// given a ptime object, return (fractional) seconds since epoch -- at UTC
double ptToDoubleUTC(const bt::ptime & pt, const bool asDate=false) {
    const bt::ptime timet_start(boost::gregorian::date(1970,1,1));

    if (asDate) {
        return static_cast<double>(pt.date().day_number()) - static_cast<double>(timet_start.date().day_number());
    }

    bt::time_duration tdiff = pt - timet_start;
    double totsec = tdiff.total_microseconds()/1.0e6;
    return totsec;
}


// given a string with a (date)time object, try all formats til we parse one
// conversion of ptime object to double done by ptToDouble()
double stringToTime(const std::string s, const bool asUTC=false, const bool asDate=false) {

    bt::ptime pt, ptbase;

    // loop over formats and try them til one fits
    for (size_t i=0; pt == ptbase && i < timeformats.getN(); ++i) {
        std::istringstream is(s);
        //Rcpp::Rcout << i << " " << timeformats.getFormat(i) << std::endl;
        is.imbue(timeformats.getLocale(i));
        is >> pt;
    }

    if (pt == ptbase) return NA_REAL; // NA for non-parsed dates

    if (debug) {
        int utc = static_cast<int>(ptToDoubleUTC(pt));
        int loc = static_cast<int>(ptToDouble(pt));
        Rcpp::Rcout << "Boost parsed as " << pt
                    << " which is UTC " << utc
                    << " local " << loc
                    << " diff " << utc-loc << std::endl;
    }
    if (asUTC) {
        return ptToDoubleUTC(pt, asDate);
    } else {
        return ptToDouble(pt, asDate);
    }
}

// helper to peel off first two tokens, if any, of a string
// use to do two things:
//  i)  split yyyymmdd hhmmss[.fff] into date and time parts
//  ii) for time part, split possible fractional seconds off
void stringSplitter(const std::string & in, const std::string spliton,
                    std::string & tok1, std::string& tok2) {
    std::vector<std::string> splitvec;
    boost::split(splitvec, in, boost::is_any_of(spliton), boost::token_compress_on);
    tok1 = splitvec[0];
    tok2 = splitvec.size() > 1 ? splitvec[1] : "";
    if (debug) Rcpp::Rcout << "In: " << in << " out: " << tok1 << " and " << tok2 << std::endl;
}

// yes, we could use regular expression -- but then we'd either be C++11 or would
// require an additional library with header / linking requirement (incl boost regex)
bool isAtLeastGivenLengthAndAllDigits(const std::string& s, const unsigned int n) {
    bool res = s.size() >= n && ba::all(s.substr(0, n), ba::is_digit());
    if (debug) Rcpp::Rcout << "s: " << s << " len: " << s.size() << " res: " << res << std::endl;
    return res;
}

// ---
// R-based ranytime below

const std::string rformats[] = {
    "%Y-%m-%d %H:%M:%OS",
    "%Y-%m-%d %H%M%OS",
    "%Y/%m/%d %H:%M:%OS",
    "%Y%m%d %H%M%OS",
    "%Y%m%d %H:%M:%OS",
    "%m/%d/%Y %H:%M:%OS",
    "%m-%d-%Y %H:%M:%OS",
    // "%d.%m.%Y %H:%M:%OS",

    "%Y-%b-%d %H:%M:%OS",
    "%Y/%b/%d %H:%M:%OS",
    "%Y%b%d %H%M%OS",
    "%Y%b%d %H:%M:%OS",
    "%b/%d/%Y %H:%M:%OS",
    "%b-%d-%Y %H:%M:%OS",

    "%d.%b.%Y %H:%M:%OS",
    "%d%b%Y %H%M%OS",
    "%d%b%Y %H:%M:%OS",
    "%d-%b-%Y %H%M%OS",
    "%d-%b-%Y %H:%M:%OS",

    "%Y-%B-%d %H:%M:%OS",
    "%Y/%B/%d %H:%M:%OS",
    "%Y%B%d %H%M%OS",
    "%Y%B%d %H:%M:%OS",
    "%B/%d/%Y %H:%M:%OS",
    "%B-%d-%Y %H:%M:%OS",
    "%d.%B.%Y %H:%M:%OS",

    // see http://stackoverflow.com/questions/39259184/formatting-dates-with-r for next one
    "%a %b %d %H:%M:%OS %Y",

    // see RFC 822 and standard Unix use eg mail headers (but no TZ or UTC offset on input :-/ )
    "%a %d %b %Y %H:%M:%OS",

    // See the Boost documentation, tz specifications (%q %Q %z %Z) are _ignored_ on input
    // http://www.boost.org/doc/libs/1_62_0/doc/html/date_time/date_time_io.html#date_time.time_input_facet
    "%Y-%m-%d %H:%M:%S%Z",

    // Issue 47: support formats like "Thu Jan 17 09:29:10 EST 2013" by ignoring the three-char TZ
    // also support fractional seconds if present
    "%a %b %d %H:%M:%OS xxx %Y",

    "%Y-%m-%d",
    "%Y%m%d",
    "%m/%d/%Y",
    "%m-%d-%Y",

    "%Y-%b-%d",
    "%Y%b%d",
    "%b/%d/%Y",
    "%b-%d-%Y",

    "%d%b%Y"
    "%d-%b-%Y"

    "%Y-%B-%d",
    "%Y%B%d",
    "%B/%d/%Y",
    "%B-%d-%Y"

};
const size_t nrformats = sizeof(rformats)/sizeof(rformats[0]);

// conversion of ptime object to double done by ptToDouble()
double r_stringToTime(const std::string s, const bool asUTC=false, const bool asDate=false) {

    const char* oldtz = asUTC ? "UTC" : getenv("TZ");
    bool done = false;
    double res = NA_REAL;
    SEXP ss = Rcpp::wrap(s);
    SEXP tzs = Rcpp::wrap(oldtz);

    // loop over formats and try them til one fits
    for (size_t i=0; !done && i < nrformats; ++i) {
        // asPOSIXct and Rstrptime are both from RApiDatetime
        Rcpp::Shield<SEXP> sp(Rstrptime(ss, Rcpp::wrap(rformats[i]), tzs));
        if (asDate) {
            Rcpp::Shield<SEXP> d1(POSIXlt2D(sp));
            Rcpp::Date d2 = Rcpp::as<Rcpp::Date>(d1);
            res = d2.getDate();
        } else {
            Rcpp::Shield<SEXP> ct(asPOSIXct(sp, tzs));
            res = Rcpp::as<double>(ct);
        }
        done = ! Rcpp::traits::is_na<REALSXP>(res);
    }
    return res;
}

// ---


template <class T, int RTYPE>
Rcpp::NumericVector convertToTime(const Rcpp::Vector<RTYPE>& sxpvec,
                                  const std::string& tz = "UTC",
                                  const bool asUTC = false,
                                  const bool asDate = false,
                                  const bool useR = false) {

    // step one: create a results vector, and class it as POSIXct
    int n = sxpvec.size();
    Rcpp::DatetimeVector pv(n, tz.c_str());
    // if (asDate) {
    //     pv.attr("class") = Rcpp::CharacterVector::create("Date");
    // } else {
    //     pv.attr("class") = Rcpp::CharacterVector::create("POSIXct", "POSIXt");
    // }
    // pv.attr("tzone") = tz;

    // step two: loop over input, cast each element to string and then convert
    for (int i=0; i<n; i++) {

        // if we do not explicit assign to int, double or string then clang
        // flags a UBSAN error (which was the case for release 0.0.1 to 0.0.3)
        // but with templating to T this is straightforward enough
        T val = sxpvec[i];
        std::string s = boost::lexical_cast<std::string>(val);

        if (s == "NA") {
            pv[i] = NA_REAL;    					// #nocov
        } else {
            if (debug) Rcpp::Rcout << "before tests: " << s << std::endl;
            // Boost Date_Time gets the 'YYYYMMDD' format wrong, even
            // when given as an explicit argument. So we need to test here.
            // While we're at it, may as well test for obviously wrong data.
            std::string one = "", two = "", three = "", inp = s;
            stringSplitter(inp, " ", one, two);
            if (isAtLeastGivenLengthAndAllDigits(one, 8)) {
                one = one.substr(0, 4) + "-" + one.substr(4, 2) + "-" + one.substr(6,2);

                if ((two.size()==5 || two.size() >= 8) &&          	// if we have hh:mm or hh:mm:ss[.ffffff]
                    !isAtLeastGivenLengthAndAllDigits(two, 6)) { 	// and it is not hhmmss
                    three = "";    	                     		// do nothing, three remains "" #nocov
                } else {
                    inp = two;

                    // The 'YYYYMMDD' format can of course be followed by either
                    // 'HHMMSS' or 'HHMM' or 'HHMMSS.fffffff' so we cover these cases
                    stringSplitter(inp, ".", two, three);
                    if (two.size() == 6) {
                        two = two.substr(0, 2) + ":" + two.substr(2, 2) + ":" + two.substr(4,2);
                    } else if (two.size() == 4) {
                        two = two.substr(0, 2) + ":" + two.substr(2, 2); // #nocov
                    }
                }

                s = one + " " + two;
                if (three != "") {
                    s = s + "." + three;
                }

                if (debug) Rcpp::Rcout << "s: " << s << " one: " << one << " two: ";
                if (debug) Rcpp::Rcout << two << " " << " three: " << three << std::endl;

            } else if (isAtLeastGivenLengthAndAllDigits(two, 6)) {
                if (two.size() == 6) { 					// #nocov start
                    two = two.substr(0, 2) + ":" + two.substr(2, 2) + ":" + two.substr(4,2);
                }
                s = one + " " + two; 					// #nocov end
            } else {
                if (debug) Rcpp::Rcout << "One: " << one << " " << "two: " << two << std::endl;
            }

            if (debug) Rcpp::Rcout << "before parse: " << s << std::endl;

            // Given the string, convert to a POSIXct using an interim double
            // of fractional seconds since the epoch
            if (useR) {
                pv[i] = r_stringToTime(s, asUTC, asDate);
            } else {
                pv[i] = stringToTime(s, asUTC, asDate);
            }
        }
    }
    // There is an issue with datetime parsing under TZ=Europe/London, see eg #36 and #51
    // We think this is caused by Boost but as we return to R for formating we need to adjust
    if (!useR && setupTZ == "Europe/London") {					// #nocov start
        //Rcpp::Rcerr << "Putzing\n";
        const double cutoff = 57722400; // 1971-10-31 02:00:00 was a policy change
        for (int i=0; i<pv.size(); i++) {
            pv[i] = pv[i] + 3600 * (pv[i] >= cutoff);
        }
    }                                                                   // #nocov end
    if (asDate) {               // if we wanted Date types, set class
        pv.attr("class") = Rcpp::CharacterVector::create("Date");
    }
    return pv;
}

// [[Rcpp::export]]
Rcpp::NumericVector anytime_cpp(SEXP x,
                                const std::string& tz = "UTC",
                                const bool asUTC = false,
                                const bool asDate = false,
                                const bool useR = false,
                                const bool oldHeuristic = false) {

    if (Rcpp::is<Rcpp::CharacterVector>(x)) {
        // already a character -- so parse from character and convert
        return convertToTime<const char*, STRSXP>(x, tz, asUTC, asDate, useR);

    } else if (Rcpp::is<Rcpp::NumericVector>(x) && asDate && REAL(x)[0] <= maxIntAsDate) {
        // if numeric and below date cutoff, treat as (already numeric/int) date
        // we clone first to ensure input is preserved
        Rcpp::NumericVector z(Rcpp::Shield<SEXP>(Rcpp::clone(x)));
        return Rcpp::DateVector(z);

    } else if (Rcpp::is<Rcpp::IntegerVector>(x) && asDate && INTEGER(x)[0] <= maxIntAsDate) {
        // if integer and below date cutoff, treat as (already numeric/int) date
        return Rcpp::DateVector(x);

    } else if (Rcpp::is<Rcpp::IntegerVector>(x) &&
               oldHeuristic && INTEGER(x)[0] <= maxIntAsYYYYMMDD) {
        // actual integer date notation: convert to string via lexical cast
        // and then parse that string as usual
        return convertToTime<int, INTSXP>(x, tz, asUTC, asDate, useR);

    } else if (Rcpp::is<Rcpp::NumericVector>(x) &&
               oldHeuristic && REAL(x)[0] <= maxIntAsYYYYMMDD) {
        // actual integer date notation: convert to string via lexical cast
        // and then parse that string as usual
        return convertToTime<double, REALSXP>(x, tz, asUTC, asDate, useR);

    } else if (Rcpp::is<Rcpp::NumericVector>(x)) {
        // now we actually should have a proper large numeric (ie as.numeric(Sys.time())
        // so we can simply return as the already created Datetime vector
        // we clone first to ensure input is preserved
        Rcpp::NumericVector z(Rcpp::Shield<SEXP>(Rcpp::clone(x)));
        return Rcpp::DatetimeVector(z, asUTC ? "UTC" : tz.c_str());

    } else if (Rcpp::is<Rcpp::IntegerVector>(x)) {
        // now we actually should have a proper large numeric (ie as.numeric(Sys.time())
        // so we can simply return as the already created Datetime vector
        // no clone needed as integers get cast
        return Rcpp::DatetimeVector(x, asUTC ? "UTC" : tz.c_str());

    } else {
        Rcpp::stop("Unsupported Type");	// bug in 0.12.{7,8}; Rcpp 0.12.9 or later ok #nocov
        return R_NilValue;//not reached
    }
}

//' The time and date parsing and conversion relies on trying a (given
//' and fixed) number of timeformats. The format used is the one employed
//' by the underlying implementation of the Boost date_time library.
//'
//' @title Functions to retrieve, set or remove formats used for parsing dates.
//' @param fmt A vector of character values in the form understood by Boost
//' date_time
//' @return Nothing in the case of \code{addFormats}; a character vector of
//' formats in the case of \code{getFormats}
//' @seealso \code{\link{anytime-package}} and references therein
//' @author Dirk Eddelbuettel
//' @examples
//'   getFormats()
//'   addFormats(c("%d %b %y",      # two-digit date [not recommended], textual month
//'                "%a %b %d %Y"))  # weekday weeknumber four-digit year
//'   removeFormats("%d %b %y")     # remove first
// [[Rcpp::export]]
std::vector<std::string> getFormats() {
    return timeformats.getFormats();
}

//' @rdname getFormats
// [[Rcpp::export]]
void addFormats(Rcpp::CharacterVector fmt) {
    for (int i = 0 ; i < fmt.size(); i++) {
        //Rcpp::Rcout  << fmt[i] << std::endl;
        timeformats.addFormat(fmt[i]);
    }
}

//' @rdname getFormats
// [[Rcpp::export]]
void removeFormats(Rcpp::CharacterVector fmt) {
    for (int i = 0 ; i < fmt.size(); i++) {
        //Rcpp::Rcout  << fmt[i] << std::endl;
        timeformats.removeFormat(fmt[i]);
    }
}



// [[Rcpp::export]]
Rcpp::NumericVector testFormat_impl(const std::string fmt,
                                    const std::string s,
                                    const std::string tz = "") {

    bt::ptime pt, ptbase;

    std::istringstream is(s);
    std::locale loc = std::locale(std::locale::classic(), new bt::time_input_facet(fmt));

    is.imbue(loc);
    is >> pt;

    double timeval = (pt == ptbase) ? NAN : ptToDouble(pt);

    Rcpp::DatetimeVector pv(1, tz.c_str());
    pv(0) = timeval;

    return pv;
}

// [[Rcpp::export]]
std::string testOutput_impl(const std::string fmt,
                            const std::string s) {

    // doing anything with an actual output _format_ requires a timezone
    // for which we need to load timezone information _from the Boost file_
    // which we generally do not have -- though RcppBDT ships it
    bt::ptime pt;
    std::istringstream is(s);
    std::locale inloc = std::locale(std::locale::classic(), new bt::time_input_facet(fmt));
    is.imbue(inloc);
    is >> pt;
    std::ostringstream os;
    os << pt;
    return os.str();
}

// [[Rcpp::export]]
bool setDebug(const bool mode) {
    debug = mode;
    return debug;
}

// [[Rcpp::export]]
std::vector<std::string> format(Rcpp::NumericVector x) {
    std::vector<std::string> z(x.size());
    for (int i=0; i<x.size(); i++) {
        Rcpp::Datetime d(x[i]);
#if RCPP_DEV_VERSION >= RcppDevVersion(0,12,8,2)
        z[i] = d.format();
#else
        z[i] = "";
#endif
    }
    return z;
}

// [[Rcpp::export]]
void setMaxIntAsYYYYMMDD(const int val) {
    maxIntAsYYYYMMDD = val;
}

// [[Rcpp::export]]
void setMaxIntAsDate(const int val) {
    maxIntAsDate = val;
}

// [[Rcpp::export]]
void setInitialTZ(std::string tz) {
    setupTZ = tz;
}
