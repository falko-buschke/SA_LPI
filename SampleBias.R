# Manually read in the number of populaiton time-series
pops <- c(47,20,0,3,1,0,32,106,0,0,247,93,7,4,0)

# Manually read in the number of species
sp <- c(25,10,0,1,1,0,22,34,0,0,129,28,6,2,0)

# Label the ecological realms and taxonomic classes
realms <- rep(c("Freshwater","Terrestrial","Marine"), each=5)
taxa <- rep(c("Fish","Birds","Mammals","Reptiles","Amphibians"),3)

# Define the colour ramp to coincide with the map in Figure 1
ramp <- c("#457428", "#d62c9d", "#ff7f00", "#1f78b4", "#ffc801")

# Make the plot
png(filename="Samples.png",width=28,height=14,units="cm",res=300)

par(mai=c(0.8,0.8,.3,.1))
par(mfrow=c(1,2))

### Number of populations (Panel A)
barplot(pops~taxa+realms,border=NA, cex.axis=1, cex.lab= 1.2, mgp=c(2.5,0.6,0), las=1,
        xlab="Realms", ylab="Number of populations", col=ramp)
legend("topleft",pch=15,col=ramp, c("Amphibians","Birds","Fish","Mammals","Reptiles"), bty="n")
mtext("a",cex=1.6, side = 3, adj = -0.15, line = 0,font=2)

### Number of species (Panel B)
barplot(sp~taxa+realms,border=NA, cex.axis=1, cex.lab= 1.2, mgp=c(2.5,0.6,0), las=1,
        xlab="Realms", ylab="Number of species", col=ramp)
legend("topleft",pch=15,col=ramp, c("Amphibians","Birds","Fish","Mammals","Reptiles"), bty="n")
mtext("b",cex=1.6, side = 3, adj = -0.15, line = 0,font=2)
dev.off()
