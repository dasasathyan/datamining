mtcars
ds=(mtcars)
ds
var(mtcars)
start=mtcars[3:7]
start
var(start)

startsd=mtcars[3]

max(start)
min(start)

#kurtosis
startsd=mtcars[3]
data <- data.matrix(mtcars[3])
data
a=mtcars[3]
typeof(data)
mean(data)

kurtosis = function(y){
  n <- length(data)
  n * sum((data-mean(data))^4)/(sum((data - mean(data))^2)^2)
  print(n)
}

kurtosis(data)

#quartiles
quantile(data)

#standard dev
sd(data)

#SKEWNESS
x<- data.matrix(mtcars[3:2])
skewness1 = function(x)
{
  n = length(x)
  v = var(x)
  m = mean(x)
  third.moment = (1/(n-2))*sum((x-m)^3)
  third.moment/(var(x)^(3/2))
}  
skewness1(x)
#QD qurtile deviation 
IQR(data)/2

################Plot - diagrams##################

#Boxplot
boxplot(start)

mtcars

#scatter plot
scatterplot(mpg ~ wt | cyl, data=mtcars,
            xlab="Weight of Car", ylab="Miles Per Gallon",
            main="Enhanced Scatter Plot",
            labels=row.names(mtcars)) 



