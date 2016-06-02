path <- "C:/Users/Loïc/Documents/UNIL/Master 1.3/Résultats/"
simulation <- "E"
n <- 100

## Patterns statistics 
fst_cor <- rep(NA, n)
fst_means <- rep(NA, n)
fst_residuals <- rep(NA, n)
fst_slopes <- rep(NA, n)
nbA_cor <- rep(NA, n)
nbA_means <- rep(NA, n)
nbA_residuals <- rep(NA, n)
nbA_slopes <- rep(NA, n)

for (i in 1:n){
W <- paste(path, simulation, "/", "fst_", simulation, "-", toString(i), ".txt", sep="")
X <- paste(path, simulation, "/", "nbA_", simulation, "-", toString(i), ".txt", sep="")
fst <- read.table(W, h=T)
nbA <- read.table(X, h=T)
reg_fst <- lm(fst$pairwise_fst~fst$pairwise_distance)
corfst <- cor.test(fst$pairwise_fst, fst$pairwise_distances)
fst_cor[i] <- corfst$estimate
fst_means[i] <- mean(fst$pairwise_fst)
fst_residuals[i] <- log(sum(abs(reg_fst$residuals)))
fst_slopes[i] <- reg_fst$coefficients['fst$pairwise_distance']
reg_nbA <- lm(nbA$nb_alleles~nbA$distance_from_AA)
cornbA <- cor.test(nbA$nb_alleles, nbA$distance_from_AA)
nbA_cor[i] <- cornbA$estimate
nbA_means[i] <- mean(nbA$nb_alleles)
nbA_residuals[i] <- log(sum(abs(reg_nbA$residuals)))
nbA_slopes[i] <- reg_nbA$coefficients['nbA$distance_from_AA']
}


name <- paste("fst_cor_", simulation,".txt", sep="" )
con <- file(name, open = "w")
writeLines(toString(fst_cor), con = con)
close(con)
name <- paste("fst_means_", simulation,".txt", sep="" )
con <- file(name, open = "w")
writeLines(toString(fst_means), con = con)
close(con)
name <- paste("fst_residuals_", simulation,".txt", sep="" )
con <- file(name, open = "w")
writeLines(toString(fst_residuals), con = con)
close(con)
name <- paste("fst_slopes_", simulation,".txt", sep="" )
con <- file(name, open = "w")
writeLines(toString(fst_slopes), con = con)
close(con)
name <- paste("nbA_cor_", simulation,".txt", sep="" )
con <- file(name, open = "w")
writeLines(toString(nbA_cor), con = con)
close(con)
name <- paste("nbA_means_", simulation,".txt", sep="" )
con <- file(name, open = "w")
writeLines(toString(nbA_means), con = con)
close(con)
name <- paste("nbA_residuals_", simulation,".txt", sep="" )
con <- file(name, open = "w")
writeLines(toString(nbA_residuals), con = con)
close(con)
name <- paste("nbA_slopes_", simulation,".txt", sep="" )
con <- file(name, open = "w")
writeLines(toString(nbA_slopes), con = con)
close(con)
