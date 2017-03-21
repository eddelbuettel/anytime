suppressMessages({                                                                              
    library(anytime)                                                                            
    library(data.table)                                                                         
})    
set.seed(1)                                                                                     
DT <- data.table(dt1=as.POSIXct('1970-01-01 00:00:00')+floor(1e6*rnorm(1e6,sd=1000)), key='dt1')
DT[,dt1Str:=as.character(dt1)]                                                                  
DT[,dt2:=anytime(dt1Str)]                                                                       
DT[abs(dt1-dt2)>1][,delta:=as.numeric(dt1-dt2)][]      

newdt <- DT[abs(dt1-dt2)>1][,delta:=as.numeric(dt1-dt2)]
newdt[, year:=year(as.IDate(dt2))]
newdt[, .(count=.N), by=year]


newdt[, .(count=.N), by=10*round(year/10,0)]

