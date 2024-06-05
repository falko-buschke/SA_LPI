# Start by installing and loading 'devtools' package, which is needed to instal the 'rlpi' package from GitHub
install.packages("devtools")
library(devtools)

# Install from main ZSL repository online
install_github("Zoological-Society-of-London/rlpi", dependencies=TRUE)
# Load the 'rlpi' package
library(rlpi)

# Open  dataset. This needs to be downloaded from "stats.livingplanetindex.org"
lpi.orig <- read.csv("LPD2022_public_SA.csv", na.strings = "NULL")

##########################################################################

# Duplicate the empirical LP dataset 
lpi <- lpi.orig[which(lpi.orig$Excluded_LPR_2022==0),]

# These are the parameters for the LPI calaculation. It is easier to change them here, than in the all the individual functions below

# The maximum year in the dataset (second last year because lambda is the log-ratio with final year too)
max_val <- 2018

# This is the year where the LPI plot end (i.e. the last year in the index)
plot.end <- max_val + 1

# This is the same as the previous year, but includes the 'X', which is read by LPI calculation
end_val <- "X2020"

##########################################################################

# Unweighted index
##########################################################################
# Freshwater

##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Freshwater")] <- FALSE
FW_SA <- create_infile(lpi, start_col_name="X1950",end_col_name=end_val, index_vector=ind_vect, name="SA/FW_SA")

# Once you have filtered out the data and created the infile, you can calculate the LPI for the Freshwater System globally
FW_lpi <- LPIMain("SA/FW_SA.txt", PLOT_MAX=max_val, use_weightings_B=1, use_weightings=1, VERBOSE=FALSE)

##########################################################################################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Marine")] <- FALSE
MR_SA <- create_infile(lpi, start_col_name="X1950",end_col_name=end_val, index_vector=ind_vect, name="SA/MR_SA")

# Once you have filtered out the data and created the infile, you can calculate the LPI for the Freshwater System globally
MR_lpi <- LPIMain("SA/MR_SA.txt", PLOT_MAX=max_val, use_weightings_B=1, use_weightings=1, VERBOSE=FALSE)

##########################################################################################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Terrestrial")] <- FALSE
TR_SA <- create_infile(lpi, start_col_name="X1950",end_col_name=end_val, index_vector=ind_vect, name="SA/TR_SA")

# Once you have filtered out the data and created the infile, you can calculate the LPI for the Freshwater System globally
TR_lpi <- LPIMain("SA/TR_SA.txt", PLOT_MAX=max_val, use_weightings_B=1, use_weightings=1, VERBOSE=FALSE)


# Once you have filtered out the data and created the infile, you can calculate the Global LPI
lpi_unweighted <- LPIMain("SA/Global_infile.txt", PLOT_MAX=max_val, use_weightings_B=0,use_weightings=0, VERBOSE=FALSE)


#############################################################################
#############################################################################
##                                                                         ##        
##   The following blocks of code is to filter the LP data and group them  ##
##   in terms of taxonomic groups, biogeographical regions, and planetary  ##
##   systems. It is just a repetitive filtering of the dataset.            ##                                                 
##                                                                         ##
#############################################################################
#############################################################################


##########################################################################
# Freshwater

##########################################
# Birds
#############

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Freshwater")] <- FALSE
ind_vect[which(lpi$Class!="Aves")] <- FALSE

# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
FW_birds <- create_infile(lpi, start_col_name="X1950",end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/FW_birds")


##########################################
# Mammals
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Freshwater")] <- FALSE
ind_vect[which(lpi$Class!="Mammalia")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
FW_mamm <- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/FW_mamm")


##########################################
# Reptiles
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Freshwater")] <- FALSE
ind_vect[which(lpi$Class!="Reptilia")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
FW_rep<- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/FW_rep")


##########################################
# Amphibia
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Freshwater")] <- FALSE
ind_vect[which(lpi$Class!="Amphibia")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
FW_amph <- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/FW_amph")

##########################################
# Fish
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Freshwater")] <- FALSE
ind_vect[which(lpi$Class!="Actinopteri" &
                 lpi$Class!="Coelacanthi" &
                 lpi$Class!="Dipneusti" &
                 lpi$Class!="Elasmobranchii" &
                 lpi$Class!="Holocephali" &
                 lpi$Class!="Myxini" &
                 lpi$Class!="Petromyzonti")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
FW_fish <- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect,	name="Weighted_SA/FW_fish")


###########################################

# Once you have filtered out the data and created the infile, you can calculate the LPI for the Freshwater System globally
FW_lpi <- LPIMain("Weighted_SA/Infiles/FW_infile.txt", PLOT_MAX=max_val, use_weightings_B=0, use_weightings=1, VERBOSE=FALSE)

#############################################################################
#############################################################################


##########################################################################
# Terrestrial

##########################################
# Birds
#############

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Terrestrial")] <- FALSE
ind_vect[which(lpi$Class!="Aves")] <- FALSE

# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
TR_birds <- create_infile(lpi, start_col_name="X1950",end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/TR_birds")


##########################################
# Mammals
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Terrestrial")] <- FALSE
ind_vect[which(lpi$Class!="Mammalia")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
TR_mamm <- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/TR_mamm")


##########################################
# Reptiles
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Terrestrial")] <- FALSE
ind_vect[which(lpi$Class!="Reptilia")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
TR_rep<- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/TR_rep")


##########################################
# Amphibia
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Terrestrial")] <- FALSE
ind_vect[which(lpi$Class!="Amphibia")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
TR_amph <- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/TR_amph")

###########################################

# Once you have filtered out the data and created the infile, you can calculate the LPI for the Freshwater System globally
TR_lpi <- LPIMain("Weighted_SA/Infiles/TR_infile.txt", PLOT_MAX=max_val, use_weightings_B=0, use_weightings=1, VERBOSE=FALSE)


#############################################################################
#############################################################################


##########################################################################
# Marine

##########################################
# Birds
#############

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Marine")] <- FALSE
ind_vect[which(lpi$Class!="Aves")] <- FALSE

# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
MR_birds <- create_infile(lpi, start_col_name="X1950",end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/MR_birds")


##########################################
# Mammals
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Marine")] <- FALSE
ind_vect[which(lpi$Class!="Mammalia")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
MR_mamm <- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/MR_mamm")


##########################################
# Reptiles
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Marine")] <- FALSE
ind_vect[which(lpi$Class!="Reptilia")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
MR_rep<- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/MR_rep")

##########################################
# Fish
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Marine")] <- FALSE
ind_vect[which(lpi$Class!="Actinopteri" &
                 lpi$Class!="Coelacanthi" &
                 lpi$Class!="Dipneusti" &
                 lpi$Class!="Elasmobranchii" &
                 lpi$Class!="Holocephali" &
                 lpi$Class!="Myxini" &
                 lpi$Class!="Petromyzonti")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
MR_fish <- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect,	name="Weighted_SA/MR_fish")


###########################################

# Once you have filtered out the data and created the infile, you can calculate the LPI for the Freshwater System globally
MR_lpi <- LPIMain("Weighted_SA/Infiles/MR_infile.txt", PLOT_MAX=max_val, use_weightings_B=0, use_weightings=1, VERBOSE=FALSE)



png(filename="LPI_Realms.png",width=30,height=10,units="cm",res=300)

par(mai=c(0.8,0.8,.3,.25))
par(mfrow=c(1,3))

TR_lpi[45:50,] <- TR_lpi[44,]
plot(0,0,type="n",las=1,xlim=c(1970,2020),ylim=c(0,3),ylab="LPI (1970 = 1)",xlab="Year", frame=F,  cex.axis=1, cex.lab= 1.2, mgp=c(2.5,0.6,0))
abline(h=1,col="black")

polygon(c(seq(1970,plot.end),seq(plot.end,1970)), c(TR_lpi$CI_low,rev(TR_lpi$CI_high)),col=rgb(0,0.6,0,0.1),border=NA)
lines(c(1970:plot.end),TR_lpi$LPI_final,col=rgb(0,0.6,0,1),lwd=1)
text(2023, TR_lpi$LPI_final[50], paste(round(TR_lpi$LPI_final[50]*100,1)-100,"%"),font=2, cex=1 , col=rgb(0,0.6,0,1), xpd=NA)

mtext("a",cex=1.1, side = 3, adj = -0.05, line = 0,font=2)
#################################################################

FW_lpi[49:50,] <- FW_lpi[48,]
plot(0,0,type="n",las=1,xlim=c(1970,2020),ylim=c(0,3),ylab="LPI (1970 = 1)",xlab="Year", frame=F,  cex.axis=1, cex.lab= 1.2, mgp=c(2.5,0.6,0))
abline(h=1,col="black")

polygon(c(seq(1970,plot.end),seq(plot.end,1970)), c(FW_lpi$CI_low,rev(FW_lpi$CI_high)),col=rgb(0.6,0.6,1,0.1),border=NA)
lines(c(1970:plot.end),FW_lpi$LPI_final,col=rgb(0.6,0.6,1,1),lwd=1)
mtext("b",cex=1.1, side = 3, adj = -0.05, line = 0,font=2)
text(2023, FW_lpi$LPI_final[50], paste(round(FW_lpi$LPI_final[50]*100,1)-100,"%"),font=2, cex=1 , col=rgb(0.6,0.6,1,1), xpd=NA)


################################################################
plot(0,0,type="n",las=1,xlim=c(1970,2020),ylim=c(0,3),ylab="LPI (1970 = 1)",xlab="Year", frame=F,  cex.axis=1, cex.lab= 1.2, mgp=c(2.5,0.6,0))
abline(h=1,col="black")

polygon(c(seq(1970,plot.end),seq(plot.end,1970)), c(MR_lpi$CI_low,rev(MR_lpi$CI_high)),col=rgb(0,0,0.6,0.1),border=NA)
lines(c(1970:plot.end),MR_lpi$LPI_final,col=rgb(0,0,0.6,1),lwd=1)
mtext("c",cex=1.1, side = 3, adj = -0.05, line = 0,font=2)
text(2023, MR_lpi$LPI_final[50], paste(round(MR_lpi$LPI_final[50]*100,1)-100,"%"),font=2, cex=1 , col=rgb(0,0,0.6, 1), xpd=NA)



dev.off()












# Once you have filtered out the data and created the infile, you can calculate the National LPI
lpi_full_weighted <- LPIMain("Weighted_SA/Infiles/Global_infile.txt", PLOT_MAX=max_val, use_weightings_B=0,use_weightings=1, VERBOSE=FALSE)

lpi_equal_weighted <- LPIMain("Weighted_SA/Infiles/Global_infile.txt", PLOT_MAX=max_val, use_weightings_B=0,use_weightings=0, VERBOSE=FALSE)


png(filename="LPI_weightings.png",width=16,height=14,units="cm",res=300)
par(mai=c(0.8,0.8,.3,.4))
plot(0,0,type="n",las=1,xlim=c(1970,2020),ylim=c(0,2),ylab="LPI (1970 = 1)",xlab="Year", frame=F,  cex.axis=1, cex.lab= 1.2, mgp=c(2.5,0.6,0))
abline(h=1,col="black")

polygon(c(seq(1970,plot.end),seq(plot.end,1970)), c(lpi_unweighted$CI_low,rev(lpi_unweighted$CI_high)),col=rgb(0,0,0,0.1),border=NA)
polygon(c(seq(1970,plot.end),seq(plot.end,1970)), c(lpi_equal_weighted$CI_low,rev(lpi_equal_weighted$CI_high)),col=rgb(1,0,0,0.1),border=NA)
polygon(c(seq(1970,plot.end),seq(plot.end,1970)), c(lpi_full_weighted$CI_low,rev(lpi_full_weighted$CI_high)),col=rgb(0,0.5,0,0.1),border=NA)

lines(c(1970:plot.end),lpi_unweighted$LPI_final,col="black",lwd=1)
lines(c(1970:plot.end),lpi_equal_weighted$LPI_final,col="red",lwd=1)
lines(c(1970:plot.end),lpi_full_weighted$LPI_final,col="darkgreen",lwd=1)

legend("topleft", lty=1, col=c("black","red","darkgreen"), c("Unweighted", "Equally weighted", "Fully weighted"), bty="n", cex=0.8)

text(2022, lpi_unweighted$LPI_final[50], paste(round(lpi_unweighted$LPI_final[50]*100,1)-100,"%"),font=2, cex=0.7 , col="black", xpd=NA)
text(2022, lpi_equal_weighted$LPI_final[50]+0.02, paste(round(lpi_equal_weighted$LPI_final[50]*100,1)-100,"%"),font=2, cex=0.7 , col="red", xpd=NA)

text(2022, lpi_full_weighted$LPI_final[50]-0.02,paste(round(lpi_full_weighted$LPI_final[50]*100,1)-100,"%"),font=2, cex=0.7 , col="darkgreen", xpd=NA)

dev.off()



Cont_lpi <- LPIMain("Weighted_SA/Infiles/Continental_infile.txt", PLOT_MAX=max_val, use_weightings_B=0,use_weightings=1, VERBOSE=FALSE)

Cont_lpi[49:50,] <- Cont_lpi[48,]
png(filename="Continental_LPI.png",width=16,height=14,units="cm",res=300)
par(mai=c(0.8,0.8,.3,.4))
plot(0,0,type="n",las=1,xlim=c(1970,2020),ylim=c(0,2),ylab="LPI (1970 = 1)",xlab="Year", frame=F,  cex.axis=1, cex.lab= 1.2, mgp=c(2.5,0.6,0))
abline(h=1,col="black")

polygon(c(seq(1970,plot.end),seq(plot.end,1970)), c(Cont_lpi$CI_low,rev(Cont_lpi$CI_high)),col=rgb(0,0.5,0.5,0.1),border=NA)

lines(c(1970:plot.end),Cont_lpi$LPI_final,col=rgb(0,0.5,0.5,1),lwd=1)

text(2022, Cont_lpi$LPI_final[50]+0.02, paste(round(Cont_lpi$LPI_final[50]*100,1)-100,"%"),font=2, cex=0.7 , col=rgb(0,0.5,0.5,1), xpd=NA)


dev.off()





################################################################################


# Open  dataset. This needs to be downloaded from "stats.livingplanetindex.org"
lpi.orig <- read.csv("LPD2022_public_SA_enhanced_redacted.csv", na.strings = "NULL")

##########################################################################

# Duplicate the empirical LP dataset 
lpi <- lpi.orig[which(lpi.orig$Excluded_LPR_2022==0),]

# These are the parameters for the LPI calaculation. It is easier to change them here, than in the all the individual functions below

# The maximum year in the dataset (second last year because lambda is the log-ratio with final year too)
max_val <- 2018

# This is the year where the LPI plot end (i.e. the last year in the index)
plot.end <- max_val + 1

# This is the same as the previous year, but includes the 'X', which is read by LPI calculation
end_val <- "X2020"

##########################################################################


#############################################################################
#############################################################################
##                                                                         ##        
##   The following blocks of code is to filter the LP data and group them  ##
##   in terms of taxonomic groups, biogeographical regions, and planetary  ##
##   systems. It is just a repetitive filtering of the dataset.            ##                                                 
##                                                                         ##
#############################################################################
#############################################################################


##########################################################################
# Freshwater

##########################################
# Birds
#############

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Freshwater")] <- FALSE
ind_vect[which(lpi$Class!="Aves")] <- FALSE

# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
FW_birds <- create_infile(lpi, start_col_name="X1950",end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/FW_birds")


##########################################
# Mammals
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Freshwater")] <- FALSE
ind_vect[which(lpi$Class!="Mammalia")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
FW_mamm <- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/FW_mamm")


##########################################
# Reptiles
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Freshwater")] <- FALSE
ind_vect[which(lpi$Class!="Reptilia")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
FW_rep<- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/FW_rep")


##########################################
# Amphibia
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Freshwater")] <- FALSE
ind_vect[which(lpi$Class!="Amphibia")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
FW_amph <- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/FW_amph")

##########################################
# Fish
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Freshwater")] <- FALSE
ind_vect[which(lpi$Class!="Actinopteri" &
                 lpi$Class!="Coelacanthi" &
                 lpi$Class!="Dipneusti" &
                 lpi$Class!="Elasmobranchii" &
                 lpi$Class!="Holocephali" &
                 lpi$Class!="Myxini" &
                 lpi$Class!="Petromyzonti")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
FW_fish <- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect,	name="Weighted_SA/FW_fish")


###########################################

# Once you have filtered out the data and created the infile, you can calculate the LPI for the Freshwater System globally
FW_lpi <- LPIMain("Weighted_SA/Infiles/FW_infile.txt", PLOT_MAX=max_val, use_weightings_B=0, use_weightings=0, VERBOSE=FALSE)

#############################################################################
#############################################################################


##########################################################################
# Terrestrial

##########################################
# Birds
#############

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Terrestrial")] <- FALSE
ind_vect[which(lpi$Class!="Aves")] <- FALSE

# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
TR_birds <- create_infile(lpi, start_col_name="X1950",end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/TR_birds")


##########################################
# Mammals
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Terrestrial")] <- FALSE
ind_vect[which(lpi$Class!="Mammalia")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
TR_mamm <- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/TR_mamm")


##########################################
# Reptiles
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Terrestrial")] <- FALSE
ind_vect[which(lpi$Class!="Reptilia")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
TR_rep<- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/TR_rep")


##########################################
# Amphibia
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Terrestrial")] <- FALSE
ind_vect[which(lpi$Class!="Amphibia")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
TR_amph <- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/TR_amph")

###########################################

# Once you have filtered out the data and created the infile, you can calculate the LPI for the Freshwater System globally
TR_lpi <- LPIMain("Weighted_SA/Infiles/TR_infile.txt", PLOT_MAX=max_val, use_weightings_B=0, use_weightings=0, VERBOSE=FALSE)


#############################################################################
#############################################################################


##########################################################################
# Marine

##########################################
# Birds
#############

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Marine")] <- FALSE
ind_vect[which(lpi$Class!="Aves")] <- FALSE

# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
MR_birds <- create_infile(lpi, start_col_name="X1950",end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/MR_birds")


##########################################
# Mammals
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Marine")] <- FALSE
ind_vect[which(lpi$Class!="Mammalia")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
MR_mamm <- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/MR_mamm")


##########################################
# Reptiles
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Marine")] <- FALSE
ind_vect[which(lpi$Class!="Reptilia")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
MR_rep<- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect, name="Weighted_SA/MR_rep")

##########################################
# Fish
##########################################

ind_vect <- rep(TRUE,nrow(lpi))
ind_vect[which(lpi$System!="Marine")] <- FALSE
ind_vect[which(lpi$Class!="Actinopteri" &
                 lpi$Class!="Coelacanthi" &
                 lpi$Class!="Dipneusti" &
                 lpi$Class!="Elasmobranchii" &
                 lpi$Class!="Holocephali" &
                 lpi$Class!="Myxini" &
                 lpi$Class!="Petromyzonti")] <- FALSE
# This creates and save the Infile needed by the LPI function. Must be saved in a folder named "Global" in the working directory.
MR_fish <- create_infile(lpi, start_col_name="X1950", end_col_name=end_val, index_vector=ind_vect,	name="Weighted_SA/MR_fish")


###########################################

# Once you have filtered out the data and created the infile, you can calculate the LPI for the Freshwater System globally
MR_lpi <- LPIMain("Weighted_SA/Infiles/MR_infile.txt", PLOT_MAX=max_val, use_weightings_B=0, use_weightings=0, VERBOSE=FALSE)





# Once you have filtered out the data and created the infile, you can calculate the National LPI
lpi_enhanced <- LPIMain("Weighted_SA/Infiles/Global_infile.txt", PLOT_MAX=max_val, use_weightings_B=0,use_weightings=1, VERBOSE=FALSE)

png(filename="LPI_enhancedData.png",width=16,height=14,units="cm",res=300)
par(mai=c(0.8,0.8,.3,.4))
plot(0,0,type="n",las=1,xlim=c(1970,2020),ylim=c(0,2),ylab="LPI (1970 = 1)",xlab="Year", frame=F,  cex.axis=1, cex.lab= 1.2, mgp=c(2.5,0.6,0))
abline(h=1,col="black")

polygon(c(seq(1970,plot.end),seq(plot.end,1970)), c(lpi_enhanced$CI_low,rev(lpi_enhanced$CI_high)),col=rgb(0,0,1,0.1),border=NA)
polygon(c(seq(1970,plot.end),seq(plot.end,1970)), c(lpi_full_weighted$CI_low,rev(lpi_full_weighted$CI_high)),col=rgb(0,0.5,0,0.1),border=NA)

lines(c(1970:plot.end),lpi_enhanced$LPI_final,col="blue",lwd=1)
lines(c(1970:plot.end),lpi_full_weighted$LPI_final,col="darkgreen",lwd=1)

legend("topleft", lty=1, col=c("blue","darkgreen"), c("Enhanced dataset", "Living Planet Database"), bty="n", cex=0.8)

text(2022, lpi_enhanced$LPI_final[50]+0.02, paste(round(lpi_enhanced$LPI_final[50]*100,1)-100,"%"),font=2, cex=0.7 , col="blue", xpd=NA)

text(2022, lpi_full_weighted$LPI_final[50]-0.02,paste(round(lpi_full_weighted$LPI_final[50]*100,1)-100,"%"),font=2, cex=0.7 , col="darkgreen", xpd=NA)

dev.off()

