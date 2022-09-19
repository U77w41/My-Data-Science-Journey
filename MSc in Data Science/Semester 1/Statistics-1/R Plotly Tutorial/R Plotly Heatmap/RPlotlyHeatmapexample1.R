# Create Heatmap
library(plotly)

## Create a heatmap
diamonds %>% 
  plot_ly() %>% 
  add_heatmap(x=~cut, y=~color, z=~price)


## Create a heatmap with annotations
## Cut type on the x axis
## Color type on the y axis 
## Heatmap color based on the price legend