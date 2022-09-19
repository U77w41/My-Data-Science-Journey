## Pie Chart
## Basic Syntex
# pie(x, labels, radius, main, col, clockwise)
#For more:
?pie()
###########################################################################################
# Data
Courses <- c("BDA", "CS", "Phys.", "Math", "Sanskrit")
No_of_Stud <- c(34, 15, 45, 30,50)
# Plot the chart
pie(No_of_Stud,Courses,radius=1.0)
########
# Filling with colors, giving title
pie(No_of_Stud, Courses, main = "RKMVERI 2021", col = rainbow(length(No_of_Stud)))
legend("topright", Courses, cex = 0.8,
       fill = rainbow(length(No_of_Stud)))
######## Better Use of Legend
percent<- round(100*No_of_Stud/sum(No_of_Stud),1)
pie(No_of_Stud, percent, main = "RKMVERI 2021", col = rainbow(length(No_of_Stud)))
legend("topright", Courses, cex = 0.8,
       fill = rainbow(length(No_of_Stud)))

my_colors <- c("red","black","blue","green","orange")
pie(No_of_Stud, percent, main = "RKMVERI 2021", col = my_colors)
legend("topright", Courses, cex = 0.8,
       fill = rainbow(length(No_of_Stud)))
############################################################################################
# 3D Pie Chart
library(plotrix)
pie3D(No_of_Stud, labels = Courses, explode = 0.1,main = "RKMVERI 2021", col = rainbow(length(No_of_Stud)))
legend("topright", Courses, cex = 0.8,
       fill = rainbow(length(No_of_Stud)))
pie3D(No_of_Stud, labels =percent, explode = 0.1,main = "RKMVERI 2021", col = rainbow(length(No_of_Stud)))
legend("topright", Courses, cex = 0.8,
       fill = rainbow(length(No_of_Stud)))
###########
# From help
pieval<-c(2,4,6,8)
pielabels<-  c("We hate\n pies","We oppose\n  pies","We don't\n  care","We just love pies")
# grab the radial positions of the labels
lp<-pie3D(pieval,radius=0.9,labels=pielabels,explode=0.1,main="3D PIE OPINIONS")
# lengthen the last label and move it to the left
pielabels[4]<-"We cannot survive without our pies"
lp[4]<-4.8
# specify some new colors
pie3D(pieval,radius=0.9,labels=pielabels,explode=0.1,main="3D PIE OPINIONS",
      col=c("brown","#ddaa00","pink","#dd00dd"),labelpos=lp)
##############################################
cl <- colors()
length(cl); #### 
cl[1:20]
#color()
### 
my_col <- c("green","blue","black","orange","red")
pie(No_of_Stud, labels=percent, main = "RKMVERI 2021", col = my_col)
legend("topright", Courses, cex = 0.8,
       fill = my_col)
#####################################################################################
# Pie Chart Using ggplot
### Source: https://bookdown.org/dli/rguide/pie-chart.html
library(ggplot2)
MscCourses <- data.frame(Courses, No_of_Stud)
ggplot(data = MscCourses, aes(x = "", y =  No_of_Stud, fill = Courses)) + 
   geom_bar(stat = "identity") + 
   coord_polar("y")
#########################
ggplot(data = MscCourses, aes(x = "", y = -No_of_Stud, fill = Courses)) + 
   geom_bar(stat = "identity", color = "black") +
   labs(title = "Courses @ RKMVERI") +
   coord_polar("y") +
   theme_void()
#########################
ggplot(data = MscCourses, aes(x = "", y = -No_of_Stud, 
                           fill = reorder(Courses, -No_of_Stud))) + 
   geom_bar(stat = "identity", color = "black") + 
   labs(title = "Courses @ RKMVERI") +
   coord_polar("y") +
   theme_void()
############################################################################################
# Labels inside the pie

