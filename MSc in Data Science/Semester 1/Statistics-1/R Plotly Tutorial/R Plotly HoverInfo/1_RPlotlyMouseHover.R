## Demo on how to customize the mouse hover info in R Plotly Plot

## Load the required packages
library(plotly)

## Plotly Plot
mtcars %>% 
plot_ly(x=~mpg, 
        y=~wt, 
        hoverinfo = "text",
        text = ~paste("Miles per gallon: ", mpg,
                     "<br>",
                     "Weight: ", wt)
        ) %>% # note the arguments text and hoverinfo above
  add_markers()
        
        
# hoverinfo - possible values
# "x", "y", "x+y", all", "none"
# "text" - to indicate manually defining the info - customized text