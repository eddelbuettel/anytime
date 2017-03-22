suppressMessages({
    library(anytime)
    library(data.table)
    library(RcppBDT)
})
set.seed(1)
DT <- data.table(dt1=as.POSIXct('1970-01-01 00:00:00')+floor(1e6*rnorm(1e6,sd=1000)), key='dt1')
DT[,dt1Str:=as.character(dt1)]
DT[,dt2:=anytime(dt1Str)]
DT[abs(dt1-dt2)>1][,delta:=as.numeric(dt1-dt2)][]

## subset
newdt <- DT[abs(dt1-dt2)>1][,delta:=as.numeric(dt1-dt2)]
newdt[, year:=year(as.IDate(dt2))]
newdt[, .(count=.N), by=year]

## by decade
newdt[, .(count=.N), by=10*round(year/10,0)]




set.seed(1)
DT <- data.table(dt1=as.POSIXct(runif(10000L,
                                      min=as.numeric(anytime("1600-01-01 00:00:00")),
                                      max=as.numeric(anytime("2300-01-01 00:00:00"))),
                                origin="1970-01-01"),
                 key='dt1')
DT[,dt1Str:=as.character(dt1)]
DT[,dt2:=anytime(dt1Str)]
DT[abs(dt1-dt2)>1][,delta:=as.numeric(dt1-dt2)][]

## no issue when parsing as R
DT[,dt3:=as.POSIXct(dt1Str)]
DT[abs(dt1-dt3)>1][,delta:=as.numeric(dt1-dt3)][]

#num2timestr <- function(n) { format(new(bdtPt, n)) }
#numvec2timestr <- Vectorize(num2timestr)

set.seed(1)
DT <- data.table(pt = round(runif(10000L,
                                  min=as.numeric(anytime("1600-01-01 00:00:00")),
                                  max=as.numeric(anytime("2300-01-01 00:00:00")))),
                 key="pt")
DT[, dt1 := anytime:::format(pt)]
DT[, pt2 := as.numeric(anytime(dt1))]
DT[abs(pt2-pt)>1][,delta:=as.numeric(pt2-pt)][]
DT[abs(pt2-pt)<1][,delta:=as.numeric(pt2-pt)][]

## no issue when parsing as R
DT[,dt3:=as.POSIXct(dt1Str)]
DT[abs(dt1-dt3)>1][,delta:=as.numeric(dt1-dt3)][]



set.seed(1)
DT <- data.table(pt = round(runif(10000L,
                                  min=as.numeric(anytime("1900-01-01 00:00:00")),
                                  max=as.numeric(anytime("2100-01-01 00:00:00")))),
                 key="pt")
DT[, dt1 := anytime:::format(pt)]
DT[, pt2 := as.numeric(anytime(dt1))]
DT[abs(pt2-pt)>1][,delta:=as.numeric(pt2-pt)][]
DT[abs(pt2-pt)<1][,delta:=as.numeric(pt2-pt)][]



set.seed(1)
DT <- data.table(pt = round(runif(10000L,
                                  min=as.numeric(anytime("1930-01-01 00:00:00")),
                                  max=as.numeric(anytime("2038-01-01 00:00:00")))),
                 key="pt")
DT[, dt1 := anytime:::format(pt)]
DT[, pt2 := as.numeric(anytime(dt1))]
DT[abs(pt2-pt)>1][,delta:=as.numeric(pt2-pt)][]
DT[abs(pt2-pt)<1][,delta:=as.numeric(pt2-pt)][]
