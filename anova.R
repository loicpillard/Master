library("reshape2")
A1 <- "C:/Users/Loïc/Documents/UNIL/Master 1.3/Statistiques/fst_correlations/_fst_correlations.txt"
A2 <- "C:/Users/Loïc/Documents/UNIL/Master 1.3/Statistiques/fst_means/_fst_means.txt"
A3 <- "C:/Users/Loïc/Documents/UNIL/Master 1.3/Statistiques/fst_residuals/_fst_residuals.txt"
A4 <- "C:/Users/Loïc/Documents/UNIL/Master 1.3/Statistiques/fst_slopes/_fst_slopes.txt"
A5 <- "C:/Users/Loïc/Documents/UNIL/Master 1.3/Statistiques/nbA_correlations/_nbA_correlations.txt"
A6 <- "C:/Users/Loïc/Documents/UNIL/Master 1.3/Statistiques/nbA_means/_nbA_means.txt"
A7 <- "C:/Users/Loïc/Documents/UNIL/Master 1.3/Statistiques/nbA_residuals/_nbA_residuals.txt"
A8 <- "C:/Users/Loïc/Documents/UNIL/Master 1.3/Statistiques/nbA_slopes/_nbA_slopes.txt"


#Correlation Fst
data1 <- read.table(A1, h=T)
anov1.1 <- melt(data1[,1:16])
m1.1 <- aov(anov1.1$value~anov1.1$variable)
qqnorm(residuals(m1.1)); qqline(residuals(m1.1))
shapiro.test(residuals(m1.1))
cor_fst1 <- kruskal.test(anov1.1$value~anov1.1$variable)


anov1.2 <- melt(data1[,18:34])
m1.2 <- aov(anov1.2$value~anov1.2$variable)
qqnorm(residuals(m1.2)); qqline(residuals(m1.2))
shapiro.test(residuals(m1.2))
cor_fst2 <- kruskal.test(anov1.2$value~anov1.2$variable)


#Mean Fst
data2 <- read.table(A2, h=T)
anov2.1 <- melt(data2[, 1:17])
m2.1 <- aov(anov2.1$value~anov2.1$variable)
qqnorm(residuals(m2.1)); qqline(residuals(m2.1))
shapiro.test(residuals(m2.1))
bartlett.test(anov2.1)
mean_fst1 <- kruskal.test(anov2.1$value~anov2.1$variable)

anov2.2 <- melt(data2[, 18:34])
m2.2 <- aov(anov2.2$value~anov2.2$variable)
qqnorm(residuals(m2.2)); qqline(residuals(m2.2))
shapiro.test(residuals(m2.2))
bartlett.test(anov2.2)
mean_fst2 <- kruskal.test(anov2.2$value~anov2.2$variable)


#Residuals Fst
data3 <- read.table(A3, h=T)
anov3.1 <- melt(data3[,1:17])
m3.1 <- aov(anov3.1$value~anov3.1$variable)
qqnorm(residuals(m3.1)); qqline(residuals(m3.1))
shapiro.test(residuals(m3.1))
residuals_fst1 <- kruskal.test(anov3.1$value~anov3.1$variable)

anov3.2 <- melt(data3[,18:34])
m3.2 <- aov(anov3.2$value~anov3.2$variable)
qqnorm(residuals(m3.2)); qqline(residuals(m3.2))
shapiro.test(residuals(m3.2))
residuals_fst2 <- kruskal.test(anov3.2$value~anov3.2$variable)


#Slope Fst
data4 <- read.table(A4, h=T)
anov4.1 <- melt(data4[,1:17])
m4.1 <- aov(anov4.1$value~anov4.1$variable)
qqnorm(residuals(m4.1)); qqline(residuals(m4.1))
shapiro.test(residuals(m4.1))
slope_fst1 <- kruskal.test(anov4.1$value~anov4.1$variable)

anov4.2 <- melt(data4[,18:34])
m4.2 <- aov(anov4.2$value~anov4.2$variable)
qqnorm(residuals(m4.2)); qqline(residuals(m4.2))
shapiro.test(residuals(m4.2))
slope_fst2 <- kruskal.test(anov4.2$value~anov4.2$variable)


