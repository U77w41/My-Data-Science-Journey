library(astsa)
######################### Figure 1.01 ##########################
plot(jj, type="o", ylab="Quarterly Earnings per Share",main="Figure 1.01")
acf(jj)
pacf(jj)
######################### Figure 1.02 ##########################
plot(gtemp, type="o", ylab="Global Temperature Deviations",main="Figure 1.02")

######################### Figure 1.03 ##########################
plot(speech,main="Figure 1.03")

######################### Figure 1.04 ##########################
plot(nyse, ylab="NYSE Returns",main="Figure 1.04")

######################### Figure 1.05 ##########################
par(mfrow = c(2,1)) # set up the graphics
plot(soi, ylab="", xlab="", main="Southern Oscillation Index")
plot(rec, ylab="", xlab="", main="Recruitment")

######################### Figure 1.06 ##########################
par(mfrow=c(2,1), mar=c(3,2,1,0)+.5, mgp=c(1.6,.6,0))
ts.plot(fmri1[,2:5], lty=c(1,2,4,5), ylab="BOLD", xlab="",
          main="Cortex")
ts.plot(fmri1[,6:9], lty=c(1,2,4,5), ylab="BOLD", xlab="",
          main="Thalamus & Cerebellum")
mtext("Time (1 pt = 2 sec)", side=1, line=2)

######################### Figure 1.07 ##########################
par(mfrow=c(2,1))
plot(EQ5, main="Earthquake")
plot(EXP6, main="Explosion")

######################### Figure 1.08 ##########################
w = rnorm(500,0,1) # 500 N(0,1) variates 
v = filter(w, sides=2, rep(1/3,3)) # moving average
par(mfrow=c(2,1))
plot.ts(w, main="white noise")
plot.ts(v, main="moving average")

######################### Figure 1.09 ##########################
w = rnorm(550,0,1) # 50 extra to avoid startup problems
x = filter(w, filter=c(1,-.9), method="recursive")[-(1:50)]
plot.ts(x, main="autoregression")

######################### Figure 1.10 ##########################
set.seed(154) # so you can reproduce the results
w = rnorm(200,0,1); x = cumsum(w) # two commands in one line
wd = w +.2; xd = cumsum(wd)
plot.ts(xd, ylim=c(-5,55), main="random walk")
lines(x); lines(.2*(1:200), lty="dashed")

######################### Figure 1.11 ##########################
cs = 2*cos(2*pi*1:500/50 + .6*pi)
w = rnorm(500,0,1)
par(mfrow=c(3,1), mar=c(3,2,2,1), cex.main=1.5)
plot.ts(cs, main=expression(2*cos(2*pi*t/50+.6*pi)))
plot.ts(cs+w, main=expression(2*cos(2*pi*t/50+.6*pi) + N(0,1)))
plot.ts(cs+5*w, main=expression(2*cos(2*pi*t/50+.6*pi) + N(0,25)))

######################### Figure 1.13 ##########################
acf(speech,250)

######################### Figure 1.14 ##########################
par(mfrow=c(3,1))
acf(soi, 48, main="Southern Oscillation Index")
acf(rec, 48, main="Recruitment")
ccf(soi, rec, 48, main="SOI vs Recruitment", ylab="CCF")

######################### Figure 1.15 ##########################
persp(1:64, 1:36, soiltemp, phi=30, theta=30, scale=FALSE, expand=4,
      ticktype="detailed", xlab="rows", ylab="cols",
      zlab="temperature")

######################### Figure 1.16 ##########################
plot.ts(rowMeans(soiltemp), xlab="row", ylab="Average Temperature")

######################### Figure 1.17 ##########################
fs = abs(fft(soiltemp-mean(soiltemp)))^2/(64*36)
cs = Re(fft(fs, inverse=TRUE)/sqrt(64*36)) # ACovF
rs = cs/cs[1,1] # ACF
rs2 = cbind(rs[1:41,21:2], rs[1:41,1:21])
rs3 = rbind(rs2[41:2,], rs2)
par(mar = c(1,2.5,0,0)+.1)
persp(-40:40, -20:20, rs3, phi=30, theta=30, expand=30,
      scale="FALSE", ticktype="detailed", xlab="row lags",
      ylab="column lags", zlab="ACF")

