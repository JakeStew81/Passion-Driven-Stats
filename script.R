setwd("C:/Users/jake/Dev/PassionDrivenStats")

library(readr)
library(descr)
library(Hmisc)
library(plyr)
library(ggplot2)
library(RVAideMemoire)
library(rcompanion)

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

# Bin & Name timeWD
data$TimeWD <- cut(data$TimeWD,
                   c("-6", "2", "5.5", "9", "61"),
                   include.lowest = T,
                   right = F)

data$TimeWD <- revalue(data$TimeWD, c("[-6,2)" = "[0, 1.5)", "[2,5.5)" = "[2, 5)", "[5.5,9)" = "[5.5, 8.5)", "[9,61]" = "[9, 61]"))

# Rename age bins for reading ease
data$Age <- as.factor(data$Age)

data$Age <- revalue(data$Age, c("4" = "19-25", "5" = "26-35", "6" = "36-45", "7" = "46-55", "8" = "56-65"))

# Collapse FearCC into binary options
data <- transform(data, HighCCFear = as.factor(ifelse(FearCC > 3, "Fears CC", "Does not fear CC")))

# Create contingency table
contingencyTable <- table(data$TimeWD, data$HighCCFear)

print(contingencyTable)

# Run chi square test
chiSquareTest <- chisq.test(contingencyTable)

print(chiSquareTest)

# Run post hoc chi square (pairwise)
pairwise <- pairwiseNominalIndependence(contingencyTable, fisher=FALSE, gtest=FALSE, chisq=TRUE, cramer=FALSE)

print(pairwise)

cldList(comparison = pairwise$Comparison,
        p.value    = pairwise$p.adj.Chisq,
        threshold  = 0.05)

by(data, data$Age, function(x)
  list(chisq.test(table(x$TimeWD, x$HighCCFear)),
       pairwise <- pairwiseNominalIndependence(table(x$TimeWD, x$HighCCFear),
                                               fisher=FALSE, gtest=FALSE, chisq=TRUE, cramer=FALSE),
       cldList(comparison = pairwise$Comparison,
               p.value    = pairwise$p.adj.Chisq,
               threshold  = 0.05)))