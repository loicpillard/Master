library("ade4")
library("adegenet")
library("MASS")
path <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats/"
simulation <- "G0"
n <- 100
i <- 1


## PCA
#for (i in 1:n){
  Y <- paste(path, simulation, "/", "structure_", simulation, "-", toString(i), ".txt", sep="")
  structure <- read.table(Y, h=F)
  #PCA per individual
  A <- sapply(structure[ , 2:ncol(structure)], function(x) {
    tapply(x, structure[ , 1], mean)
  })
  if (is.element(6, A[,1])){
    selectionA<-which(A[,1]==6)
    AwO <-A[-selectionA,]
  } else {
    AwO <- A
  }

par(mfrow=c(1,1))
pca <- dudi.pca(AwO[,2:101], scannf=FALSE, nf=10)
png(paste("pca_", simulation, "-", toString(i), ".png", sep=""))
pc1 <- paste("PC1 (", toString(round(pca$eig[1], 2)), "%)", sep="")
pc2 <- paste("PC2 (", toString(round(pca$eig[2], 2)), "%)", sep="")
plot(pca$li, col=c("black", "yellow", "cyan", "green", "blue", "yellow", "red")[AwO[,1]], 
     pch=20, cex=0.75, xlab=pc1, ylab=pc2)
legend("topleft", 
       c('Africa','Middle East','Europe','Central Asia','East Asia','America'), 
       col=c("black", "yellow", "cyan", "green", "blue", "red"), pch=20, bty="n", 
       cex=1.25)
dev.off()

name <- paste("pca_", simulation, "-", toString(i), ".txt", sep="")
write.table(pca$li[,1:2], file=name)

name <- paste("parallel_coordinates_", simulation, "-", toString(i), ".png", sep="")
png(name)
parcoord(pca$li, col=c("black", "pink", "cyan", "green", "blue", "yellow", "red")[AwO[,1]], 
         main=paste("Parallel Coordinates Plot on PCA with ", simulation, "-", toString(i), sep=""), 
         lwd=0.25)
dev.off()

#}