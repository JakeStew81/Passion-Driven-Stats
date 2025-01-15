setwd("C:/Users/jake/Dev/PassionDrivenStats")

library(readr)
library(descr)
library(Hmisc)
library(plyr)

# Load data-
responses <- read_tsv('responses.tsv', col_types=cols())

# Subset, both reducing columns and getting rid of bad data from the 9th age group (error on survey)
data <- responses[responses$'3' != 9, c('3', '68', '19')]

# Clean out NAs
data <- na.omit(data)

# Store the medians of the age categories for conversion into quantatative
ageCategoryToMedian <- c(
  3.5,
  10,
  15.5,
  22,
  30.5,
  40.5,
  50.5,
  60.5
)

# Make secondary timeWD variable
data <- transform(data, timeWD =  as.numeric(ageCategoryToMedian[data$'3']) - as.numeric(data$'68'))

# Rename columns
colnames(data) <- c("Age", "AgeOD", "FearCC", "TimeWD")

# Bin timeWD
data$TimeWD <- cut(data$TimeWD,
                   c("-6", "2", "5.5", "9", "61"),
                   include.lowest = T,
                   right = F)

# Rename age bins for reading ease
data$Age <- as.factor(data$Age)

data$Age <- revalue(data$Age, c("4" = "19-25", "5" = "26-35", "6" = "36-45", "7" = "46-55", "8" = "56-65"))

# Output both tables and histograms
freq(data$Age)
freq(data$TimeWD)
freq(data$FearCC)