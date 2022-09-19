### Subplot demo -
### Histogram and a Boxplot
library(plotly)

hist = diamonds %>% 
  plot_ly() %>% 
  add_histogram(x=~price) %>% 
  layout(bargap=0.1)

box = diamonds %>% 
  plot_ly()  %>% 
  add_boxplot(x=~price, boxpoints = "outliers")

subplot(hist, box , nrows = 2, shareX = TRUE) %>% 
  # layout(showlegend = FALSE)
  hide_legend()