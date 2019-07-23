
isWindows <- Sys.info()[["sysname"]] == "Windows"

if (FALSE && !isWindows) {

    library(anytime)

    options("digits.secs"=3)

    inputs <- c("2017-04-02 11:12:13.456", "1971-10-31", "1971-11-01")
    expected <- c("2017-04-02 18:12:13.456 CEST",
                  "1971-10-31 06:00:00.000 CET",
                  "1971-11-01 07:00:00.000 CET")

    expect_equal(format(anytime(inputs, tz="Europe/Berlin", useR=TRUE),
                        tz="Europe/Berlin", usetz=TRUE),
                 expected)
}
