manager <- c(1,2,3,4,5)
date <- c("10/24/08", "10/28/08","10/01/08","10/12/08","05/01/09")
country <- c("US","US","UK","UK","UK")
gender <- c("M","F","F","M","F")
age <- c(32,45,25,39,99)
q1 <- c(5,3,3,3,2)
q2 <- c(4,5,5,3,2)
q3 <- c(5,2,5,4,1)
q4 <- c(5,5,5,NA,2)
q5 <- c(5,5,2,NA,1)

leadership <- data.frame(manager,date,country,gender,age,q1,q2,q3,q4,q5,stringsAsFactors = FALSE)


#leadership <- transform(leadership, sum1= q1+q2+q3+q4+q5, mean1= sum1/5)
#transform, 添加两列变量，分别为q值之和以及每个人的q值平均数

#fix(leadership)
#fix,调用数据框进行数据的修改

#names(leadership)
#names，显示数据框的各变量

#names(leadership)[2] <- "teatdate" 
#修改第二个变量名

#is.na(leadership)
#is.na，显示数据里的NA（Not Available）

leadership$age[leadership$age == 99] <- NA
#年龄中每个严格等于99的都会被判为缺失（重编码）

#newdata <- na.omit(leadership)
#使用后，行删除原数据框中含有NA的，而后重新输出数据框“newdata”中（listwise deletion）

myformat <- "%m/%d/%y"
leadership$date <- as.Date(leadership$date, myformat)
#将leadership里的date变量由str变为num型数据


