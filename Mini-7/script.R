setwd("C:/Users/jake/Dev/PassionDrivenStats/Mini-6")

# Libraries
library(dplyr)
library(ggplot2)

# Open Data
data <- read.csv("CPS.csv")

# Gender moderating experience and wage
by(data, data$sex, function(x)
  cor.test(x$wage, x$exper, method = "pearson"))

# Job sector & wages per hour
summary(aov(wage ~ sector, data = data))

# Moderating with race
by(data, data$race, function(x)
  list(aov(wage ~ sector, data = x), summary(aov(wage ~ sector, data = x))))