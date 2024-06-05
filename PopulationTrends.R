# Open  the dataset. 
lambda <- read.csv("Lambdas.csv", na.strings = "NULL")

##################################################################
# Carry out the linear regression presented in Appendix S1

lpi.lm <- lm(lambda$CumulativeLambda ~ lambda$Realm * lambda$Taxon)
anova(lpi.lm)
summary(lpi.lm)

#################################################################

png(filename="Lambdas.png",width=28,height=14,units="cm",res=300)

par(mai=c(0.8,0.8,.3,.1))
par(mfrow=c(1,2))

### Histogram Panel A

brks <- seq(-4,4,l=41)
hist(lambda$CumulativeLambda, breaks=brks, xlim=c(-3,3), main="", las=1, xlab=expression(Cumulative~ lambda), 
     col=rgb(0,0.6,0,1), border=F,  cex.axis=1, cex.lab= 1.2, mgp=c(2.5,0.6,0))

hist(lambda$CumulativeLambda[which(lambda$Realm!="Terrestrial")], add=T, breaks=brks, col=rgb(0.6,0.6,1,1), border=F)
hist(lambda$CumulativeLambda[which(lambda$Realm=="Marine")], add=T, breaks=brks, col=rgb(0,0,0.6,1), border=F)

mtext("a",cex=1.6, side = 3, adj = -0.05, line = 0,font=2)
legend("left", pch=15, col=c(rgb(0,0.6,0,1), rgb(0.6,0.6,1,1), rgb(0,0,0.6,1)), c("Terrestrial","Freshwater","Marine"), bty="n")

#### Boxplots Panel B
boxplot(lambda$CumulativeLambda~lambda$Taxon, outline=F, las=1, ylab=expression(Cumulative~ lambda), xlab="Taxon", 
        lty=1, pch=16, frame=F, cex.axis=1, cex.lab= 1.2, mgp=c(2.5,0.6,0), ylim=c(-3,3))

stripchart(lambda$CumulativeLambda~lambda$Taxon,
           method = "jitter", # Random noise
           jitter=0.2,
           pch = 16, cex=1.5 ,       # Pch symbols
           col = rgb(0,0,0,0.2),          # Color of the symbol
           vertical = T,   # Vertical mode
           add = TRUE)

abline(h=0, lty=2,lwd=2, col="red")
mtext("b",cex=1.6, side = 3, adj = -0.05, line = 0,font=2)
dev.off()
