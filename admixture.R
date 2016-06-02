path <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats ADMIXTURE/"
simulation <- "G0"
i <- 1
chemin1 <- paste(path, simulation, "/admixture_", simulation, "-", toString(i), ".1.txt", sep="")
chemin2 <- paste(path, simulation, "/admixture_", simulation, "-", toString(i), ".2.txt", sep="")
chemin3 <- paste(path, simulation, "/admixture_", simulation, "-", toString(i), ".3.txt", sep="")
chemin4 <- paste(path, simulation, "/admixture_", simulation, "-", toString(i), ".4.txt", sep="")
chemin5 <- paste(path, simulation, "/admixture_", simulation, "-", toString(i), ".5.txt", sep="")
chemin6 <- paste(path, simulation, "/admixture_", simulation, "-", toString(i), ".6.txt", sep="")
chemin7 <- paste(path, simulation, "/admixture_", simulation, "-", toString(i), ".7.txt", sep="")

chemin <- paste("C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats/", simulation, "/individuals_", simulation, ".txt", sep="")
data <- read.table(chemin, h=F)
ind <- data[data != 6]
individuals <- sort(ind)


png(paste("admixture_",simulation, "-", toString(i), "a.png", sep=""))
par(mfrow=c(3,1))
tbl2 <- read.table(chemin2, h=F)
barplot(t(as.matrix(tbl2)), col=rainbow(2), names.arg=individuals, main="K=2", ylab="Ancestry", border=NA)
tbl3 <- read.table(chemin3, h=F)
barplot(t(as.matrix(tbl3)), col=rainbow(3), names.arg=individuals, main="K=3", ylab="Ancestry", border=NA)
tbl4 <- read.table(chemin4, h=F)
barplot(t(as.matrix(tbl4)), col=rainbow(4), names.arg=individuals, main="K=4", ylab="Ancestry", border=NA)
dev.off()
png(paste("admixture_",simulation,"-", toString(i), "b.png", sep=""))
par(mfrow=c(3,1))
tbl5 <- read.table(chemin5, h=F)
barplot(t(as.matrix(tbl5)), col=rainbow(5), names.arg=individuals, main="K=5", ylab="Ancestry", border=NA)
tbl6 <- read.table(chemin6, h=F)
barplot(t(as.matrix(tbl6)), col=rainbow(6), names.arg=individuals, main="K=6", ylab="Ancestry", border=NA)
tbl7 <- read.table(chemin7, h=F)
barplot(t(as.matrix(tbl7)), col=rainbow(7), names.arg=individuals, main="K=7", ylab="Ancestry", border=NA)
dev.off()


############################
## K-means clustering 500 ##
simulation1 <- "G4"
simulation2 <- "O"
simulation3 <- "R1"
chemin1 <- paste("C:/Users/Loïc/Documents/UNIL/Master 2.1/500 loci/Résultats_K-means/continent_individuals_", simulation1, ".txt", sep="")
individuals1 <- read.table(chemin1, h=F)
chemin2 <- paste("C:/Users/Loïc/Documents/UNIL/Master 2.1/500 loci/Résultats_K-means/continent_individuals_", simulation2, ".txt", sep="")
individuals2 <- read.table(chemin2, h=F)
chemin3 <- paste("C:/Users/Loïc/Documents/UNIL/Master 2.1/500 loci/Résultats_K-means/continent_individuals_", simulation3, ".txt", sep="")
individuals3 <- read.table(chemin3, h=F)

chemin <- paste("C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats/", simulation1, "/individuals_", simulation1, ".txt", sep="")
ind <- read.table(chemin, h=F)
lab1 <- sort(ind[,1])
chemin <- paste("C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats/", simulation2, "/individuals_", simulation2, ".txt", sep="")
ind <- read.table(chemin, h=F)
lab2 <- sort(ind[,1])
chemin <- paste("C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats/", simulation3, "/individuals_", simulation3, ".txt", sep="")
ind <- read.table(chemin, h=F)
lab3 <- sort(ind[,1])

