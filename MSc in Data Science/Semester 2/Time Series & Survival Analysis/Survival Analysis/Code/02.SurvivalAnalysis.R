#=========================================================================
# Parametric Survival Models
#-------------------------------------------------------------------------
# Gamma Distribution
par(mfrow=c(1,3))
plot(seq(0,10,.1),dgamma(seq(0,10,.1), shape=.5, scale=1),type='l',col=2,xlab = "Time", 
     ylab='f(t)',ylim = c(0,2));
lines(seq(0,10,.1),dgamma(seq(0,10,.1), shape=1, scale=1),col=3)
lines(seq(0,10,.1),dgamma(seq(0,10,.1), shape=2, scale=1),col=4)
legend('topright',c("Shape=0.5","Shape=1.0","Shape=2.0"),lty=c(1,1,1),col=c(2,3,4))
title(sub='Gamma Probability Density Function')
plot(seq(0,10,.1),pgamma(seq(0,10,.1), shape=.5, scale=1,lower.tail = FALSE),type='l',col=2,xlab = "Time", 
     ylab='S(t)',ylim = c(0,1.25));
lines(seq(0,10,.1),pgamma(seq(0,10,.1), shape=1, scale=1,lower.tail = FALSE),col=3)
lines(seq(0,10,.1),pgamma(seq(0,10,.1), shape=2, scale=1,lower.tail = FALSE),col=4)
legend('topright',c("Shape=0.5","Shape=1.0","Shape=2.0"),lty=c(1,1,1),col=c(2,3,4))
title(main='Figure 2A',sub='Gamma Survival Function')
plot(seq(0,10,.1),dgamma(seq(0,10,.1), shape=.5, scale=1)/pgamma(seq(0,10,.1), shape=.5, scale=1,lower.tail = FALSE),type='l',col=2,xlab = "Time", 
     ylab='h(t)',ylim = c(0,3));
lines(seq(0,10,.1),dgamma(seq(0,10,.1), shape=1, scale=1)/pgamma(seq(0,10,.1), shape=1, scale=1,lower.tail = FALSE),col=3)
lines(seq(0,10,.1),dgamma(seq(0,10,.1), shape=2, scale=1)/pgamma(seq(0,10,.1), shape=2, scale=1,lower.tail = FALSE),col=4)
legend('topright',c("Shape=0.5","Shape=1.0","Shape=2.0"),lty=c(1,1,1),col=c(2,3,4))
title(sub='Gamma Hazard Function')
#-------------------------------------------------------------------------
# Weibull Distribution
par(mfrow=c(1,3))
plot(seq(0,10,.1),dweibull(seq(0,10,.1), shape=.5, scale=1),type='l',col=2,xlab = "Time", 
     ylab='f(t)',ylim = c(0,1.5));
lines(seq(0,10,.1),dweibull(seq(0,10,.1), shape=1, scale=1),col=3)
lines(seq(0,10,.1),dweibull(seq(0,10,.1), shape=2, scale=1),col=4)
legend('topright',c("Shape=0.5","Shape=1.0","Shape=2.0"),lty=c(1,1,1),col=c(2,3,4))
title(sub='Weibull Probability Density Function')
plot(seq(0,10,.1),pweibull(seq(0,10,.1), shape=.5, scale=1,lower.tail = FALSE),type='l',col=2,xlab = "Time", 
     ylab='S(t)',ylim = c(0,1.25));
lines(seq(0,10,.1),pweibull(seq(0,10,.1), shape=1, scale=1,lower.tail = FALSE),col=3)
lines(seq(0,10,.1),pweibull(seq(0,10,.1), shape=2, scale=1,lower.tail = FALSE),col=4)
legend('topright',c("Shape=0.5","Shape=1.0","Shape=2.0"),lty=c(1,1,1),col=c(2,3,4))
title(main='Figure 2B',sub='Weibull Survival Function')
plot(seq(0,10,.1),dweibull(seq(0,10,.1), shape=.5, scale=1)/pweibull(seq(0,10,.1), shape=.5, scale=1,lower.tail = FALSE),type='l',col=2,xlab = "Time", 
     ylab='h(t)',ylim = c(0,5));
