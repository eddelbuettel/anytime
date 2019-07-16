
isWindows <- Sys.info()[["sysname"]] == "Windows"

if (FALSE && !isWindows) {

    library(anytime)

    options("digits.secs"=3)

    inputs <- c("2017-04-02 11:12:13.456", "1971-10-31", "1971-11-01")
    expected <- c("2017-04-02 11:12:13.456 BST",
                  "1971-10-31 00:00:00.000 BST",
                  "1971-11-01 00:00:00.000 GMT")

    expect_equal(format(anytime(inputs, tz="Europe/Berlin", useR=TRUE),
                        tz="Europe/Berlin", usetz=TRUE),
                 expected)
}
