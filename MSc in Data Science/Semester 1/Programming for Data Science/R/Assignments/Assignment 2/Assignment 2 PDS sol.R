#read the covid file into a dataframe
#covid_india2 <- read.csv("../archive/covid_19_india.csv")
covid_india <-read.csv("covid_19_india.csv" , header= T , na.strings = "-")
head(covid_india)
nrow(covid_india)
str(covid_india)
table(covid_india$Time)
#1 merge the Date and Time columns into a single col and then convert
#(a)it into a POSIXlt date using strptime function inside a "within" function
#(b)attempt doing the same using dplyr
covid_baseR <- within(covid_india, {dt = paste(Date,Time,sep = " ")
dt_fmt1 = strptime(dt,tz = 'Asia',format = "%Y-%m-%d %H:%M %p")
dt_fmt2 = as.Date(Date)
rm(dt)})
head(covid_baseR)
str(covid_baseR)
#find the total number of rows in the dataset month-wise (you may use
#"months" function with a Date type column or "mon" component of 
#POSIXlt date column)
table(covid_baseR$dt_fmt1$mon)
table(months(covid_baseR$dt_fmt2))

covid_baseR$ConfirmedIndianNational <- as.numeric(covid_baseR$ConfirmedIndianNational)
covid_baseR$ConfirmedForeignNational <- as.numeric(covid_baseR$ConfirmedForeignNational)
str(covid_baseR)
#verify if the Confirmed column is the sum of the other two 
#Confirmed<...> columns
with(covid_baseR,table(Confirmed))
covid_baseR$ConfirmedTotal <- covid_baseR$ConfirmedIndianNational+
  covid_baseR$ConfirmedForeignNational
#find the average number of cases month-wise in dataset and arrange them
#starting from Jan to Dec (you may use month.name built-in constant for same)
# (a) using base R and barplot function
head(covid_baseR)
#first convert the cumulativeConfirmed column to per day Confirmed col 
#using diff function
###????? covid_baseR$CnfrmdPerDay <- diff(c(0,covid_baseR$Confirmed))
###################
#get all the state names
states <- unique(covid_baseR$State.UnionTerritory); states
#create an empty data frame of the same structure as the target dataframe
my_df <- covid_baseR[FALSE,]
#verify if the new empty data frame is of correct structure (optional step)
library(dplyr)
all_equal(my_df,covid_baseR)
#add another new confirmed per day (CPD) column
my_df <- cbind(my_df,CPD=integer(0))
str(my_df)
?order
rm
for(s in states){
  #tname <- print(paste0(s,"_data"))
  temp_df <- subset(covid_baseR,State.UnionTerritory == s)
  temp_df <- temp_df[order(temp_df$dt_fmt1),]
  temp_df$CPD <- diff(c(0,temp_df$Confirmed))
  my_df <- rbind(my_df,temp_df)
}
nrow(my_df)
write.csv(my_df,"my_df.csv")
max(my_df$CPD)
min(my_df$CPD)
##################
nrow(my_df)
t1 <- with(my_df,tapply(CPD, 
                        months(dt_fmt2), mean,na.rm=TRUE))[month.name]
t1
t1 <- as.data.frame(t1)
t1$month = row.names(t1)
barplot(t1$t1,names.arg = t1$month)
#(b) using dplyr and ggplot (try using coord_flip and coord_polar from examples)
# use theme function to rotate the x-axis labels to vertical or some angle
library(ggplot2)
avg_stat <- my_df %>% 
  mutate(mc1 = months(my_df$dt_fmt2), mc2 = factor(mc1,levels = month.name)) %>%
  group_by(mc2) %>% summarise(count = n(),avg_cases = mean(CPD))
avg_stat
library(ggplot2)
ggplot(avg_stat) + geom_bar(aes(x=mc2,y=avg_cases),stat = "identity") + 
  theme(axis.text.x=element_text(angle=45, hjust=1))
ggplot(avg_stat) + geom_bar(aes(x=mc2,y=avg_cases),stat = "identity") + coord_flip()
ggplot(avg_stat) + geom_bar(aes(x=mc2,y=avg_cases),stat = "identity") + coord_polar()
str(my_df)

