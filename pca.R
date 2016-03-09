library("ade4")
library("adegenet")
path <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats/"
simulation <- "E"
n <- 100
i <- 54


## PCA
#for (i in 1:n){
  Y <- paste(path, simulation, "/", "structure_", simulation, "-", toString(i), ".txt", sep="")
  Z <- paste(path, simulation, "/", "structure_pop_", simulation, "-", toString(i), ".txt", sep="")
  structure <- read.table(Y, h=F)
  structurePop <- read.table(Z, h=F)
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
  B <- sapply(structurePop[ , 2:ncol(structurePop)], function(x) {
  tapply(x, structurePop[ , 103], mean)
  })
  if (is.element(6, B[,1])){
    selectionB<-which(B[,1]==6)
    BwO <-B[-selectionB,]
  } else {
    BwO <- B
  }

par(mfrow=c(1,1))

pca <- dudi.pca(AwO[,2:101], scannf=FALSE, nf=2)
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

pcaPop <- dudi.pca(BwO[,2:102], scannf=FALSE, nf=2)
plot(pcaPop$li, col=c("black", "yellow", "cyan", "green", "blue", "yellow", "red")[BwO[,1]],
     pch=20, cex=1)
legend("bottomright", 
       c('Africa','Middle East','Europe','Central Asia','East Asia', 'America'), 
       col=c("black", "yellow", "cyan", "green", "blue", "red"), pch=20, bty="n", 
       cex=0.75)
name <- paste("pcaPop_", simulation, "-", toString(i), ".txt", sep="")
con <- file(name, open = "w")
writeLines(toString(pcaPop$li[,1]), con = con) 
writeLines(toString(pcaPop$li[,2]), con = con)
close(con)

#}