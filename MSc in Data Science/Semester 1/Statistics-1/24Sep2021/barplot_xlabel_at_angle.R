x <- barplot(table(mtcars$cyl), xaxt="n")
labs <- paste(names(table(mtcars$cyl)), "cylinders")
text(cex=1, x=x-.25, y=-1.95, labs, xpd=TRUE, srt=45)
abline(0,0)

################################################################ 
df <- read.csv("data_Unit14_Exampl1.csv")
df
colnames(df)
barplot(df$Profit,width=2,space=1,names.arg=df$Year,angle=90,yaxt="n")
labs <- df$Year
text(cex=1, x=x-.25, y=-2.95, labs, xpd=TRUE, srt=45)
abline(0,0)
################################################################
barplot(df$Profit,width=2,space=1,ylim=c(0,150),yaxt="n")#,names.arg=df$Year,angle=90)
labs <- df$Year
x1 <- seq(1,37,4)#c(1,3,5,7,9,11,13,15,17,19)+2
text(cex=1, x=x1+0.25, y=0, labs, xpd=T, srt=45)
text(cex=1, x=x1+2.25, y=df$Profit + 5, df$Profit)
abline(h=0)#(0,0)
abline(h=50)#(50,0,)
abline(h=100)#(100,0)
abline(h=150)#(150,0)
# Following will 
barplot(df$Profit,width=2,space=1,ylim=c(0,150),add = TRUE,yaxt="n")#,names.arg=df$Year,angle=90)
ytick<- c(0,50,100,150)#seq(0, 100, by=50)
axis(side=2, at=ytick, labels = TRUE)
abline(v=2)
abline(v=4)
abline(v=6)
#########################################################################################
n <- length(df$Year)
width0 <- 2
#space: the amount of space (as a fraction of the average bar width) left before each bar.
space0 <- 1
x1stbar <-  width0 + 0.5*width0# x coord. of the midd of 1st bar
dx <- width0 + width0*space0
x1 <- seq(x1stbar,by=dx,length.out=n)
########################################################################################
datavector <- df$Profit
xlabels <- df$Year
mybarplot <- function(datavector,xlabels,width,space){
  n <- length(df$Year)
  width0 <- 2
  #space: the amount of space (as a fraction of the average bar width) left before each bar.
  space0 <- 1
  x1stbar <-  width0 + 0.5*width0# x coord. of the midd of 1st bar
  dx <- width0 + width0*space0
  x1 <- seq(x1stbar,by=dx,length.out=n)
  ###############################################
  barplot(df$Profit,width=2,space=1,ylim=c(0,150),yaxt="n")#,names.arg=df$Year,angle=90)
  labs <- df$Year
  x1 <- seq(1,37,4)#c(1,3,5,7,9,11,13,15,17,19)+2
  text(cex=1, x=x1+0.25, y=0, labs, xpd=TRUE, srt=45)
  text(cex=1, x=x1+2.25, y=df$Profit...in..Rs..crore. + 5, df$Profit...in..Rs..crore.)
  abline(h=0)#(0,0)
  abline(h=50)#(50,0,)
  abline(h=100)#(100,0)
  abline(h=150)#(150,0)
  # Following will 
  barplot(df$Profit,width=2,space=1,ylim=c(0,150),add = TRUE,yaxt="n")#,names.arg=df$Year,angle=90)
  ytick<- c(0,50,100,150)#seq(0, 100, by=50)
}

