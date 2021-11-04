rm(list=ls())
simc10.lnl <- read.csv("./bs_data/simc10_lnLs.csv")
simc10n.lnl <- read.csv("./bs_data/simc10n_lnLs.csv")
simc11.lnl <- read.csv("./bs_data/simc11_lnLs.csv")
simc11n.lnl <- read.csv("./bs_data/simc11n_lnLs.csv")
simc12.lnl <- read.csv("./bs_data/simc12_lnLs.csv")
simc12n.lnl <- read.csv("./bs_data/simc12n_lnLs.csv")

lrs.simc10 <- sort(2*(simc10.lnl$bsA-simc10.lnl$null2))
lrs.simc10n <- sort(2*(simc10n.lnl$bsA-simc10n.lnl$null2))
lrs.simc11 <- sort(2*(simc11.lnl$bsA-simc11.lnl$null2))
lrs.simc11n <- sort(2*(simc11n.lnl$bsA-simc11n.lnl$null2))
lrs.simc12 <- sort(2*(simc12.lnl$bsA-simc12.lnl$null2))
lrs.simc12n <- sort(2*(simc12n.lnl$bsA-simc12n.lnl$null2))

N <- length(lrs.simc10)
x <- seq(0,6.3,length.out=N)

pdf("~/scm/thesis_talk.git/bs_cdfs_conf.pdf")
par(mfrow=c(3,2),mai=c(0,.3,0.1,0))

plot(x,1/2+pchisq(x,1)/2,type='l',ylab='',xaxt='n',ann=F,main="Study 1")
title("Study 10",adj=0.9,line=-5)
##title(expression(paste(p[0],"=0.7 ",p[1],"=0.2 ",omega[0],"=0.3")),adj=0.9,line=-8)
title(expression(paste(p[0],"=0.5 ",p[1],"=0.4 ",omega[0],"=0.75 ",omega[2],"=2.0")),adj=0.9,line=-8)
points(x,pchisq(x,1),col='grey',type='l')
points(sort(lrs.simc10),c(1:N)/N,col='#0072B2',lty=2,lwd=2.0,type='l') # blue
points(sort(lrs.simc10n),c(1:N)/N,col='#d66d00',lty=3,lwd=2.5,type='l') # orange
legend(2.5,.73,c('Null','Confound',expression(chi[0]^2/2 + chi[1]^2/2),expression(chi[1]^2)),
       cex=1.5,
       col=c('#d66d00','#0072B2','#000000','grey'),
       lty=c(3,2,1,1),
       lwd=c(2,2.5,1,1),
       seg.len=4,
       box.col='white')

tree <- read.tree(text="(((A:0.214286,B:0.214286):0.214286,(C:0.214286,D:0.214286):0.214286):0.214286,((E:0.214286,F:0.214286):0.214286,(G:0.214286,H:0.214286):0.214286):0.214286);");
edge.colors <- rep(1,68)
##edge.colors[c(12,14,33,34,36,38,53,54,55,59)] <- brewer.pal(n=10,name="Paired")
edge.colors[c(2,5)] <- c("#0000FF","#8B0000")
##edge.widths <- rep(2,68)
edge.widths <- rep(4,14)
##edge.widths[c(2,5)] <- 6

par(mai=c(.3,0,0,0))
plot(tree,cex=1.5,type="phylogram",edge.color=edge.colors,edge.width=edge.widths,lab4ut="axial",show.node.label=F,label.offset=0.01)
##edgelabels(tree$edge.length, bg="black", col="white", font=2)
##add.scale.bar()
##branches.tested <- c('Vampyroteuthis','Sepiida','Groenlandibelids','Idiosepius','Sepiolida','Loliginidae','Oegop_Bathy','Bathyteuthis','Oegopsida','Ommastrepidae')
legend(0,8.7,c('Simulated','Fitted'),c("#8B0000","#0000FF"),box.lty=0,cex=1.4)

par(mai=c(0,.3,0,0))
plot(x,1/2+pchisq(x,1)/2,type='l',ylab='',xaxt='n',ann=F,main="Study 1")
title("Study 11",adj=0.9,line=-5)
title(expression(paste(p[0],"=0.475 ",p[1],"=0.475 ",omega[0],"=0 ",omega[2],"=3.0")),adj=0.95,line=-9)
##title(expression(paste(p[0],"=0.7 ",p[1],"=0.2 ",omega[0],"=0.3")),adj=0.9,line=-8)
points(x,pchisq(x,1),col='grey',type='l')
points(sort(lrs.simc11),c(1:N)/N,col='#0072B2',lty=2,lwd=2.0,type='l') # blue
points(sort(lrs.simc11n),c(1:N)/N,col='#d66d00',lty=3,lwd=2.5,type='l') # orange

tree <- read.tree(text="(((A:0.214286,B:0.214286):0.214286,(C:0.214286,D:0.214286):0.214286):0.214286,((E:0.214286,F:0.214286):0.214286,(G:0.214286,H:0.214286):0.214286):0.214286);");
edge.colors <- rep(1,14)
edge.colors[c(2,5)] <- c("#0000FF","#8B0000")
edge.widths <- rep(4,14)

par(mai=c(.3,0,0,0))
plot(tree,cex=1.5,type="phylogram",edge.color=edge.colors,edge.width=edge.widths,lab4ut="axial",show.node.label=F,label.offset=0.01)
##edgelabels(tree$edge.length, bg="black", col="white", font=2)
##add.scale.bar()

par(mai=c(0.3,0.3,0,0))
plot(x,1/2+pchisq(x,1)/2,type='l',ylab='',,ann=F,main="Study 1")
title("Study 12",adj=0.9,line=-6)
title(expression(paste(p[0],"=0.475 ",p[1],"=0.475 ",omega[0],"=0 ",omega[2],"=3.0")),adj=0.95,line=-11)
points(x,pchisq(x,1),col='grey',type='l')
points(sort(lrs.simc12),c(1:N)/N,col='#0072B2',lty=2,lwd=2.0,type='l') # blue
points(sort(lrs.simc12n),c(1:N)/N,col='#d66d00',lty=3,lwd=2.5,type='l') # orange

tree <- read.tree(text="(((A:0.214286,B:0.214286):0.214286,(C:0.214286,D:0.214286):0.214286):0.214286,((E:0.214286,F:0.214286):0.214286,(G:0.214286,H:0.214286):0.214286):0.214286);");
edge.colors <- rep(1,14)
##edge.colors[c(12,14,33,34,36,38,53,54,55,59)] <- brewer.pal(n=10,name="Paired")
edge.colors[seq(2,7)] <- c("#0000FF")
edge.colors[seq(9,14)] <- c("#8B0000")
edge.widths <- rep(4,14)

par(mai=c(.3,0,0,0))
plot(tree,cex=1.5,type="phylogram",edge.color=edge.colors,edge.width=edge.widths,lab4ut="axial",show.node.label=F,label.offset=0.01)
##edgelabels(tree$edge.length, bg="black", col="white", font=2)
##add.scale.bar()
##branches.tested <- c('Vampyroteuthis','Sepiida','Groenlandibelids','Idiosepius','Sepiolida','Loliginidae','Oegop_Bathy','Bathyteuthis','Oegopsida','Ommastrepidae')
dev.off()
