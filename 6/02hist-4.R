par(mfrow=c(2,2))

hist(mtcars$mpg)

hist(mtcars$mpg,
     breaks = 12,
     col = "#60a9a6",
     xlab = "Miles Per Gallon",
     main = "Colored histogram with 12 bins")

hist(mtcars$mpg, 
     freq = FALSE, 
     breaks = 12, 
     col = "#60a9a6", 
     xlab = "Miles Per Gallon", 
     main = "Histogram, rug plot, density curve")
rug(jitter(mtcars$mpg))
#这样将向每个数据点添加一个小的随机值，以避免重叠的点产生影响。
#轴须图（rug plot）:这条密度曲线是一个核密度估计(一维数据in fact)
lines(density(mtcars$mpg), col="#cd3f3e", lwd=2)
#density即为创建核密度曲线

x <- mtcars$mpg
h <- hist(x, 
          breaks = 12,
          col = "#60a9a6",
          xlab = "Miles Per Gallon",
          main = "Histogram with normal curve and box")
xfit <- seq(min(x), max(x), length=40)
yfit <- dnorm(xfit, mean = mean(x), sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col = "#cd3f3e", lwd=2)
#此中线为正态线，与3图lines不同
box()