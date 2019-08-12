library(anytime)

oldtz <- anytime:::getTZ()
anytime:::setTZ("Europe/London")

if (anytime:::getTZ() != "Europe/London") {
    cat("Note that you MUST use Europe/London to see anything here\n")
}

start <- anytime("1971-10-31 00:00:00")
for (i in 0:25) {
    now <- start + i*60*60
    txt <- iso8601(now)
    res <- iso8601(anytime(txt))
    #cat("Using ", now, " == ", txt, " parsed as ", res, "\n")
}
