rm(list=ls())
sim1a.lnl <- read.csv("./bs_data/sim1a_lnLs.csv")
sim1b.lnl <- read.csv("./bs_data/sim1b_lnLs.csv")
sim1c.lnl <- read.csv("./bs_data/sim1c_lnLs.csv")
sim1d.lnl <- read.csv("./bs_data/sim1d_lnLs.csv")

sim2a.lnl <- read.csv("./bs_data/sim2a_lnLs.csv")
sim2b.lnl <- read.csv("./bs_data/sim2b_lnLs.csv")

sim3a.lnl <- read.csv("./bs_data/sim3a_lnLs.csv")
sim3b.lnl <- read.csv("./bs_data/sim3b_lnLs.csv")

sim4a.lnl <- read.csv("./bs_data/sim4a_lnLs.csv")
sim4b.lnl <- read.csv("./bs_data/sim4b_lnLs.csv")
sim4c.lnl <- read.csv("./bs_data/sim4c_lnLs.csv")
sim4d.lnl <- read.csv("./bs_data/sim4d_lnLs.csv")

lrs.sim1a <- sort(2*(sim1a.lnl$bsA-sim1a.lnl$null2))
lrs.sim1b <- sort(2*(sim1b.lnl$bsA-sim1b.lnl$null2))
lrs.sim1c <- sort(2*(sim1c.lnl$bsA-sim1c.lnl$null2))
lrs.sim1d <- sort(2*(sim1d.lnl$bsA-sim1d.lnl$null2))

lrs.sim2a <- sort(2*(sim2a.lnl$bsA-sim2a.lnl$null2))
lrs.sim2b <- sort(2*(sim2b.lnl$bsA-sim2b.lnl$null2))

lrs.sim3a <- sort(2*(sim3a.lnl$bsA-sim3a.lnl$null2))
lrs.sim3b <- sort(2*(sim3b.lnl$bsA-sim3b.lnl$null2))

lrs.sim4a <- sort(2*(sim4a.lnl$bsA-sim4a.lnl$null2))
lrs.sim4b <- sort(2*(sim4b.lnl$bsA-sim4b.lnl$null2))
lrs.sim4c <- sort(2*(sim4c.lnl$bsA-sim4c.lnl$null2))
lrs.sim4d <- sort(2*(sim4d.lnl$bsA-sim4d.lnl$null2))

N <- length(lrs.sim1a)
x <- seq(0,6.3,length.out=N)

pdf("~/scm/thesis_talk.git/bs_sfb_cdf.pdf")
par(mfrow=c(2,2))
par(mai=c(0,.3,0,0))
plot(x,1/2+pchisq(x,1)/2,type='l',ylab='',xaxt='n',ann=F,main="Study 1")
title("Studies 1a-1d",adj=0.9,line=-5)
title(expression(paste(p[0],"=0.7 ",p[1],"=0.2 ",omega[0],"=0.3")),adj=0.9,line=-8)
points(x,pchisq(x,1),col='grey',type='l')
points(sort(lrs.sim1a),c(1:N)/N,col='#0072B2',lty=2,lwd=2.0,type='l') # blue
points(sort(lrs.sim1b),c(1:N)/N,col='#d66d00',lty=3,lwd=2.5,type='l') # orange
points(sort(lrs.sim1c),c(1:N)/N,col='#000000',lty=4,lwd=2.0,type='l') # black
points(sort(lrs.sim1d),c(1:N)/N,col='#67933a',lty=6,lwd=2.0,type='l') # green

par(mai=c(0,0,0,0))
plot(x,1/2+pchisq(x,1)/2,type='l',ylab='',xaxt='n',yaxt='n',main='',ann=F)
title("Studies 2a-2b",adj=0.9,line=-5)
title(expression(paste(p[0],"=0.75 ",p[1],"=0.25 ",omega[0],"=0.3")),adj=0.9,line=-8)
points(x,pchisq(x,1),col='grey',type='l')
points(sort(lrs.sim2a),c(1:N)/N,col='#0072B2',lty=2,lwd=2.0,type='l') # blue
points(sort(lrs.sim2b),c(1:N)/N,col='#d66d00',lty=3,lwd=2.5,type='l') # orange

par(mai=c(.3,.3,0,0))
plot(x,1/2+pchisq(x,1)/2,type='l',yaxt='n',ylab='',main='',ann=F)
title("Studies 3a-3b",adj=0.9,line=-5)
title(expression(paste(p[0],"=0.25 ",p[1],"=0.75 ",omega[0],"=0.3")),adj=0.9,line=-8)
axis(2, at=c(0.5,0.6,0.7,0.8,0.9),labels=c('0.5','0.6','0.7','0.8','0.9'))
points(x,pchisq(x,1),col='grey',type='l')
points(sort(lrs.sim3a),c(1:N)/N,col='#0072B2',lty=2,lwd=2.0,type='l') # blue
points(sort(lrs.sim3b),c(1:N)/N,col='#d66d00',lty=3,lwd=2.5,type='l') # orange

par(mai=c(0.3,0,0,0))
plot(x,1/2+pchisq(x,1)/2,type='l',ylab='',yaxt='n',main='',ann=F)
title("Studies 4a-4d",adj=0.9,line=-5)
title(expression(paste(p[0],"=",p[1],"=0.5 ",omega[0],"=0")),adj=0.9,line=-8)
points(x,pchisq(x,1),col='grey',type='l')
points(sort(lrs.sim4a),c(1:N)/N,col='#0072B2',lty=2,lwd=2.0,type='l') # blue
points(sort(lrs.sim4b),c(1:N)/N,col='#d66d00',lty=3,lwd=2.5,type='l') # orange
points(sort(lrs.sim4c),c(1:N)/N,col='#000000',lty=4,lwd=2.0,type='l') # black
points(sort(lrs.sim4d),c(1:N)/N,col='#67933a',lty=6,lwd=2.0,type='l') # green
legend(2.8,.77,c('a','b','c','d',expression(chi[0]^2/2 + chi[1]^2/2),expression(chi[1]^2)),
       cex=1.3,
       col=c('#0072B2','#d66d00','#000000','#67933a','#000000','grey'),
       lty=c(2,3,4,6,1,1),
       lwd=c(2,2.5,2,2,1,1),
       seg.len=4,
       box.col='white')
dev.off()