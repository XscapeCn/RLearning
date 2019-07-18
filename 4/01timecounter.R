startdate <- as.Date("2016-11-10")
nowadays <- as.Date(Sys.Date())

days <- nowadays - startdate


difftime(nowadays, startdate, units = "weeks")
