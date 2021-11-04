library(ggplot2)

p0_0.25_w0_0.25_m2a_mles <- read.csv("~/scm/modl.git/sim/null/5_taxa_bl_3/data/p0_0.25_w0_0.25_m2a_mles.csv",header=F)
colnames(p0_0.25_w0_0.25_m2a_mles) <- c('k','p0','p1','p2','w0','w1','w2')
p0_0.25_w0_0.5_m2a_mles <- read.csv("~/scm/modl.git/sim/null/5_taxa_bl_3/data/p0_0.25_w0_0.5_m2a_mles.csv",header=F)
colnames(p0_0.25_w0_0.5_m2a_mles) <- c('k','p0','p1','p2','w0','w1','w2')
p0_0.5_w0_0.25_m2a_mles <- read.csv("~/scm/modl.git/sim/null/5_taxa_bl_3/data/p0_0.5_w0_0.25_m2a_mles.csv",header=F)
colnames(p0_0.5_w0_0.25_m2a_mles) <- c('k','p0','p1','p2','w0','w1','w2')
p0_0.5_w0_0.5_m2a_mles <- read.csv("~/scm/modl.git/sim/null/5_taxa_bl_3/data/p0_0.5_w0_0.5_m2a_mles.csv",header=F)
colnames(p0_0.5_w0_0.5_m2a_mles) <- c('k','p0','p1','p2','w0','w1','w2')
p0_0.75_w0_0.25_m2a_mles <- read.csv("~/scm/modl.git/sim/null/5_taxa_bl_3/data/p0_0.75_w0_0.25_m2a_mles.csv",header=F)
colnames(p0_0.75_w0_0.25_m2a_mles) <- c('k','p0','p1','p2','w0','w1','w2')
p0_0.75_w0_0.5_m2a_mles <- read.csv("~/scm/modl.git/sim/null/5_taxa_bl_3/data/p0_0.75_w0_0.5_m2a_mles.csv",header=F)
colnames(p0_0.75_w0_0.5_m2a_mles) <- c('k','p0','p1','p2','w0','w1','w2')

p0_0.25_w0_0.25_c2_mles <- read.csv("~/scm/modl.git/sim/null/5_taxa_bl_3/data/p0_0.25_w0_0.25_c2_mles.csv",header=F)
colnames(p0_0.25_w0_0.25_c2_mles) <- c('k','p0','p1','p2','w0','w1','w2')
p0_0.25_w0_0.5_c2_mles <- read.csv("~/scm/modl.git/sim/null/5_taxa_bl_3/data/p0_0.25_w0_0.5_c2_mles.csv",header=F)
colnames(p0_0.25_w0_0.5_c2_mles) <- c('k','p0','p1','p2','w0','w1','w2')
p0_0.5_w0_0.25_c2_mles <- read.csv("~/scm/modl.git/sim/null/5_taxa_bl_3/data/p0_0.5_w0_0.25_c2_mles.csv",header=F)
colnames(p0_0.5_w0_0.25_c2_mles) <- c('k','p0','p1','p2','w0','w1','w2')
p0_0.5_w0_0.5_c2_mles <- read.csv("~/scm/modl.git/sim/null/5_taxa_bl_3/data/p0_0.5_w0_0.5_c2_mles.csv",header=F)
colnames(p0_0.5_w0_0.5_c2_mles) <- c('k','p0','p1','p2','w0','w1','w2')
p0_0.75_w0_0.25_c2_mles <- read.csv("~/scm/modl.git/sim/null/5_taxa_bl_3/data/p0_0.75_w0_0.25_c2_mles.csv",header=F)
colnames(p0_0.75_w0_0.25_c2_mles) <- c('k','p0','p1','p2','w0','w1','w2')
p0_0.75_w0_0.5_c2_mles <- read.csv("~/scm/modl.git/sim/null/5_taxa_bl_3/data/p0_0.75_w0_0.5_c2_mles.csv",header=F)
colnames(p0_0.75_w0_0.5_c2_mles) <- c('k','p0','p1','p2','w0','w1','w2')

w0 <- c(p0_0.25_w0_0.25_c2_mles$w0,p0_0.25_w0_0.5_c2_mles$w0,
        p0_0.5_w0_0.25_c2_mles$w0,p0_0.5_w0_0.5_c2_mles$w0,
        p0_0.75_w0_0.25_c2_mles$w0,p0_0.75_w0_0.5_c2_mles$w0)

N <- nrow(p0_0.25_w0_0.25_m2a_mles)

mle.data <- data.frame(w0,
                       weight=rep(c(0.25,0.5,0.75),each=2*N),
                       omega=rep(c(0.25,0.5),each=N,times=3))

pdf("~/scm/thesis_talk.git/modl_prob_mles.pdf")
cdf.plot <- ggplot(mle.data,aes(w0,y=..ncount..)) +
    geom_histogram(binwidth=.005,fill=I('black')) +
    labs(x=expression(omega[0]),y='') +
    facet_grid(weight~omega,labeller=label_bquote(cols=omega[0]*'='*.(omega),rows=p[0]*'='*.(weight)))

cdf.plot +
    theme(panel.spacing=unit(2,"lines"),
          panel.background=element_blank(),
          strip.background=element_blank(),
          text=element_text(size=18),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank())
##panel.border = element_rect(colour = "black", fill=NA, size=0))
dev.off()