##Reading and writing the Data


setwd("C:/Users/HP/Desktop/SL/Data")


Data=read.csv("Data.csv")


class(Data)


head(Data)

tail(Data)



summary(Data)


str(Data)
dim(Data)

#Let us visulaize the data

plot(Data)
plot(Data$Pre)


plot(Data$Pre, type = "p")
plot(Data$Pre, type = "p", col="red")
plot(Data$Pre, type = "p", col="red", main="Graph", xlab="Frequency",ylab="Variable")

plot(density(Data$Pre), main="Density-Graph", xlab="Data", col="red")

plot(density(Data$Pre), main="Density-Graph", xlab="Data", col="red", lwd=2, lty=1)


lines(density(Data$Post), col="blue", lwd=2)


plot(density(Data$Pre), main="Density-Graph", xlab="Data", col="red", lwd=2, lty=1, xlim=c(2,7))

lines(density(Data$Post), col="blue", lwd=2 )


legend("topleft", c("Post","Pre"),fill=c("blue","red"))

legend("topright", c("Post","Pre"),fill=c("blue","red"))
legend("bottom",c("Post","Pre"),fill=c("blue","red"))
legend("bottomright", c("Post","Pre"),fill=c("blue","red"))
legend("bottomleft", c("Post","Pre"),fill=c("blue","red"))




#############Measures of central tendency



#################################################Compuuting mean median and quantiles

Data$Pre
mean(Data$Pre)
m1=mean(Data$Pre) 
m1

Data$Post
mean(Data$Post)
m2=mean(Data$Post) 
m2

Data$Pre
median(Data$Pre) 
m1=median(Data$Pre) 
m1

Data$Post
median(Data$Post) 
m2=median(Data$Post) 
m2

##command for mode
install.packages("statip")
library(statip)

head(mfv(Data$Pre))
head(mfv(Data$Post))

##for quratiles
Fourth is Quantiles 


quantile(Data$Pre) 
quantile(Data$Post) 


quantile(Data$Pre, 0.975) 
quantile(Data$Pre, 0.025) 

quantile(Data$Post, 0.975) 
quantile(Data$Post, 0.025) 

quantile(Data$Pre, seq(0,1, 0.2)) 
quantile(Data$Post, seq(0,1, 0.2)) 


######################################################################
#Measures of variability 

#Measures of variation are:
#  Range
#Variance
#Standard Deviation
#Mean Absolute deviation




range(Data$Pre)
range(Data$Post)


var(Data$Pre)
var(Data$Post)

 

sd(Data$Pre)
sd(Data$Post)


mad(Data$Pre)
mad(Data$Post)


##########we move to the measures of shape and their implementation



install.packages("tseries", "moments") 
library(tseries) 
library(moments)
#The first measure of shape is Skewness:  

 


skewness(Data$Pre)
skewness(Data$Post)

skewness(rnorm(1000))


agostino.test(Data$Pre)
agostino.test(Data$Post)
agostino.test(rnorm(1000))


hist(Data$Pre)
hist(Data$Pre, probability = T)
lines(density(Data$Pre), lwd=3, col="red")

hist(Data$Post)
hist(Data$Post, probability = T)
lines(density(Data$Post), lwd=3, col="red")

hist(rnorm(1000))
hist(rnorm(1000), probability = T)
lines(density(rnorm(1000)), lwd=3, col="red")       
#Kurtosis 


kurtosis(Data$Pre) 
kurtosis(Data$Post) 
kurtosis(rnorm(1000)) 


anscombe.test(Data$Pre) 
anscombe.test(Data$Post) 
anscombe.test(rnorm(1000)) 



#############################Normality

jarque.bera.test(Data$Pre)
jarque.bera.test(Data$Post)
jarque.bera.test(rnorm(1000))


jarque.test(Data$Pre)
jarque.test(Data$Post)
jarque.test(rnorm(1000))

##CLT: Distribution of sample means approach normal distribution in large number of samples
#if sample size is more than 30



##############################################################Sampling techniques
#

#Sampling is of two types, probability sampling, and non-probability sampling. 

#First is Probability Sampling: In this sampling, samples are chosen at random
#, and each sample has a known probability of being selected. 

#Probability Sampling is further classified as 
#Simple Random Sampling 
#Systematic Sampling 
#Stratified Sampling 
#Cluster Sampling 

sample(Data$Pre, 50, replace=T)
Pre=sample(Data$Pre, 50, replace=T)

set.seed(51)
sample(Data$Pre, 50, replace=T)

Pre=sample(Data$Pre, 50, replace=T)
Post=sample(Data$Post, 50, replace=T)

