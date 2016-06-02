A1 <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/Statistiques/fst_correlations/_fst_correlations.txt"
A2 <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/Statistiques/fst_means/_fst_means.txt"
A3 <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/Statistiques/fst_residuals/_fst_residuals.txt"
A4 <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/Statistiques/fst_slopes/_fst_slopes.txt"
A5 <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/Statistiques/nbA_correlations/_nbA_correlations.txt"
A6 <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/Statistiques/nbA_means/_nbA_means.txt"
A7 <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/Statistiques/nbA_residuals/_nbA_residuals.txt"
A8 <- "C:/Users/Loïc/Documents/UNIL/Master 2.1/Statistiques/nbA_slopes/_nbA_slopes.txt"


#Correlation Fst
data <- read.table(A1, h=T)
png("fst_cor1.png")
boxplot(data[,1:17], ylab="Correlation Fst", xlab="Type of sampling", main="Correlation Fst with A* 4D distance",
        ylim=c(0.5, 1))
dev.off()
png("fst_cor2.png")
boxplot(data[,18:34], ylab="Correlation Fst", xlab="Type of sampling", main="Correlation Fst with A* 4D distance",
        ylim=c(0.5, 1))
dev.off()


#Mean Fst
data <- read.table(A2, h=T)
par(mfrow=c(1,1))
png("fst_means1.png")
boxplot(data[,1:17], ylab="Mean Fst", xlab="Type of sampling", main="Mean Fst", 
        ylim=c(0.025, 0.065))
dev.off()
png("fst_means2.png")
boxplot(data[,18:34], ylab="Mean Fst", xlab="Type of sampling", main="Mean Fst",
        ylim=c(0.025, 0.065))
dev.off()


#Residuals Fst
data <- read.table(A3, h=T)
png("fst_residuals1.png")
boxplot(data[,1:17], ylab="log of sum of residuals (Fst)", xlab="Type of sampling", 
        main="Log of sum of residuals (Fst) with A* 4D distance", ylim=c(2.5, 4.2))
dev.off()
png("fst_residuals2.png")
boxplot(data[,18:34], ylab="log of sum of residuals (Fst)", xlab="Type of sampling", 
        main="Log of sum of residuals (Fst) with A* 4D distance", ylim=c(2.5, 4.2))
dev.off()


#Slope Fst
data <- read.table(A4, h=T)
png("fst_slopes1.png")
boxplot(data[,1:17], ylab="Slope Fst", xlab="Type of sampling", 
        main="Fst slope with A* 4D distance", ylim=c(1.7e-06, 4.7e-06))
dev.off()
png("fst_slopes2.png")
boxplot(data[,18:34], ylab="Slope Fst", xlab="Type of sampling", 
        main="Fst slope with A* 4D distance", ylim=c(1.7e-06, 4.7e-06))
dev.off()


#Correlation nbA
data <- read.table(A5, h=T)
png("nbA_cor1.png")
boxplot(data[,1:17], ylab="Correlation nbA", xlab="Type of sampling", main="Correlation nbA with A* 4D distance",
        ylim=c(0.5, 1))
dev.off()
png("nbA_cor2.png")
boxplot(data[,18:34], ylab="Correlation nbA", xlab="Type of sampling", main="Correlation nbA with A* 4D distance",
        ylim=c(0.5, 1))
dev.off()


#Mean nbA
data <- read.table(A6, h=T)
png("nbA_mean1.png")
boxplot(data[,1:17], ylab="Mean nbA", xlab="Type of sampling", main="Mean nbA", 
        ylim=c(5.7, 6.9))
dev.off()
png("nbA_mean2.png")
boxplot(data[,18:34], ylab="Mean nbA", xlab="Type of sampling", main="Mean nbA",
        ylim=c(5.7, 6.9))
dev.off()


#Residuals nbA
data <- read.table(A7, h=T)
png("nbA_residuals1.png")
boxplot(data[,1:17], ylab="log of sum of residuals (nbA)", xlab="Type of sampling", 
        main="Log of sum of residuals (nbA) with A* 4D distance", ylim=c(2.3, 4))
dev.off()
png("nbA_residuals2.png")
boxplot(data[,18:34], ylab="log of sum of residuals (nbA)", xlab="Type of sampling", 
        main="Log of sum of residuals (nbA) with A* 4D distance", ylim=c(2.3, 4))
dev.off()


