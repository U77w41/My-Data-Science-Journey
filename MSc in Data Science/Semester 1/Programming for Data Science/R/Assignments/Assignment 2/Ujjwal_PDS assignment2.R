
# Q1. read the covid file into a dataframe
cv19 <- read.csv("covid_19_india.csv" , header= T) 


# Q2. merge the Date and Time columns into a single col and then convert
# (a)it into a POSIXlt date using strptime function inside a "within" function
# (b)attempt doing the same using dplyr

# (a)

cv19$Date_Time <- strptime((paste( cv19$Date , cv19$Time)) ,  "%Y-%m-%d  %I:%M") 

class(cv19$Date_Time)

# (b)

library(dplyr)
 cv19 <- mutate(cv19, d_t =as.POSIXlt(paste(Date , Time)))

class(cv19$d_t)

# Q3. find the total number of rows in the dataset month-wise 
# (you may use "months" function with a Date type column or "mon"
#   component of POSIXlt date column)
cv19 %>% group_by(months(cv19$d_t)) %>%tally()

# Q4. Find the average number of cases month-wise in dataset and arrange them 
# starting from Jan to Dec (you may use month.name built-in constant for same)
# (a) using base R and barplot function (first convert the cumulative Confirmed column
#     to per day Confirmed col using diff function)
# (b) using dplyr and ggplot (try using coord_flip and coord_polar from examples & 
#     use theme function to rotate the x-axis labels to vertical or some angle)

# (a)
library(lubridate)
avg <- aggregate(Confirmed~months(cv19$d_t)+year(cv19$d_t) ,cv19,mean)

colnames(avg) <- c("Months","Year","Average_Confirmed")
avg$Months <- factor(avg$Months, month.name, ordered=TRUE)
avg[order(avg$Months), ]

# (b)
 
avg %>%
  ggplot(aes(x = Months, y = Average_Confirmed, fill = Months)) +
  geom_bar(stat = 'identity') + 
  coord_polar() 




# Q5. Visualize the number of confirmed cases year wise but months stacked 
# (use format command to extract the year component or some other suitable 
#   technique before proceeding)


v1 <- aggregate(Confirmed~months(d_t)+year(d_t) ,cv19,sum) ; v1 ; class(v1)
colnames(v1) <- c("Months","Year","Confirmed")

v1$Months <- factor(v1$Months, month.name, ordered=TRUE)
v1[order(v1$Months), ]

v1 %>%
  ggplot(aes(x = Months , y = Confirmed)) +
  geom_point( data = v1)  + 
  facet_wrap(~Year)




# Q6. Find state-wise the extremes in highs and lows (i.e. the largest fluctuation) 
#     in terms of cured, deaths and plot the same using ggplot

# 
# # Month
# v1 <- aggregate(Confirmed~months(d_t)+year(d_t) ,cv19,sum)
# colnames(v1) <- c("Months","Year","Confirmed")
# v1$Months <- factor(v1$Months, month.name, ordered=TRUE)
# v1[order(v1$Months), ]

# 



# Q7. Find the number of cases per month (or per quarter) and year wise 
#     (Hint: explore months, quarters and format functions)

# Month wise

View(cv19) 
cv19
v1 <- aggregate(Confirmed~months(d_t)+year(d_t) ,cv19,sum)
colnames(v1) <- c("Months","Year","Confirmed")
v1$Months <- factor(v1$Months, month.name, ordered=TRUE)
v1[order(v1$Months), ]


# Year Wise

y1 <- aggregate(Confirmed~year(d_t) ,cv19,sum)
colnames(y1) <- c("Year","Confirmed") ; y1




# Q8. Plot the data in Q7 using an appropriate plot - scatter

plot(x = y1$Year , y = y1$Confirmed)

v1 %>%
  ggplot(aes(x = Months , y = Confirmed)) +
  geom_point( data = v1)  + 
  facet_wrap(~Year)



# Q9. Find the correlation of the no. of Cured and Deaths column 
#     after grouping it year and month wise

v0c <- aggregate(Cured~months(d_t)+year(d_t) , cv19 ,sum)
colnames(v0c) <- c("Months","Year","Cured") ; v0c
v0d <- aggregate(Deaths~months(d_t)+year(d_t) , cv19 ,sum)
colnames(v0d) <- c("Months","Year","Death") ; v0d

vcd <- data.frame(v0c , v0d$Death) 
colnames(vcd) <-c("Months","Year", "Cured" , "Death") ; vcd

