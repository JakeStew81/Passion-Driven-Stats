setwd("C:/Users/jake/Dev/PassionDrivenStats")

library(readr)
library(descr)
library(Hmisc)
library(Dict)

responses <- read_tsv('responses.tsv', col_types=cols())

data <- responses[responses$'3' != 9, c('3', '68', '19')]

data <- na.omit(data)

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

data <- transform(data, timeWD =  as.numeric(ageCategoryToMedian[data$'3']) - as.numeric(data$'68'))

data$timeWD <- cut(data$timeWD,
                   c("-6", "2", "5.5", "9", "61"),
                   include.lowest = T,
                   right = F)

colnames(data) <- c("Age", "AgeOD", "FearCC", "TimeWD")

View(data)

freq(data$Age)
freq(data$TimeWD)
freq(data$FearCC)