###Summarize
summary(Pre)
summary(Post)

library(statip)
head(mfv(Pre))
head(mfv(Post))

#################
quantile(Pre, seq(0,1, 0.2)) 
quantile(Post, seq(0,1, 0.2)) 



############################################

range(Pre)
range(Post)


var(Pre)
var(Post)

sd(Pre)
sd(Post)

mad(Pre)
mad(Post)

########################
#######Visualize

##Compare Pre with Normal
plot(density(Pre), main="Density-Graph", xlab="Data", col="red", lwd=4,  xlim=c(2,7), ylim=c(0,0.8))

Norm_Pre=rnorm(10000, mean=mean(Pre), sd=sd(Pre))

lines(density(Norm_Pre), col="green", lwd=4 )
legend("topleft", c("Normal","Pre"),fill=c("green","red"))

########Compare post with normal

plot(density(Post), main="Density-Graph", xlab="Data", col="blue", lwd=4,  xlim=c(2,7), ylim=c(0,0.8))

Norm_Post=rnorm(10000, mean=mean(Post), sd=sd(Post))

lines(density(Norm_Post), col="green", lwd=4 )
legend("topleft", c("Normal","Post"),fill=c("green","blue"))

#############Compare Pre with Post
plot(density(Pre), main="Density-Graph", xlab="Data", col="red", lwd=2, lty=1, xlim=c(2,7))

lines(density(Post), col="blue", lwd=2 )

legend("topleft", c("Post","Pre"),fill=c("blue","red"))

################################Systematic sampling


######################
####################################Systematic samplin
install.packages("TeachingSampling")   
library(TeachingSampling)  

Syst_Sample=S.SY(1000, 20)
Pre= Data$Pre[Syst_Sample]
Post= Data$Post[Syst_Sample]
###########################

#######Stratified sampling 


install.packages("dplyr")
library(dplyr) 

Data$Gender=as.factor(round(runif(1000, 0,1),0))

Sample=Data %>% group_by (Gender) %>% sample_n(., 25) 
Pre=Sample$Pre
Pre=Sample$Post
##

##################Cluster Sampling


install.packages("sampling") 
library(sampling) 

Data$Dept=as.factor(round(runif(1000, 1,50),0))


Data_Sample=cluster(Data,clustername=c("Dept"),size=10,method="srswor") 
dim(cl)
head(cl)

levels(Data_Sample$Dept)
Data_Sample$Dept=droplevels(Data_Sample$Dept)
levels(Data_Sample$Dept)


Final_Sample <- Data_Sample %>% group_by(Dept) %>% sample_n(size = 5) 

dim(Final_Sample)



###########Confidence interval estimation


install.packages("distributions3")
library(distributions3)


#We will start with Z test, though less practical
#t-statistic is used when we do not now the population variance and sample sizes are small
#which is most oftes the case

#We will estimate the interval of population mean with the help of sample estimate
mean(Pre)


a=0.05

Norm=Normal(0,1)
plot(Norm)
Norm$mu
Norm$sigma

SE=sd(Data$Pre)/sqrt(length(Pre))

z=quantile(Norm, 1-a/2)
MOE=z*SE

lower= mean(Pre)-MOE
upper= mean(Pre)+MOE
mean(Data$Pre)
#t-score corresponding to the confidence interval

DOF=length(Pre)-1

t=qt(p=a/2, df=DOF, lower.tail = F)
?qt

SE=sd(Pre)/sqrt(length(Pre))
MOE=t*SE

lower= mean(Pre)-MOE
upper= mean(Pre)+MOE
mean(Data$Pre)
######################
t.test(Pre)
########Regression
confint(lm(Pre~1))
###########

plot(density(rnorm(5000)), col="red", lwd=2, main="")
lines(density(rt(5000, df=500)), col="green", lwd=2)

legend("topleft", c("T-dist","Normal"),fill=c("green","normal"))





##Binomial distribution


Pre_Bino=ifelse(Pre< 4.5, 0,1)
sum(Pre_Bino)

prop.test(sum(Pre_Bino), 50, conf.level = 0.95)
?prop.test

Population_Pre=ifelse(Data$Pre< 4.5, 0,1)
sum(Population_Pre)/length(Data$Pre)

##################


Post_Bino=ifelse(Post< 4.5, 0,1)
sum(Post_Bino)

prop.test(sum(Post_Bino), 50, conf.level = 0.95)

Population_Post=ifelse(Data$Post< 4.5, 0,1)
sum(Population_Post)/length(Data$Post)

