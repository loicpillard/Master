library(ade4)
library(adegenet)
library(gtools)
library(maps)
library(MASS)

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
nbPC <- 5
pcaY <- dudi.pca(Y[,2:ncol(Y)],center=TRUE,scale=FALSE, nf=nbPC, scannf=FALSE)
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

### Parallel coordinates plots ###
dataPC <- cbind(pcaY$li, Y[,1])
B <- sapply(dataPC[ ,1:5], function(x) {
  tapply(x, dataPC[ , 6], mean)
})

C <- sapply(dataPC[ ,1:5], function(x) {
  tapply(x, dataPC[ , 6], quantile)
})

mat <- matrix(, nrow=7, ncol=5)
for (i in 1:7){
  mat[i, 1] <- C[i,]$Axis1[1]
  mat[i, 2] <- C[i,]$Axis2[1]
  mat[i, 3] <- C[i,]$Axis3[1]
  mat[i, 4] <- C[i,]$Axis4[1]
  mat[i, 5] <- C[i,]$Axis5[1]
}

D <- rbind(B, mat)

mat <- matrix(, nrow=7, ncol=5)
for (i in 1:7){
  mat[i, 1] <- C[i,]$Axis1[5]
  mat[i, 2] <- C[i,]$Axis2[5]
  mat[i, 3] <- C[i,]$Axis3[5]
  mat[i, 4] <- C[i,]$Axis4[5]
  mat[i, 5] <- C[i,]$Axis5[5]
}

E <- rbind(D, mat)


png("parallel_coordinates_eHGDP.png")
parcoord(E, col=c("black", "pink", "cyan", "green", "blue", "yellow", "red")[c(1,2,3,4,5,6,7)], 
         main="Parallel Coordinates Plot on PCA with eHGDP", 
         lwd=c(2,2,2,2,2,2,2,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5),
         lty=c(1,1,1,1,1,1,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3))
dev.off()




### K-means clustering ###
Y <- apply(eHGDP$tab,2,f1)
kmeans <- find.clusters(Y, n.pca=100, choose.n.clust=FALSE, criterion='diffNgroup')
kmeans$stat


plot(kmeans$Kstat, pch=19)

