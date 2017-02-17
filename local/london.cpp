// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; indent-tabs-mode: nil; -*-

// cf http://stackoverflow.com/a/3787188/143305 and extended
#include <iostream>
#include <boost/date_time.hpp>
#include <boost/date_time/local_time_adjustor.hpp>
#include <boost/date_time/c_local_time_adjustor.hpp>

#include <time.h>

const char *fmt = "%Y-%m-%d %H:%M:%S";

namespace bt = boost::posix_time;

const std::locale format = std::locale(std::locale::classic(), new bt::time_input_facet(fmt));

std::time_t pt_to_time_t(const bt::ptime& pt) {
    //This local adjustor depends on the machine TZ settings-- highly dangerous!
    typedef boost::date_time::c_local_adjustor<bt::ptime> local_adj;

    const bt::ptime timet_start(boost::gregorian::date(1970,1,1));
    const bt::ptime local_timet_start = local_adj::utc_to_local(timet_start);
    bt::time_duration tdiff = pt - local_timet_start;
    return tdiff.ticks()/bt::time_duration::rep_type::ticks_per_second;
}

void seconds_from_epoch(const std::string& s) {
    bt::ptime pt, ptbase;
    std::istringstream is(s);
    is.imbue(format);
    is >> pt;
    if (pt == bt::ptime()) {
        std::cerr << "Parse error for " << s << '\n';
        exit(-1);
    }
    std::cout << "Boost secs from epoch: " << pt_to_time_t(pt) << " "
              << "Input: " << s << " "
              << "ptime: " << pt << std::endl;
}

void oldschool(const std::string& s) {
    struct tm tm;
    strptime(s.c_str(), fmt, &tm);
    time_t t = mktime(&tm);
    std::cout << "C library secs       : " << t << " "
              << "secs off: " << tm.tm_gmtoff << " "
              << "tmzone " << tm.tm_zone << std::endl;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        std::cerr << "Usage: " << argv[0] << " 'yyyy-mm-dd hh::mm:ss'\n";
        exit(-1);
    }
    seconds_from_epoch(argv[1]);
    oldschool(argv[1]);
    exit(0);
}
