rm(list = ls())
#####################################################################
#library(my_library)
source("my_library.R")
df <- read.csv("data_Unit14_Exampl1.csv")
colnames(df)
######################
sapply(df, class) ### EXTRA
sapply(df, typeof) #### EXTRA
######################
datavector <- df$Profit
xlabels <- df$Year
graphics.off()
width = 1
space = 0
hlines <- c(0,50,100,150)
my_yticks <- c(0,50,100,150)
my_ylim <- c(0,150)
xlabelsXpad = 1
xlabelsYpad = 20
xlabelsAng = 45

mybarplot(datavector,
          width,space=0,
          xlabels,xlabelsXpad=1,xlabelsYpad=20,xlabelsAng = 90,
          my_ylim,
          hlines,my_yticks)

graphics.off()
mybarplot_VER1(datavector,
               width=2,
               space=1,
               xlabels,
               xlabelsXpad,
               xlabelsYpad,
               xlabelsAng=45)
graphics.off()

mybarplot_VER1(datavector,
               width=2,
               space=1,
               xlabels,
               xlabelsXpad,
               xlabelsYpad,
               xlabelsAng=30,my_yticks=my_yticks)