png("ind2.png")
par(mfrow=c(3,1))
barplot(t(as.matrix(individuals1)), col=rainbow(6), names.arg=lab1, ylab="Ancestry", main = "Sampling G4 (K=6)", border=NA)
barplot(t(as.matrix(individuals2)), col=rainbow(6), names.arg=lab2, ylab="Ancestry", main = "Sampling O (K=6)", border=NA)
barplot(t(as.matrix(individuals3)), col=rainbow(6), names.arg=lab3, ylab="Ancestry", main = "Sampling R1 (K=6)", border=NA)
dev.off()


############################
## K-means clustering 100 ##
simulation1 <- "G4"
simulation2 <- "O"
simulation3 <- "R1"
chemin1 <- paste("C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats K-means/", simulation1, "/kmeans_continent_individuals_rearranged_", simulation1, ".txt", sep="")
individuals1 <- read.table(chemin1, h=F)
chemin2 <- paste("C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats K-means/", simulation2, "/kmeans_continent_individuals_rearranged_", simulation2, ".txt", sep="")
individuals2 <- read.table(chemin2, h=F)
chemin3 <- paste("C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats K-means/", simulation3, "/kmeans_continent_individuals_rearranged_", simulation3, ".txt", sep="")
individuals3 <- read.table(chemin3, h=F)

chemin <- paste("C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats/", simulation1, "/individuals_", simulation1, ".txt", sep="")
ind <- read.table(chemin, h=F)
lab1 <- sort(ind[,1])
chemin <- paste("C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats/", simulation2, "/individuals_", simulation2, ".txt", sep="")
ind <- read.table(chemin, h=F)
lab2 <- sort(ind[,1])
chemin <- paste("C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats/", simulation3, "/individuals_", simulation3, ".txt", sep="")
ind <- read.table(chemin, h=F)
lab3 <- sort(ind[,1])

png("ind2.png")
par(mfrow=c(3,1))
barplot(t(as.matrix(individuals1)), col=rainbow(6), names.arg=lab1, ylab="Ancestry", main = "Sampling G4 (K=6)", border=NA)
barplot(t(as.matrix(individuals2)), col=rainbow(6), names.arg=lab2, ylab="Ancestry", main = "Sampling O (K=6)", border=NA)
barplot(t(as.matrix(individuals3)), col=rainbow(6), names.arg=lab3, ylab="Ancestry", main = "Sampling R1 (K=6)", border=NA)
dev.off()


############################
## eHGDP ##
path <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/eHGDP/eHGDP/ADMIXTURE_eHGDP/"
chemin1 <- paste(path, "eHGDP.1.txt", sep="")
chemin2 <- paste(path, "eHGDP.2.txt", sep="")
chemin3 <- paste(path, "eHGDP.3.txt", sep="")
chemin4 <- paste(path, "eHGDP.4.txt", sep="")
chemin5 <- paste(path, "eHGDP.5.txt", sep="")
chemin6 <- paste(path, "eHGDP.6.txt", sep="")
chemin7 <- paste(path, "eHGDP.7.txt", sep="")
chemin8 <- paste(path, "eHGDP.8.txt", sep="")
chemin9 <- paste(path, "eHGDP.9.txt", sep="")
chemin10 <- paste(path, "eHGDP.10.txt", sep="")

chemin <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/eHGDP/eHGDP/eHGDP_individuals.txt"
data <- read.table(chemin, h=F)
#ind <- data[data != 6]
individuals <- sort(data$V1)

