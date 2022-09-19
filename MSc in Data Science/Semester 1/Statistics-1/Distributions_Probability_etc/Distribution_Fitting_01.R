#Source: http://www-eio.upc.es/teaching/adtl/apunts/TrR_IDA-DF_1.html
########################################################################################
sample<- rweibull(5000, shape=1, scale = 2) + 10
summary(sample)
library(moments)
all.moments(sample,4,central=F)
all.moments(sample,4,central=T)
####################################################
dm=5000 #sample size
#install.packages("car")
library(car)
plot(sample[1:(dm-1)],sample[2:dm],main="Scattergram Sample at lag=1")
lines(lowess(sample[1:(dm-1)],sample[2:dm],f=0.5),col=2,lwd=2,lty=2)  # Overlap smoother
######################
scatterplot(sample[1:(dm-1)],sample[2:dm],main="Scattergram Sample at lag=1")
####################################################
#install.packages("lmtest")
library(lmtest)
dwtest(sample~1)  # OK for residuals in library car and lmtest
## Also ?durbinWatsonTest  # in library car
acf(sample)
########################################################################################
# 2.1 Histogram: Equal length intervals
# Non suitable for distribution fitting Chi-squared Test
hist(sample,freq=F,breaks=100,main="Take a look to data...")
m=mean(sample);std=sd(sample);m;std
lines(density(sample),col="blue")
##################################
#ussample<-sample-min(sample)+epsilon
ussample<-sample-10
hist(ussample,freq=F,breaks=100,main="Take a look to data...")
m=mean(ussample);std=sd(ussample);m;std
###########
curve(dnorm(x,m,std),col="red",lwd=2,add=T)
curve(dexp(x,rate=1/m),col="green",lwd=2,add=T)
#############
all.moments(ussample,4,central=F)
all.moments(ussample,4,central=T)
########################################################################################
# 3 List of Candidate distributions
# 3.1 Plot pdf’s for variable location = 0, scala =1 for several shape parameter values
par( mfrow = c( 3,2 ) )
#######################
m.shape1 <-  rgamma(5000, shape=1, scale = 1)
mean( m.shape1);sd( m.shape1);var( m.shape1)

hist( m.shape1, freq=F )
x<-seq(0,max(m.shape1),100)
curve(dgamma(x,shape=1,scale=1),col=2,add=T)

#######################
m.shape0.5 <-  rgamma(5000, shape=0.5, scale = 1)
mean( m.shape0.5);var( m.shape0.5)^0.5;var( m.shape0.5)

hist( m.shape0.5, freq=F )
x<-seq(0,max(m.shape0.5),100)
curve(dgamma(x,shape=0.5,scale=1),col=2,add=T)
#######################
m.shape2<-  rgamma(5000, shape=2, scale = 1)
mean( m.shape2);var( m.shape2)^0.5;var( m.shape2)

hist( m.shape2, freq=F )
x<-seq(0,max(m.shape2),100)
curve(dgamma(x,shape=2,scale=1),col=2,add=T)
#######################
m.shape3<-  rgamma(5000, shape=3, scale = 1)
mean( m.shape3);var( m.shape3)^0.5;var( m.shape3)

hist( m.shape3, freq=F )
x<-seq(0,max(m.shape3),100)
curve(dgamma(x,shape=3,scale=1),col=2,add=T)
#######################
m.shape5<-  rgamma(5000, shape=5, scale = 1)
mean( m.shape5);var( m.shape5)^0.5;var( m.shape5)

hist( m.shape5, freq=F )
x<-seq(0,max(m.shape5),100)
curve(dgamma(x,shape=5,scale=1),col=2,add=T)
#######################
m.shape10 <-  rgamma(5000, shape=10, scale = 1)
mean( m.shape10);var( m.shape10)^0.5;var( m.shape10)

hist( m.shape10, freq=F )
x<-seq(0,max(m.shape10),100)
curve(dgamma(x,shape=10,scale=1),col=2,add=T)
########################################################################################
# 3.2 Method descdist() in fitdistplus package
#install.packages("fitdistrplus")
library(fitdistrplus)
## Loading required package: MASS
par( mfrow = c( 1,1 ) )
descdist(ussample)
########################################################################################
# 4 Fit distribution
# To fit: use fitdistr() method in MASS package. 
# Pay attention to supported distributions and how to refer to them 
# (the name given by the method) and parameter names and meaning.

# For discrete data use goodfit() method in vcd package: estimates and 
# goodness of fit provided together
library(MASS)

res<-fitdistr(ussample,"weibull",lower=0.001)
res$estimate

# ?fitdistr   Check it

#install.packages("vcd")
library(vcd) # For discrete data

# gf <- goodfit(d27x, type = "binomial", par = list(prob = 0.8, size = 7))
# summary(gf)
# plot(gf)

#Method fitdist() in fitdistplus package
fitg<-fitdist(ussample,"gamma")#??????????????????????????????????
fitw<-fitdist(ussample,"weibull")#?????????????????????????????????????
########################################################################################
# 5 Goodness of Fit
# 5.1 Histogram: Variable length intervals

