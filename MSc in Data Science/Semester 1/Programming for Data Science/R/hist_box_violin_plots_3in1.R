rm(list=ls())
set.seed(14012021)
#install.packages("vioplot")
library(vioplot)
##### seed??????????????????

mu<-2
si<-0.6
bimodal<-c(rnorm(1000,-mu,si),rnorm(1000,mu,si))
uniform<-runif(2000,-4,4)
normal<-rnorm(2000,0,3)
#######################################################
data1 <- bimodal
par(mfrow=c(3,1))
hist(data1,freq=FALSE,xlim = c(-4.0,4.0))
d <-density(data1)
lines(d,lwd=2,col="red")
boxplot(data1,horizontal = TRUE,notch = TRUE)#,xlim = c(-4.0,4.0))
vioplot(data1,horizontal = TRUE)#,xlim = c(-4.0,4.0))
abline(v=mean(data1), col="blue")
abline(v=median(data1), col="red")


##############################################################

# ##########################################################################################
# par(mfrow=c(1,3)) 
# hist(uniform)
# hist(bimodal)
# hist(normal)
# 
# ##########################################################################################
# layout(matrix(c(1:2), 2, 1,
#               byrow = TRUE))
# hist(beaver1$temp, # histogram
#      col = "peachpuff", # column color
#      border = "black",
#      prob = TRUE, # show densities instead of frequencies
#      xlim = c(36,38.5),
#      ylim = c(0.0,3.0), ###########################
#      xlab = "temp",
#      main = "Beaver #1")
# lines(density(beaver1$temp), # density plot
#       lwd = 2, # thickness of line
#       col = "chocolate3")
# hist(beaver2$temp, # histogram
#      col = "peachpuff", # column color
#      border = "black",
#      prob = TRUE, # show densities instead of frequencies
#      xlim = c(36,38.5),
#      xlab = "temp",
#      main = "Beaver #2")
# lines(density(beaver2$temp), # density plot
#       lwd = 2, # thickness of line
#       col = "chocolate3")