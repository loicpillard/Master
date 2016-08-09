A1 <- "C:/Users/Loïc/Documents/UNIL/Master 1.3/Statistiques/fst_correlations/_fst_correlations.txt"
A2 <- "C:/Users/Loïc/Documents/UNIL/Master 1.3/Statistiques/fst_means/_fst_means.txt"
A3 <- "C:/Users/Loïc/Documents/UNIL/Master 1.3/Statistiques/fst_residuals/_fst_residuals.txt"
A4 <- "C:/Users/Loïc/Documents/UNIL/Master 1.3/Statistiques/fst_slopes/_fst_slopes.txt"
A5 <- "C:/Users/Loïc/Documents/UNIL/Master 1.3/Statistiques/nbA_correlations/_nbA_correlations.txt"
A6 <- "C:/Users/Loïc/Documents/UNIL/Master 1.3/Statistiques/nbA_means/_nbA_means.txt"
A7 <- "C:/Users/Loïc/Documents/UNIL/Master 1.3/Statistiques/nbA_residuals/_nbA_residuals.txt"
A8 <- "C:/Users/Loïc/Documents/UNIL/Master 1.3/Statistiques/nbA_slopes/_nbA_slopes.txt"

data1 <- read.table(A1, h=T)
data2 <- read.table(A2, h=T)
data3 <- read.table(A3, h=T)
data4 <- read.table(A4, h=T)
data5 <- read.table(A5, h=T)
data6 <- read.table(A6, h=T)
data7 <- read.table(A7, h=T)
data8 <- read.table(A8, h=T)

skewness <- function(x) {
  num <- sum((x-mean(x))^3)
  den <- length(x)*sd(x)^3
  return(num/den)
}

kurtosis <- function(x) {
  num <- mean((x-mean(x))^4)
  den <- sd(x)^4
  return((num/den)-3)
}

S <- rep(NA, 34)
K <- rep(NA, 34)
for (i in 1:34){
S[i] <- skewness(data1[,i])
K[i] <- kurtosis(data1[,i])
}

data <- data8
#data[,8] == O
v1.1 <- c(1,2,3,4,5,6,7,9,10,11,12,13,14,15,16,17)
p1.1 <- rep(NA, length(v1.1))
for (i in v1.1){
  test <- t.test(data[,8],data[,i])
  p1.1[i] <- test$p.value
}
con <- file("name1.txt", open = "w")
writeLines(toString(p1.1), con = con)
close(con)
v1.2 <- c(18,19,20,21,22,23,24,26,27,28,29,30,31,32,33,34)
p1.2 <- rep(NA, length(v1.2))
for (i in v1.2){
  test <- t.test(data[,25],data[,i])
  p1.2[i] <- test$p.value
}
con <- file("name2.txt", open = "w")
writeLines(toString(p1.2), con = con)
close(con)

0.05/16
