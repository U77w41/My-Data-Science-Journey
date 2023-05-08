#### A Start

library(survival)
mydata<-lung
## Step (1)
## Create the Survival Object
## we need status = 0 --> no event and status = 1 --> event happened
recodestatus<-function(x){
  if(x==1){rs=0} ## no event / censored
  if(x==2){rs=1} ## event happened
  return(rs)
}
for(i in 1:length(mydata$status)){
  mydata$recodedStatus[i]<-recodestatus(mydata$status[i])
}
mySurv<-Surv(time=mydata$time, event = mydata$recodedStatus)
class(mySurv)
head(mySurv)


####### B

## single survival curve: no comparisons
myfit<-survfit(mySurv~1) ## signle curve for all patients in 
## the dataset
myfit
median(mydata$time)


### Median survival is the time at which the survivorship 
### function equals 0.5.
plot(myfit)
plot(myfit, conf.int = "none")
abline(h=0.5)
abline(v=310)


## specify predictor variable in the formula
myfit<-survfit(mySurv~mydata$sex)
myfit
plot(myfit)
table(mydata$sex)
# 1= Male, 2= Female
plot(myfit, col=c("red","blue")) ## red = Male, Blue= female
plot(myfit, conf.int = "both", col=c("red","blue"))
plot(myfit, col=c("red","blue"))
plot(myfit, col=c("red","blue"), mark=3) ## mark.time=T marked at 
## each censoring time
legend("topright", c("male","female"), col=c("red","blue"), lty=1)
abline(h=0.5)
abline(v=270, col="red")
abline(v=426, col="blue")

## Now we see that survival of females is better, 
## Q: Is it better by chance, or statistically significant?
survdiff(mySurv~mydata$sex)

###  plot the inverse of a survival function

plot(myfit, fun="event", col=c("red","blue"), mark=3)


### End B

### C

coxph(mySurv~mydata$sex+mydata$age)

#### End C