png("admixture_eHGDP1.png")
par(mfrow=c(3,1))
tbl2 <- read.table(chemin2, h=F)
barplot(t(as.matrix(tbl2)), col=rainbow(2), names.arg=individuals, main="K=2", ylab="Ancestry", border=NA)
tbl3 <- read.table(chemin3, h=F)
barplot(t(as.matrix(tbl3)), col=rainbow(3), names.arg=individuals, main="K=3", ylab="Ancestry", border=NA)
tbl4 <- read.table(chemin4, h=F)
barplot(t(as.matrix(tbl4)), col=rainbow(4), names.arg=individuals, main="K=4", ylab="Ancestry", border=NA)
dev.off()
png("admixture_eHGDP2.png")
par(mfrow=c(3,1))
tbl5 <- read.table(chemin5, h=F)
barplot(t(as.matrix(tbl5)), col=rainbow(5), names.arg=individuals, main="K=5", ylab="Ancestry", border=NA)
tbl6 <- read.table(chemin6, h=F)
barplot(t(as.matrix(tbl6)), col=rainbow(6), names.arg=individuals, main="K=6", ylab="Ancestry", border=NA)
tbl7 <- read.table(chemin7, h=F)
barplot(t(as.matrix(tbl7)), col=rainbow(7), names.arg=individuals, main="K=7", ylab="Ancestry", border=NA)
dev.off()
png("admixture_eHGDP3.png")
par(mfrow=c(3,1))
tbl8 <- read.table(chemin8, h=F)
barplot(t(as.matrix(tbl8)), col=rainbow(8), names.arg=individuals, main="K=8", ylab="Ancestry", border=NA)
tbl9 <- read.table(chemin9, h=F)
barplot(t(as.matrix(tbl9)), col=rainbow(9), names.arg=individuals, main="K=9", ylab="Ancestry", border=NA)
tbl10 <- read.table(chemin10, h=F)
barplot(t(as.matrix(tbl10)), col=rainbow(10), names.arg=individuals, main="K=10", ylab="Ancestry", border=NA)
dev.off()


############################
## eHGDP_E ##
path <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/eHGDP/eHGDP_E/ADMIXTURE_eHGDP_E/"
chemin1 <- paste(path, "eHGDP_E.1.txt", sep="")
chemin2 <- paste(path, "eHGDP_E.2.txt", sep="")
chemin3 <- paste(path, "eHGDP_E.3.txt", sep="")
chemin4 <- paste(path, "eHGDP_E.4.txt", sep="")
chemin5 <- paste(path, "eHGDP_E.5.txt", sep="")
chemin6 <- paste(path, "eHGDP_E.6.txt", sep="")
chemin7 <- paste(path, "eHGDP_E.7.txt", sep="")
chemin8 <- paste(path, "eHGDP_E.8.txt", sep="")
chemin9 <- paste(path, "eHGDP_E.9.txt", sep="")
chemin10 <- paste(path, "eHGDP_E.10.txt", sep="")

chemin <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/eHGDP/eHGDP_E/eHGDP_E_individuals.txt"
data <- read.table(chemin, h=F)
#ind <- data[data != 6]
individuals <- sort(data$V1)

png("admixture_eHGDP_E1.png")
par(mfrow=c(3,1))
tbl2 <- read.table(chemin2, h=F)
barplot(t(as.matrix(tbl2)), col=rainbow(2), names.arg=individuals, main="K=2", ylab="Ancestry", border=NA)
tbl3 <- read.table(chemin3, h=F)
barplot(t(as.matrix(tbl3)), col=rainbow(3), names.arg=individuals, main="K=3", ylab="Ancestry", border=NA)
tbl4 <- read.table(chemin4, h=F)
barplot(t(as.matrix(tbl4)), col=rainbow(4), names.arg=individuals, main="K=4", ylab="Ancestry", border=NA)
dev.off()
png("admixture_eHGDP_E2.png")
par(mfrow=c(3,1))
tbl5 <- read.table(chemin5, h=F)
barplot(t(as.matrix(tbl5)), col=rainbow(5), names.arg=individuals, main="K=5", ylab="Ancestry", border=NA)
tbl6 <- read.table(chemin6, h=F)
barplot(t(as.matrix(tbl6)), col=rainbow(6), names.arg=individuals, main="K=6", ylab="Ancestry", border=NA)
tbl7 <- read.table(chemin7, h=F)
barplot(t(as.matrix(tbl7)), col=rainbow(7), names.arg=individuals, main="K=7", ylab="Ancestry", border=NA)
dev.off()
png("admixture_eHGDP_E3.png")
par(mfrow=c(3,1))
tbl8 <- read.table(chemin8, h=F)
barplot(t(as.matrix(tbl8)), col=rainbow(8), names.arg=individuals, main="K=8", ylab="Ancestry", border=NA)
tbl9 <- read.table(chemin9, h=F)
barplot(t(as.matrix(tbl9)), col=rainbow(9), names.arg=individuals, main="K=9", ylab="Ancestry", border=NA)
tbl10 <- read.table(chemin10, h=F)
barplot(t(as.matrix(tbl10)), col=rainbow(10), names.arg=individuals, main="K=10", ylab="Ancestry", border=NA)
dev.off()


