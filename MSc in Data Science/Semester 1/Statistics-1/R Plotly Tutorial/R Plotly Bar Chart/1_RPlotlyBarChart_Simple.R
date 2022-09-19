## Demo R plotly Bar chart
## A Simple Bar Chart using mtcars dataset
## Categorical variable 'cyl' representing no. of cylinders in car
## X axis with the categorical variable
## Y axis shows no. of data points corresponding to the categorical variable

######## Load required packages
library(plotly) # for Plotly charts
library(dplyr) # for pipe operator and data manipulation operations


###### Structure of the data
str(mtcars)


#### Create bar chart
mtcars %>% 
  mutate(cyl = as.factor(cyl)) %>%  # convert cyl to categorical variable
  count(cyl) %>%  ## count to get the frequency table (from dplyr package)
  plot_ly(x=~cyl,  
          y=~n, 
          color=~cyl,
          text = ~n,
          ## below 3 lines for the bar label and hover text
          textposition = "outside",
          hovertext = ~paste("No. of cyl=", cyl, "\n", "Count=", n), 
          hoverinfo = "text") %>%  # apply plotly on the frequency data
  add_bars(width=0.2) %>%  # use the width argument to adjust the width of the bars
  layout(title="Plotly Bar Chart using mtcars data",
         xaxis = list(title="No. of Cylinders "),
         yaxis = list(title = "Count"))

# How about making a horizontal bar chart
# interchange the x and y variables



