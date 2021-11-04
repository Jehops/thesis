sim8a.lnl <- read.csv("./bs_data/sim8a_lnLs.csv")
sim8b.lnl <- read.csv("./bs_data/sim8b_lnLs.csv")
sim8c.lnl <- read.csv("./bs_data/sim8c_lnLs.csv")
sim8d.lnl <- read.csv("./bs_data/sim8d_lnLs.csv")
sim9a.lnl <- read.csv("./bs_data/sim9a_lnLs.csv")
sim9b.lnl <- read.csv("./bs_data/sim9b_lnLs.csv")

lrs.sim8a <- sort(2*(sim8a.lnl$bsA-sim8a.lnl$null2))
lrs.sim8b <- sort(2*(sim8b.lnl$bsA-sim8b.lnl$null2))
lrs.sim8c <- sort(2*(sim8c.lnl$bsA-sim8c.lnl$null2))
lrs.sim8d <- sort(2*(sim8d.lnl$bsA-sim8d.lnl$null2))
lrs.sim9a <- sort(2*(sim9a.lnl$bsA-sim9a.lnl$null2))
lrs.sim9b <- sort(2*(sim9b.lnl$bsA-sim9b.lnl$null2))

N <- length(lrs.sim8a)
x <- seq(0,6.3,length.out=N)

pdf("~/scm/thesis_talk.git/bs_hist_wm.pdf")
par(mfrow=c(1,2))
par(mai=c(.5,.45,0,0))

plot(x,1/2+pchisq(x,1)/2,type='l',main='',xlab='',ylab=expression("P(X"<="x)"))
title("Studies 8a-8d",adj=0.65,line=-10,cex.main=1)
title(expression(paste(p[0],"=",p[1],"=0.4 ",p[2],"=0.2")),adj=0.7,line=-12,cex.main=0.85,cex.main=1)
title(expression(paste(omega[0],"=0.1 ",omega[1],"=0.5 ",omega[2],"=0.9"),p[2],"=0.2"),adj=0.82,line=-13,cex.main=1)
points(x,pchisq(x,1),col='grey',type='l')
points(sort(lrs.sim8a),c(1:N)/N,col='#0072B2',lty=2,lwd=2.0,type='l') # blue
points(sort(lrs.sim8b),c(1:N)/N,col='#d66d00',lty=3,lwd=2.5,type='l') # orange
points(sort(lrs.sim8c),c(1:N)/N,col='#000000',lty=4,lwd=2.0,type='l') # black
points(sort(lrs.sim8d),c(1:N)/N,col='#67933a',lty=6,lwd=2.0,type='l') # green

par(mai=c(.5,0,0,0))

plot(x,1/2+pchisq(x,1)/2,type='l',main='',xlab='',yaxt='n',cex.lab=1.5)
title("Studies 9a-9b",adj=0.65,line=-10,cex.main=1)
title(expression(paste(p[0],"=0.4 ",p[1],"=0.2 ",p[2],"=0.4")),adj=0.8,line=-12,cex.main=1)
title(expression(paste(omega[0],"=0.1 ",omega[1],"=0.5 ",omega[2],"=0.9"),p[2],"=0.2"),adj=0.83,line=-13,cex.main=1)
points(x,pchisq(x,1),col='grey',type='l')
points(sort(lrs.sim9a),c(1:N)/N,col='#0072B2',lty=2,lwd=2.0,type='l') # blue
points(sort(lrs.sim9b),c(1:N)/N,col='#d66d00',lty=3,lwd=2.5,type='l') # orange

legend(2.8,.7,c('a','b','c','d',expression(chi[0]^2/2 + chi[1]^2/2),expression(chi[1]^2)),
       cex=1,
       col=c('#0072B2','#d66d00','#000000','#67933a','#000000','grey'),
       lty=c(2,3,4,6,1,1),
       lwd=c(2,2.5,2,2,1,1),
       seg.len=4,
       box.col='white')
dev.off()