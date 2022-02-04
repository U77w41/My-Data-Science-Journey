data(mtcars)
cars <- mtcars
head(cars)
#boxplot(cars$Consumtion.Kpl ~ cars$Transmission, data = mtcars,
boxplot(cars$mpg~cars$am, data = mtcars,        
        col = c("dark grey", "light grey"),
        xlab = "Transmission",
        ylab = "KPL",
        main = "Average Fuel consumption(Kpl() by transmission")


data(mtcars)
data(mtcars)
cars <- mtcars
head(cars)
##############################
data1 <- cars$mpg[cars$am==0]
data2 <- cars$mpg[cars$am==1]
# length(data1);length(data2);length(cars$mpg)
# NOTE: length(data1) + length(data2) = length(cars$mpg)
data <- data1

####################################################################################
boxplot(data,        
        col = c("dark grey", "light grey"),
        xlab = "Transmission",
        ylab = "KPL",
        main = "Average Fuel consumption(Kpl() by transmission",
        notch=TRUE)
#################################
#abline(v=1.2);abline(v=1);abline(v=0.8)
####### (1) Adding mean
means <- mean(data)
points(means,col="red",pch=18)

###### (2) Median: arrow and text
xStart1 <- 1.2
yStart1 <- median(data)
xEnd1 <- 1.3
yEnd1 <- median(data)
arrows(xStart1,yStart1,xEnd1,yEnd1, col = "red")
text(xEnd1,yEnd1,"Median",adj=0)

# ###### (3) Min: arrow and text
# xStart1 <- 1.2
# yStart1 <- min(data)
# xEnd1 <- 1.3
# yEnd1 <- min(data)
# arrows(xStart1,yStart1,xEnd1,yEnd1, col = "re

###### (3) Max: arrow and text
xStart1 <- 1.2
yStart1 <- max(data)
xEnd1 <- 1.3
yEnd1 <- max(data)
arrows(xStart1,yStart1,xEnd1,yEnd1, col = "red")
text(xEnd1,yEnd1,"Maximum",adj=0)

###### (4) Q1: arrow and text
xStart1 <- 1.2
yStart1 <- quantile(data)[2]
xEnd1 <- 1.3
yEnd1 <- quantile(data)[2] #-0.2
arrows(xStart1,yStart1,xEnd1,yEnd1, col = "red")
text(xEnd1,yEnd1,"Q1",adj=0)

###### (5) Q2: arrow and text
xStart1 <- 1.2
yStart1 <- quantile(data)[4]
xEnd1 <- 1.3
yEnd1 <- quantile(data)[4] #+0.2
arrows(xStart1,yStart1,xEnd1,yEnd1, col = "red")
text(xEnd1,yEnd1,"Q3",adj=0)
####################################################################################
####################################################################################
####################################################################################
q5 <- quantile(data)
IQR13 <- q5[4] - q5[2]

notch_up <- median(data) + 1.57*IQR13/sqrt(length(data))
notch_dn <- median(data) - 1.57*IQR13/sqrt(length(data))

text_up <- expression(median+
                        text(xEnd1,yEnd1,text_dn,adj=0)
                      
                      
                      
                      
                      
                      
                      
                      q5 <- quantile(data)
                      IQR13 <- q5[4] - q5[2]
                      
                      notch_up <- median(data) + 1.57*IQR13/sqrt(length(data))
                      notch_dn <- median(data) - 1.57*IQR13/sqrt(length(data))
                      
                      text_up <- expression(median+1.57*frac(IQR,sqrt(n)))
                      text_dn <- expression(median-1.57*frac(IQR,sqrt(n)))
                      #####################
                      xStart1 <- 1.2
                      yStart1 <- notch_up
                      xEnd1 <- 1.3
                      yEnd1 <- notch_up#+0.2
                      arrows(xStart1,yStart1,xEnd1,yEnd1, col = "red")
                      text(xEnd1,yEnd1,text_up,adj=0)
                      #####################
                      xStart1 <- 1.2
                      yStart1 <- notch_dn
                      xEnd1 <- 1.3
                      yEnd1 <- notch_dn
                      arrows(xStart1,yStart1,xEnd1,yEnd1, col = "red")
                      text(xEnd1,yEnd1,text_dn,adj=0)
                      