############################
## eHGDP_G ##
path <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/eHGDP/eHGDP_G/ADMIXTURE_eHGDP_G/"
chemin1 <- paste(path, "eHGDP_G.1.txt", sep="")
chemin2 <- paste(path, "eHGDP_G.2.txt", sep="")
chemin3 <- paste(path, "eHGDP_G.3.txt", sep="")
chemin4 <- paste(path, "eHGDP_G.4.txt", sep="")
chemin5 <- paste(path, "eHGDP_G.5.txt", sep="")
chemin6 <- paste(path, "eHGDP_G.6.txt", sep="")
chemin7 <- paste(path, "eHGDP_G.7.txt", sep="")
chemin8 <- paste(path, "eHGDP_G.8.txt", sep="")
chemin9 <- paste(path, "eHGDP_G.9.txt", sep="")
chemin10 <- paste(path, "eHGDP_G.10.txt", sep="")

chemin <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/eHGDP/eHGDP_G/eHGDP_G_individuals.txt"
data <- read.table(chemin, h=F)
#ind <- data[data != 6]
individuals <- sort(data$V1)

png("admixture_eHGDP_G1.png")
par(mfrow=c(3,1))
tbl2 <- read.table(chemin2, h=F)
barplot(t(as.matrix(tbl2)), col=rainbow(2), names.arg=individuals, main="K=2", ylab="Ancestry", border=NA)
tbl3 <- read.table(chemin3, h=F)
barplot(t(as.matrix(tbl3)), col=rainbow(3), names.arg=individuals, main="K=3", ylab="Ancestry", border=NA)
tbl4 <- read.table(chemin4, h=F)
barplot(t(as.matrix(tbl4)), col=rainbow(4), names.arg=individuals, main="K=4", ylab="Ancestry", border=NA)
dev.off()
png("admixture_eHGDP_G2.png")
par(mfrow=c(3,1))
tbl5 <- read.table(chemin5, h=F)
barplot(t(as.matrix(tbl5)), col=rainbow(5), names.arg=individuals, main="K=5", ylab="Ancestry", border=NA)
tbl6 <- read.table(chemin6, h=F)
barplot(t(as.matrix(tbl6)), col=rainbow(6), names.arg=individuals, main="K=6", ylab="Ancestry", border=NA)
tbl7 <- read.table(chemin7, h=F)
barplot(t(as.matrix(tbl7)), col=rainbow(7), names.arg=individuals, main="K=7", ylab="Ancestry", border=NA)
dev.off()
png("admixture_eHGDP_G3.png")
par(mfrow=c(3,1))
tbl8 <- read.table(chemin8, h=F)
barplot(t(as.matrix(tbl8)), col=rainbow(8), names.arg=individuals, main="K=8", ylab="Ancestry", border=NA)
tbl9 <- read.table(chemin9, h=F)
barplot(t(as.matrix(tbl9)), col=rainbow(9), names.arg=individuals, main="K=9", ylab="Ancestry", border=NA)
tbl10 <- read.table(chemin10, h=F)
barplot(t(as.matrix(tbl10)), col=rainbow(10), names.arg=individuals, main="K=10", ylab="Ancestry", border=NA)
dev.off()