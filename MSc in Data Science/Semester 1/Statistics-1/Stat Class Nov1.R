# histogram
# density
#fitting a probility distribution


# Data
set.seed(14012021)
data <- rnorm(200,mean = 4) ; data

#Kernal Density Estimation
d <- density(data) ; d
hist(data, freq = F)
par(new= T)

# hist(data, breaks = 30)
# hist(data, breaks = 300)
# hist(data, breaks = 1)
# hist(data, breaks = 1000)
lines(d , col = "red")
d1 <- density(data,bw =2.0)
lines(d1)
d2 <- density(data,bw =0.05)
lines(d2 , col="blue")


#
graphics.off()
x <- seq(-3,3,length.out = 512)
kern = dnorm(x)
kernel <- (1/sqrt(2*pi)) * exp(-x^2/2)
lines(x,kern)
plot()
