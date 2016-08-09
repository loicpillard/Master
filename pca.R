library("ade4")
library("adegenet")
library("MASS")
path <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats/"
simulation <- "G0"
n <- 100
i <- 1


## PCA
for (i in 1:n){
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

nbPC <- 2
pca <- dudi.pca(AwO[,2:101], scannf=FALSE, nf=nbPC) 
par(mfrow=c(1,1))
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
}

name <- paste("pca_", simulation, "-", toString(i), ".txt", sep="")
write.table(pca$li[,1:2], file=name)


dataPC <- cbind(pca$li, AwO[,1])
B <- sapply(dataPC[ ,1:nbPC], function(x) {
  tapply(x, dataPC[ , nbPC+1], mean)
})

CI.95_min <- function(v){
  min <- mean(v)-1.96*(sd(v)/sqrt(length(v)))
  max <- mean(v)+1.96*(sd(v)/sqrt(length(v)))
  return(min)
}

CI.95_max <- function(v){
  min <- mean(v)-1.96*(sd(v)/sqrt(length(v)))
  max <- mean(v)+1.96*(sd(v)/sqrt(length(v)))
  return(max)
}


C <- sapply(dataPC[ ,1:5], function(x) {
  tapply(x, dataPC[ , 6], CI.95_min)
})

D <- sapply(dataPC[ ,1:5], function(x) {
  tapply(x, dataPC[ , 6], CI.95_max)
})

d <- rbind(B, C)
e <- rbind(d, D)

name <- paste("parallel_coordinates_", simulation, "-", toString(i), ".png", sep="")
png(name)
parcoord(e, col=c("black", "pink", "cyan", "green", "blue", "red")[c(1,2,3,4,5,6)], 
         main=paste("Parallel Coordinates Plot on PCA with ", simulation, "-", toString(i), sep=""), 
         lwd=c(2,2,2,2,2,2,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5),
         lty=c(1,1,1,1,1,1,3,3,3,3,3,3,3,3,3,3,3,3))
dev.off()



#}