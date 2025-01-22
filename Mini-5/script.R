setwd("C:/Users/jake/Dev/PassionDrivenStats/Mini-5")

#Libraries
library(descr)
library(ggplot2)
library(agricolae)

#Open Data
data <- read.csv("Utilities.csv")

# Season Variable
attach(data)
data$Season[month == 12 | month <= 2] <- "Winter"
data$Season[month >= 3 & month <= 5] <- "Spring"
data$Season[month >= 6 & month <= 8] <- "Summer"
data$Season[month >= 9 & month <= 11] <- "Fall"
detach(data)

# Test
model <- aov(totalbill ~ Season, data = data)

summary(model)
duncan.test(model, "Season", alpha = 0.05, console = TRUE)