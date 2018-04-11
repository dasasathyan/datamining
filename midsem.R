data<-read.csv("~/project/datamining/R programs/height.csv")
View(data)
library(arules)

#Distance-Matrix
as.matrix(dist(data[1]))
dis1<-discretize(data[,1], method="interval", categories = 1, labels = NULL,ordered=FALSE, onlycuts=FALSE)
as.matrix(dis1)


as.matrix(dist(dis1, method = "euclidean", diag = FALSE, upper = FALSE, p = 2))

#Data-Discretization
dis1<-discretize(data[,1], method="interval", categories = 4, labels = NULL,ordered=FALSE, onlycuts=FALSE)
dis2<-discretize(data[,2], method="interval", categories = 4, labels = NULL,ordered=FALSE, onlycuts=FALSE)
dis3<-discretize(data[,3], method="interval", categories = 4, labels = NULL,ordered=FALSE, onlycuts=FALSE)
dis4<-discretize(data[,4], method="interval", categories = 4, labels = NULL,ordered=FALSE, onlycuts=FALSE)
View(dis1)
View(dis2)
View(dis3)
View(dis4)



