## Demo - R plotly linked scatter plots 
## Author : Abhinav Agrawal
## Powered by R, Plotly, dplyr, crosstalk, R Studio

## Import the key libraries
library(plotly) # Plotly charts
library(dplyr) # data manipulation, Pipe operator
library(crosstalk) # Shared Data Object, linking

## Linked Scatter Charts using mtcars dataset
## Visualize relation between mpg, hp, disp and wt for a given data point
## 'mpg vs hp' & 'disp vs wt' scatter plots
## Selecting data point on scatter plot highlights same data point on second scatter plot


# Step :1 creating the shared data object (Crosstalk package)
shared_mtcars = mtcars %>% 
  SharedData$new()

# Step:2 Creating the first scatter chart but using the shared data object created in step 1
p1 = shared_mtcars %>% 
  plot_ly(x=~mpg , y=~hp) %>% 
  add_markers()

# Step:3 Creating the second scatter chart but using the shared data object created in step 1
p2 = shared_mtcars %>% 
  plot_ly(x=~disp, y=~wt) %>% 
  add_markers()

# Step :4 add both the plots side by side in a row using subplot
subplot(p1, p2, titleX = TRUE, titleY = TRUE) %>% 
  hide_legend() %>% 
  highlight(on="plotly_hover", off = "plotly_doubleclick")

## highlight 'on' options : plotly_click, plotly_hover, plotly_selected
## highlight 'off' options : plotly_deselect, plotly_doubleclick