setwd("C:/Users/jake/Dev/PassionDrivenStats/Mini-3")

library(descr)

data <- read.csv("HELP.csv")

data <- transform(data, ExtremeMCS =  ifelse(data$mcs < 20, 1, 0))

data <- transform(data, SuicidalThought =  ifelse(data$g1b == "yes", 1, 0))

data <- transform(data, HomelessStatus =  ifelse(data$homeless == "homeless", 1, 0))

data <- transform(data, RiskTotal =  data$ExtremeMCS + data$SuicidalThought + data$HomelessStatus)

freq(data$ExtremeMCS)
freq(data$SuicidalThought)
freq(data$RiskTotal)