#Correlation nbA
data5 <- read.table(A5, h=T)
anov5.1 <- melt(data5[,1:17])
m5.1 <- aov(anov5.1$value~anov5.1$variable)
qqnorm(residuals(m5.1)); qqline(residuals(m5.1))
shapiro.test(residuals(m5.1))
cor_nbA1 <- kruskal.test(anov5.1$value~anov5.1$variable)

anov5.2 <- melt(data5[,18:34])
m5.2 <- aov(anov5.2$value~anov5.2$variable)
qqnorm(residuals(m5.2)); qqline(residuals(m5.2))
shapiro.test(residuals(m5.2))
cor_nbA2 <- kruskal.test(anov5.2$value~anov5.2$variable)


#Mean nbA
data6 <- read.table(A6, h=T)
anov6.1 <- melt(data6[,1:17])
m6.1 <- aov(anov6.1$value~anov6.1$variable)
qqnorm(residuals(m6.1)); qqline(residuals(m6.1))
shapiro.test(residuals(m6.1))
mean_nbA1 <- kruskal.test(anov6.1$value~anov6.1$variable)

anov6.2 <- melt(data6[,18:34])
m6.2 <- aov(anov6.2$value~anov6.2$variable)
qqnorm(residuals(m6.2)); qqline(residuals(m6.2))
shapiro.test(residuals(m6.2))
mean_nbA2 <- kruskal.test(anov6.2$value~anov6.2$variable)

#Residuals nbA
data7 <- read.table(A7, h=T)
anov7.1 <- melt(data7[,1:17])
m7.1 <- aov(anov7.1$value~anov7.1$variable)
qqnorm(residuals(m7.1)); qqline(residuals(m7.1))
shapiro.test(residuals(m7.1))
residuals_nbA1 <- kruskal.test(anov7.1$value~anov7.1$variable)

anov7.2 <- melt(data7[,18:34])
m7.2 <- aov(anov7.2$value~anov7.2$variable)
qqnorm(residuals(m7.2)); qqline(residuals(m7.2))
shapiro.test(residuals(m7.2))
residuals_nbA2 <- kruskal.test(anov7.2$value~anov7.2$variable)


#Slope nbA with 4D
data8 <- read.table(A8, h=T)
anov8.1 <- melt(data8[,1:17])
m8.1 <- aov(anov8.1$value~anov8.1$variable)
qqnorm(residuals(m8.1)); qqline(residuals(m8.1))
shapiro.test(residuals(m8.1))
slope_nbA1 <- kruskal.test(anov8.1$value~anov8.1$variable)

anov8.2 <- melt(data8[,18:34])
m8.2 <- aov(anov8.2$value~anov8.2$variable)
qqnorm(residuals(m8.2)); qqline(residuals(m8.2))
shapiro.test(residuals(m8.2))
slope_nbA2 <- kruskal.test(anov8.2$value~anov8.2$variable)


#######################################################################################
cor_fst1$p.value <- kruskal.test(anov1.1$value~anov1.1$variable)
cor_fst2$p.value <- kruskal.test(anov1.2$value~anov1.2$variable)
mean_fst1$p.value <- kruskal.test(anov2.1$value~anov2.1$variable)
mean_fst2$p.value <- kruskal.test(anov2.2$value~anov2.2$variable)
residuals_fst1$p.value <- kruskal.test(anov3.1$value~anov3.1$variable)
residuals_fst2$p.value <- kruskal.test(anov3.2$value~anov3.2$variable)
slope_fst1$p.value <- kruskal.test(anov4.1$value~anov4.1$variable)
slope_fst2$p.value <- kruskal.test(anov4.2$value~anov4.2$variable)
cor_nbA1$p.value <- kruskal.test(anov5.1$value~anov5.1$variable)
cor_nbA2$p.value <- kruskal.test(anov5.2$value~anov5.2$variable)
mean_nbA1$p.value <- kruskal.test(anov6.1$value~anov6.1$variable)
mean_nbA2$p.value <- kruskal.test(anov6.2$value~anov6.2$variable)
residuals_nbA1$p.value <- kruskal.test(anov7.1$value~anov7.1$variable)
residuals_nbA2$p.value <- kruskal.test(anov7.2$value~anov7.2$variable)
slope_nbA1$p.value <- kruskal.test(anov8.1$value~anov8.1$variable)
slope_nbA2$p.value <- kruskal.test(anov8.2$value~anov8.2$variable)
