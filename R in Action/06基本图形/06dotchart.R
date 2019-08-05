x <- mtcars[order(mtcars$mpg),]

x$cyl <- factor(x$cyl)
x$color[x$cyl==4] <- "#fac0e1"
x$color[x$cyl==6] <- "#caa5f1"
x$color[x$cyl==8] <- "#59d4e8"

dotchart(x$mpg, 
         labels = row.names(x), 
         cex= .75, 
         groups = x$cyl, 
         gcolor= "black", 
         col = x$color,
         pch =19, 
         main = "Gas Mileage for Car Models", 
         xlab = "Miles per Gallon")