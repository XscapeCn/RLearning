x <- c(1:10)
y <- x
z <- 10/x

opar <- par(no.readonly = TRUE)

par(mar=c(5,4,4,8)+ 0.1)

plot(x,y,type="b",
     pch=21,col="green",yaxt="n", lty=3,ann=FALSE)

lines(x,z,type = "b", pch=22, col="blue",lty=2)

axis(2,at=x,labels = x, col.axis="black",las=2)

axis(4,at=z, labels=round(z, digits=2),
     col.axis="black", las=2, cex.axis= 0.7,tck=-0.01)

mtext("y=10/x",side = 4, line = 3, cex.lab=1, las=2)

title("An example of creating Axes", 
      xlab="X values", 
      ylab = "Y=X")

legend("bottomright",inset=.55, c("Y=X","Y=10/X"),
       lty = c(1,2), pch=c(21,22),col=c("green","blue"))

par(opar)