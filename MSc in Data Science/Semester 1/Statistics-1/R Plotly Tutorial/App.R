# install.packages("highcharter")
library(highcharter)
library(dplyr)

pokemon %>% 
  count(type_1) %>% 
  hchart(type = "bar", hcaes(x = type_1, y = n))

library(shiny)
library(shiny)

ui <- fluidPage(
  downloadButton("down", outputId = "Down", label = "Download")
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)  
