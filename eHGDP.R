library(ade4)
library(adegenet)
library(gtools)
library(maps)

#Load the data
data(eHGDP)
#GPS coordinates and populations informations
eHGDP$other
eHGDP$pop
write.table(eHGDP$tab, file="eHGDP_tab.txt")
write.table(eHGDP$loc.fac,file="eHGDP_loc.txt")
write.table(eHGDP$other$popInfo, file="eHGDP_other.txt")
write.table(eHGDP$pop, file="eHGDP_pop.txt")

#Plot the populations location on a map
png("map.png")
map(database = "world", col = "grey")
map.axes()
points(eHGDP$other$popInfo[,5], eHGDP$other$popInfo[,4], col=c("red", "blue", "green", "yellow", "black", "pink", "cyan", "orange"), 
     pch=20, cex=1)
dev.off()

### PCA on the dataset ###
#Function for replacing NA by mean of the column
f1 <- function(vec) {
  m <- mean(vec, na.rm = TRUE)
  vec[is.na(vec)] <- m
  return(vec)
}

# PCA with microsatellites #
data <- read.table("C:/Users/Loïc/Documents/UNIL/Master 2.1/eHGDP/eHGDP/eHGDP.txt", h=F)
dataY <- apply(data,2,f1)
dataY <-data.frame(dataY)
Y <- sapply(dataY[, 2:ncol(dataY)], function(x) {
  tapply(x, dataY[, 1], mean)
  })
pcaY <- dudi.pca(Y[,2:ncol(Y)],center=TRUE,scale=FALSE, nf=10, scannf=FALSE)
png("pca_eHGDP_microsatellites.png")
pc1 <- paste("PC1 (", toString(round(pcaY$eig[1]/sum(pcaY$eig)*100, 2)), "%)", sep="")
pc2 <- paste("PC2 (", toString(round(pcaY$eig[2]/sum(pcaY$eig)*100, 2)), "%)", sep="")
plot(pcaY$li, pch=20, cex=0.75, xlab=pc1, ylab=pc2, main="PCA on eHGDP with microsatellites",
     col=c("black", "pink", "cyan", "green", "blue", "yellow", "red")[Y[,1]])
legend("topright", 
       c('Africa','Middle East','Europe','Central Asia','East Asia','Oceania', 'America'), 
       col=c("black", "pink", "cyan", "green", "blue", "yellow", "red"), pch=20, bty="n", 
       cex=1)
dev.off()

png("parallel_coordinates_eHGDP_microsatellites.png")
parcoord(pcaY$li, col=c("black", "pink", "cyan", "green", "blue", "yellow", "red")[Y[,1]], 
         main="Parallel Coordinates Plot on PCA with eHGDP_microsatellites", lwd=0.25)
dev.off()

# PCA with SNP
individuals <- read.table("C:/Users/Loïc/Documents/UNIL/Master 2.1/eHGDP/eHGDP/eHGDP_individuals.txt", h=F)
Y <- apply(eHGDP$tab,2,f1)
pca <- dudi.pca(Y,center=TRUE,scale=FALSE, nf=10,scannf=FALSE)
png("pca_eHGDP_SNP.png")
pc1 <- paste("PC1 (", toString(round(pca$eig[1]/sum(pca$eig)*100, 2)), "%)", sep="")
pc2 <- paste("PC2 (", toString(round(pca$eig[2]/sum(pca$eig)*100, 2)), "%)", sep="")
plot(pca$li, pch=20, cex=0.75, xlab=pc1, ylab=pc2, main="PCA on eHGDP with SNP",
     col=c("black", "pink", "cyan", "green", "blue", "yellow", "red")[individuals$V1])
legend("topright", 
       c('Africa','Middle East','Europe','Central Asia','East Asia','Oceania', 'America'), 
       col=c("black", "pink", "cyan", "green", "blue", "yellow", "red"), pch=20, bty="n", 
       cex=1.25)
dev.off()
write.table(pca$li, file="eHGDP_pca_SNP_coordinates.txt")
write.table(pcaY$li, file="eHGDP_pca_microsatellites_coordinates.txt")

png("parallel_coordinates_eHGDP_SNP.png")
parcoord(pca$li, col=c("black", "pink", "cyan", "green", "blue", "yellow", "red")[individuals$V1], 
         main="Parallel Coordinates Plot on PCA with eHGDP_SNP", lwd=0.25)
dev.off()

### K-means clustering ###
Y <- apply(eHGDP$tab,2,f1)
kmeans <- find.clusters(Y, n.pca=100, choose.n.clust=FALSE, criterion='diffNgroup')
kmeans$stat


plot(kmeans$Kstat, pch=19)

