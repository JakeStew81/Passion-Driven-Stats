setwd("~/Dev/PassionDrivenStats")

library(readr)
library(descr)
library(Hmisc)

responses = read_tsv('responses.tsv', col_types=cols())

Veiw(responses)

label(responses$"3")<-"Age"

freq(responses$"3")