#visualize the number of confirmed cases year wise but months stacked
#use format command to extract the year component or some other suitable technique
#before proceeding
avg_stat <- my_df %>% 
  mutate(mc1 = months(my_df$dt_fmt2), 
         mc2 = factor(mc1,levels = month.name),
         year = format(my_df$dt_fmt2,"%Y")) %>%
  group_by(year,mc2) %>% summarise(count = n(),avg_cases = mean(CPD))
avg_stat
ggplot(avg_stat) + geom_bar(aes(x=year,y=avg_cases,fill=mc2),stat = "identity")
ggplot(avg_stat) + 
  geom_bar(aes(x=year,y=avg_cases,fill=mc2),stat = "identity") +
  coord_polar()

#find state-wise the extremes in highs and lows (i.e. the largest
#fluctuation) in terms of cured, deaths and plot the same using ggplot
temp <- subset(my_df,select = c(State.UnionTerritory,Cured,Deaths,Confirmed))
head(temp)
rm(temp)
aggregate(cbind(Cured,Deaths,Confirmed) ~ State.UnionTerritory,my_df,sd)
sd_overall <- my_df %>% group_by(State.UnionTerritory) %>%
  summarise(cured_sd = sd(Cured), deaths_sd = sd(Deaths), cnf_sd = sd(Confirmed))
sd_overall
sd_overall %>% ggplot(aes(x=State.UnionTerritory,y=cured_sd))+
  geom_bar(stat = "identity") + coord_flip() 
my_df %>% ggplot(aes(x=State.UnionTerritory,y=Cured)) + 
  geom_boxplot() + coord_flip()
my_df %>% ggplot(aes(x=reorder(State.UnionTerritory,Cured,IQR),y=Cured)) + 
  geom_boxplot() + coord_flip()

#find the number of cases per month (or per quarter) and year wise 
#(Hint: explore months, quarters and format functions)
aggregate(CPD~ 
            quarters(dt_fmt2)+format(dt_fmt2,"%Y"),my_df,sum)
aggregate(CPD~ 
            months(dt_fmt2)+format(dt_fmt2,"%Y"),my_df,sum)
#plot the data using an appropriate plot - scatter
my_df %>% mutate(mo=months(dt_fmt2),yr=format(dt_fmt2,"%Y")) %>%
  group_by(yr,mo) %>% summarise(su = sum(CPD)) %>% 
  ggplot(aes(x=factor(mo,levels=month.name),y=su)) + geom_point() +
  facet_grid(~yr) + coord_flip()

#find the correlation of the no. of Cured and Deaths column 
#after grouping it year and month wise
t2 <- my_df %>% mutate(mo=months(dt_fmt2),yr=format(dt_fmt2,"%Y")) %>%
  group_by(yr,mo) %>% summarise(sumCured = sum(Cured),sumDeaths = sum(Deaths)) %>%
  mutate(mo = factor(mo,levels=month.name))
t2  
cor(t2$sumCured,t2$sumDeaths)
ggplot(t2,aes(sumCured,sumDeaths))+geom_point()+geom_smooth()+
  facet_grid(~yr)

#create line plots of no. of infections per day for different states
ggplot(covid_baseR, aes(dt_fmt2,Confirmed)) +
  geom_line(aes(colour=State.UnionTerritory))
#if you find the plot too messy try to filter based on states
#in alphabetical order e.g. states starting with A,B,C,D,E in one plot
# those starting with F,G,H, etc in second plot and so on
l <- levels(as.factor(covid_baseR$State.UnionTerritory));l
l_with_A <- l[1:4]
l_with_A
my_df %>% filter(State.UnionTerritory %in% l_with_A) %>%
  ggplot(aes(dt_fmt2,Confirmed)) +
  geom_line(aes(colour=State.UnionTerritory))