lines(seq(0,10,.1),dweibull(seq(0,10,.1), shape=1, scale=1)/pweibull(seq(0,10,.1), shape=1, scale=1,lower.tail = FALSE),col=3)
lines(seq(0,10,.1),dweibull(seq(0,10,.1), shape=2, scale=1)/pweibull(seq(0,10,.1), shape=2, scale=1,lower.tail = FALSE),col=4)
legend('topright',c("Shape=0.5","Shape=1.0","Shape=2.0"),lty=c(1,1,1),col=c(2,3,4))
title(sub='Weibull Hazard Function')
#-------------------------------------------------------------------------
# LogNormal Distribution
par(mfrow=c(1,3))
plot(seq(0,10,.1),dlnorm(seq(0,10,.1), meanlog = -1, sdlog = 1),type='l',col=2,xlab = "Time", 
     ylab='f(t)',ylim = c(0,2.2))
lines(seq(0,10,.1),dlnorm(seq(0,10,.1), meanlog = 0, sdlog = .5),col=3)
lines(seq(0,10,.1),dlnorm(seq(0,10,.1), meanlog = 0, sdlog = 1),col=4)
lines(seq(0,10,.1),dlnorm(seq(0,10,.1), meanlog = 0, sdlog = 2),col=5)
lines(seq(0,10,.1),dlnorm(seq(0,10,.1), meanlog = 1, sdlog = 1),col=6)
legend('topright',c("m=-1,sd=1","m=0,sd=0.5","m=0,sd=1.0","m=0,sd=2.0","m=+1,sd=1"),lty=c(1,1,1,1,1),col=c(2,3,4,5,6))
title(sub='LogNormal Probability Density Function')
plot(seq(0,10,.1),plnorm(seq(0,10,.1), meanlog = -1, sdlog = 1,lower.tail = FALSE),type='l',col=2,xlab = "Time", 
     ylab='S(t)',ylim = c(0,1.25));
lines(seq(0,10,.1),plnorm(seq(0,10,.1), meanlog = 0, sdlog = .5,lower.tail = FALSE),col=3)
lines(seq(0,10,.1),plnorm(seq(0,10,.1), meanlog = 0, sdlog = 1,lower.tail = FALSE),col=4)
lines(seq(0,10,.1),plnorm(seq(0,10,.1), meanlog = 0, sdlog = 2,lower.tail = FALSE),col=5)
lines(seq(0,10,.1),plnorm(seq(0,10,.1), meanlog = 1, sdlog = 1,lower.tail = FALSE),col=6)
legend('topright',c("m=-1,sd=1","m=0,sd=0.5","m=0,sd=1.0","m=0,sd=2.0","m=+1,sd=1"),lty=c(1,1,1,1,1),col=c(2,3,4,5,6))
title(main='Figure 2C',sub='LogNormal Survival Function')
plot(seq(0,10,.1),dlnorm(seq(0,10,.1), meanlog = -1, sdlog = 1)/plnorm(seq(0,10,.1), meanlog = -1, sdlog = 1,lower.tail = FALSE),type='l',col=2,xlab = "Time", 
     ylab='h(t)',ylim = c(0,3));
lines(seq(0,10,.1),dlnorm(seq(0,10,.1), meanlog = 0, sdlog = .5)/plnorm(seq(0,10,.1), meanlog = 0, sdlog = .5,lower.tail = FALSE),col=3)
lines(seq(0,10,.1),dlnorm(seq(0,10,.1), meanlog = 0, sdlog = 1)/plnorm(seq(0,10,.1), meanlog = 0, sdlog = 1,lower.tail = FALSE),col=4)
lines(seq(0,10,.1),dlnorm(seq(0,10,.1), meanlog = 0, sdlog = 2)/plnorm(seq(0,10,.1), meanlog = 0, sdlog = 2,lower.tail = FALSE),col=5)
lines(seq(0,10,.1),dlnorm(seq(0,10,.1), meanlog = 1, sdlog = 1)/plnorm(seq(0,10,.1), meanlog = 1, sdlog = 1,lower.tail = FALSE),col=6)
legend('topright',c("m=-1,sd=1","m=0,sd=0.5","m=0,sd=1.0","m=0,sd=2.0","m=+1,sd=1"),lty=c(1,1,1,1,1),col=c(2,3,4,5,6))
title(sub='LogNormal Hazard Function')
#-------------------------------------------------------------------------
# Log logistic Distribution
library(actuar)
par(mfrow=c(1,3))
plot(seq(0,10,.1),dllogis(seq(0,10,.1),scale = 1,shape = 0.5),type='l',col=2,xlab = "Time", 
     ylab='f(t)',ylim = c(0,2.2))
