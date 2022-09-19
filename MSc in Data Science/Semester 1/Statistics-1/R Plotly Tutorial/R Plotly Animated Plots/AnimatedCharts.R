## Animated Charts
library(dplyr) # for data manipulation
library(plotly) # for plotly charts
library(purrr) # for cumulative dataset
library(crosstalk) # for plot linking
library(gapminder) # for gapminder dataset


## Animated Scatter Chart with year timeline
gapminder %>% 
  plot_ly(x=~gdpPercap, y=~lifeExp) %>% 
  add_markers(frame=~year, ids=~country, showlegend = FALSE) %>% 
  layout(title="Animated Scatter Plotly Chart",
         xaxis=list(title="GDP Per Capita", type="log"),
         yaxis=list(title= "Life Expectancy"))


## Animated bubble chart with year timeline
## Size of the bubble will represent the population
## Color of the bubble will represent the continent
## Add text
## Add Pause button

gapminder %>% 
  plot_ly(x=~gdpPercap, y=~lifeExp) %>% 
  add_markers(frame=~year, 
              ids=~country,
              size = ~pop,
              color=~continent,
              text = ~country,
              hoverinfo = "text", 
              marker=list(sizemode="diameter")) %>% 
  layout(title="Animated Scatter Plotly Chart",xaxis=list(title="GDP Per Capita", type="log"),
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
## xanchor = right , left
## yanchor = top, bottom, middle
## time lapse between each frame ~700ms
## each frame pause for ~350ms
## Easing options : linear, bounce, quad,sin,exp, circle,back,cubic,elastic
## Continents on timeline for the year 2002
gapminder %>% 
  filter(year=="2002") %>% 
  plot_ly(x=~gdpPercap, y=~lifeExp) %>% 
  add_markers(frame=~continent, 
              ids=~country,
              size = ~pop,
              color=~continent,
              marker=list(sizemode="diameter"),
              showlegend = FALSE) %>% 
  layout(title="Animated Scatter Plotly Chart",xaxis=list(title="GDP Per Capita"),
         yaxis=list(title= "Life Expectancy"))

##### Animation Options
## Slider appearance
## Frame transition
## Time between frames


##### Plotting options
# Glyph color, shape and size
# Axis labels, transformations
# Tool tips / hover text


gapminder %>% 
  plot_ly(x=~log(gdpPercap), y=~lifeExp) %>% 
  add_markers(frame=~year, 
              ids=~country,
              size = ~pop,
              color=~continent,
              text = ~paste(country, gdpPercap),
              hoverinfo = "text", 
              marker=list(sizemode="diameter")) %>% 
  layout(title="Animated Scatter Plotly Chart",xaxis=list(title="GDP Per Capita (log)"),
         yaxis=list(title= "Life Expectancy")) 



## With text layer
gapminder %>% 
  plot_ly(x=~gdpPercap, y=~lifeExp) %>% 
  add_text(x=60000,
           y=50,
           text=~year,
           frame=~year,
           textfont=list(size=100, color=toRGB("gray80"))) %>%  
  add_markers(frame=~year, 
              ids=~country,
              size = ~pop,
              color=~continent,
              text = ~country,
              hoverinfo = "text", 
              marker=list(sizemode="diameter")) %>% 
  layout(title="Animated Scatter Plotly Chart",xaxis=list(title="GDP Per Capita", type="log"),
         yaxis=list(title= "Life Expectancy")) %>% 
  animation_slider(hide=TRUE)


# Step: 1 Data Split - Chunk the data by year into separate dataframes
# One dataframe to multiple data frame
gapminder %>% 
  filter(country=="Afganistan") %>% 
  select(year, lifeExp) %>% 
  split(.$year) 

# Step : 2 Accumalate the data (past years + current)
# Recursively rbind the data frames

gapminder %>% 
  filter(country=="China") %>% 
  select(year, lifeExp) %>% 
  split(.$year) %>%  
  accumulate(~bind_rows(.x, .y)) %>% 
  bind_rows(.id="frame") %>% 
  plot_ly(x=~year, y=~lifeExp) 
# add_trace(frame=~frame, showlegend=FALSE, mode='lines+markers')
# add_lines(frame=~frame, showlegend=FALSE) %>% 
# add_markers(frame=~frame, showlegend=FALSE)



# Animated bar chart
storms %>% 
  count(year, status) %>%
  plot_ly(x=~n , y =~status, color=~status) %>% 
  add_bars(frame=~year) %>% 
  layout(barmode="stack")

# Commulative animated line plot
storms %>% 
  count(year) %>% 
  split(.$year) %>% 
  accumulate(~bind_rows(.x, .y)) %>% 
  set_names(1975:2015) %>% # optional
  bind_rows(.id="frame") %>%
  plot_ly(x=~year, y=~n) %>% 
  add_lines(frame=~frame)

# Commulative animated line plot by category
# Smoothing the animated lines
storms %>% 
  count(year, category) %>% 
  split(.$year) %>% 
  accumulate(~bind_rows(.x, .y)) %>% 
  set_names(1975:2015) %>% # optional
  bind_rows(.id="frame") %>%
  plot_ly(x=~year, y=~n) %>% 
  add_lines(frame=~frame, color=~category, ids=~category)

## Smoothing the animated lines
# Commulative animated line plot by status
storms %>% 
  count(year, status) %>% 
  split(.$year) %>% 
  accumulate(~bind_rows(.x, .y)) %>% 
  set_names(1975:2015) %>% # optional
  bind_rows(.id="frame") %>%
  plot_ly(x=~year, y=~n) %>% 
  add_lines(frame=~frame, color=~status, ids=~status)
