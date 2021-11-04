sim5.lnl <- read.csv("./bs_data/sim5_lnLs.csv")
sim6.lnl <- read.csv("./bs_data/sim6_lnLs.csv")
sim7a.lnl <- read.csv("./bs_data/sim7a_lnLs.csv")
sim7b.lnl <- read.csv("./bs_data/sim7b_lnLs.csv")
sim7c.lnl <- read.csv("./bs_data/sim7c_lnLs.csv")

lrs.sim5 <- sort(2*(sim5.lnl$bsA-sim5.lnl$null2))
lrs.sim6 <- sort(2*(sim6.lnl$bsA-sim6.lnl$null2))
lrs.sim7a <- sort(2*(sim7a.lnl$bsA-sim7a.lnl$null2))
lrs.sim7b <- sort(2*(sim7b.lnl$bsA-sim7b.lnl$null2))
lrs.sim7c <- sort(2*(sim7c.lnl$bsA-sim7c.lnl$null2))

N <- length(lrs.sim6)
x <- seq(0,6.3,length.out=N)

pdf("~/scm/thesis_talk.git/bs_hist_ht.pdf")
par(mfrow=c(1,3))

par(mai=c(.3,.3,0,0))
plot(x,1/2+pchisq(x,1)/2,type='l',main='',xlab='',ylab='',cex.axis=1.5)
title("Study 5",adj=0.05,line=-2,cex.main=1.5)
title(expression(paste(p[0],"=",p[1],"=0.375")),adj=0.07,line=-4,cex.main=1.5)
title(expression(paste(omega[0],"=0")),adj=0.05,line=-5.5,cex.main=1.5)
points(x,pchisq(x,1),col='grey',type='l')
points(sort(lrs.sim5),c(1:N)/N,col='#0072B2',lty=2,lwd=2.0,type='l') # blue

par(mai=c(.3,0,0,0))
plot(x,1/2+pchisq(x,1)/2,type='l',main='',xlab='',cex.axis=1.5,yaxt='n')
title("Study 6",adj=0.1,line=-2,cex.main=1.5)
title(expression(paste(p[0],"=",p[1],"=0.475")),adj=0.12,line=-4,cex.main=1.5)
title(expression(paste(omega[0],"=0")),adj=0.09,line=-5.5,cex.main=1.5)
points(x,pchisq(x,1),col='grey',type='l')
points(sort(lrs.sim6),c(1:N)/N,col='#0072B2',lty=2,lwd=2.0,type='l') # blue

par(mai=c(.3,0,0,0))
plot(x,1/2+pchisq(x,1)/2,type='l',yaxt='n',xlab='',ylab='',cex.axis=1.5)
title("Studies 7a-7c",adj=0.15,line=-2,cex.main=1.5)
title(expression(paste(p[0],"=",p[1],"=0.5")),adj=0.12,line=-3.8,cex.main=1.5)
title(expression(paste(omega[0],"=0")),adj=0.09,line=-5.5,cex.main=1.5)
points(x,pchisq(x,1),col='grey',type='l')
points(sort(lrs.sim7a),c(1:N)/N,col='#0072B2',lty=2,lwd=2.0,type='l') # blue
points(sort(lrs.sim7b),c(1:N)/N,col='#d66d00',lty=3,lwd=2.5,type='l') # orange
points(sort(lrs.sim7c),c(1:N)/N,col='#000000',lty=4,lwd=2.0,type='l') # black

legend(1.4,.7,c('a','b','c',expression(chi[0]^2/2 + chi[1]^2/2),expression(chi[1]^2)),
       cex=1.7,
       col=c('#0072B2','#d66d00','#000000','#000000','grey'),
       lty=c(2,3,4,1,1),
       lwd=c(2,2.5,2,1,1),
       seg.len=2.8,
       box.col='white')
dev.off()