lines(seq(0,10,.1),dllogis(seq(0,10,.1),scale = 1,shape = 1),col=3)
lines(seq(0,10,.1),dllogis(seq(0,10,.1),scale = 1,shape = 2),col=4)
legend('topright',c("Shape=0.5","Shape=1.0","Shape=2.0"),lty=c(1,1,1),col=c(2,3,4))
title(sub='Log-logistic Probability Density Function')
plot(seq(.0,10,.1),pllogis(seq(0,10,.1),scale = 1,shape = 0.5,lower.tail = FALSE),type='l',col=2,xlab = "Time", 
     ylab='S(t)',ylim = c(0,1.25));
lines(seq(0,10,.1),pllogis(seq(0,10,.1),scale = 1,shape = 1,lower.tail = FALSE),col=3)
lines(seq(0,10,.1),pllogis(seq(0,10,.1),scale = 1,shape = 2,lower.tail = FALSE),col=4)
legend('topright',c("Shape=0.5","Shape=1.0","Shape=2.0"),lty=c(1,1,1),col=c(2,3,4))
title(main='Figure 2D',sub='Log-logistic Survival Function')
plot(seq(0,10,.1),dllogis(seq(0,10,.1),scale = 1,shape = 0.5)/pllogis(seq(0,10,.1),scale = 1,shape = 0.5,lower.tail = FALSE),type='l',col=2,xlab = "Time", 
     ylab='h(t)',ylim = c(0,3));
lines(seq(0,10,.1),dllogis(seq(0,10,.1),scale = 1,shape = 1)/pllogis(seq(0,10,.1),scale = 1,shape = 1,lower.tail = FALSE),col=3)
lines(seq(0,10,.1),dllogis(seq(0,10,.1),scale = 1,shape = 2)/pllogis(seq(0,10,.1),scale = 1,shape = 2,lower.tail = FALSE),col=4)
legend('topright',c("Shape=0.5","Shape=1.0","Shape=2.0"),lty=c(1,1,1),col=c(2,3,4))
title(sub='Log-logistic Hazard Function')
#-------------------------------------------------------------------------
# Gompertz Distribution
library(reliaR)
par(mfrow=c(1,3))
plot(seq(.1,10,.1),dgompertz(seq(.1,10,.1),alpha = 1,theta = 0.5),type='l',col=2,xlab = "Time", 
     ylab='f(t)',ylim = c(0,2.2))
lines(seq(.1,10,.1),dgompertz(seq(.1,10,.1),alpha = 1,theta = 1),col=3)
lines(seq(.1,10,.1),dgompertz(seq(.1,10,.1),alpha = 1,theta = 2),col=4)
legend('topright',c("Shape=0.5","Shape=1.0","Shape=2.0"),lty=c(1,1,1),col=c(2,3,4))
title(sub='Gompetz Probability Density Function')
plot(seq(.1,10,.1),pgompertz(seq(.1,10,.1),alpha = 1,theta = 0.5,lower.tail = FALSE),type='l',col=2,xlab = "Time", 
     ylab='S(t)',ylim = c(0,1.25));
lines(seq(.1,10,.1),pgompertz(seq(.1,10,.1),alpha = 1,theta = 1,lower.tail = FALSE),col=3)
lines(seq(.1,10,.1),pgompertz(seq(.1,10,.1),alpha = 1,theta = 2,lower.tail = FALSE),col=4)
legend('topright',c("Shape=0.5","Shape=1.0","Shape=2.0"),lty=c(1,1,1),col=c(2,3,4))
title(main='Figure 2E',sub='Gompertz Survival Function')
plot(seq(.1,10,.1),dgompertz(seq(.1,10,.1),alpha = 1,theta = 0.5)/pgompertz(seq(.1,10,.1),alpha = 1,theta = 0.5,lower.tail = FALSE),type='l',col=2,xlab = "Time", 
     ylab='h(t)',ylim = c(0,3));
lines(seq(.1,10,.1),dgompertz(seq(.1,10,.1),alpha = 1,theta = 1)/pgompertz(seq(.1,10,.1),alpha = 1,theta = 1,lower.tail = FALSE),col=3)
lines(seq(.1,10,.1),dgompertz(seq(.1,10,.1),alpha = 1,theta = 2)/pgompertz(seq(.1,10,.1),alpha = 1,theta = 2,lower.tail = FALSE),col=4)
legend('topright',c("Shape=0.5","Shape=1.0","Shape=2.0"),lty=c(1,1,1),col=c(2,3,4))
title(sub='Gompertz Hazard Function')
#=========================================================================
