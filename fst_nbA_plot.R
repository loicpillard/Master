## Plot the graphes fst-pairwise distance and nbA-distance from AA WITH A* 4D DISTANCES
#pch = type of symbole (by default: pch=1)
#cex = size (by default: cex=1)
#lty = type of abline 
path <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats/"
simulation <- "E"
i <- 54
W <- paste(path, simulation, "/", "fst_", simulation, "-", toString(i), ".txt", sep="")
X <- paste(path, simulation, "/", "nbA_", simulation, "-", toString(i), ".txt", sep="")
fst <- read.table(W, h=T)
nbA <- read.table(X, h=T)

png(paste("fst_nbA_", simulation, "-", toString(i), ".png", sep=""))
par(mfrow=c(2,1))
par(cex.axis=1) #size of the names text
plot(nbA$distance_from_AA, nbA$nb_alleles, xlab="Distance from Addis Ababa (km)", 
     ylab="Number of alleles", main="Number of alleles", xlim=c(0,40000), ylim=c(3,9), pch=20, cex=0.5)
abline(lm(nbA$nb_alleles~nbA$distance_from_AA), col="red")
a <- summary(lm(nbA$nb_alleles~nbA$distance_from_AA))
r2 = bquote(italic(R)^2 == .(format(a$r.squared, digits = 3)))
text(35000, 8, r2, col="red", cex=1.5)
plot(fst$pairwise_distance, fst$pairwise_fst, xlab="Pairwise distance (km)", 
     ylab="Pairwise Fst", main="Pairwise Fst", xlim=c(0,45000), ylim=c(0,0.25), pch=20, cex=0.5)
abline(lm(fst$pairwise_fst~fst$pairwise_distance), col="red")
a <- summary(lm(fst$pairwise_fst~fst$pairwise_distance))
r2 = bquote(italic(R)^2 == .(format(a$r.squared, digits = 3)))
text(40000, 0.22, r2, col="red", cex=1.5)
dev.off()




## Plot the boxplot for nbA for each continent
png(paste("nbA_per_continent_", simulation, "-", toString(i), ".png", sep=""))
par(mfrow=c(1,1))
newgp<-factor(nbA$continents, levels=c('Africa','Middle_East','Europe','Central_Asia','East_Asia','America'))
par(cex.lab=1)    #size of the text for axis
par(cex.axis=0.75) #size of the names text
boxplot(nbA$nb_alleles~newgp, ylab="Number of alleles", xlab="Continents",
        names=c('Africa','Middle_East','Europe','Central_Asia','East_Asia','America'),
        border=c("black", "yellow", "cyan", "green", "blue", "red"))
dev.off()