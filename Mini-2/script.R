library(labelled)
library(expss)

setwd("C:/Users/jake/Dev/PassionDrivenStats/Mini-2")

originalData <- read.csv("HELP.csv")

data <- subset(originalData, substance == "cocaine" & age >= 40)

View(data)

sex <- data$female
d1 <- data$d1

var_lab(sex) <- "Sex"
var_lab(d1) <- "# of Hospitalizations"

val_lab(sex) <- make_labels(
  "0 Male
  1 Female"
)

table1 <- table(sex)
print(table1)

table2 <- table(d1)
print(table2)