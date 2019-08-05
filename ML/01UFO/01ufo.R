ufo <- read.delim("C:/newR/ML_for_Hackers-master/01-Introduction/data/ufo/ufo_awesome.tsv", 
                  sep = "\t", stringsAsFactors = FALSE, header = FALSE, na.strings = "")
#我们已经得知，文件是用制表符分隔，所以设置sep为制表符
#所有read*函数默认转化字符串为factor类型
#防止把第一列设置为表头
#把源数据中的空元素定义为NA

names(ufo) <- c("DateOccurred", "DateReported", "Location", "ShortDescription","Duration","LongDescription")
#命名各列

#直接对日期数据进行转化会遇到字符长度不匹配等因素，因此开始数据清洗，转化代码见下行
#ufo$DateOccurred <- as.Date(ufo$DateOccurred, format = "%Y%m%d")

head(ufo[which(nchar(ufo$DateOccurred) != 8 | nchar(ufo$DateReported) != 8), 1])
#显示ufo中O与R字符长度不为8的那一行中的第一个数据

good.rows <- ifelse(nchar(ufo$DateOccurred) != 8 | nchar(ufo$DateReported) != 8, FALSE, TRUE)
#如果ifelse里的条件满足，输出FALSE,否则输出TRUE，代表异常数据为FALSE

#length(which(!good.rows))
#检查异常数据，！代表反向

ufo <- ufo[good.rows,]
#重定义ufo数据集，保留正常数据的全部列

ufo$DateOccurred <- as.Date(ufo$DateOccurred, format = "%Y%m%d")
ufo$DateReported <- as.Date(ufo$DateReported, format = "%Y%m%d")

get.location <- function(l){
  split.location <- tryCatch(strsplit(l, ",")[[1]], error = function(e) return(c(NA, NA)))
  clean.location <- gsub("^ ", "", split.location)
  if(length(clean.location) > 2){
    return(c(NA, NA))
  }
  else{
    return(clean.location)
  }
}
#tryCatch进行异常捕捉，采用对应函数处理异常和错误
#针对列表操作，单括号返回一个列表，双括号返回一个向量
#error = function(e)为trycatch标准用法

city.state <- lapply(ufo$Location, get.location)

location.matrix <- do.call(rbind, city.state)
#do.call() 是告诉list一个函数，然后list里的所有元素来执行这个函数。
#cbind纵向追加，rbind横向追加

ufo <- transform(ufo, USCity = location.matrix[,1], USState=tolower(location.matrix[,2]), 
                 stringsAsFactors = FALSE)

us.states <- c("ak", "al", "ar", "az", "ca", "co", "ct", "de", "fl", "ga", "hi", "ia", "id", 
               "il", "in", "ks", "ky", "la", "ma", "md", "me", "mi", "mn", "mo", "ms", "mt",
               "nc", "nd", "ne", "nh", "nj", "nm", "nv", "ny", "oh", "ok", "or", "pa", "ri",
               "sc", "sd", "tn", "tx", "ut", "va", "vt", "wa", "wi", "wv", "wy")

ufo$USState <- us.states[match(ufo$USState, us.states)]
#match(x,y)返回x在y中第一次出现的位置
ufo$USCity[is.na(ufo$USState)] <- NA

ufo.us <- subset(ufo, !is.na(USState))
#selectresult=subset(df1,name=="aa" & sex=="f",select=c(age,sex))

library(ggplot2)
library(plyr)
quick.hist <- ggplot(ufo.us, aes(x=DateOccurred)) + geom_histogram()+ scale_x_date(date_breaks = "50 years", date_labels="%Y")
#更新后原(major="50 years")不可用

ufo.us <- subset(ufo.us, DateOccurred >= as.Date("1990-01-01"))
#着重统计发生在1990后的ufo事件
#nrow(ufo.us)

ufo.us$YearMonth <- strftime(ufo.us$DateOccurred, format = "%Y-%m")
#strftime把日期对象转化为字符串格式，

sightings.counts <- ddply(ufo.us, .(USState,YearMonth), nrow)
#统计每个州在每个年月期间目击ufo的次数

date.range <- seq.Date(from = as.Date(min(ufo.us$DateOccurred)), to = as.Date(max(ufo.us$DateReported)), by="month")
date.strings <- strftime(date.range, "%Y-%m")
#创建了覆盖整个数据集的年月向量，补充未发生ufo现象的月份

states.dates <- lapply(us.states, function(s)cbind(s,date.strings))
states.dates <- data.frame(do.call(rbind, states.dates), stringsAsFactors = FALSE)
#创建了一个包含所有年月和洲名的数据框，用其去匹配目击数据

all.sightings <- merge(states.dates, sightings.counts, by.x = c("s", "date.strings"), by.y = c("USState", "YearMonth"), all = TRUE)
#这里第一次出现计数全是NA，因为合并的时间格式不一样

names(all.sightings) <- c("State", "YearMonth", "Sightings")
#给all.sightings中的各列命名

all.sightings$Sightings[is.na(all.sightings$Sightings)] <- 0
#为NA的定义为0
all.sightings$YearMonth <- as.Date(rep(date.range, length(us.states)))
#用前面创建的date.range向量和rep函数创建一个和date.range一模一样的向量，将日期字符串转化为日期向量
all.sightings$State <- as.factor(toupper(all.sightings$State))
#之前用attach不知道为什么不行？？？

#数据清洗到此结束，开始分析

state.plot <- ggplot(all.sightings, aes(x = YearMonth, y = Sightings)) + 
                     geom_line(aes(color = "darkblue"), size = 0.75) + 
                       facet_wrap(~State, nrow = 10, ncol = 5) + 
                       theme_bw() + 
                       scale_colour_manual(values = c("darkblue" = "darkblue")) + 
                       scale_x_date(date_breaks = "5 years", date_labels="%Y") + 
                       xlab("目击时间") + 
                       ylab("目击次数") + 
                       ggtitle("Number of UFO sightings by Mouth-Year and U.S.State(1990-2010)")
#opts(title = "Number of UFO sightings by Mouth-Year and U.S.State(1990-2010)") 为老版本

