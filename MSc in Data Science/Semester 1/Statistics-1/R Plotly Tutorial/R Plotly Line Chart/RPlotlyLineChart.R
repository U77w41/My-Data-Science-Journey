## Line chart
library(plotly)

# Line chart of storms by year
storms %>% 
  count(year, status) %>% 
  plot_ly(x=~year, y=~n) %>% 
  add_lines(color=~status)
