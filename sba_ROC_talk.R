c1s3.ft.fp     <- scan("../sba.git/doc/paper/data/c1s3_opt_fp.csv",sep=',')
c1s3.ft.tp     <- scan("../sba.git/doc/paper/data/c1s3_opt_tp.csv",sep=',')

c1s3m2a.beb.fp <- scan("../sba.git/doc/paper/data/c1s3_m2a_beb_fp.csv",sep=',')
c1s3m2a.neb.fp <- scan("../sba.git/doc/paper/data/c1s3_m2a_neb_fp.csv",sep=',')
c1s3m2a.sba.fp <- scan("../sba.git/doc/paper/data/c1s3_m2a_sba_fp.csv",sep=',')
c1s3m2a.beb.tp <- scan("../sba.git/doc/paper/data/c1s3_m2a_beb_tp.csv",sep=',')
c1s3m2a.neb.tp <- scan("../sba.git/doc/paper/data/c1s3_m2a_neb_tp.csv",sep=',')
c1s3m2a.sba.tp <- scan("../sba.git/doc/paper/data/c1s3_m2a_sba_tp.csv",sep=',')

c1s3m8.beb.fp  <- scan("../sba.git/doc/paper/data/c1s3_m8_beb_fp.csv",sep=',')
c1s3m8.neb.fp  <- scan("../sba.git/doc/paper/data/c1s3_m8_neb_fp.csv",sep=',')
c1s3m8.sba.fp  <- scan("../sba.git/doc/paper/data/c1s3_m8_sba_fp.csv",sep=',')
c1s3m8.beb.tp  <- scan("../sba.git/doc/paper/data/c1s3_m8_beb_tp.csv",sep=',')
c1s3m8.neb.tp  <- scan("../sba.git/doc/paper/data/c1s3_m8_neb_tp.csv",sep=',')
c1s3m8.sba.tp  <- scan("../sba.git/doc/paper/data/c1s3_m8_sba_tp.csv",sep=',')

c2s7.ft.fp     <- scan("../sba.git/doc/paper/data/c2s7_opt_fp.csv",sep=',')
c2s7.ft.tp     <- scan("../sba.git/doc/paper/data/c2s7_opt_tp.csv",sep=',')

c2s7m2a.beb.fp <- scan("../sba.git/doc/paper/data/c2s7_m2a_beb_fp.csv",sep=',')
c2s7m2a.neb.fp <- scan("../sba.git/doc/paper/data/c2s7_m2a_neb_fp.csv",sep=',')
c2s7m2a.sba.fp <- scan("../sba.git/doc/paper/data/c2s7_m2a_sba_fp.csv",sep=',')
c2s7m2a.beb.tp <- scan("../sba.git/doc/paper/data/c2s7_m2a_beb_tp.csv",sep=',')
c2s7m2a.neb.tp <- scan("../sba.git/doc/paper/data/c2s7_m2a_neb_tp.csv",sep=',')
c2s7m2a.sba.tp <- scan("../sba.git/doc/paper/data/c2s7_m2a_sba_tp.csv",sep=',')

c2s7m8.beb.fp  <- scan("../sba.git/doc/paper/data/c2s7_m8_beb_fp.csv",sep=',')
c2s7m8.neb.fp  <- scan("../sba.git/doc/paper/data/c2s7_m8_neb_fp.csv",sep=',')
c2s7m8.sba.fp  <- scan("../sba.git/doc/paper/data/c2s7_m8_sba_fp.csv",sep=',')
c2s7m8.beb.tp  <- scan("../sba.git/doc/paper/data/c2s7_m8_beb_tp.csv",sep=',')
c2s7m8.neb.tp  <- scan("../sba.git/doc/paper/data/c2s7_m8_neb_tp.csv",sep=',')
c2s7m8.sba.tp  <- scan("../sba.git/doc/paper/data/c2s7_m8_sba_tp.csv",sep=',')

thin <- floor(seq(1,length(c1s3.ft.fp),length=(length(c1s3.ft.fp)-1)/100))

fp <- c(c1s3.ft.fp[thin],c1s3m2a.neb.fp[thin],c1s3m2a.sba.fp[thin],c1s3m2a.beb.fp[thin])
fp <- c(fp,c1s3.ft.fp[thin],c1s3m8.neb.fp[thin],c1s3m8.sba.fp[thin],c1s3m8.beb.fp[thin])
fp <- c(fp,c2s7.ft.fp[thin],c2s7m2a.neb.fp[thin],c2s7m2a.sba.fp[thin],c2s7m2a.beb.fp[thin])
fp <- c(fp,c2s7.ft.fp[thin],c2s7m8.neb.fp[thin],c2s7m8.sba.fp[thin],c2s7m8.beb.fp[thin])