v0cd <- subset(vcd ,Year <= 2020) ; v0cd
v1cd <- subset(vcd, Year > 2020)  ; v1cd


cr20 <- cor.test(v0cd$Cured, v0cd$Death, method = "pearson") ; cr20

cr21 <- cor.test(v1cd$Cured, v1cd$Death, method = "pearson") ; cr21


# Q10. Create line plots of no. of infections per day for different states

  ggplot(data = cv19 ,aes(x = Date , y = ConfirmedIndianNational)) +
  geom_line()  + 
  facet_wrap(~State.UnionTerritory)





# Q11. If you find the plot in Q10 too messy try to filter based on states in 
#      alphabetical order e.g. states starting with A,B,C,D,E in one plot 
#      those starting with F,G,H, etc in second plot and so on.


state <- as.factor(cv19$State.UnionTerritory) ; state
date <- as.Date(cv19$Date) ; date
con <- cv19$ConfirmedIndianNational ; con


q11 <- data.frame(state,date,con)

a2e <- q11 %>% 
  filter(substr(state, 1, 1) == c("A", "B" , "C" , "D", "E"))
a2es <- subset(a2e , select = -state)
# A to E
plot(a2es$date , a2es$con , type = "b")


f2j <- q11 %>% 
  filter(substr(state, 1, 1) == c("F", "G" , "H" , "I", "J"))
f2js <- subset(a2e , select = -state)
# F to J
plot(f2js$date , f2js$con , type = "b")


k2o <- q11 %>% 
  filter(substr(state, 1, 1) == c("K", "L" , "M" , "N", "O"))
k2os <- subset(k2o , select = -state)
# K to O
plot(k2os$date , k2os$con , type = "b")



p2t <- q11 %>% 
  filter(substr(state, 1, 1) == c("P", "Q" , "R" , "S", "T" ))
p2ts <- subset(p2t , select = -state)
# P to T
plot(p2ts$date , p2ts$con , type = "b")




u2z <- q11 %>% 
  filter(substr(state, 1, 1) == c("U", "V" , "W" , "x" , "Y" , "Z"))
u2zs <- subset(u2z , select = -state)
# A to E
plot(u2zs$date , u2zs$con , type = "b")



# Q12. Create a new column which assigns "cat1" to the first 10 states 
#      arranged alphabetically, "cat2" to the next 10 and so on. use this new column to 
#      facet the category-wise line plots into the 5 categories, using

#   i. direct substitution with multiple assignment operators
#   ii. custom function and call it using mapply (w/ or w/o dplyr)


f_ten <- rbind(a2e,f2j) ; f_ten #; View(f_ten)
f_ten$Cat <- rep("Cat1" , times = nrow(f_ten) ) 

s_ten <- rbind(k2o,p2t) ; s_ten
s_ten$Cat <- rep("Cat2" , times = nrow(s_ten) ) #; View(s_ten)

l_8 <- u2z ; l_8
l_8$Cat <- rep("Cat3" , times = nrow(l_8) ) #; View(l_8)

df1<- rbind(f_ten , s_ten , l_8) ; View(df1)

ggplot(data = df1 ,aes(x = date , y = con)) +
  geom_line()  + 
  facet_wrap(~Cat)







# Q13. Plot the fluctuations of per day confirmed cases statewise, 
#      order by amount of fluctuations (Hint: use IQR) hint: use boxplot
cv19
cv19 %>% 
  group_by(State.UnionTerritory) %>%
  summarise(c_p_d = c(0,diff(Confirmed))) %>%
  ggplot(aes(x =State.UnionTerritory, y = c_p_d)) +
  geom_boxplot()








# Q14. Create a fluctuations (IQR) based 4 categories and plot them using geom_jitter













# Q15. Find the relationship between Confirmed cases per day and deaths 
#      per day where the confirmation is a positive number












# Q16. Find the relationship between deaths per day, confirmed per day, 
#      cured per day in a time series plot

library(tidyr)
library(dplyr)
pt <- cv19 %>%
  select(d_t, Deaths, Cured, Confirmed)
 head(pt, 3)

 ggplot(cv19, aes(x = month(Date_Time))) + 
   geom_line(aes(y = Deaths) , color = "red") +
   geom_line(aes(y =Cured),color = "green")  +
   geom_line(aes(y =Confirmed),color = "blue")






# Q17. Frame 4 more interesting questions and plot them using appropriate plots.











