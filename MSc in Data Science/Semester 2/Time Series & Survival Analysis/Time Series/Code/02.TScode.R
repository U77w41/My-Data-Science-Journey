# setwd("/SUDIPTA RKMV University/Time Series/CodeClass")
#########################################################################
#########################################################################
# Multiplicative Model
# -----------------------------------------------------------------------
# Red wine data
# -----------------------------------------------------------------------
library(itsmr)
winets=ts(wine,start=c(1980,1),end=c(1991,10),
          frequency=12)         # transform to time series object
par(mfrow=c(1,2))
plot.ts(winets,type='o')        # data before transformation
plot.ts(log(winets),type='o')   # data after log transformation
#########################################################################
#########################################################################
# Esimating TREND by Finite Moving Average Filter
# -----------------------------------------------------------------------
# Trend (US strike data)
# -----------------------------------------------------------------------
strikests=ts(strikes/1000,start=c(1951),end=c(1980),
             frequency=1)
par(mfrow=c(3,1))
plot.ts(strikests,type='o')
strikests_ext=c(rep(strikests[1],2),
                strikests,rep(strikests[length(strikests)],2))  # padding both sides
strikests_ma=filter(strikests_ext, sides=2, rep(1/5,5))         # moving average
strikests_ma=(strikests_ma[-c(1,2,length(strikests_ma)-1,
                              length(strikests_ma))])           # discarding the pads
strikests_ma=ts(strikests_ma,start=c(1951),end=c(1980),
                frequency=1)                                    # moving average time series
plot.ts(strikests,type='p');lines(strikests_ma,type='l')        # raw data with fitted moving average line
strikes_rs_ma=strikests-strikests_ma                            # residuals after moving average fit       
plot.ts(strikes_rs_ma,type='o');abline(0,0)                     # plot of residuals
#########################################################################
# Esimating TREND by Exponential Smoothing
# -----------------------------------------------------------------------
# Trend (US strike data)
# -----------------------------------------------------------------------
par(mfrow=c(3,1))
plot.ts(strikests,type='o')
alpha=0.4
strikests_es=array(0,length(strikests))
strikests_es[1]=strikests[1]
for(i in 2:length(strikests))
{
  strikests_es[i]=(1-alpha)*strikests_es[i-1]+alpha*strikests[i]
}
strikests_es=ts(strikests_es,start=c(1951),end=c(1980),
                frequency=1)                                    # exponential smoothed time series
plot.ts(strikests,type='p');lines(strikests_es,type='l')        # raw data with fitted exponentially smoothed line
strikes_rs_es=strikests-strikests_es                            # residuals after exponentially smoothed fit
plot.ts(strikes_rs_es,type='o');abline(0,0)                     # plot of residuals
#########################################################################
# Esimating TREND by Regression to Find Residuals
# -----------------------------------------------------------------------
# Trend (Population in US)
# -----------------------------------------------------------------------
decade=seq(1790,1990,by=10)
myvector=c(3929214,5308483,7239881,9638453,12866020,17069453,
           23191876,31443321,38558371,50189209,62979766,76212168,
           92228496,106021537,123202624,132164569,151325798,179323175,
           203302031,226545805,248709873)/1000000
myts <- ts(myvector, start=c(1790), end=c(1990), frequency=.1)
par(mfrow=c(2,1))
plot.ts(myts,type="p",ylab="Population in Millions")
time_scale=(decade-1780)/10
popln_data=cbind(decade,myvector,time_scale,time_scale^2)
colnames(popln_data)=c("Decade","Popln","time","sqtime")
popln_data=as.data.frame(popln_data)
trFit=lm(Popln~time+sqtime,data=popln_data)
summary(trFit)
lines(decade,predict(trFit),type="l",col="red")
plot(decade,trFit$residuals,xlab="Decade",ylab="Residuals");abline(h=0)
# -----------------------------------------------------------------------
# Trend (Water level of lake Huron)
# -----------------------------------------------------------------------
LakeHuron
par(mfrow=c(2,1))
plot.ts(LakeHuron-570,type="o",ylab="level in feet")
trFit <- lm(LakeHuron-570~time(LakeHuron))
summary(trFit)
abline(trFit,col="red")
plot(as.numeric(time(LakeHuron)),trFit$residuals,
     type="o",xlab="Year",ylab="Residuals");abline(h=0)
#########################################################################
# TREND Elimination by Differencing to get Residual
# -----------------------------------------------------------------------
# Trend (US population data)
# -----------------------------------------------------------------------
myvector=c(3929214,5308483,7239881,9638453,12866020,17069453,
           23191876,31443321,38558371,50189209,62979766,76212168,
           92228496,106021537,123202624,132164569,151325798,179323175,
           203302031,226545805,248709873)/1000000
myts <- ts(myvector, start=c(1790), end=c(1990), frequency=.1)
# ------ Original and corresponding 1st and 2nd difference ------
par(mfcol=c(3,2),by)
plot.ts(myts,type="o",ylab="Population in Millions")
D1myts=ts(myts[2:length(myts)]-myts[1:(length(myts)-1)],
          start(myts)+10,end(myts),.1)
plot.ts(D1myts,type="o",ylab="Population in Millions 1st diff")
D2myts=ts(D1myts[2:length(D1myts)]-D1myts[1:(length(D1myts)-1)],
          start(myts)+10,end(myts),.1)
