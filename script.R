setwd("C:/Users/jake/Dev/PassionDrivenStats")

library(readr)
library(descr)
library(Hmisc)

responses <- read_tsv('responses.tsv', col_types=cols())

print(which(grepl("2009", responses$`68`)))

data <- subset(responses, grepl("", responses$`68`))

data <- data[c('3', '68', '19')]

View(data)