tp <- c(c1s3.ft.tp[thin],c1s3m2a.neb.tp[thin],c1s3m2a.sba.tp[thin],c1s3m2a.beb.tp[thin])
tp <- c(tp,c1s3.ft.tp[thin],c1s3m8.neb.tp[thin],c1s3m8.sba.tp[thin],c1s3m8.beb.tp[thin])
tp <- c(tp,c2s7.ft.tp[thin],c2s7m2a.neb.tp[thin],c2s7m2a.sba.tp[thin],c2s7m2a.beb.tp[thin])
tp <- c(tp,c2s7.ft.tp[thin],c2s7m8.neb.tp[thin],c2s7m8.sba.tp[thin],c2s7m8.beb.tp[thin])

pdf("~/scm/thesis_talk.git/ROC_left.pdf")
roc.data <- data.frame(fp,tp,
Method=rep(c("OPT","NEB","SBA","BEB"),
each=length(thin),times=4),
Study=rep(c('Study 3 - M2a',
'Study 3 - M8',
'Study 7 - M2a',
'Study 7 - M8'),
each=length(thin)*4),
Scenario=rep(c('CM','MM'),
each=length(thin)*8))

roc.plot <- ggplot(roc.data,aes(fp,tp)) +
coord_cartesian(xlim=c(-0.005,.405), ylim=c(-0.005,.405)) +
labs(x="False Positive Rate",y="True Positive Rate") +
geom_line(aes(color=Method,linetype=Method),size=1.2) +
geom_abline(slope=1,intercept=0,color='gray60') +
scale_color_manual(values=c("gray30","grey40","grey50","black")) +
scale_linetype_manual(values=c("dotted","dotdash","dashed","solid")) +
scale_x_continuous(breaks=c(0.1,0.2,0.3)) +
facet_wrap(~Study,ncol=2)

roc.plot +
theme(panel.margin=unit(0,"lines"),
panel.background=element_blank(),
strip.background=element_blank(),
panel.grid.major=element_line(color="gray95"),
axis.line=element_line(colour="black"),
text=element_text(size=23),
legend.title=element_blank(),
legend.key=element_rect(fill="transparent"),
legend.position=c(.87,.66),
legend.key.width=unit(3,"line"),
panel.border = element_rect(colour = "black", fill=NA, size=1))
dev.off()


c1s4.ft.fp     <- scan("../sba.git/doc/paper/data/c1s4_opt_fp.csv",sep=',')
c1s4.ft.tp     <- scan("../sba.git/doc/paper/data/c1s4_opt_tp.csv",sep=',')

c1s4m2a.beb.fp <- scan("../sba.git/doc/paper/data/c1s4_m2a_beb_fp.csv",sep=',')
c1s4m2a.neb.fp <- scan("../sba.git/doc/paper/data/c1s4_m2a_neb_fp.csv",sep=',')
c1s4m2a.sba.fp <- scan("../sba.git/doc/paper/data/c1s4_m2a_sba_fp.csv",sep=',')
c1s4m2a.beb.tp <- scan("../sba.git/doc/paper/data/c1s4_m2a_beb_tp.csv",sep=',')
c1s4m2a.neb.tp <- scan("../sba.git/doc/paper/data/c1s4_m2a_neb_tp.csv",sep=',')
c1s4m2a.sba.tp <- scan("../sba.git/doc/paper/data/c1s4_m2a_sba_tp.csv",sep=',')

c1s4m8.beb.fp <-  scan("../sba.git/doc/paper/data/c1s4_m8_beb_fp.csv",sep=',')
c1s4m8.neb.fp <-  scan("../sba.git/doc/paper/data/c1s4_m8_neb_fp.csv",sep=',')
c1s4m8.sba.fp <-  scan("../sba.git/doc/paper/data/c1s4_m8_sba_fp.csv",sep=',')
c1s4m8.beb.tp <-  scan("../sba.git/doc/paper/data/c1s4_m8_beb_tp.csv",sep=',')
c1s4m8.neb.tp <-  scan("../sba.git/doc/paper/data/c1s4_m8_neb_tp.csv",sep=',')
c1s4m8.sba.tp <-  scan("../sba.git/doc/paper/data/c1s4_m8_sba_tp.csv",sep=',')

c2s8.ft.fp  <-    scan("../sba.git/doc/paper/data/c2s8_opt_fp.csv",sep=',')
c2s8.ft.tp  <-    scan("../sba.git/doc/paper/data/c2s8_opt_tp.csv",sep=',')

