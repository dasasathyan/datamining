#View(readingSkills)
library(party)
data <- read.csv("~/Downloads/weather.csv")
#View(data)
data$outlook<-as.factor(data$outlook)
data$temperature<-as.factor(data$temperature)
data$windy<-as.factor(data$windy)
data$humidity<-as.factor(data$humidity)
data$play<-as.factor(data$play)
input.dat <- data[c(1:13),]
#View(input.dat)

png(file = "decision_tree_weather.png")

output.tree <- ctree(play ~ temperature + humidity + windy + outlook, data = input.dat,)

plot(output.tree)
dev.off()
