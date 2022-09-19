rm(list = ls())
graphics.off()
###########################################################################
############################################
#PART-00: Data
m <- matrix(scan("data_for_distr_fitting_8.txt",skip=0),ncol=1,byrow=T)
usesample <- m[,1]
############################################
# PART-01: Take a look at data
summary(usesample)
par(new=T)
dev.new() #### FIGURE 01
#par( mfrow = c( 1,1 ) )
hist(usesample,breaks = 100)

dev.new()
m=mean(usesample);std=sd(usesample)
hist(usesample,breaks = 100,freq = FALSE)
curve(dnorm(x,m,std),col="red",lwd=2,add=T)
curve(dexp(x,rate=1/m),col="green",lwd=2,add=T)
#curve(dgamma(x,shape=1,scale=2),col='blue',add=T)
#curve(dweibull(x,shape=1,scale=2),col='black',add=T)
############################################
# PART-02: Cullen and Frey graph




############################################
# PART-03: Now fit the candidate distributions to obtain parameters
#OPTION 1:
library(MASS)
res<-fitdistr(usesample,"weibull",lower=0.001)
res$estimate
?fitdistr()
#"beta", "cauchy", "chi-squared", "exponential", "gamma", 
#"geometric", "log-normal", "lognormal", 
#"logistic", "negative binomial", "normal", 
#"Poisson", "t" and "weibull"
dev.new()
hist(usesample,breaks = 100,freq = FALSE)
est_shape <- res$estimate[["shape"]]
est_scale <- res$estimate[["scale"]]
curve(dweibull(x,shape=est_shape,scale=est_scale),col='red',add=T)
####
res1 <-fitdistr(usesample,"exponential",lower=0.001)
est_rate <- res1$estimate[["rate"]]
curve(dexp(x,rate=est_rate),col='blue',add=T)

####
res2 <- fitdistr(usesample,"gamma",lower=0.001)

### AND SO ON...

#####################################
# #OPTION 2:
# library(vcd) # For discrete data
# gf <- goodfit(usesample, type = "binomial", par = list(prob = 0.8, size = 7))
# summary(gf)
# dev.new()
# plot(gf)
#####################################
# #OPTION 3:
#install.packages('fitdistrplus')
library(fitdistrplus)
fitg<-fitdist(usesample,"gamma")
fitw<-fitdist(usesample,"weibull")
?fitdist()

summary(fitg)
summary(fitw)

dev.off()
plot(fitg)

dev.off()
plot(fitg, demp = TRUE)

dev.new()
cdfcomp(list(fitg,fitw), legendtext=c("Gamma","Weibull"))

dev.new()
denscomp(list(fitg,fitw), legendtext=c("Gamma","Weibull"))

ppcomp(list(fitg,fitw), legendtext=c("Gamma","Weibull"))


qqcomp(list(fitg,fitw), legendtext=c("Gamma","Weibull"))


##################################################################
#PART-04: Goodness of Fit
gofstat(list(fitg,fitw), fitnames=c("Gamma","Weibull"))
?gofstat()

#######
#Kolmogorov-Smirnoff Test for continuous data

#ks.test(ussample,"pweibull")  # Doesn't work
ks.test(usesample,"pweibull", scale=res$estimate[2], shape=res$estimate[1] )  

# New

ks.test(usesample,"pexp",)




