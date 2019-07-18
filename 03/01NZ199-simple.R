NZ199 <- c(0,2,4,6)
L <- c(18.548,14.771,11.881,0)

opar <- par(no.readonly=TRUE)
par(mfrow=c(2,3))
par(lwd=2,cex=1.5,cex.axis=.75,font.axis=3)


plot(NZ199,L,col="blue",lty=2,pch=2,lwd=2,main="",sub="",
	xlab="老化天数", ylab="苗长",
	xlim=c(0,6), ylim=c(0,20))

plot(NZ199,L,type="c", col="blue",lty=2,pch=2,lwd=2,main="",sub="",
     xlab="老化天数", ylab="苗长",
     xlim=c(0,6), ylim=c(0,20))

plot(NZ199,L,type="o", col="blue",lty=2,pch=2,lwd=2,main="",sub="",
     xlab="老化天数", ylab="苗长",
     xlim=c(0,6), ylim=c(0,20))

plot(NZ199,L,type="h", col="blue",lty=2,pch=2,lwd=2,main="",sub="",
     xlab="老化天数", ylab="苗长",
     xlim=c(0,6), ylim=c(0,20))

plot(NZ199,L,type="s", col="blue",lty=2,pch=2,lwd=2,main="",sub="",
     xlab="老化天数", ylab="苗长",
     xlim=c(0,6), ylim=c(0,20))

plot(NZ199,L,type="S", col="blue",lty=2,pch=2,lwd=2,main="",sub="",
     xlab="老化天数", ylab="苗长",
     xlim=c(0,6), ylim=c(0,20))

par(opar)

