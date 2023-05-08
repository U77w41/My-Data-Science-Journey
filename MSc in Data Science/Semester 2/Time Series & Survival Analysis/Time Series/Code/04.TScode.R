#########################################################################
# setwd("/SUDIPTA RKMV University/Time Series")
#########################################################################
# Simple Random Process
#########################################################################
# White Noise
# --------------------------------------
w = rnorm(500,0,1)
plot.ts(w, main="white noise")                      # stationary
# --------------------------------------
# MA(1) process
# --------------------------------------
theta=-0.8
ma1=array(0,500)
ma1[1]=w[1]
ma1=w[2:500]+theta*w[1:499]
plot.ts(ma1, main="First-order moving average")     # stationary
# --------------------------------------
# MA(2) process
# --------------------------------------
theta1=-0.8
theta2=.6
ma2=array(0,500)
ma2[1]=w[1]
ma2[2]=theta1*ma2[1]+w[2]
ma2=w[3:500]+theta1*w[2:499]+theta2*w[1:498]
plot.ts(ma2, main="Second-order moving average")     # stationary
acf(ma1)
acf(ma2)

# --------------------------------------
# AR(1) process
# --------------------------------------
phi=0.9
ar1=array(0,500)
ar1[1]=w[1]
for (i in 2:500)
  ar1[i]=phi*ar1[i-1]+w[i]
plot.ts(ar1, main="First-order auto regression")    # stationary
# --------------------------------------
# AR(2) process
# --------------------------------------
phi1=.4
phi2=-.5
ar2=array(0,500)
ar2[1]=w[1]
ar2[2]=phi1*ar2[1]+w[2]
for (i in 3:500)
  ar2[i]=phi1*ar2[i-1]+phi2*ar2[i-2]+w[i]
plot.ts(ar2, main="Second-order auto regression")    # stationary
pacf(ar2)
# --------------------------------------
# ARMA(1,1) process
# --------------------------------------
theta=0.4
phi=-0.9
arma_1_1=array(0,500)
arma_1_1[1]=w[1]
for (i in 2:500)
  arma_1_1[i]=phi*arma_1_1[i-1]+w[i]+theta*w[i-1]
plot.ts(arma_1_1, main="ARMA(1,1)")    # stationary
pacf(arma_1_1)
#########################################################################
# Autocorrelation Function
#########################################################################
# --------------------------------------
# ACF of white noise
# --------------------------------------
rho0=1
wnacf=acf(w, main="white noise acf")
# --------------------------------------
# ACF of MA(1)
# --------------------------------------
ma1acf=acf(ma1,ylim = c(-1,1), main="MA(1) acf")
rho1=theta/(1+theta^2)
rho1hat=ma1acf$acf[2]
w22hat=1+2*rho1hat^2
abline(a=1.96*sqrt(w22hat/length(ma1)),b=0,col='red',lty=2)
abline(a=-1.96*sqrt(w22hat/length(ma1)),b=0,col='red',lty=2)
w11hat=1-3*rho1hat^2+4*rho1hat^4
abline(a=rho1hat+1.96*sqrt(w11hat/length(ma1)),b=0,col='green',lty=2)
abline(a=rho1hat-1.96*sqrt(w11hat/length(ma1)),b=0,col='green',lty=2)
points(x=1,y=rho1,col='red')
# --------------------------------------
# ACF of MA(2)
# --------------------------------------
ma2acf=acf(ma2,ylim = c(-1,1), main="MA(2) acf")
# --------------------------------------
# ACF of AR(1)
# --------------------------------------
ar1acf=acf(ar1,ylim = c(-1,1), main="AR(1) acf")
phihat=ar1acf$acf[2]
lags=ar1acf$lag[-1]
what=array(0,length(lags))
w_ii=function(x,i)
  return((1-x^(2*i))*(1+x^2)/(1-x^2)-2*i*x^(2*i))
what=w_ii(phihat,lags)
upperbounds=phihat^lags+1.96*sqrt(what/length(ar1))
lowerbounds=phihat^lags-1.96*sqrt(what/length(ar1))
lines(lags,upperbounds,col='red',lty=2)
lines(lags,lowerbounds,col='red',lty=2)
points(x=lags,y=phi^lags,col='magenta')
# --------------------------------------
# ACF of AR(2)
# --------------------------------------
ar2acf=acf(ar2,ylim = c(-1,1), main="AR(2) acf")
# --------------------------------------
# ACF of ARMA(1,1)
# --------------------------------------
arma_1_1acf=acf(arma_1_1,ylim = c(-1,1), main="ARMA(1,1) acf")
#########################################################################
# Fitting data with trend (Water level of lake Huron)
#########################################################################
LakeHuron
# --------------------------------------
plot.ts(LakeHuron-570,type="o",ylab="level in feet")
trFit <- lm(LakeHuron-570~time(LakeHuron))
summary(trFit)
abline(trFit,col="red")
plot(as.numeric(time(LakeHuron)),trFit$residuals,
     type="o",xlab="Year",ylab="Residuals")

# --------------------------------------
# ACF of residuals of LakeHuron data
# --------------------------------------
yr=trFit$residuals
yracf=acf(yr,40,ylim = c(-0.8,1), main="Lake Huron residual acf")
phiH0=0.791
lags=yracf$lag[-1]
phihat=yracf$acf[2]
what=array(0,length(lags))
w_ii=function(x,i)
  return( (1-x^(2*i))*(1+x^2)/(1-x^2) - 2*i*x^(2*i)) 
what=w_ii(phiH0,lags)
upperbounds=yracf$acf[-1]+1.96*sqrt(what/length(yr))
lowerbounds=yracf$acf[-1]-1.96*sqrt(what/length(yr))
lines(lags,upperbounds,col='red',lty=2)
lines(lags,lowerbounds,col='red',lty=2)
points(x=lags,y=phiH0^lags,col='magenta',pch=8)
#########################################################################

#########################################################################
# Partial Autocorrelation Function
#########################################################################
# --------------------------------------
wnpacf=pacf(w, main="white noise pacf")               # PACF of white noise
ma1pacf=pacf(ma1,ylim = c(-1,1), main="MA(1) pacf")   # PACF of MA(1)
ma2pacf=pacf(ma2,ylim = c(-1,1), main="MA(2) pacf")   # PACF of MA(2)
ar1pacf=pacf(ar1,ylim = c(-1,1), main="AR(1) pacf")   # PACF of AR(1)   
ar2pacf=pacf(ar2,ylim = c(-1,1), main="AR(2) pacf")   # PACF of AR(2)
arma_1_1pacf=pacf(arma_1_1,ylim = c(-1,1), main="ARMA(1,1) pacf") # PACF of ARMA(1,1)
#########################################################################
sppacf=pacf(sunspot.year[70:169])