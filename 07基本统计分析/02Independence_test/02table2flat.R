table2flat <- function(mytable){
  df <- as.data.frame(mytable)
  rows <- dim(df)[1]
  cols <- dim(df)[2]
  x <- NULL
  for (i in 1:rows) {
    for (i in 1:df$Freq[i]) {
      row <- df[i, c(1:(cols-1))]
      x <- rbind(x,row)
    }
  }
  row.names(x) <- c(1:dim(x)[1])
  return(x)
}

treatment <- rep(c("placebo","treated"), times=3)
improved <- rep(c("none", "some","marked"), each = 2)
Freq <- c(29,13,7,17,7,21)
mytable <- as.data.frame(cbind(treatment, improved, Freq))
mydata <- table2flat(mytable)
head(mydata)