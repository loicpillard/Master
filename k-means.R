library("ade4")
library("adegenet")
path <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/Résultats/"
simulation <- "E"
n <- 100
i <- 3

## K-means clustering
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
  cluster_ind <- find.clusters(AwO, n.pca=100, choose.n.clust=FALSE, criterion='diffNgroup')

  #Write the ouput files
  name <- paste("kmeans_ind_", simulation, "-", toString(i), ".txt", sep="")
  con <- file(name, open = "w")
  writeLines(toString(AwO[,1]), con = con) # continent
  writeLines(toString(cluster_ind$grp), con = con) # cluster number
  close(con)
}

help(find.clusters)


