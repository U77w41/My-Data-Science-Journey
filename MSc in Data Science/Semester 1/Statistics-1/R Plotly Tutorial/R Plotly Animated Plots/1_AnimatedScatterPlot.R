## Demo of an animated Scatter Plotly chart with year timeline
## Powered by R, Rstudio, Plotly, Dplyr, Gapminder libraries
## Code is tested on Mac OS and Windows

## Import required libraries
## If packages are not installed, install the packages using install.packages() function
library(gapminder) # to access gapminder dataset
library(plotly) # for plotly charts, pipe % operator
library(dplyr) # for any data manipulation operations; we used filter()


# install.packages() ; if the package is not already installed

## Quick glance of gapminder dataset through the str()
gapminder %>% 
  str()


## Scatter plot for a specific year 2002
gapminder %>% 
  filter(year==2002) %>%  # filter data for the year 2002
  plot_ly() %>% 
  add_markers(x=~gdpPercap, y=~lifeExp) %>% 
  ## Add title to the plot, and axis. Apply log transformation to the x axis
  layout(title="Plotly Scatter Plot",
         xaxis=list(title="GDP Per Capita (log scale)", type="log"),
         yaxis=list(title= "Life Expectancy")) %>% 
  hide_legend()


## Creating animation using the frame argument
## Frame is transitioned over the years to bring a smooth animation effect
gapminder %>% 
  plot_ly() %>%  
  # add frame argument for animation and map to the variable needed on the timeline
  add_markers(x=~gdpPercap, y=~lifeExp, 
              frame=~year, 
              text=~paste("Life Expectancy: ", round(lifeExp,1), 
                          "<br>", 
                          "GDP Per Capita:", round(gdpPercap,1), 
                          "<br>", 
                          "Country:", country), 
              hoverinfo= "text") %>% 
  layout(title="Animated Plotly Scatter Plot",
         xaxis=list(title="GDP Per Capita (log scale)", type="log"),
         yaxis=list(title= "Life Expectancy")) %>% 
  hide_legend()
