
###Common Distributions
#What is the probability of getting more than 1160 ad clicks in a day, if the ad clicks are normally distributed.
#Mean Ad clicks = 1020, sd of ad clicks = 50
pnorm(1160, mean=1020, sd =50, lower.tail=FALSE);
#1160 is 2.8 standard deviations from the mean
pnorm(2.8, lower.tail=FALSE); #distribution function

#What number of ad clicks would represent the one where 75% of the days have fewer ad clicks
#Mean Ad clicks = 1020, sd of ad clicks = 50
qnorm(.75, mean=1020, sd=50); #quantile function

#Poisson approximation to binomial
#We flip a coin with success probability .01, 500 times. What is the probability of 2 or fewer successes
pbinom(2, size=500, prob=.01);
ppois(2, lambda=500*.01);

#random generation of the normal distribution - n observations
rnorm(4);

###Law of large numbers
#The law of large numbers states that if X1,..,Xn are iid from a population with mean mu and variance signma square,
# then Xn bar converges to mu 
n<-10000;
means<-cumsum(rnorm(n))/(1:n);
plot(1:n, means);

#Law of large numbers - coin flip
n<-1000;
#sample takes a sample of the specified size from the elements of x using either with or without replacement.
means <- cumsum(sample(0:1,n,replace=TRUE))/(1:n);
plot(1:n,means);

#Confidence interval
library("UsingR");
data(father.son);
x<-father.son$sheight;
(mean(x)+c(-1,1)*qnorm(.95)*sd(x)/sqrt(length(x)));
