setwd("C:/Users/jake/Dev/PassionDrivenStats/Mini-6")

# Libraries
library(dplyr)
library(ggplot2)

# Open Data
data <- read.csv("CPS.csv")

# ANOVA
summary(aov(wage ~ sex, data = data))

# Scatter plot
ggplot(data, aes(x=exper, y=wage)) +
  geom_point()

# Make table
table <- table(data$sector, data$satisfaction)

# Chi square
print(chisq.test(table))