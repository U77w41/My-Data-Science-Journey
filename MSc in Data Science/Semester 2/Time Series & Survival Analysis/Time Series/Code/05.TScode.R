#######################################################################
setwd("/SUDIPTA RKMV University/Time Series")
#######################################################################
# Time Series:- Fitting by arma() method
#######################################################################
# Autoregressive Process
# --------------------------------------
par(mfrow=c(2,1))
plot(arima.sim(list(order=c(1,0,0), ar=.9), n=100), ylab="x",
     main=(expression(AR(1)~~~phi==+.9)))
plot(arima.sim(list(order=c(1,0,0), ar=-.9), n=100), ylab="x",
     main=(expression(AR(1)~~~phi==-.9)))
# --------------------------------------
# Moving Average process
# --------------------------------------
par(mfrow = c(2,1))
plot(arima.sim(list(order=c(0,0,1), ma=.5), n=100), ylab="x",
     main=(expression(MA(1)~~~theta==+.5)))
plot(arima.sim(list(order=c(0,0,1), ma=-.5), n=100), ylab="x",
     main=(expression(MA(1)~~~theta==-.5)))
# --------------------------------------
# Autoregressive Moving Average process
# --------------------------------------
par(mfrow = c(2,1))
plot(arima.sim(list(order=c(1,0,1), ar=.9,ma=.5), n=100), ylab="x",
     main=(expression(ARMA(1,1)~~~phi==.9~~~theta==.5)))
plot(arima.sim(list(order=c(2,0,2), ar=c(.9,-.1),ma=c(.4,-.5)), n=100), ylab="x",
     main=(expression(ARMA(2,2))))
# --------------------------------------
# To calculate and display the ACF and PACF of the model
# --------------------------------------
ACF = ARMAacf(ar=c(1.5,-.75), ma=0, 24)
PACF = ARMAacf(ar=c(1.5,-.75), ma=0, 24, pacf=TRUE)
par(mfrow=c(1,2))
plot(ACF, type="h", xlab="lag", ylim=c(-.8,1)); abline(h=0)
plot(PACF, type="h", xlab="lag", ylim=c(-.8,1)); abline(h=0)

ACF = ARMAacf(ar=0, ma=c(1.5,-.75), 24)
PACF = ARMAacf(ar=0, ma=c(1.5,-.75), 24, pacf=TRUE)
par(mfrow=c(1,2))
plot(ACF, type="h", xlab="lag", ylim=c(-.8,1)); abline(h=0)
plot(PACF, type="h", xlab="lag", ylim=c(-.8,1)); abline(h=0)
########################################
# Fitting of Dow Jones Utilities Index
# --------------------------------------
library(itsmr)
plot.ts(dowj,ylab='Utility Index',main='Dow Jones Utility Index')
dowj_d1 <- diff(dowj)
plot.ts(dowj_d1,ylab='Utility Index',main='Dow Jones Utility Index')
library(astsa)
acf2(dowj_d1)
# --------------------------------------
# Parameter Estimation Algorithms 
# --------------------------------------
# dowj_d1.yw = yw(dowj_d1,p=1);print(dowj_d1.yw)            # Yule-Walker (AR)
# dowj_d1.bg = burg(dowj_d1,p=1);print(dowj_d1.bg)          # Burge (AR)
# dowj_d1.ia = ia(dowj_d1,q=2);print(dowj_d1.ia)            # Innovation (MA)
dowj_d1.ml = arma(dowj_d1,p=1,q=0);print(dowj_d1.ml)      # MLE (ARMA)
dowj_d1.at=autofit(dowj_d1,p=0:4,q=0:4);print(dowj_d1.at) # Autofit by mle
########################################
# Fitting of Lake Huron (Raw)
# --------------------------------------
plot.ts(LakeHuron)
acf2(LakeHuron)
# --------------------------------------
# Parameter Estimation Algorithms
# --------------------------------------
# huron.yw = yw(LakeHuron,p=2);print(huron.yw)            # Yule-Walker
# huron.bg = burg(LakeHuron,p=2);print(huron.bg)          # Burge
# huron.hn = hannan(LakeHuron,p=1,q=1);print(huron.hn)    # Hannan
huron.ml = arma(LakeHuron,p=1,q=1);print(huron.ml)      # mle
huron.at=autofit(LakeHuron,p=0:5,q=0:5);print(huron.at) # Autofit by mle
########################################
# Fitting data with trend
# --------------------------------------
plot.ts(LakeHuron-570,type="o",ylab="level in feet")
trFit <- lm(LakeHuron-570~time(LakeHuron))
summary(trFit)
abline(trFit,col="red")
plot(as.numeric(time(LakeHuron)),trFit$residuals,
     type="o",xlab="Year",ylab="Residuals")
# --------------------------------------
# Fitting data after removing trend
# --------------------------------------
plot.ts(trFit$residuals)
acf2(trFit$residuals)
huron.res.at=autofit(trFit$residuals,p=0:5,q=0:5);print(huron.res.at) # Autofit by mle
# --------------------------------------