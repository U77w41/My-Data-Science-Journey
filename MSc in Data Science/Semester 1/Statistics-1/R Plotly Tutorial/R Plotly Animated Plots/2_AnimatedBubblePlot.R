## Demo of the Gapminder style animated bubble chart
## Powered by R, Rstudio, Plotly, Gapminder libraries
## Code is tested on Mac OS and Windows


## Load the required libraries
library(gapminder) # for gapminder dataset
library(plotly) # for plotly charts and %>% pipe operator

## Install the packages if not already using install.packages() function.

## Size of the scatter data point will represent the population
## Color of the scatter data point will represent the continent

gapminder %>% 
  plot_ly() %>%  
  # add frame argument for animation and map to the variable needed on the timeline
  add_markers(x=~gdpPercap, y=~lifeExp, 
              frame=~year, 
              size = ~pop,
              color=~continent,
              marker=list(sizemode="diameter"),
              text=~paste("Life Expectancy: ", round(lifeExp,1), 
                          "<br>",
                          "GDP Per Capita:", round(gdpPercap,1), 
                          "<br>", 
                          "Country:", country, 
                          "<br>", 
                          "Population:", pop), 
              hoverinfo= "text") %>% 
  layout(title="Animated Plotly Bubble Plot",
         xaxis=list(title="GDP Per Capita (log scale)", type="log"),
         yaxis=list(title= "Life Expectancy"))