c2s8m2a.beb.fp <- scan("../sba.git/doc/paper/data/c2s8_m2a_beb_fp.csv",sep=',')
c2s8m2a.neb.fp <- scan("../sba.git/doc/paper/data/c2s8_m2a_neb_fp.csv",sep=',')
c2s8m2a.sba.fp <- scan("../sba.git/doc/paper/data/c2s8_m2a_sba_fp.csv",sep=',')
c2s8m2a.beb.tp <- scan("../sba.git/doc/paper/data/c2s8_m2a_beb_tp.csv",sep=',')
c2s8m2a.neb.tp <- scan("../sba.git/doc/paper/data/c2s8_m2a_neb_tp.csv",sep=',')
c2s8m2a.sba.tp <- scan("../sba.git/doc/paper/data/c2s8_m2a_sba_tp.csv",sep=',')

c2s8m8.beb.fp <-  scan("../sba.git/doc/paper/data/c2s8_m8_beb_fp.csv",sep=',')
c2s8m8.neb.fp <-  scan("../sba.git/doc/paper/data/c2s8_m8_neb_fp.csv",sep=',')
c2s8m8.sba.fp <-  scan("../sba.git/doc/paper/data/c2s8_m8_sba_fp.csv",sep=',')
c2s8m8.beb.tp <-  scan("../sba.git/doc/paper/data/c2s8_m8_beb_tp.csv",sep=',')
c2s8m8.neb.tp <-  scan("../sba.git/doc/paper/data/c2s8_m8_neb_tp.csv",sep=',')
c2s8m8.sba.tp <-  scan("../sba.git/doc/paper/data/c2s8_m8_sba_tp.csv",sep=',')

thin <- floor(seq(1,length(c1s4.ft.fp),length=(length(c1s4.ft.fp)-1)/100))

fp <- c(c1s4.ft.fp[thin],c1s4m2a.neb.fp[thin],c1s4m2a.sba.fp[thin],c1s4m2a.beb.fp[thin])
fp <- c(fp,c1s4.ft.fp[thin],c1s4m8.neb.fp[thin],c1s4m8.sba.fp[thin],c1s4m8.beb.fp[thin])
fp <- c(fp,c2s8.ft.fp[thin],c2s8m2a.neb.fp[thin],c2s8m2a.sba.fp[thin],c2s8m2a.beb.fp[thin])
fp <- c(fp,c2s8.ft.fp[thin],c2s8m8.neb.fp[thin],c2s8m8.sba.fp[thin],c2s8m8.beb.fp[thin])

tp <- c(c1s4.ft.tp[thin],c1s4m2a.neb.tp[thin],c1s4m2a.sba.tp[thin],c1s4m2a.beb.tp[thin])
tp <- c(tp,c1s4.ft.tp[thin],c1s4m8.neb.tp[thin],c1s4m8.sba.tp[thin],c1s4m8.beb.tp[thin])
tp <- c(tp,c2s8.ft.tp[thin],c2s8m2a.neb.tp[thin],c2s8m2a.sba.tp[thin],c2s8m2a.beb.tp[thin])
tp <- c(tp,c2s8.ft.tp[thin],c2s8m8.neb.tp[thin],c2s8m8.sba.tp[thin],c2s8m8.beb.tp[thin])



roc.data <- data.frame(fp,tp,
                       Method=rep(c("OPT","NEB","SBA","BEB"),
                                  each=length(thin),times=4),
                       Study=rep(c('Study 4 - M2a',
                                   'Study 4 - M8',
                                   'Study 8 - M2a',
                                   'Study 8 - M8'),
                                 each=length(thin)*4),
                       Scenario=rep(c('CM','MM'),
                                    each=length(thin)*8))

pdf("~/scm/thesis_talk.git/ROC_right.pdf")
roc.plot <- ggplot(roc.data,aes(fp,tp)) +
    coord_cartesian(xlim=c(-0.005,.1),ylim=c(-0.005,.805)) +
    labs(x="False Positive Rate",y="True Positive Rate") +
    geom_line(aes(color=Method,linetype=Method),size=1.2) +
    geom_abline(slope=1,intercept=0,color='gray60') +
    scale_shape_manual(values=c(15,18,17,16)) +
    scale_color_manual(values=c("gray30","grey40","grey50","black")) +
    scale_linetype_manual(values=c("dotted","dotdash","dashed","solid")) +
    scale_x_continuous(breaks=c(0.02,0.04,0.06,0.08)) +
    guides(colour = guide_legend(override.aes = list(size=1.4))) +
    facet_wrap(~Study,ncol=2)

roc.plot +
    theme(panel.background=element_blank(),
          strip.background=element_blank(),
          panel.grid.major=element_line(colour="gray95"),
          panel.margin=unit(0,"lines"),
          axis.line=element_line(colour="black"),
          legend.title=element_blank(),
          legend.key=element_rect(fill="transparent"),
          legend.position=c(.83,.80),
          legend.key.width=unit(6,"line"),
          text=element_text(size=23),
          panel.border = element_rect(colour = "black", fill=NA, size=1))
dev.off()