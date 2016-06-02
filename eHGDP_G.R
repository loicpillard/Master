library(ade4)
library(adegenet)
library(gtools)
library(maps)
library(MASS)

pop <- read.table("C:/Users/Loïc/Documents/UNIL/Master 2.1/eHGDP/eHGDP_G/eHGDP_G_other.txt", h=T)

#Plot the populations location on a map
png("map_G.png")
map(database = "world", col = "grey")
map.axes()
points(pop[,5], pop[,4], col=c("red", "blue", "green", "yellow", "black", "pink", "cyan", "orange"), 
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
data <- read.table("C:/Users/Loïc/Documents/UNIL/Master 2.1/eHGDP/eHGDP_G/eHGDP_G.txt", h=F)
dataY <- apply(data,2,f1)
dataY <-data.frame(dataY)
Y <- sapply(dataY[, 2:ncol(dataY)], function(x) {
  tapply(x, dataY[, 1], mean)
})
pcaY <- dudi.pca(Y[,2:ncol(Y)],center=TRUE,scale=FALSE, nf=10, scannf=FALSE)
png("pca_eHGDP_G_microsatellites.png")
pc1 <- paste("PC1 (", toString(round(pcaY$eig[1]/sum(pcaY$eig)*100, 2)), "%)", sep="")
pc2 <- paste("PC2 (", toString(round(pcaY$eig[2]/sum(pcaY$eig)*100, 2)), "%)", sep="")
plot(pcaY$li, pch=20, cex=0.75, xlab=pc1, ylab=pc2, main="PCA on eHGDP_G with microsatellites",
     col=c("black", "pink", "cyan", "green", "blue", "yellow", "red")[Y[,1]])
legend("bottomleft", 
       c('Africa','Middle East','Europe','Central Asia','East Asia','America'), 
       col=c("black", "pink", "cyan", "green", "blue", "red"), pch=20, bty="n", 
       cex=1)
dev.off()

write.table(pcaY$li, file="eHGDP_G_pca_microsatellites_coordinates.txt")

png("parallel_coordinates_eHGDP_G.png")
parcoord(pcaY$li, col=c("black", "pink", "cyan", "green", "blue", "yellow", "red")[Y[,1]], 
         main="Parallel Coordinates Plot on PCA with eHGDP_G", lwd=0.25)
dev.off()

legend("bottomright", 
       c('Africa','Middle East','Europe','Central Asia','East Asia','America'), 
       col=c("black", "pink", "cyan", "green", "blue", "red"), pch=20, bty="n", 
       cex=1)






### K-means clustering ###
Y <- apply(eHGDP$tab,2,f1)
kmeans <- find.clusters(Y, n.pca=100, choose.n.clust=FALSE, criterion='diffNgroup')
kmeans$stat


plot(kmeans$Kstat, pch=19)
