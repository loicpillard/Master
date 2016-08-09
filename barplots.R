L <- c("E", "G0", "G1", "G2", "G3", "G4", "G4bis", "O", "R1", "R2", "R3", "R4", "R5", "R6", "R7",
       "R8", "R9", "SE", "SG0", "SG1", "SG2", "SG3", "SG4", "SG4bis", "SO", "SR1", "SR2", "SR3", 
       "SR4", "SR5", "SR6", "SR7", "SR8", "SR9")


data <- read.table(file.choose(), h=F)
par(mfrow=c(1,1))
png("barplot_E.png")
barplot(data[,1], names=c("K=2", "K=3", "K=4", "K=5", "K=6", "K=7"), main="Number of K for E sampling")
dev.off()
png("barplot_G2.png")
barplot(data[,1], names=c("K=2", "K=3", "K=4", "K=5", "K=6", "K=7"), main="Number of K for G2 sampling")
dev.off()
png("barplot_R1.png")
barplot(data[,1], names=c("K=2", "K=3", "K=4", "K=5", "K=6", "K=7", "K=8", "K=9"), main="Number of K for R1 sampling")
dev.off()


#admixture
data <- read.table(file.choose(), h=T)
par(mfrow=c(1,1))

png("admixture_R1-500.png")
barplot(data[,1], names=c("K=3", "K=4", "K=5", "K=6", "K=7", "K=8", "K=9"), main="Number of K for R1 sampling")
dev.off()

png("admixture_G0.png")
barplot(data[,2], names=c("K=3", "K=4", "K=5", "K=6", "K=7", "K=8"), main="Number of K for G0 sampling")
dev.off()