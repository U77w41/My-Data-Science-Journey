# setwd("/SUDIPTA RKMV University/Time Series/CodeClass")
#########################################################################
# Simple Random Process
#########################################################################
# -----------------------------------------------------------------------
# Bernoulli iid
# -----------------------------------------------------------------------
b = (2*rbinom(500,1,0.5)-1)
par(mfrow=c(2,1))
plot.ts(b, main="binary process")                   # stationary
s = cumsum(b)
plot.ts(s, main="simple random walk")               # non-sationary
# -----------------------------------------------------------------------
# White Noise
# -----------------------------------------------------------------------
w = rnorm(500,0,1)
par(mfrow=c(2,1))
plot.ts(w, main="white noise")                      # stationary
# Random Walk
r = cumsum(w)
plot.ts(r, main="random walk")                      # non-stationary
#########################################################################
# Checking hypothesis of iid processes (randomness)
#########################################################################
# -----------------------------------------------------------------------
# White Noise
# -----------------------------------------------------------------------
t=seq(1:200)
xt = rnorm(200,0,.5)                        # White noise
par(mfrow=c(3,1))
plot(t/10,xt, main="WhiteNoise")         
# check ACF
acf(xt,lag.max = 40)      
# all ACF together (sum of stzd normal i.e., chi-suare)
Box.test(xt, lag = 40, type = "Ljung-Box", fitdf = 0)  
library(randtests)
# [y(i-1)<y(i)>y(i+1) or y(i-1)>y(i)<y(i+1)] testing of iid hypothesis
turning.point.test(xt)       
# # [y(i)<y(i+1)] testing of no trend hypothesis
# difference.sign.test(xt)                              
# # [y(i)<y(j)] testing of no trend hypothesis
# rank.test(xt)   
# qq plot testing for normality
qqnorm(xt)
# shapiro R-square (checking of normality)
shapiro.test(xt)
# # checking of normality
# ks.test(xt, "pnorm")                                  
#########################################################################
#########################################################################
# Checking hypothesis of iid processes (randomness)
#########################################################################
# -----------------------------------------------------------------------
# Signal plus Noise
# -----------------------------------------------------------------------
t=seq(1:200)
xt = t/10+cos(t/10*pi/180)+rnorm(200,0,.5)                        # Mixing signal and noise
par(mfrow=c(3,1))
plot(t/10,xt, main="Signal plus Noise")         
# check ACF 
acf(xt,lag.max = 40)      
# all ACF together (sum of stzd normal i.e., chi-suare)
Box.test(xt, lag = 40, type = "Ljung-Box", fitdf = 0)  
library(randtests)
# [y(i-1)<y(i)>y(i+1) or y(i-1)>y(i)<y(i+1)] testing of iid ness
turning.point.test(xt)       
# # [y(i)<y(i+1)] testing of iid ness
# difference.sign.test(xt)                              
# # [y(i)<y(j)] testing of iid nes
# rank.test(xt)   
# qq plot
qqnorm(xt)
# shapiro R-square (checking of normality)
shapiro.test(xt)
# # checking of normality
# ks.test(xt, "pnorm")                                  
#########################################################################