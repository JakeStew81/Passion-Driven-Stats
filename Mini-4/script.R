setwd("C:/Users/jake/Dev/PassionDrivenStats/Mini-4")

#Libraries
library(descr)
library(ggplot2)

#Open Data
data <- read.csv("Utilities.csv")

# Season Variable
attach(data)
data$Season[month == 12 | month <= 2] <- "Winter"
data$Season[month >= 3 & month <= 5] <- "Spring"
data$Season[month >= 6 & month <= 8] <- "Summer"
data$Season[month >= 9 & month <= 11] <- "Fall"
detach(data)

# Donor Status
data <- transform(data, DonorStatus = ifelse(donate == "yes", 1, 0))

# Donation across seasons
ggplot(data, aes(Season, (..count..)/sum(..count..))) + geom_bar(aes(fill = as.factor(DonorStatus)), position = "dodge") +
  ylab("Percentage") + xlab("Season") + scale_y_continuous(labels=scales::percent) +
    ggtitle("Donation Status Across Seasons")

# I modified code instead of creating new ggplots, so there isn't code for the other plots