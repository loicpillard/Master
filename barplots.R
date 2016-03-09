L <- c("E", "G0", "G1", "G2", "G3", "G4", "G4bis", "O", "R1", "R2", "R3", "R4", "R5", "R6", "R7",
       "R8", "R9", "SE", "SG0", "SG1", "SG2", "SG3", "SG4", "SG4bis", "SO", "SR1", "SR2", "SR3", 
       "SR4", "SR5", "SR6", "SR7", "SR8", "SR9")

for (simulation in L){
path <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats Procrustes/"
name <- paste(path, simulation, "/procrustes_summary_score_", simulation, ".txt", sep="")
data <- read.table(name, h=F)
#mean(data$V1)
#median(data$V1)
#var(data$V1)
print(cbind(mean(data$V1), median(data$V1), var(data$V1)))
}

data <- read.table(file.choose(), h=T)
par(mfrow=c(1,1))
png("barplot_E.png")
barplot(data[,1], names=c("K=2", "K=3", "K=4", "K=5", "K=6", "K=7"), main="Number of K for E sampling")
dev.off()
png("barplot_G0.png")
barplot(data[,2], names=c("K=2", "K=3", "K=4", "K=5", "K=6", "K=7"), main="Number of K for G0 sampling")
dev.off()

data <- read.table(file.choose(), h=T)
par(mfrow=c(1,1))
png("admixture_E.png")
barplot(data[,1], names=c("K=3", "K=4", "K=5", "K=6", "K=7", "K=8"), main="Number of K for E sampling")
dev.off()
png("admixture_G0.png")
barplot(data[,2], names=c("K=3", "K=4", "K=5", "K=6", "K=7", "K=8"), main="Number of K for G0 sampling")
dev.off()