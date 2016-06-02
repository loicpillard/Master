library(MCMCpack)
library(maps)
library(mapdata)
library(mapproj)
path <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/"
simulation <- "E"
n <- 100
i <- 54
for (i in 1:n){
name1 <- paste(path, "Résultats/", simulation, "/pca_", simulation, "-", toString(i), ".txt", sep="")
name2 <- paste(path, "Coordinates GPS/geocoord_", simulation, ".txt", sep="")
# load data 
pca <- read.table(name1, header=T)
nov <- read.table(name2, header=T)
# get coordinate of points
X <- as.matrix(cbind(nov$longitude,nov$latitude))
# get pc coordinates of points
Xstar <- as.matrix(cbind(pca$Axis1,pca$Axis2))
# do procruste transformation
p <- procrustes(Xstar,X,translation=T,dilation=T)

## Calculate T0 score ##
#PCA X0
x1 <- rep(sum(X[,1])/length(X[,1]), length(X[,1]))
x2 <- rep(sum(X[,2])/length(X[,2]), length(X[,2]))
X0 <- as.matrix(cbind(x1,x2))
Xc <- X-X0

#GPS Y0
y1 <- rep(sum(p$X.new[,1])/length(p$X.new[,1]), length(p$X.new[,1]))
y2 <- rep(sum(p$X.new[,2])/length(p$X.new[,2]), length(p$X.new[,2]))
Y0 <- as.matrix(cbind(y1,y2))
Yc <- p$X.new-Y0

C <- t(Yc)%*%Xc

tr_lambda <- sum(svd(C)$d)
tr_X <- sum(diag(t(Xc)%*%Xc))
tr_Y <- sum(diag(t(Yc)%*%Yc))

D <- 1-((tr_lambda^2)/(tr_X*tr_Y))
t0 <- sqrt(1-D)

## Plot the graph ##
# load the right map
name <- paste("procruste_", simulation, "-", toString(i), ".png", sep="")
png(name)
map(database="world", projection="rectangular", parameter=0, orientation=c(90,-20,180), wrap=T, interior=F)
map.axes()
# plot transformed pca
text(p$X.new, col=c(nov$continents),labels=nov$continents,cex=0.25) #procrustes data
# plot "real" data
text(nov$longitude,nov$latitude, col=c(nov$continents),labels=nov$continents,cex=0.6)

new_center <- p$s*c(0,0)%*%p$R+t(p$tt)
new_pc1 <- p$s*c(1,0)%*%p$R+t(p$tt)
new_pc2 <- p$s*c(0,1)%*%p$R+t(p$tt)

slope1 <- (new_pc1[2]-new_center[2])/(new_pc1[1]-new_center[1])
slope2 <- (new_pc2[2]-new_center[2])/(new_pc2[1]-new_center[1])

h1 <- new_center[2]-slope1*new_center[1]
h2 <- new_center[2]-slope2*new_center[1]

abline(h1, slope1, lty=3)
abline(h2, slope2, lty=3)
text(3, 0.8, labels="PC1")
text(0, 2.8, labels="PC2")
text(2, -2.5, labels=paste("t0=", toString(round(t0, 7))))
dev.off()

####selection (col = 1, row = 1)
####angle of rotation
angleC <- acos(p$R[1,2])
name <- paste("procrustes_angle_", simulation, "-", toString(i), ".txt", sep="")
con <- file(name, open = "w")
writeLines(toString(t0), con = con) # t0 score
writeLines(toString(angle), con = con) # angle
close(con)
}

pca <- read.table(file.choose(), header=T)
nov <- read.table(file.choose(), header=T)
name <- "procrustes_eHGDP_E_microsatellites.png"
