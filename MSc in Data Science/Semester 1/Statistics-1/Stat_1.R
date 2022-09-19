#
data()
## example of data set
head(swiss)
write.csv(swiss,file="copy_of_swiss_data.csv")

#####
df <- read.csv("copy_of_swiss_data.csv")
df
df1 <- data.frame(df2[,-1], row.names = df)
head(df)
tail(df)

as.data.frame(colnames(df))
summary(df)


########################################################################
attach(swiss)  # same as using data_frame like df$Agriculture 
plot(Agriculture,Education)

plot(Agriculture,Education , xlab = 'x level' , ylab = 'y level')

plot(Agriculture,Education , xlab = 'x level' , ylab = 'y level' , main = 'title')







c <- c("a" , "b" , "c")
       
n <- c(12 , 23 , 43)

library(plotrix)











######################################
#3d Pie Chart

library(plotrix)
pie3D()
