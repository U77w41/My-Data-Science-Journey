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
summary(myCredit)                       # descriptive statistics
#=========================================================================
# Step 1. Preparing Right Censor Data
#-------------------------------------------------------------------------
Lifetime = myCredit$Duration                  # Right Censor Survival Data
Status = ifelse(myCredit$Class=="Bad",1,0)    # Censoring indicator variable (1 for complete obs, 0 for censored)
# Data preparation for KM estimation but not for parametric fit
CensorData = data.frame(cbind(Lifetime,Status))                 # Censor Data      
SurvObject = Surv(myCredit$Duration,(myCredit$Class)=="Bad")    # Survival Object
#=========================================================================
# Step 2. Build Cox proportional hazard models Semi-Parametric
#-------------------------------------------------------------------------
# Cox proportional hazards model regression
ResultSP = coxph(SurvObject ~ Age+Amount+InstallmentRatePercentage+NumberExistingCredits+NumberPeopleMaintenance, data=myCredit)     # Build the coxph model
summary(ResultSP)
BaselineHazard=basehaz(ResultSP)
plot(BaselineHazard$time,BaselineHazard$hazard,type='s',xlab='Time',ylab='Baseline Hazard')
ResultSP = coxph(SurvObject ~ Amount + InstallmentRatePercentage, data=myCredit)     # Build the coxph model
summary(ResultSP)
BaselineHazard=basehaz(ResultSP)
lines(BaselineHazard$time,BaselineHazard$hazard,type='s',lty=2)
legend('topleft',c("H0(t), 5 covariate","H0(t), 2 covariate"),lty=c(1,2),col=c(1,1))
title("Figure 7a")
#-------------------------------------------------------------------------
# Visualize
#-------------------------------------------------------------------------
# Compare predictions for X = mu+sd and X = mu-sd (on Amount, Inst. rate const. at mean)
newdata <- data.frame( rep(mean(myCredit$Amount)+sd(myCredit$Amount),2), 
                       rep(mean(myCredit$InstallmentRatePercentage),2))
colnames(newdata)=c('Amount','InstallmentRatePercentage')

plot(survfit(ResultSP, newdata, se.fit=F), xlab = "Time", ylab="Survival probability")
ts = seq(min(Lifetime),max(Lifetime),length.out = 200)
newdata[,'Amount']=rep(mean(myCredit$Amount)-sd(myCredit$Amount),2)
lines(survfit(ResultSP, newdata, se.fit=F), lty = 2)
legend('topright',c("Cox, X = mu+sd","Cox, X = mu-sd"),lty=c(1,2),col=c(1,1))
title("Figure 7b")
#-------------------------------------------------------------------------
