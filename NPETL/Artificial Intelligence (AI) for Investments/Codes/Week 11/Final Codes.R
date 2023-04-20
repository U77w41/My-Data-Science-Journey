# ABC Case Study problem
##Load the relevant packages
library(readxl)
library(lubridate)
library(moments)
library(car)
library(lmtest)
library(sandwich)
library(urca)

#################################################
setwd("C:/Users/HP/Dropbox/Simplilearn Masterclass/Case 2")
Data= read_excel("ABC.xlsx")
head(Data)
dim(Data)
class(Data$Date)
Data$Date=as.Date(Data$Date)
class(Data)
class(Data$Date)
#saveRDS(Data, "Data.rds")
Data= readRDS("Data.rds")

################################################
#Visualaze the data: Returns on ABC and Nifty

plot(Data$Date, Data$ABC, xlab="Data", ylab="", main="ABC Returns",
     type="l")


Data$Cum_Ret= Data$Price/Data$Price[1]-1

plot(Data$Date, Data$Cum_Ret, xlab="Data", ylab="", main="Cummulative Returns",
     type="l")

#############Market or Nifty Returns

plot(Data$Date, Data$Nifty, xlab="Data", ylab="", main="Market Returns",
     type="l")


#Cummulative market returns

Data$Cum_Ret_Nifty= cumsum(Data$Nifty)


plot(Data$Date, Data$Cum_Ret_Nifty, xlab="Data", ylab="",
     main="Cummulative Market Returns",
     type="l")


###Basic properties of Data
###Summmarizing the data
summary(Data$ABC)
summary(Data$Nifty)


##########
plot(density(Data$ABC), main="Density-Graph",
     xlab="Data", col="red", lwd=2, lty=1, xlim=c(-0.6, 0.6))


lines(density(Data$Nifty), col="blue", lwd=2)
legend("topleft", c("ABC", "Nifty"),fill= c("red", "blue"))

###################################################################
##Normality and Staionerity of the data

####Symmetry 
skewness(Data$ABC)
skewness(Data$Nifty)

agostino.test(Data$ABC)
agostino.test(Data$Nifty)

##Kurtosis
kurtosis(Data$ABC)
kurtosis(Data$Nifty)

anscombe.test(Data$ABC)
anscombe.test(Data$Nifty)
#######################Testing the normality

jarque.test(Data$ABC)
jarque.test(Data$Nifty)
#####
##Stationerity of the data




##ADF Test
summary(ur.df(Data$ABC))
summary(ur.df(Data$Nifty))


summary(ur.pp(Data$ABC))
summary(ur.pp(Data$Nifty))


summary(ur.kpss(Data$ABC))
summary(ur.kpss(Data$Nifty))

##############################Segregating the data into training and test data
train= Data[Data$Date <=as.Date("2017-12-01")  & year(Data$Date)>2006,]
head(train)
tail(train)
dim(train)

test= Data[Data$Date > as.Date("2017-12-01"),]
head(test)
tail(test)
dim(test)
######################################Simple linear regression model
### Examining the ABC returns and Nifty returns relationship

Slr=lm(ABC ~ Nifty, data= train)
model= summary(Slr)
model
################Residual Diagnostics
densityPlot(model$residuals)
densityPlot(rstudent(Slr))
qqPlot(Slr, id=list(n=10))
outlierTest(Slr)
?qqPlot
?outlierTest

influenceIndexPlot(Slr)
influenceIndexPlot(Slr, vars=c ("Cook", "hat"), id=list(n=10))
influencePlot(Slr)
#################Heteroscedasticity 
plot(Slr)
?ncvTest
ncvTest(Slr)
ncvTest(Slr, var.formula = ~Nifty)
ncvTest(Slr, var.formula = ~ABC)


######Breusch-Pagan Test
?bptest
bptest(model, studentize = F)
bptest(model, studentize = T)

####Autocorrelation################
?dwtest
dwtest(Slr)

