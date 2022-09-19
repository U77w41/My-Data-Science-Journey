## Demo Cumalative line chart
library(gapminder) # for gapminder dataset
library(plotly) # for plotly charts
library(dplyr)
library(purrr)

# Step: 1 Data Split - Chunk the data by year into separate dataframes
# One dataframe to multiple data frame
gapminder %>% 
  filter(country=="India") %>% 
  select(year, lifeExp) %>% 
  split(.$year) 

# Step : 2 Accumalate the data (past years + current)
# Recursively rbind the data frames
# Single Country
gapminder %>% 
  filter(country=="India") %>% 
  select(year, lifeExp) %>%
  split(.$year) %>%
  accumulate(~bind_rows(.x, .y)) %>%
  bind_rows(.id="frame") %>%
  plot_ly(x=~year, y=~lifeExp) %>% 
  add_trace(frame=~frame, showlegend=FALSE, mode='lines+markers')
  # add_lines(frame=~frame) 

  # add_markers(frame=~frame)
# add_markers(frame=~frame, showlegend=FALSE)


# Across Continents
gapminder %>% 
  select(continent, year, lifeExp) %>% 
  group_by(continent, year) %>% 
  summarise(avglifexp = mean(lifeExp)) %>% 
  split(.$year) %>%  
  accumulate(~bind_rows(.x, .y)) %>% 
  bind_rows(.id="frame") %>% 
  plot_ly(x=~year, y=~avglifexp) %>% 
  # add_trace(frame=~frame, showlegend=FALSE, mode='lines+markers')
  add_lines(frame=~frame, color = ~continent, fill="tozeroy") %>% 
  add_markers(frame=~frame) %>% 
  hide_legend()


