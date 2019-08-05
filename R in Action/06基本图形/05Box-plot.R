mtcars$cyl.f <- factor(mtcars$cyl,
                       levels = c(4,6,8), 
                       labels = c("4", "6", "8"))

mtcars$am.f <- factor(mtcars$am, 
                      levels = c(0,1), 
                      labels = c("Auto", "Standard"))

boxplot(mpg ~ am.f*cyl.f, data = mtcars, 
        varwidth = TRUE, 
        col = c("#28c3d4", "#fafdcb"), 
        main = "MPG Distributino by Auto Type", 
        xlab = "Auto type")

#install.packages("vioplot")
#library("vioplot")
#x1 <- mtcars$mpg[mtcars$cyl==4]
#x2 <- mtcars$mpg[mtcars$cyl==6]
#x3 <- mtcars$mpg[mtcars$cyl==8]
#vioplot(x1,x2,x3, names = c("4 cylinder", "6 cylinder", "8 cylinder"), col="#28c3d4")
#title("Violin plots of miles per gallon")
