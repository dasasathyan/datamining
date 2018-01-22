data <- read.csv("~/Downloads/Wholesale customers data.csv", header = T)
summary(data)
k <- kmeans(data[, -c(1, 2)], centers = 5)
k$centers
table(k$cluster)
k$withinss
k$centers
k$betweenss
k$tot.withinss
plot(data[c("Milk", "Fresh")], col = k$cluster)
plot(data[c("Milk", "Fresh", "Grocery", "Region")], col = k$cluster)