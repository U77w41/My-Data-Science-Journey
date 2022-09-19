## Demo R plotly Stacked Bar chart

######## Load required packages
library(plotly) # for Plotly charts
library(dplyr) # for pipe operator and data manipulation operations

## Stacked Bar chart
mtcars %>% 
  mutate(cyl = as.factor(cyl), 
         am = as.factor(am)) %>% 
  count(cyl, am) %>% ## count to get the frequency table (from dplyr package)
  plot_ly(x=~cyl, 
          y=~n, 
          color=~am,
          text = ~paste("No. of cyl=", cyl, "<br>", "Count=", n, "<br>", "Transmission=", am), 
          hoverinfo = "text") %>% 
  add_bars() %>% 
  layout(title="Plotly Stacked Bar Chart",
         xaxis = list(title="No. of Cylinders"),
         yaxis = list(title = "Count"),
         barmode="stack")


