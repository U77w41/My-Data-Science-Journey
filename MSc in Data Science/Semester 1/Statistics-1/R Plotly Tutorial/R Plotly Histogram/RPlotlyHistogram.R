## A simple histogram - single continuous variable
## Histogram shows distribution of a continuous variable
## Y axis shows the frequency againts a series of intervals (called BINs)
library(plotly)
library(ggplot2) # for diamonds dataset

hist = diamonds %>% 
  plot_ly() %>% 
  add_histogram(x=~price)

## Add lines between the Histogram BINs
diamonds %>% 
  plot_ly() %>% 
  add_histogram(x=~price) %>% 
  layout(bargap=0.1)

## Histogram with specified BINs using nbinsx argument
diamonds %>% 
  plot_ly(x=~price) %>% 
  add_histogram(nbinsx = 50, color=I("green")) %>% 
  layout(bargap=0.1)

# Histogram with specified BINs
diamonds %>% 
  plot_ly() %>% 
  add_histogram(x=~price, xbins = list(start=0, end=20000, size=2000)) %>% 
  layout(bargap=0.1)

set.seed(23)  
plot_ly() %>% 
  add_histogram(x=~rnorm(30), 
                xbins=0.5
  ) %>% 
  layout(bargap=0.1)


# Histogram with categorical variable
diamonds %>% 
  plot_ly() %>% 
  add_histogram(x=~cut) 

# Histogram with 2 categorical variables
diamonds %>% 
  plot_ly() %>% 
  add_histogram(x=~cut, color=~clarity)
