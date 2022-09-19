rm(list = ls())
graphics.off()
set.seed(123457)
sample<- rweibull(5000, shape=1, scale = 2) + 10
write.table(sample, file = "data_for_distr_fitting.txt",sep = "\t", row.names=FALSE,col.names=FALSE)#, sep = " ")
m <- matrix(scan("data_for_distr_fitting.txt",skip=0),ncol=1,byrow=T)
x <- m[,1]
hist(x,breaks = 100)
summary(x)

