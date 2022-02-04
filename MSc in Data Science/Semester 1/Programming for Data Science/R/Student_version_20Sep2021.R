rm(list = ls())  # to clear the environment
########################
# https://cran.r-project.org/web/packages/dplyr/vignettes/dplyr.html
# https://www.youtube.com/watch?v=ANMuuq502rE
########################################################################################
#Introduction to dplyr : data from a csv file(copy of gapminder data)
########################################################################################
# RATHER THAN WORKING WITH A BUILT_IN DATASET (starwars) WE WILL WORK WITH A DATA STORED 
# IN  A CSV FILE
my_df <- read.csv("a_copy_of_gapminder_data.csv",row.names = 1)
colnames(my_df)
summary(my_df)
mean(my_df$gdpPercap)
mean(gdpPercap)   ##### Error msg
attach(my_df)
mean(gdpPercap)   ##### No Error msg
median(pop)   ##### No Error msg
###########################
hist(lifeExp)
hist(pop)
hist(log(pop))
########################### ignore two lines for today 20 Sept
boxplot(lifeExp ~ continent)
boxplot(lifeExp,continent)   ## Not correct see ?boxplot()
###########################
plot(gdpPercap,lifeExp)
plot(lifeExp,gdpPercap)
plot(lifeExp~gdpPercap) ##### Same results as from plot(gdpPercap,lifeExp)
########################################################################################
########################################################################################
########################################################################################
library(dplyr)
########################################################################################
#Rows:
#     filter() chooses rows based on column values.
#     slice() chooses rows based on location.
#     arrange() changes the order of the rows.
#Columns:
#     select() changes whether or not a column is included.
#     rename() changes the name of columns.
#     mutate() changes the values of columns and creates new columns.
#     relocate() changes the order of the columns.
#Groups of rows:
#     summarise() collapses a group into a single row.
########################################################################################
# pipe operator " %>% " #
my_df%>%
  select(country,lifeExp)

my_df%>%
  select(country,lifeExp)%>%
  filter(country=="South Africa" | country == "Ireland") %>%
  group_by(country)%>%
  summarise(Average_life = mean(lifeExp))

?mean()

my_df%>%
  select(country,lifeExp)%>%
  filter(country=="South Africa" | country == "Ireland") %>%
  group_by(country)%>%
  summarise(Average_life = mean(lifeExp,trim=1))
#######################################################################
subset_df <- my_df%>%
  select(country,lifeExp)%>%
  filter(country=="South Africa" | country == "Ireland")

summary(subset_df)
summarise(subset_df)

summarise(mean(subset_df))

summarise(mean(subset_df==lifeExp))

mean(subset_df$lifeExp)

mean(subset_df[country == "Ireland",subset_df$lifeExp])

subset_df$country == "Ireland"

subset_df$lifeExp[subset_df$country == "Ireland"]

mean(subset_df$lifeExp[subset_df$country == "Ireland"])

mean(subset_df$lifeExp[subset_df$country == "South Africa"])

######################################################################################
######################################################################################
India_data <- my_df%>%
  select(country,year,lifeExp,pop,gdpPercap)%>%
  filter(country=="India")

plot(India_data$year,India_data$pop)
plot(India_data$year,India_data$gdpPercap)
plot(India_data$year,India_data$lifeExp)
######################################################################################
######################################################################################
library(ggplot2)

my_df%>%
  filter(gdpPercap < 50000)%>%
  ggplot(aes(x=gdpPercap,y=lifeExp)) + geom_point()

my_df%>%
  filter(gdpPercap < 50000)%>%
  ggplot(aes(x=gdpPercap,y=lifeExp, col = continent)) + geom_point()


#change the value of alpha to change the opacity
my_df%>%
  filter(gdpPercap < 50000)%>%
  ggplot(aes(x=gdpPercap,y=lifeExp, col = continent)) + geom_point(alpha = 0.5)
# makes those poppulations boobles
my_df%>%
  filter(gdpPercap < 50000)%>%
  ggplot(aes(x=gdpPercap,y=lifeExp, col = continent , size = pop)) + geom_point(alpha = 0.5)


my_df%>%
  filter(gdpPercap < 50000)%>%
  ggplot(aes(x=gdpPercap,y=lifeExp, col = continent , size = pop)) + geom_point(alpha = 0.5) +
   geom_smooth()


my_df%>%
  filter(gdpPercap < 50000)%>%
  ggplot(aes(x=gdpPercap,y=lifeExp, col = continent , size = pop)) + geom_point(alpha = 0.5) +
  geom_smooth(method = lm)



my_df%>%
  filter(gdpPercap < 50000)%>%
  ggplot(aes(x=gdpPercap,y=lifeExp, col = continent , size = pop)) + geom_point(alpha = 0.5) +
  geom_smooth(method = lm) +
  facet_wrap(~continent)
  

my_df%>%
  filter(gdpPercap < 50000)%>%
  ggplot(aes(x=gdpPercap,y=lifeExp, size = pop , col = year)) + geom_point(alpha = 0.5) +
  geom_smooth(method = lm) +
  facet_wrap(~continent)
