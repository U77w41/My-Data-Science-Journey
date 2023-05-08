#=========================================================================
# Prepare Environment
#-------------------------------------------------------------------------
library(survival)
library(MASS)
library(fitdistrplus)
#=========================================================================
# Step 0. Get the data
#-------------------------------------------------------------------------
myCredit=read.csv('GermanCredit.csv')   # Extract the German Credit Data
head(myCredit)        # Have a glimps of data
names(myCredit)       # the column names of the data
str(myCredit)         # types of variables
summary(myCredit)     # descriptive statistics
#=========================================================================
# Step 1. Preparing Right Censor Data
#-------------------------------------------------------------------------
Lifetime = myCredit$Duration                  # Right Censor Survival Data
Status = ifelse(myCredit$Class=="Bad",1,0)    # Censoring indicator variable (1 for complete obs, 0 for censored)
# Data preparation for KM estimation but not for parametric fit
CensorData = data.frame(cbind(Lifetime,Status))                 # Censor Data      
SurvObject = Surv(myCredit$Duration,(myCredit$Class)=="Bad")    # Survival Object
#=========================================================================
# Step 2. Non-parametric Survival Function/Hazard Estimation
#-------------------------------------------------------------------------
# Step 2.1. Non-parametric Survival Function Estimation [KM]
#-------------------------------------------------------------------------
# Kaplan Meier estimate of survival function
Result = survfit(Surv(Lifetime,Status)~1,
                 CensorData,stype=1)  # stype=1: direct method (i.e. KM) to estimate S(t)
plot(Result,xlab = "time", 
     ylab="Survival probability",ylim=c(0,1),col=1)           # KM estimator and confidence intervals
title("Figure 5A")
legend('bottomleft',c("KM Estimate","95% CI"),lty=c(1,2),col=c(1,1))
#-------------------------------------------------------------------------
# Step 2.2. Non-parametric Survival Function Estimation [NA]
#-------------------------------------------------------------------------
# Nelson Aalen estimate of survival function
ResultH = survfit(Surv(Lifetime,Status)~1,CensorData,conf.type="plain",
                  stype=2,ctype=1)  # stype=2,ctype=1: indirect method to estimate S(t) from H(t)
plot(ResultH$time,ResultH$cumhaz,xlab = "time", 
     ylab="Cummulative hazard",ylim=c(0,3),type="l",col=1)
lines(ResultH$time,ResultH$cumhaz+1.96*ResultH$std.err,lty=2,col=1)
lines(ResultH$time,ResultH$cumhaz-1.96*ResultH$std.err,lty=2,col=1)
title("Figure 5B")
legend('topleft',c("NA Estimate for H(t)","95% CI"),lty=c(1,2),col=c(1,1))
plot(ResultH,xlab = "time", 
     ylab="Survival probability",ylim=c(0,1),col=1)
title("Figure 5C")
legend('bottomleft',c("NA Estimate for S(t)","95% CI"),lty=c(1,2),col=c(1,1))
#-------------------------------------------------------------------------
# Step 2.3. Kernel estimate of hazard function for right-censored data
#-------------------------------------------------------------------------
library(muhaz)
mhFit=muhaz(Lifetime,Status,kern="epanechnikov")
plot(mhFit$est.grid,mhFit$haz.est,type="l",xlab="time",ylab="Hazard rate")
title("Figure 5D")
#-------------------------------------------------------------------------
