### Linked Charts (Bar & Line Charts)
library(plotly)
library(crosstalk)
# Linked bar chart and line chart
shared_data <- storms %>% 
  count(year, status) %>% 
  SharedData$new(key = ~status)

# line chart of storms by year and status
line <- shared_data %>%  
  plot_ly(x=~year , y =~n, color=~status) %>% 
  add_lines() 

# bar chart of storms by status
bar = shared_data %>% 
  plot_ly() %>%
  add_bars(x=~status , y =~n, color=~status) 



# Combining the bar and line chart
subplot(bar, line) %>% 
  hide_legend() %>% 
  highlight(on="plotly_hover", off = "plotly_doubleclick")