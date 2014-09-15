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
