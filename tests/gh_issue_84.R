si <- sessionInfo()
if (!grepl("Fedora", si$running, ignore.case=TRUE)) {
    expected <- "2018-10-01"
    stopifnot(expected == format(anytime::utctime("2018-10", tz = "UTC")))
    stopifnot(expected == format(anytime::utctime("2018-10-01", tz = "UTC")))
    stopifnot(expected == format(anytime::utctime("2018-10-01 00", tz = "UTC")))
    stopifnot(expected == format(anytime::utctime("2018-10-01 00:00", tz = "UTC")))
    stopifnot(expected == format(anytime::utctime("2018-10-01 00:00:00", tz = "UTC")))
}
