pdf("~/scm/thesis_talk.git/sfb_tree.pdf")
tree <- read.tree(text="(((A:0.214286,B:0.214286):0.214286,(C:0.214286,D:0.214286):0.214286):0.214286,((E:0.214286,F:0.214286):0.214286,(G:0.214286,H:0.214286):0.214286):0.214286);");
edge.colors <- rep(1,14)
##edge.colors[c(12,14,33,34,36,38,53,54,55,59)] <- brewer.pal(n=10,name="Paired")
##edge.colors[seq(2,7)] <- c("#0000FF")
##edge.colors[seq(9,14)] <- c("#8B0000")
edge.colors[c(3)] <- c("#0000FF")
edge.widths <- rep(4,14)

par(mai=c(.3,0,0,0))
plot(tree,cex=1.5,type="phylogram",edge.color=edge.colors,edge.width=edge.widths,lab4ut="axial",show.node.label=F,label.offset=0.01)
dev.off()

pdf("~/scm/thesis_talk.git/htf_tree.pdf")
tree <- read.tree(text="(((A:0.214286,B:0.214286):0.214286,(C:0.214286,D:0.214286):0.214286):0.214286,((E:0.214286,F:0.214286):0.214286,(G:0.214286,H:0.214286):0.214286):0.214286);");
edge.colors <- rep(1,14)
##edge.colors[c(12,14,33,34,36,38,53,54,55,59)] <- brewer.pal(n=10,name="Paired")
edge.colors[seq(2,7)] <- c("#0000FF")
##edge.colors[seq(9,14)] <- c("#8B0000")
#edge.colors[c(3)] <- c("#0000FF")
edge.widths <- rep(4,14)

par(mai=c(.3,0,0,0))
plot(tree,cex=1.5,type="phylogram",edge.color=edge.colors,edge.width=edge.widths,lab4ut="axial",show.node.label=F,label.offset=0.01)
dev.off()