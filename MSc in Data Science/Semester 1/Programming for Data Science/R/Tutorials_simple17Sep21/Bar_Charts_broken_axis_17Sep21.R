# Barplot: break in (y-)axis
Browser <- c("Chrome", "Edge", "Firefox", "IE",
             "Opera", "Safari", "Others")
Users <- c(2502.4, 150.78, 395.83, 238.05, 86.49, 387.65, 134.8)
################################
barplot(Users)
barplot(Users,names.arg = Browser,xlab = "Internet Browser",
        ylab = "Users",main="2018 Internet Browser Users (in millions)")
 
##################################
#Also see:
#https://rstudio-pubs-static.s3.amazonaws.com/235467_5abd31ab564a43c9ae0f18cdd07eebe7.html 
# https://stackoverflow.com/questions/44694496/y-break-with-scale-change-in-r
# https://stackoverflow.com/questions/40128929/how-to-break-axis-in-a-barplot-maybe-using-plotrix-gap-barplot
library(plotrix)
from = 500.0
to = 2000.0
#?gap.barplot()
#?axis.break()
gap.barplot(Users, gap=c(from,to),
            xaxlab = Browser,
            xlab = "Internet Browser",
            ylab = "Users",
            main="2018 Internet Browser Users (in millions)")
axis.break(2, from, breakcol="snow", style="gap")
axis.break(2, from*(1+0.02), breakcol="black", style="slash")
axis.break(4, from*(1+0.02), breakcol="black", style="slash")
axis(2, at=from)
##############################################################################################
#https://stackoverflow.com/questions/40128929/how-to-break-axis-in-a-barplot-maybe-using-plotrix-gap-barplot
# Your data with names
#library(plotrix)
d <- c(10,20,500)
names(d) <- letters[1:3]
# Specify a cutoff where the y.axis should be splitted.
co <- 200
# Now cut off this area in your data.
d[d > co] <- d[d > co] - co
# Create new axis label using the pretty() function
newy <- pretty(d)
newy[ newy > co] <- newy[ newy > co] + co
# remove values in your cutoff. 
gr <- which(newy != co)
newy <- newy[ gr ]
# plot the data
barplot(d, axes=F)
# add the axis
axis(2, at = pretty(d)[gr], labels = newy)
axis.break(2, co, style = "gap") 
######################################################################################
# Also see:
#https://statisticsglobe.com/r-ggplot2-barplot-with-break-and-zoom-in-axis
#https://stat.ethz.ch/pipermail/r-help/2014-May/375236.html
