## Animated bubble chart with year timeline
## Size of the bubble will represent the population
## Color of the bubble will represent the continent
## Add text
## Add Pause button

library(gapminder) # for gapminder dataset
library(plotly) # for plotly charts

gapminder %>% 
  plot_ly(x=~gdpPercap, y=~lifeExp) %>% 
  add_markers(frame=~year, 
              ids=~country,
              size = ~pop,
              color=~continent,
              text = ~country,
              hoverinfo = "text", 
              marker=list(sizemode="diameter")) %>% 
  layout(title="Animated Bubble Plotly Chart",xaxis=list(title="GDP Per Capita (log scale)", type="log"),
         yaxis=list(title= "Life Expectancy")) %>% 
  animation_button(label = "Click me!",
                   x=1,
                   y=1,
                   xanchor="right",
                   yanchor="bottom") %>% 
  animation_opts(frame = 700, 
                 transition = 350, 
                 easing="linear", 
                 redraw = FALSE) %>% 
  animation_slider(hide=F, 
                   currentvalue=list(prefix=NULL,
                                     font = list(color="GREY", size=30)))
