## Demo on how to customize the mouse hover info in R Plotly Plot
## Hover text size
## Hover text font
## Hover text color
## Hover text background color

## Load the required packages
library(plotly)

## Plotly Plot
mtcars %>% 
plot_ly(x=~mpg, 
        y=~wt, 
        hoverinfo = "text", 
        text = ~paste("Miles per gallon: ", mpg, 
                      "<br>", 
                      "Weight: ", wt)) %>% 
  add_markers() %>% 
  layout(hoverlabel = list(bgcolor="black", 
                           font = list(color = "yellow", 
                                       family="sans-serif", 
                                       size = 15)
                           )
         )


# hoverinfo - possible values
# "x", "y", "x+y", all", "none"
# "text" - to indicate manually defining the info