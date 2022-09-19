rm(list = ls())
graphics.off()
###########################################################################
m <- matrix(scan("data_for_distr_fitting_8.txt",skip=0),ncol=1,byrow=T)
usesample <- m[,1]
hist(usesample,breaks = 100)
summary(usesample)
###########################################################################
library(fitdistrplus)
par( mfrow = c( 1,1 ) )
dev.new() #### FIGURE 07
descdist(usesample)#,boot = 1000)