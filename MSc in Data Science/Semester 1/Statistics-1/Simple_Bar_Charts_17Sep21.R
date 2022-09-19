# Simple Bar Diagrams
#barplot(H,xlab,ylab,main, names.arg,col)
#    H is a vector or matrix containing numeric values used in bar chart.
#    xlab is the label for x axis.
#    ylab is the label for y axis.
#    main is the title of the bar chart.
#    names.arg is a vector of names appearing under each bar.
#    col is used to give colors to the bars in the graph.
###########################################################
# Create the data for the chart
No_of_Stud_BDA <- c(8,11,17,22,25,34)
year <- c("2016","2017","2018","2019","2020","2021")
# Plot the bar chart 
barplot(No_of_Stud_BDA)
barplot(No_of_Stud_BDA, names.arg= year)
###########################################################
###### Bar Chart Labels, Title and Colors
# Create the data for the chart
No_of_Stud_BDA <- c(11,17,22,25,34)
No_of_Stud_CS <- c(5,11,15,17,20)
No_of_Stud_Phys <- c(15,21,25,37,40)
year <- c("2017","2018","2019","2020","2021")

# Plot the bar chart 
barplot(No_of_Stud_BDA,names.arg=year,xlab="Year",ylab="No_of_Stud",col="blue",
        main="BDA @ RKMVERI ",border="red")

###########################################################
###Stacked Bar Chart

# Create the input vectors.
colors = c("green","orange","brown","blue","red")
Courses <- c("BDA","CS","Phys")
# Create the matrix of the values.
No_of_Stud_by_course <- matrix(c(No_of_Stud_BDA,No_of_Stud_CS,No_of_Stud_Phys), nrow = 5, ncol = 3, byrow = FALSE)
# Create the bar chart
barplot(No_of_Stud_by_course, main = "Stud @ RKMVERI", names.arg = Courses, xlab = "Year", ylab = "No_of_Stud", col = colors)
# Add the legend to the cha
legend("topleft",year, cex = 0., fill = colors)
#############
No_of_Stud_by_year <- matrix(c(No_of_Stud_BDA,No_of_Stud_CS,No_of_Stud_Phys), nrow = 3, ncol = 5, byrow = TRUE)
# Create the bar chart
barplot(No_of_Stud_by_year, main = "Stud @ RKMVERI", names.arg = year, 
        xlab = "Year", ylab = "No_of_Stud", col = colors , horiz=1)
#,horiz = TRUE)########################## HORIZONTAL
# Add the legend to the cha
legend("bottomright",Courses, cex = 0.7, fill = colors)
###############
####### Group Bar Chart 
# beside = TRUE #################
barplot(No_of_Stud_by_year, main = "Stud @ RKMVERI", names.arg = year, xlab = "Year", ylab = "No_of_Stud", col = colors[1:3],beside = TRUE)
legend("topleft",Courses, cex = 0.9, fill = colors)
##############################################################################################
##############################################################################################
### Also see:
# https://bookdown.org/dli/rguide/bar-graph.html