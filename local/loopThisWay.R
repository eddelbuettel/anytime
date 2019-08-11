

if (requireNamespace("tinytest", quietly=TRUE)) {

    files <- list.files("../inst/tinytest", full.names = TRUE, pattern="test.*R")

    runTestFile <- function(file) {
        tz_prior <- Sys.getenv("TZ")
        Sys.sleep(0.1)
        val <- tinytest::run_test_file(file)
        Sys.sleep(0.1)
        tz_post <- Sys.getenv("TZ")
        c(tz_prior, tz_post)
    }

    runSerial <- function(files) {
        cat("** serial\n")
        for (file in files) {
            res <- runTestFile(file)
            #cat(sprintf("TZ from %s to %s\n", res[1], res[2]))
        }
    }

    runParallel <- function(files) {
        cat("** parallel\n")
        rl <- parallel::mclapply(files, runTestFile, mc.cores=4)
        res <- do.call(rbind, rl)
        #print(res)
    }

#    runParallel(files)
    runSerial(files)
    runSerial(files)
    runParallel(files)
}
