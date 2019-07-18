opar=par(no.readonly = TRUE)
par(mfrow=c(1,3))

plot(NZ199,L,col="blue",lty=2,pch=2,lwd=2,
     xlab="a", ylab="b",
     xlim=c(0,6), ylim=c(0,20))

plot(dose,drugA,type="b", 
     pch=15, lty=1, col="green", 
     ylim=c(0, 60),
     main="DrugA VS DrugB",
     xlab= "Drug Dosage",ylab="Drug Response")
lines(dose,drugB,type = "b",
      pch=17, lty=2, col="blue")
legend("bottomright",inset=.55,title="Drug Type", c("A","B"),
       lty = c(1,2), pch=c(15,17),col=c("green","blue"))

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
