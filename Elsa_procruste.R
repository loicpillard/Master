## script R to run procuste
# Elsa Guillot Oct 2015

# packages 
#install.packages('maps')
#install.packages('MCMCpack')

library(MCMCpack)
library(maps)
# load data november
nov <- read.table(file.choose(),header=T,sep="\t")
# get coordinate of points
X <- as.matrix(cbind(nov$longitude,nov$latitude))
# get pc coordinates of points
Xstar <- as.matrix(cbind(nov$PC1,nov$PC2))
# do procruste transformation
p <- procrustes(Xstar,X,translation=T,dilation=T)

# load the right map
map(database='world',regions=c('belgium','italy','spain','portugal','france','netherlands','denmark','austria','uk','germany','sweden','norway','luxembourg','ireland','finland','monaco','greece'),xlim=c(-10,20),ylim=c(35,60))
map.axes()
# plot transformed pca
text(p$X.new, col=c(nov$alabels),labels=nov$alabels,cex=0.45)
# plo coordinate of points
text(nov$longitude,nov$latitude,col=c(nov$alabels),labels=nov$alabels)

#map(database="world")


## do the same on real data
setwd('~/Documents/RicardoProject/pca_study')
pcasim=as.matrix(read.table('pca_ex1_pop.txt',h=T,sep="\t"))
pcaobs=as.matrix(read.table('OBS.pca.out.pop.txt',h=T,sep="\t"))

p <- procrustes(pcaobs,pcasim)

par(mfrow=c(2,1))
plot(pcaobs[,1],pcaobs[,2],main="before procruste")
points(pcasim[,1],pcasim[,2],col='red')
plot(pcaobs[,1],pcaobs[,2],main="after procruste")
points(p$X.new[,1],p$X.new[,2],col='red')
