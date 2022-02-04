################

# Loading pakages
#install.packages("tidyverse")
library(tidyverse)
#Reading the data
# data1 <-read.csv(file.choose(), header=TRUE)
View(data1)
# data2 <- read.csv(file.choose(), header=TRUE)
View(data2)
colnames(data1) = colnames(data2)
colnames(data1) == colnames(data2)
data <- rbind.data.frame(data1,data2)
View(data)
nrow(data)

#Cleaning the data
colnames(data)
# # removing "transgendrs"
# d <- data %>% filter(What.is.your.sex. == c("Male" , "Female"))
# View(d)



# removing some outliiers


# remoiving all those rows where total family income < expendatre

df1 <- data %>% filter((How.much.money.do.you.spend.to.maintain.fitness..i.e..for.diet..gym..nutrients.etc..in.total..in.a.month. - What.is.your.monthly.family.income.) <0)

View(df1)



# Removing the column Timestamp

rmv <- c("Timestamp" )
df2 <- df1[,!(colnames(data) %in% rmv)]
View(df2)

f1 <- function(clnm){
  for(i = 1 : nrow(clnm)){
  if (clnm[i] > 7){
    clmn[i] = clnm[i]/30.48    
  }
}
}
a1 <-subset(df2,What.is.your.height..in.feet..> 7) 
nrow(a1)

b <- c(654265,7,0,3,4,1,3232,234,34,2,3,4,2)

df3 <- lapply(b,f1)