#create a new column which assigns "cat1" to the first 10 states arranged
#alphabetically, "cat2" to the next 10 and so on
#use this new column to facet the category-wise line plots into 
#the 5 categories, 
#i. direct substitution using multiple assignment operator
#ii. use custom function and call it using mapply (w/ or w/o dplyr)
my_df$state_vec[my_df$State.UnionTerritory %in% l[1:10]] <- "cat1"
my_df$state_vec[my_df$State.UnionTerritory %in% l[11:20]] <- "cat2"
my_df$state_vec[my_df$State.UnionTerritory %in% l[21:30]] <- "cat3"
my_df$state_vec[my_df$State.UnionTerritory %in% l[31:40]] <- "cat4"
my_df$state_vec[my_df$State.UnionTerritory %in% l[41:46]] <- "cat5"
table(my_df$State.UnionTerritory,my_df$state_vec)
my_df %>% ggplot(aes(dt_fmt2,Confirmed)) +
  geom_line(aes(colour=state_vec)) + 
  facet_grid(vars(state_vec))

f1 <- function(x){
  if (x %in% l[1:10]){
    "cat1"
  }else if (x %in% l[11:20]){
    "cat2"
  }else if (x %in% l[21:30]){
    "cat3"
  }else if (x %in% l[31:40]){
    "cat4"
  }else if (x %in% l[41:46]){
    "cat5"
  }
}
mapply(f1, my_df$State.UnionTerritory)[1:10]
covid_baseR$state_vec2 <- mapply(f1, covid_baseR$State.UnionTerritory)
table(covid_baseR$state_vec,covid_baseR$state_vec2)


#plot the fluctuations of per day confirmed cases statewise, order by
#amount of fluctuations (Hint: use IQR)
#hint: use boxplot
my_df %>% filter(CPD <100000) %>% ggplot(aes(reorder(State.UnionTerritory,Cured,IQR),CPD)) +
  geom_boxplot(aes(colour = State.UnionTerritory)) + 
  guides(x=guide_axis(angle = 90))+ theme(legend.position ="none") +
  xlab("fluctuations of per day cases") + ylab("per day confirmed cases")


#create a fluctuations (IQR) based 4 categories and plot them using geom_jitter
tapply(my_df$CPD , my_df$State.UnionTerritory, IQR)
quantile(tapply(my_df$CPD , my_df$State.UnionTerritory, IQR),
         seq(0,1,0.25))
ct <- cut(tapply(my_df$CPD , my_df$State.UnionTerritory, IQR),
          4,labels = paste0("iqr",1:4))
ct
nm <- names(tapply(my_df$CPD , my_df$State.UnionTerritory, IQR))
nm
iqr_list <- cbind(ct,nm); iqr_list
sort(tapply(my_df$CPD , my_df$State.UnionTerritory, IQR))

df1 <- aggregate(my_df$CPD , 
                 by=list(my_df$State.UnionTerritory), IQR)
df1
df1$buckets <- cut(df1$x,4,paste0("iqr",1:4))
df1
#or use functions
f1 <- function(x){
  if (IQR(x) %in% l[1:10]){
    "cat1"
  }else if (x %in% l[11:20]){
    "cat2"
  }else if (x %in% l[21:30]){
    "cat3"
  }else if (x %in% l[31:40]){
    "cat4"
  }else if (x %in% l[41:46]){
    "cat5"
  }
}
df1 %>% ggplot(aes(Group.1,buckets)) +
  geom_jitter() + guides(x=guide_axis(angle = 90))

#find the relationship between Confirmed cases per day and deaths
#per day where the confirmation is a positive number
#this plot has an ERROR!!! (as it is assumed Deaths is per day Death)
ggplot(my_df,aes(CPD,Deaths)) + geom_smooth(method = lm) +
  geom_point() + xlim(c(0,200000))

#find the relationship between deaths per day, confirmed per day,
#cured per day in a time series plot
#there seems to be some ERROR as "green" is missing!!!
my_df %>% 
  #filter(dt_fmt2>as.Date("2020-06-18") & 
  #                      dt_fmt2<as.Date("2020-11-05")) %>%
  group_by(dt_fmt2) %>% summarise(sumCnfd = sum(CPD),
                                  sumDeaths = sum(Deaths),
                                  sumCured = sum(Cured)) %>%
  ggplot()+geom_line(aes(dt_fmt2,sumCnfd),colour = 'blue') +
  geom_line(aes(dt_fmt2,sumDeaths),colour = 'red') 
geom_line(aes(dt_fmt2,sumCured),colour = 'green')