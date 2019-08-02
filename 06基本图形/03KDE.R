#https://baike.baidu.com/item/%E6%A0%B8%E5%AF%86%E5%BA%A6%E4%BC%B0%E8%AE%A1/10349033?fr=aladdin

par(mfrow = c(2,1))
d <- density(mtcars$mpg)

plot(d)
rug(mtcars$mpg, col = "#4f3a65")

d <- density(mtcars$mpg)
plot(d, main = "Kernel Density of Miles Per Gallon")
polygon(d, col="#dff0ea", border = "#95adbe", lwd=2)
rug(mtcars$mpg, col = "#4f3a65")

