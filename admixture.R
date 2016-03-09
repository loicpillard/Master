path <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats ADMIXTURE/"
simulation <- "O"
i <- 1
chemin1 <- paste(path, simulation, "/admixture_", simulation, "-", toString(i), ".1.txt", sep="")
chemin2 <- paste(path, simulation, "/admixture_", simulation, "-", toString(i), ".2.txt", sep="")
chemin3 <- paste(path, simulation, "/admixture_", simulation, "-", toString(i), ".3.txt", sep="")
chemin4 <- paste(path, simulation, "/admixture_", simulation, "-", toString(i), ".4.txt", sep="")
chemin5 <- paste(path, simulation, "/admixture_", simulation, "-", toString(i), ".5.txt", sep="")
chemin6 <- paste(path, simulation, "/admixture_", simulation, "-", toString(i), ".6.txt", sep="")
chemin7 <- paste(path, simulation, "/admixture_", simulation, "-", toString(i), ".7.txt", sep="")

chemin <- paste("C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats/", simulation, "/individuals_", simulation, ".txt", sep="")
ind <- read.table(chemin, h=F)
individuals <- sort(ind[,1])

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


###########################
#Kanitz order#

png(paste("admixture_",simulation, "-", toString(i), "a.png", sep=""))
par(mfrow=c(3,1))
tbl4 <- read.table(chemin4, h=F)
barplot(t(as.matrix(tbl4)), col=rainbow(4), names.arg=individuals, main="K=4", ylab="Ancestry", border=NA)
tbl3 <- read.table(chemin3, h=F)
barplot(t(as.matrix(tbl3)), col=rainbow(3), names.arg=individuals, main="K=3", ylab="Ancestry", border=NA)
tbl2 <- read.table(chemin2, h=F)
barplot(t(as.matrix(tbl2)), col=rainbow(2), names.arg=individuals, main="K=2", ylab="Ancestry", border=NA)
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


simulation <- "E"
chemin <- paste("C:/Users/Loïc/Documents/UNIL/Master 2.1/continent_individuals", "/continent_individuals_", simulation, ".txt", sep="")
individuals1 <- read.table(chemin, h=F)
simulation <- "G0"
chemin <- paste("C:/Users/Loïc/Documents/UNIL/Master 2.1/continent_individuals", "/continent_individuals_", simulation, ".txt", sep="")
individuals2 <- read.table(chemin, h=F)
simulation <- "G2"
chemin <- paste("C:/Users/Loïc/Documents/UNIL/Master 2.1/continent_individuals", "/continent_individuals_", simulation, ".txt", sep="")
individuals3 <- read.table(chemin, h=F)

png("ind1.png")
par(mfrow=c(3,1))
barplot(t(as.matrix(individuals1)), col=rainbow(6), ylab="Ancestry", main = "Sampling E (K=6)", border=NA)
barplot(t(as.matrix(individuals2)), col=rainbow(6), ylab="Ancestry", main = "Sampling G0 (K=6)", border=NA)
barplot(t(as.matrix(individuals3)), col=rainbow(6), ylab="Ancestry", main = "Sampling G2 (K=6)", border=NA)
dev.off()