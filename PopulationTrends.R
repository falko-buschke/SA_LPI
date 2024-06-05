.libPaths(c("C:\\Users\\buschfa\\R\\R-4.1.3", .libPaths()))



# Open  dataset. This needs to be downloaded from "stats.livingplanetindex.org"
lambda <- read.csv("Lambdas.csv", na.strings = "NULL")


lm(lambda$CumulativeLambda~lambda$Realm*lambda$Taxon + 0)



png(filename="CleanedAnalyses/Lambdas.png",width=28,height=14,units="cm",res=300)

par(mai=c(0.8,0.8,.3,.1))
par(mfrow=c(1,2))
brks <- seq(-4,4,l=41)
hist(lambda$CumulativeLambda, breaks=brks, xlim=c(-3,3), main="", las=1, xlab=expression(Cumulative~ lambda), 
     col=rgb(0,0.6,0,1), border=F,  cex.axis=1, cex.lab= 1.2, mgp=c(2.5,0.6,0))


hist(lambda$CumulativeLambda[which(lambda$Realm!="Terrestrial")], add=T, breaks=brks, col=rgb(0.6,0.6,1,1), border=F)
hist(lambda$CumulativeLambda[which(lambda$Realm=="Marine")], add=T, breaks=brks, col=rgb(0,0,0.6,1), border=F)

mtext("a",cex=1.6, side = 3, adj = -0.05, line = 0,font=2)
legend("left", pch=15, col=c(rgb(0,0.6,0,1), rgb(0.6,0.6,1,1), rgb(0,0,0.6,1)), c("Terrestrial","Freshwater","Marine"), bty="n")


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


boxplot(lambda$CumulativeLambda~lambda$Realm, outline=F, las=1, ylab=expression(Cumulative~ lambda), xlab="Realm")
abline(h=0)

pops <- c(47,20,0,3,1,0,32,106,0,0,247,93,7,4,0)


sp <- c(25,10,0,1,1,0,22,34,0,0,129,28,6,2,0)

realms <- rep(c("Freshwater","Terrestrial","Marine"), each=5)
taxa <- rep(c("Fish","Birds","Mammals","Reptiles","Amphibians"),3)


library(RColorBrewer)
ramp <- brewer.pal(5,"Set1")
ramp <- c("#457428", "#d62c9d", "#ff7f00", "#1f78b4", "#ffc801")

png(filename="CleanedAnalyses/Samples.png",width=28,height=14,units="cm",res=300)

par(mai=c(0.8,0.8,.3,.1))
par(mfrow=c(1,2))

barplot(pops~taxa+realms,border=NA, cex.axis=1, cex.lab= 1.2, mgp=c(2.5,0.6,0), las=1,
        xlab="Realms", ylab="Number of populations", col=ramp)
legend("topleft",pch=15,col=ramp, c("Amphibians","Birds","Fish","Mammals","Reptiles"), bty="n")
mtext("a",cex=1.6, side = 3, adj = -0.15, line = 0,font=2)

barplot(sp~taxa+realms,border=NA, cex.axis=1, cex.lab= 1.2, mgp=c(2.5,0.6,0), las=1,
        xlab="Realms", ylab="Number of species", col=ramp)
legend("topleft",pch=15,col=ramp, c("Amphibians","Birds","Fish","Mammals","Reptiles"), bty="n")
mtext("b",cex=1.6, side = 3, adj = -0.15, line = 0,font=2)
dev.off()

