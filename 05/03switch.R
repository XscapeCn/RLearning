mydata <- function(type ="long") {
  switch(type,
         long = format(Sys.Date(), "%a %b %d %y"),
         short = format(Sys.Date(), "%m-%d-%y"),
         cat(type, 'is not an available type\n')
         )
}


mydata("shor")