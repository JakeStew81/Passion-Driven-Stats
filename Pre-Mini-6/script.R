setwd("C:/Users/jake/Dev/PassionDrivenStats/Pre-Mini-6")

#Libraries
library(dplyr)

# Open Data
data <- read.csv("CPS.csv")

# Make contingency table
table <- table(data$married, data$union)

print(table)

# Do chi square test and print results
print(chisq.test(table))