plot.ts(D2myts,type="o",ylab="Population in Millions 2nd diff")
# ------ Log Original and corresponding 1st and 2nd difference ------
myts_ln <- ts(log(myvector), start=c(1790), end=c(1990), frequency=.1)
plot.ts(myts_ln,type="o",ylab="Log Population in Millions")
D1myts_ln=ts(myts_ln[2:length(myts_ln)]-myts_ln[1:(length(myts_ln)-1)],
             start(myts_ln)+10,end(myts_ln),.1)
plot.ts(D1myts_ln,type="o",ylab="Log Population in Millions 1st diff")
D2myts_ln=ts(D1myts_ln[2:length(D1myts_ln)]-D1myts_ln[1:(length(D1myts_ln)-1)],
             start(D1myts_ln)+10,end(D1myts_ln),.1)
plot.ts(D2myts_ln,type="o",ylab="Log Population in Millions 2nd diff")
#########################################################################
#########################################################################
# Esimating SEASONALITY by Regression to Find Residuals
# -----------------------------------------------------------------------
# Seasonality (US monthly accidental data)
# -----------------------------------------------------------------------
acdData <- read.csv("accidental-deaths-in-usa-monthly.csv",
                    header = TRUE)
acdDatats=ts(acdData[,2]/1000,start=c(1973,1),end=c(1978,12),
             frequency=12)
par(mfrow=c(2,1))
plot.ts(acdDatats,type='p',ylab="Death in Thousans")
mnth=time(acdDatats) - mean(time(acdDatats))
cs1 = cos(2*pi*1*mnth);sn1 = sin(2*pi*1*mnth)
cs2 = cos(2*pi*2*mnth);sn2 = sin(2*pi*2*mnth)
reg2 = lm(acdDatats ~ cs1 + sn1 + cs2 +sn2, na.action = NULL)
summary(reg2)
lines(fitted(reg2))
plot(as.numeric(time(acdDatats)),reg2$residuals,
     type="o",xlab="Year",ylab="Residuals");abline(h=0)
#########################################################################
#########################################################################
# Esimating TREND and SEASONALITY by Finite Moving Average Filter
# -----------------------------------------------------------------------
# Trend and Seasonality (US monthly accidental data)
# -----------------------------------------------------------------------
acdData <- read.csv("accidental-deaths-in-usa-monthly.csv",
                    header = TRUE)
acdDatats=ts(acdData[,2]/1000,start=c(1973,1),end=c(1978,12),
             frequency=12)
par(mfrow=c(2,2))
plot.ts(acdDatats,type='p',ylab="Death in Thousands")
d=12                                                                # period(even)    
# ------------------ Trend Removal --------------
acdDatats_ma=filter(acdDatats, sides=2, c(.5,rep(1,d-1),.5)/d)      # moving average
lines(acdDatats_ma)
acdDatats_dm=matrix(acdDatats-acdDatats_ma,ncol=d,byrow = TRUE)     # discarding moving average trend
# ------- Followed by Seasonality Removal -------
acdDatats_sk=(colMeans(acdDatats_dm,na.rm = TRUE)
              -mean(colMeans(acdDatats_dm,na.rm = TRUE)))           # calculating seasonality components (adjustment ensures zero sum)
plot.ts(ts(acdDatats_sk,start=c(1973,1),end=c(1978,12),
           frequency=12),ylab="Death seasonality",type='o');abline(0,0)
acdDatats_ds=acdDatats-acdDatats_sk                                 # discarding seasonality
plot.ts(acdDatats_ds,type="o",ylab="Death in Thousands")
# --------- Followed by Trend Removal ---------
shifted_tm1=seq(1:length(acdDatats_ds))
shifted_tm2=shifted_tm1^2
acdDatats_Fit <- lm(acdDatats_ds~shifted_tm1+shifted_tm2)           # fiting trend
summary(acdDatats_Fit)
lines(ts(predict(acdDatats_Fit),start=c(1973,1),end=c(1978,12),
         frequency=12),type="l",col="red")
plot(as.numeric(time(acdDatats)),acdDatats_Fit$residuals,
     type="o",xlab="Year",ylab="Residuals");abline(0,0)             # ultimate residuals
#########################################################################
# TREND and SEASONALITY Elimination by Differencing to get Residual
# -----------------------------------------------------------------------
# Trend and Seasonality  (US monthly accidental data)
# -----------------------------------------------------------------------
par(mfrow=c(3,1))
plot.ts(acdDatats,type="o",ylab="Death in Thousands")
acdDatats_df_ds=ts(acdDatats[(d+1):length(acdDatats)]
                   -acdDatats[1:(length(acdDatats)-d)],
                   start(acdDatats)+c(1,0),end(acdDatats),12)               # 12 period difference
plot.ts(acdDatats_df_ds,type="o",ylab="Del_12(acdDatats)")            
D1acdDatats_df_ds=ts(acdDatats_df_ds[2:length(acdDatats_df_ds)]-
                       acdDatats_df_ds[1:(length(acdDatats_df_ds)-1)],
                     start(acdDatats_df_ds)+c(0,1),end(acdDatats_df_ds),12) # 1st difference
plot.ts(D1acdDatats_df_ds,type="o",ylab="D1(Del_12(acdDatats))");abline(0,0)
#########################################################################