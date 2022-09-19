df <- read.csv("data_Unit14_Exampl1.csv")
colnames(df)
######################
sapply(df, class)
sapply(df, typeof)
#########################################################################################
barplot(df$Profit)
graphics.off()
barplot(df$Profit,width=2,space=1)
#########################################################################################
barplot(df$Profit,width=2,space=1,ylim=c(0,150),yaxt="n",main="Profit(in Crore)")
abline(h=50)
abline(h=100)
abline(h=150)
barplot(df$Profit,width=2,space=1,ylim=c(0,150),add=TRUE,yaxt="n")
##########################################################################################
width =2;space=1
n= length(df$Profit)
x1stbar <-  space*width + 0.5*width# x coord. of the midd of 1st bar
dx <- width + width*space
x1 <- seq(x1stbar,by=dx,length.out=n)

labs <- df$Year
text(cex=1,x=x1-2.0,y=0-20,labels=labs, xpd=TRUE, srt=45)# x=x1+0.25, y=0
barplot(datavector,width,space,ylim=my_ylim,add = TRUE,yaxt="n",xaxt="n")#,names.arg=df$Year,angle=90)
ytick<- c(0,50,100,150)
axis(side=2, at=ytick, labels = TRUE)
abline(h=0)
###########################################################################################

text(cex=1,x=x1,y=df$Profit+10,labels=df$Profit)



graphics.off()



