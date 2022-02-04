library(ggplot2)
MscCourses <- data.frame(Courses, No_of_Stud)
myplot1 <-ggplot(data = MscCourses, aes(x = "", y =  No_of_Stud, fill = Courses)) + 
  geom_bar(stat = "identity") + 
  coord_polar("y")
show(myplot1)
#########################
myplot2 <-ggplot(data = MscCourses, aes(x = "", y = -No_of_Stud, fill = Courses)) + 
  geom_bar(stat = "identity", color = "black") +
  labs(title = "Courses @ RKMVERI") +
  coord_polar("y") +
  theme_void()
show(myplot2)
#########################
myplot3 <- ggplot(data = MscCourses, aes(x = "", y = -No_of_Stud, 
                              fill = reorder(Courses, -No_of_Stud))) + 
  geom_bar(stat = "identity", color = "black") + 
  labs(title = "Courses @ RKMVERI") +
  coord_polar("y") +
  theme_void()
show(myplot3)
############################################################################################
# Labels inside the pie

