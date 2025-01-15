pesetwd("C:/Users/jake/Dev/PassionDrivenStats/Mini-3")

library(descr)
library(ggplot2)

data <- read.csv("HELP.csv")

data <- transform(data, ExtremeMCS =  ifelse(data$mcs < 20, 1, 0))

data <- transform(data, SuicidalThought =  ifelse(data$g1b == "yes", 1, 0))

data <- transform(data, HomelessStatus =  ifelse(data$homeless == "homeless", 1, 0))

data <- transform(data, RiskTotal =  data$ExtremeMCS + data$SuicidalThought + data$HomelessStatus)

ggplot(data, aes(x = ExtremeMCS)) + geom_bar(stat = "count") + ggtitle("Extreme MCS Frequency")