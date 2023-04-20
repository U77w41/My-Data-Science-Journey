
setwd("C:/Users/HP/Desktop/SL/Data")

Data=read.csv("Data.csv")

Pre=sample(Data$Pre, 50, replace=T)
Post=sample(Data$Post, 50, replace=T)


#Hypothesis testing with a single population
install.packages("BSDA")
library(BSDA)
z.test(Pre,mu=4.5, alternative = "two.sided", conf.level = 0.95, sigma.x = sd(Data$Pre) )
qnorm(p=0.05/2, lower.tail = T)
?qnorm
mean(Data$Pre)
z.test(Pre,mu=4.5, alternative = "greater", conf.level = 0.95, sigma.x = sd(Data$Pre) )


z.test(Pre,mu=4.5, alternative = "less", conf.level = 0.95, sigma.x = sd(Data$Pre) )
qnorm(p=0.05, lower.tail = T)
mean(Data$Pre)
#################################t-test when population variance is not known

t.test(Pre, mu=4.5,alternative = "two.sided", conf.level = 0.95 )

DOF=length(Pre)-1
qt(p=0.05/2, df=DOF, lower.tail = T)

#########
t.test(Pre, mu=4.5,alternative = "greater", conf.level = 0.95 )

t.test(Pre, mu=4.5,alternative = "less", conf.level = 0.95 )
qt(p=0.05, df=DOF, lower.tail = T)

z.test(Post,mu=4.5, alternative = "two.sided", conf.level = 0.95, sigma.x = sd(Data$Post) )
qnorm(p=0.05/2, lower.tail = F)
#quite obvious that critical value corresponding to 5% would be less
z.test(Post,mu=4.5, alternative = "greater", conf.level = 0.95, sigma.x = sd(Data$Post) )
qnorm(p=0.05, lower.tail = F)

z.test(Post,mu=4.5, alternative = "less", conf.level = 0.95, sigma.x = sd(Data$Post) )

mean(Data$Post)
#################################t-test when population variance is not known
t.test(Post, mu=4.5,alternative = "two.sided", conf.level = 0.95 )
qt(p=0.05/2, df=DOF, lower.tail = F)
t.test(Post, mu=4.5,alternative = "greater", conf.level = 0.95 )
qt(p=0.05, df=DOF, lower.tail = F)

t.test(Post, mu=4.5,alternative = "less", conf.level = 0.95 )
########################################################################################################
#######################working with two samples
z.test(Pre, Post, alternative = "two.sided", conf.level = 0.95, sigma.x = sd(Data$Pre), sigma.y = sd(Data$Post) )
qnorm(p=0.05/2, lower.tail = T)
#quite obvious that critical value corresponding to 5% would be less
z.test(Pre, Post, alternative = "greater", conf.level = 0.95, sigma.x = sd(Data$Pre), sigma.y = sd(Data$Post) )

z.test(Pre, Post, alternative = "less", conf.level = 0.95, sigma.x = sd(Data$Pre), sigma.y = sd(Data$Post) )
qnorm(p=0.05, lower.tail = F)

mean(Data$Pre)-mean(Data$Post)
##iwth 95% confidence , there is a 5% chance that we may incorrectly 
#rerject the null when it is actually true

#################################t-test when population variance is not known


t.test(Pre, Post,alternative = "two.sided", conf.level = 0.95 )
qt(p=0.05/2, df=DOF, lower.tail = T)
#critical value corresponding to 95% would be less
t.test(Pre, Post,alternative = "greater", conf.level = 0.95 )
t.test(Pre, Post,alternative = "less", conf.level = 0.95 )
qt(p=0.05, df=DOF, lower.tail = T)

################################################################
#############################################################################
##########################Proportions
Pre_Bino=ifelse(Pre< 4.5, 0,1)
prop.test(sum(Pre_Bino), 50, conf.level = 0.95, alternative = "two.sided")
qchisq(0.95, 1)

prop.test(sum(Pre_Bino), 50, conf.level = 0.95, alternative = "greater")


prop.test(sum(Pre_Bino), 50, conf.level = 0.95, alternative = "less")
qchisq(0.90, 1)
qchisq(1-2*0.0599,1)
##############################Post sample data

Post_Bino=ifelse(Post< 4.5, 0,1)
prop.test(sum(Post_Bino), 50, conf.level = 0.95, alternative = "two.sided")
qchisq(0.95, 1)

prop.test(sum(Post_Bino), 50, conf.level = 0.95, alternative = "greater")
qchisq(0.999999993, 1)

prop.test(sum(Post_Bino), 50, conf.level = 0.95, alternative = "less")


#######################################
###########################Two sample tests of population proportion using
#

prop.test(x=c(sum(Post_Bino),sum(Pre_Bino) ), n=c(50,50), conf.level = 0.95, alternative = "two.sided")


prop.test(x=c(sum(Post_Bino),sum(Pre_Bino) ), n=c(50,50), conf.level = 0.95, alternative = "greater")


prop.test(x=c(sum(Post_Bino),sum(Pre_Bino) ), n=c(50,50), conf.level = 0.95, alternative = "less")


#######################################