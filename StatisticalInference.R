
###Common Distributions
#What is the probability of getting more than 1160 ad clicks in a day, if the ad clicks are normally distributed.
#Mean Ad clicks = 1020, sd of ad clicks = 50
pnorm(1160, mean=1020, sd =50, lower.tail=FALSE);
#1160 is 2.8 standard deviations from the mean
pnorm(2.8, lower.tail=FALSE);

#What number of ad clicks would represent the one where 75% of the days have fewer ad clicks
#Mean Ad clicks = 1020, sd of ad clicks = 50
qnorm(.75, mean=1020, sd=50);

#Poisson approximation to binomial
#We flip a coin with success probability .01, 500 times. What is the probability of 2 or fewer successes
pbinom(2, size=500, prob=.01);
ppois(2, lambda=500*.01);
