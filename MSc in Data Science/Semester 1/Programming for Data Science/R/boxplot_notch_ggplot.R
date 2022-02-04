### https://r-graphics.org/recipe-distribution-boxplot-notch
# https://chartio.com/learn/charts/box-plot-complete-guide/
# http://becomingvisual.com/rfundamentals/descriptive-statistics.html
library(MASS) # Load MASS for the birthwt data set
library("ggplot2")
ggplot(birthwt, aes(x = factor(race), y = bwt)) +
  geom_boxplot(notch = TRUE)

ggplot(birthwt, aes(x = factor(race), y = bwt)) +
  geom_boxplot()#(notch = TRUE)