#Residuals nbA without log
data <- read.table(A7, h=T)
png("nbA_residuals_nolog1.png")
D<-10^data
boxplot(D[,1:17], ylab="Sum of residuals (nbA)", xlab="Type of sampling", 
        main="Sum of residuals (nbA) with A* 4D distance", ylim=c(100, 9000))
dev.off()
png("nbA_residuals_nolog2.png")
boxplot(D[,18:34], ylab="Sum of residuals (nbA)", xlab="Type of sampling", 
        main="Sum of residuals (nbA) with A* 4D distance", ylim=c(100, 9000))
dev.off()


#Slope nbA with 4D
data <- read.table(A8, h=T)
png("nbA_slopes1.png")
boxplot(data[,1:17], ylab="Slope nbA", xlab="Type of sampling", 
        main="nbA slope with A* 4D distance", ylim=c(-0.00013, -0.00004))
dev.off()
png("nbA_slopes2.png")
boxplot(data[,18:34], ylab="Slope nbA", xlab="Type of sampling", 
        main="nbA slope with A* 4D distance", ylim=c(-0.00013, -0.00004))
dev.off()


############

#Mean Fst
data <- read.table(A2, h=T)
png("fst_means1.png")
boxplot(data[,1:17], ylab="Mean Fst", xlab="Type of sampling", main="Mean Fst", 
        ylim=c(0.025, 0.065), col = c("light blue", "green", "green", "green", "green", "green",
                                      "green", "yellow", "red", "red", "red", "red", "red", 
                                      "red", "red", "red", "red"))
legend("topleft", c("Equidistant", "Group", "Observed", "Random"), 
       col=c("light blue", "green", "yellow", "red"), pch=20, bty="n")
dev.off()
png("fst_means2.png")
boxplot(data[,18:34], ylab="Mean Fst", xlab="Type of sampling", main="Mean Fst",
        ylim=c(0.025, 0.065), col = c("light blue", "green", "green", "green", "green", "green",
                                      "green", "yellow", "red", "red", "red", "red", "red", 
                                      "red", "red", "red", "red"))
legend("topleft", c("Equidistant", "Group", "Observed", "Random"), 
       col=c("light blue", "green", "yellow", "red"), pch=20, bty="n")
dev.off()

#Mean nbA
data <- read.table(A6, h=T)
png("nbA_mean1.png")
boxplot(data[,1:17], ylab="Mean nbA", xlab="Type of sampling", main="Mean nbA", 
        ylim=c(5.7, 6.9), col = c("light blue", "green", "green", "green", "green", "green",
                                  "green", "yellow", "red", "red", "red", "red", "red", 
                                  "red", "red", "red", "red"))
legend("topleft", c("Equidistant", "Group", "Observed", "Random"), 
       col=c("light blue", "green", "yellow", "red"), pch=20, bty="n")
dev.off()
png("nbA_mean2.png")
boxplot(data[,18:34], ylab="Mean nbA", xlab="Type of sampling", main="Mean nbA",
        ylim=c(5.7, 6.9),col = c("light blue", "green", "green", "green", "green", "green",
                                 "green", "yellow", "red", "red", "red", "red", "red", 
                                 "red", "red", "red", "red"))
legend("bottomleft", c("Equidistant", "Group", "Observed", "Random"), 
       col=c("light blue", "green", "yellow", "red"), pch=20, bty="n")
        
dev.off()

#Slope Fst
data <- read.table(A4, h=T)
png("fst_slopes1.png")
boxplot(data[,1:17], ylab="Slope Fst", xlab="Type of sampling", 
        main="Fst slope with A* 4D distance", ylim=c(1.7e-06, 4.7e-06), 
        col = c("light blue", "green", "green", "green", "green", "green", "green", "yellow", "red", 
          "red", "red", "red", "red", "red", "red", "red", "red"))
legend("topright", c("Equidistant", "Group", "Observed", "Random"), 
       col=c("light blue", "green", "yellow", "red"), pch=20, bty="n")
dev.off()

#Slope nbA with 4D
data <- read.table(A8, h=T)
png("nbA_slopes1.png")
boxplot(data[,1:17], ylab="Slope nbA", xlab="Type of sampling", 
        main="nbA slope with A* 4D distance", ylim=c(-0.00013, -0.00004),
        col = c("light blue", "green", "green", "green", "green", "green", "green", "yellow", "red", 
                "red", "red", "red", "red", "red", "red", "red", "red"))
legend("bottomright", c("Equidistant", "Group", "Observed", "Random"), 
       col=c("light blue", "green", "yellow", "red"), pch=20, bty="n")
dev.off()
