ID <- c(1,1,2,2)
Time <- c(1,2,1,2)
X1 <- c(5,3,6,2)
X2 <- c(6,5,1,4)

mydata <- data.frame(ID, Time, X1, X2, stringsAsFactors = FALSE)

library(reshape)
md <- melt(mydata, id=(c("ID", "Time")))
#必须唯一确定每个测量所需的变量（ID和Time），测量变量名的变量（X1、X2）将由程序创建。

#有关cast 见p104，暂时略过