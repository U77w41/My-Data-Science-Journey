## Histogram
# hist(v,main,xlab,xlim,ylim,breaks,col,border)
#    v is a vector containing numeric values used in histogram.
#    main indicates title of the chart.
#    col is used to set color of the bars.
#    border is used to set border color of each bar.
#    xlab is used to give description of x-axis.
#    xlim is used to specify the range of values on the x-axis.
#    ylim is used to specify the range of values on the y-axis.
#    breaks is used to mention the width of each bar.
######################################################################
v1 <- rnorm(1000)
hist(v1)
#?hist()
hist(v1,xlab = "Voltages",col = "blue",border = "red")
hist(v1,xlab = "Voltages",col = "blue",border = "red",breaks=5)
hist(v1,xlab = "Voltages",col = "blue",border = "red",breaks=2)
hist(v1,xlab = "Voltages",col = "blue",border = "red",breaks=20)
hist(v1,xlab = "Voltages",col = "blue",border = "red",breaks=50)
######################################################################
# For histogram using ggplot/ggplot2
#https://bookdown.org/dli/rguide/histogram.html