?bgtest
###Breusch-Godfrey Test
?bgtest
bgtest(model)
bgtest(model, order=4)
############################Robust Standard Errors
?hccm
coeftest(Slr, vcov.=hccm)
?coeftest
coeftest(Slr, vcov.=vcovHAC)
coeftest(Slr, vcov.=vcovHC)
?NeweyWest
coeftest(Slr, vcov.=NeweyWest)
?jarque.test
###################Prediction using the test data
Pred=predict(Slr, test)
Slr_Pred=Pred
plot(test$Date, test$ABC, xlab="Date", ylab="Returns", 
     main="Predicted Returns vs Actual Returns"
    , ylim=c(-0.1, 0.1), pch=20, col="red", type="l", lwd=1)

lines(test$Date, Pred, lwd=1, col="green", type="l")

legend( "topright", c("Actual Return", "Predicted Return"), fill=c("red", "green"))

cor(test$ABC, Pred)
#################################Cost or error function
library(Metrics)
#MSE 

mse(test$ABC, Pred)

##rmse
?rmse
rmse(test$ABC, Pred)

##rae
rae(test$ABC, Pred)

####mae
mae(test$ABC, Pred)


#mape
mape(test$ABC, Pred)
?mape
#smape
smape(test$ABC, Pred)

#msle

#rmsle 



#bias

#rse
rse(test$ABC, Pred)

#rrse

###Multiple Linear Regression model
head(train)
Mlr= lm(ABC ~ Sensex+Sentiment+Nifty+DividendAnnounced, data=train)

model=summary(Mlr)
model

##########################################Multicollinearity 
cor(train[, c("ABC", "Sensex", "Nifty", "Sentiment")])

##variance inflation factor VIF
vif(Mlr)


Mlr= lm(ABC ~ Sensex+Sentiment+DividendAnnounced, data=train)

model=summary(Mlr)
model


############Prediction object with test data


Pred= predict(Mlr, test)
Mlr_Pred=Pred

length(Pred)

cor(Pred, test$ABC)

plot(test$Date, test$ABC, xlab="Date", ylab="Returns",
     main="Actual vs Predicted Returns",
     ylim=c(-0.20, 0.20), col="red", type="l")

lines(test$Date, Pred, col="green", type="l")

legend("topright", c("Actual Returns", "Predicted Returns"), fill=c("red", "green"))
#######################################################


cor(cbind.data.frame(test$ABC,Slr_Pred, Mlr_Pred))

#############################################################

Error= data.frame(matrix(nrow=9, ncol=2))
colnames(Error)=c("SLR_Mod", "MLR_Mod")
rownames(Error)=c("MSE", "RMSE", "RAE", "MAE",  "SMAPE","MSLE",
                  "RMSLE",  "RSE", "RRSE")

Error$SLR_Mod[1]=mse(test$ABC, Slr_Pred)
Error$MLR_Mod[1]=mse(test$ABC, Mlr_Pred)

Error$SLR_Mod[2]=rmse(test$ABC, Slr_Pred)
Error$MLR_Mod[2]=rmse(test$ABC, Mlr_Pred)

Error$SLR_Mod[3]=rae(test$ABC, Slr_Pred)
Error$MLR_Mod[3]=rae(test$ABC, Mlr_Pred)

Error$SLR_Mod[4]=mae(test$ABC, Slr_Pred)
Error$MLR_Mod[4]=mae(test$ABC, Mlr_Pred)





Error$SLR_Mod[5]=smape(test$ABC, Slr_Pred)
Error$MLR_Mod[5]=smape(test$ABC, Mlr_Pred)

Error$SLR_Mod[6]=msle(test$ABC, Slr_Pred)
Error$MLR_Mod[6]=msle(test$ABC, Mlr_Pred)

Error$SLR_Mod[7]=rmsle(test$ABC, Slr_Pred)
Error$MLR_Mod[7]=rmsle(test$ABC, Mlr_Pred)


Error$SLR_Mod[8]=rse(test$ABC, Slr_Pred)
Error$MLR_Mod[8]=rse(test$ABC, Mlr_Pred)

Error$SLR_Mod[9]=rrse(test$ABC, Slr_Pred)
Error$MLR_Mod[9]=rrse(test$ABC, Mlr_Pred)









Rank= data.frame(matrix(nrow=9, ncol=2))
colnames(Rank)=c("SLR_Mod", "MLR_Mod")
rownames(Rank)=c("MSE", "RMSE", "RAE", "MAE", "SMAPE",
                 "MSLE", "RMSLE", "RSE", "RRSE")


Rank= apply(Error,1, rank)




















