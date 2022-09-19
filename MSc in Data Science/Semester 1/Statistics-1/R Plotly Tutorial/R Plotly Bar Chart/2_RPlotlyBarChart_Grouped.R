## Demo R plotly Grouped Bar chart
## Using the mtcars dataset
## Using two categorical variables (Car Cylinder type and Transmission type)

######## Load required packages
library(plotly) # for Plotly charts
library(dplyr) # for pipe operator and data manipulation operations

## Side by Side or Grouped Bar Chart
mtcars %>% 
  mutate(cyl = as.factor(cyl), 
         am = as.factor(am)) %>% # Data type conversion
  count(cyl, am) %>%  ## count to get the frequency table (from dplyr package)
  plot_ly(x=~cyl, 
          y=~n, 
          color=~am,
          text = ~n,
          textposition = "outside",
          hovertext = ~paste("No. of cyl=", cyl, "\n", "Count=", n, "<br>", "Transmission=", am),
          hoverinfo = "text") %>% 
  add_bars() %>% 
  layout(title="Plotly Grouped Bar Chart",
         xaxis = list(title="No. of Cylinders"),
         yaxis = list(title = "Count"),
         barmode="group")


