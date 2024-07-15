# Mantel test in R
setwd("F:\\Project\\MSc Project\\Identifying predominant mutations in Coronavirus and related families\\HCV")

library(vegan)
library(readxl)

prot_selc_press <- read_excel("pam_250_selc_press_wr.xlsx")
head(prot_selc_press)

control <- read_excel("pam_250_control_wr.xlsx")
head(control)

pam <- read_excel("pam_250_wr.xlsx")
head(pam)

dist1 <- dist(prot_selc_press, method = "euclidean")
head(dist1)

dist2 <- dist(control, method = "euclidean")
head(dist2)

dist3 <- dist(pam, method = "euclidean")
head(dist3)

comp1 <- mantel(dist1, dist3, method = "spearman", permutations = 9999, na.rm = TRUE)
comp1

comp2 <- mantel(dist2, dist3, method = "spearman", permutations = 9999, na.rm = TRUE)
comp2
