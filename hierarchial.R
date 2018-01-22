head(mtcars)
#---------Distance with numerical values----------------
numeric_frame<-data.frame(mtcars[,1:3])
?dist
dist(numeric_frame)
table(mtcars$cyl)
#---------Distance with ordinal values--------------------
ordinal_frame<-data.frame(mtcars[,1:3])
ordinal_frame1<-ordered(ordinal_frame$cyl,levels= c("4","6","8"))
View(ordinal_frame1)
library(cluster)
?daisy
daisy(as.data.frame(ordinal_frame1))
#---------Distance with nominal values---------------------------
nominal_frame<-data.frame(mtcars[,1:4])
nominal_frame1<-ordered(nominal_frame$cyl,levels= c("4","6","8"))
print(nominal_frame1)
library(cluster)
?daisy
daisy(as.data.frame(nominal_frame1))
#---------Distance with binary and mixed attributes -----------------
binary_frame<-data.frame(mtcars[,1:9])
binary_frame1<-ordered(binary_frame$am,levels=c("1","0"))
print(binary_frame1)
library(cluster)
?daisy
daisy(as.data.frame(binary_frame1))

#---------Hierarchical clustering with 3 different values for number -----------------

nominal_frame$cyl<-NULL
ds1<-dist(as.data.frame(nominal_frame1));

hc1<-hclust(ds1, method="single")
plot(hc1,labels=mtcars$cyl)

hc2<-hclust(ds1, method="complete")
plot(hc2,labels=mtcars$cyl)

hc3<-hclust(ds1, method="average")
plot(hc3,labels=mtcars$cyl)


#---------Hierarchical clustering with 3 different values for Mixed Attribute --------------

idx <- sample(1:dim(iris)[1], 40) 
irisSample <- iris[idx,] 
irisSample$Species <- NULL 
hc <- hclust(dist(irisSample), method="ave")

plot(hc, hang = -1, labels=iris$Species[idx]) 
# cut tree into 3 clusters 
rect.hclust(hc, k=3) 
groups <- cutree(hc, k=3)