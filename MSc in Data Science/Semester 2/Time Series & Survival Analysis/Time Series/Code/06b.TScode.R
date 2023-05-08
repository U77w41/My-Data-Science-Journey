#######################################################################
setwd("/SUDIPTA RKMV University/Time Series")
#######################################################################
# Time Series:- Fitting and Forecasting by arima() method
#######################################################################
# Fitting of Lake Huron Data
# --------------------------------------
plot(LakeHuron, ylab="Height", xlab="Year", main="Lake Huron")
library(astsa)
acf2(LakeHuron,max.lag=48)                      # ACF & PACF values with graphic
library(itsmr)
huron.at = autofit(LakeHuron, p = 0:5, q = 0:5) # ARMA Model Selecton
# AR order selection
p=length(huron.at$phi)
if(p==1 && huron.at$phi[1]==0)
  p=0
# MA order selection
q=length(huron.at$theta)
if(q==1 && huron.at$theta[1]==0)
  q=0
huron.aim = arima(LakeHuron, order=c(p,0,q))    
print(huron.aim);huron.at$aicc                  # ARIMA Model
########################################
# Forecasting of Lake Huron Data
# --------------------------------------
huron.aim.pr = predict(huron.aim, n.ahead=30)   # Forecasting data
ts.plot(LakeHuron,huron.aim.pr$pred, col=c('black','blue'),
        xlim=c(1875,1972+30),ylab="Recruitment",main="Lake Huron")
lines(huron.aim.pr$pred+huron.aim.pr$se, lty="dashed", col='red')
lines(huron.aim.pr$pred-huron.aim.pr$se, lty="dashed", col='red')
#######################################################################
# Fitting of Dow Jones
# --------------------------------------
plot.ts(dowj, main="Dow Jones")
acf2(dowj)                                        # ACF & PACF values with graphic
djd1 <- diff(dowj)                                # first difference
plot.ts(djd1, main="Dow Jones First Difference")
acf2(djd1)                                        # ACF & PACF values with graphic

djd1.at = autofit(djd1, p = 0:4, q = 0:4)         # ARMA model selection
# AR order selection
p=length(djd1.at$phi)
if(p==1 && djd1.at$phi[1]==0)
  p=0
# MA order selection
q=length(djd1.at$theta)
if(q==1 && djd1.at$theta[1]==0)
  q=0
djd1.aim = arima(djd1, order=c(p,0,q))
print(djd1.aim);djd1.at$aicc                      # Resulting ARIMA Model
########################################
# Forecasting of Dow Jones Utility Index
# --------------------------------------
djd1.aim.pr = predict(djd1.aim, n.ahead=100)      # Forecasting differeance of data
ts.plot(ts(djd1),djd1.aim.pr$pred,
        col=c('black','blue'),xlim=c(0,length(djd1)+100),
        ylab="Index Value",main="Dow Jones Utility Index First Difference")
lines(djd1.aim.pr$pred+djd1.aim.pr$se, lty="dashed", col='red')
lines(djd1.aim.pr$pred-djd1.aim.pr$se, lty="dashed", col='red')

ts.plot(ts(dowj),
        ts(dowj[length(dowj)]+cumsum(djd1.aim.pr$pred),start=length(dowj)),
        col=c('black','blue'),xlim=c(0,length(dowj)+100),
        ylab="Index Value",main="Dow Jones Utility Index")
# --------------------------------------