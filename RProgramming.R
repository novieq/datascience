x<-matrix(rnorm(200),20,10);
#Calculate the mean of all the columns - dim = 2 - columns - margin
apply(x,2,mean);
#Calculate the sum of all the rows - dim = 1 - rows
apply(x,1,sum);

#Sums and means for matrix dimensions - much faster than apply
rowSums(x);
rowMeans(x);
colSums(x);
colMeans(x);

### lapply - loop over a list and evaluate a function on each element and always return a list
x <- list(a = 1:5, b = rnorm(10));
lapply(x, mean);

x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2)) ;
lapply(x, function(elt) elt[,1]);

###tapply
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
#Take group means
tapply(x,f,mean);
#Take group range
tapply(x,f,range)


#Splitting a data frame
library(datasets);
s <- split(airquality, airquality$Month);
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]));

library(datasets);
data(iris);
tapply(iris$Sepal.Length,iris$Species,mean)
mean(iris$Sepal.Length)
#a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'
apply(iris[, 1:4], 2, mean)
data(mtcars)
mtcars
# average miles per gallon (mpg) by number of cylinders in the car (cyl)?
tapply(mtcars$mpg, mtcars$cyl, mean)
tapply(mtcars$hp, mtcars$cyl, mean)

str(mtcars)
summary(mtcars)

#Profiling in R
system.time(readLines("http://www.jhsph.edu"))
