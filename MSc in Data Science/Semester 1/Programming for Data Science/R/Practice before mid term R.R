##### Practice
View(cars)

plot(cars) # for plotting a scatter plot
hist(cars$speed)
attach(cars)
#now we dont need to use the $ sign
hist(speed)
summary(cars)
summary(cars$speed)
summary(speed)
class(cars)
class(cars$speed)
length(cars$speed) # It tells us the no of rows in the speed cloumn
unique(cars$dist)
unique(cars$speed)   # Tells us all the unique values present in the data base
head(cars) # gives the first six rows of dataframe
tail(cars)    #gives us the last six rows of the data frame
cars[ , 2]   # Selecting the the 2nd row of the data frame
cars[1,]       # SELECTING THE 1ST ROW OF THE DATA FRAME
subset_of_cars <- cars[1:35, 1:2]

median(cars$dist , na.rm = T) # removing the missing elements and calculating the median of the distance column



############################################################3
library(tidyverse)
head(starwars)
#summary(starwars)
sw <- starwars %>%   #press ctrl + shif + m to write the pipe operator " %>% "
  select(name, height , mass , sex)  %>%   # for selecting the columns we need
  rename(weight = mass , gender = sex)  %>%  # renaming the mass column to weight (note: mass = weight will not work)
  na.omit()    %>%  # for removing all na values
  mutate(height = height*0.394/12) %>% # for getting heights in foot
  filter(gender == "male" | gender == "female") %>% # filter(gender %in% c("male", "female")) # this will do the same thing as above line
  mutate(gender = recode(gender ,       #this is for renaming male to M and female to F
                         male = 'M' ,   # here the remane function will not work
                         female = 'F')) %>% 
  mutate(size = height >6.4 & weight > 80 , # this is for assigning a new column for size 
              size = if_else(size == T , "Big" , "Small")) # this makes size == true to Big and else

head(sw)

View(sw)

View(starwars)





