#    Histogram with breaks defined using quartiles of theoretical candidate distributions.
#    Non Equal length intervals defined by empirical quartiles are more suitable for 
#    distribution fitting Chi-squared Test, since degrees of freedoms for Chi-squared 
#    Tests are guaranteed.

sequence<-seq(0,1,by=0.02)
qualist<-quantile(ussample,sequence)
sequence;qualist

##########################
hist(ussample,freq=F,breaks=qualist,main="Take a look to data...")
m=mean(ussample);std=sd(ussample);m;std

curve(dnorm(x,m,std),col="red",lwd=2,add=T)
curve(dexp(x,rate=1/m),col="green",lwd=2,add=T)
lines(density(sample),col="blue")
lines(density(ussample),col="cyan")
########################################################
#library(fitdistrplus)
# descdist(ussample)
fitg<-fitdist(ussample,"gamma")
fitw<-fitdist(ussample,"weibull")

summary(fitg)
summary(fitw)

plot(fitg)

plot(fitg, demp = TRUE)
##########
cdfcomp(list(fitg,fitw), legendtext=c("Gamma","Weibull"))

denscomp(list(fitg,fitw), legendtext=c("Gamma","Weibull"))

ppcomp(list(fitg,fitw), legendtext=c("Gamma","Weibull"))

qqcomp(list(fitg,fitw), legendtext=c("Gamma","Weibull"))

gofstat(list(fitg,fitw), fitnames=c("Gamma","Weibull"))
########################################################################################
# 5.2 Validate matching between empirical moments and theoretical moments

# For each candidate distributions calculate up to degree 4 theoretical 
# moments and check central and absolute empirical moments.Previously, 
# you have to estimate parameters and calculate theoretical moments, 
# using estimated parameters. Good matching should exists for any of 
# the candidate distributions between theoretical and empirical moments.

#Dues???????????????

########################################################################################
# 5.3 Goodness of Fit: Graphical Assessment
# 5.3.1 Known shape

xx <- qweibull( ppoints( sample ) , shape=1)
yy<- sort( sample )
mm <- lm( yy ~ xx )
plot(xx,yy,main="QQPlot")
abline(mm,col="red", lwd=2, lty=2)

cors<-cor(yy,xx);cors
############################################################################
# 5.3.2 UNKnown shape
# Use standarized distributions - Identifies shape giving the best fit 
# (alternative to ML estimation). As a subproduct location and scale 
# parameters are also estimated, so you do not need to unshift your data.

rang <- seq(0.5,2,length=50)
cors<-rep(0,50)

for (i in 1:50)
{
  xx <- qweibull( ppoints( sample ) , shape=rang[ i ] )
  yy<- sort( sample )
  mm <- lm( yy ~ xx )
  cors[ i ]<-cor(yy,xx);cors
}
plot(rang,cors)

# Goodness of Fit: Histogram needs estimates for parameters
sequence<-seq(0,1,by=0.02)
qualist<-qweibull(shape=res$estimate[1],scale=res$estimate[2],sequence)
sequence;qualist

qualist[51]<-max(ussample)

hist(ussample,freq=F,breaks=qualist,main="Take a look to data...")
m=mean(ussample);std=sd(ussample);m;std

curve(dnorm(x,m,std),col="red",lwd=2,add=T)
curve(dexp(x,rate=1/m),col="green",lwd=2,add=T)
lines(density(sample),col="blue")
lines(density(ussample),col="cyan")
######################################################################################
# 5.4 Goodness of Fit: Tests
# 5.4.1 Kolmogorov-Smirnoff Test for continuous data
# Beware of using the proper names in R for distribution parameters

#ks.test(ussample,"pweibull")  # Doesn't work
ks.test(ussample,"pweibull", scale=res$estimate[2], shape=res$estimate[1] )  

# 5.4.2 Cramer von Miess Test for discrete data
# For discrete data (discrete version of KS Test). library(dgof) includes cvm.test() Cramer von Miess test, discrete version of KS Test.
### DUES ?????????????

# 5.4.3 Chi Squared Test
# Chi Squared Test - It requires manual programming using non-constant length 
# intervals (defined by quartiles). Valid for discrete or continuous data.

sequence<-seq(0,1,by=0.02)
qualist<-qweibull(shape=res$estimate[1],scale=res$estimate[2],sequence)
sequence;qualist

qualist[51]<-max(ussample)
dsample<-cut(ussample,breaks=qualist)
iobs<-as.vector(table(dsample))  # Obs in the groups defined by nb intervals-percentiles
pexp<-as.vector(rep(1/50,50))    # Expected probability for each groups: sample size/nb intervals
iexp<-length(ussample)*pexp
iobs;pexp;iexp

X2<-sum(((iobs-iexp)^2)/iexp);X2

#chisq.test( sample, "pweibull", shape= 2, scale=1 )   #Doesn't work
chisq.test( iobs,p=pexp ) # Works



