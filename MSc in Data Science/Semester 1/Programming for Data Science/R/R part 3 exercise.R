
##############################    R - Part3     ##############################

## Exercises
# * Given the following vectors use mapply to find the sum of all the first elements
#  of the numerical vectors, sum of all the second elements and so on
#  w1 <- c(1,4,9,1)
#  w2 <- c('a','b','b','a')
#  w3 <- c(2,3,4,1)
#  w4 <- c(3,1,3,1)

w1 <- c(1,4,9,1)
w2 <- c('a','b','b','a')
w3 <- c(2,3,4,1)
w4 <- c(3,1,3,1)
mapply(sum, w1,w3,w4)


as.numeric(w2)
str(w2)
typeof(w2)














# . Create 3 vectors of the same length containing information about the age, marks, 
# number of books read in a year and the gender for 5 students in a class.
# Combine these vectors into a dataframe. Use tapply function to find the average number 
# of marks obtained for each gender group and the min number of books
# read for each gender group.

age <- c(21,22,23,25,24) 
marks <- c(80,90,78,79,87)
books <-  c( 10 ,21 ,8 , 9 , 12)
gender <- c("male","female","male","female","male")

dt_frme <- data.frame(age, marks, books ,gender)

tapply(dt_frme$marks, dt_frme$gender, mean)
tapply(dt_frme$books, dt_frme$gender , min)



















# . With the above dataframe created use the apply function to find the average marks obtained by the students, average number of books read and the average
# age of the students.
# . Create a matrix using the 3 numerical vectors and use the apply function to find the average marks obtained by the students, average number of books read and
# the average age of the students.
# . With the above dataframe created use the lapply function to find the average marks obtained by the students, average number of books read and the average
# age of the students.











# . Create 2 vectors of the same length containing the before training and after training measurement of competency on a scale of 1-10 for 5 students. For example,
# let vector 1 contains the pre-training competency score of the 5 students as 2,7,4,9,6 and the post training competency score as 5,6,7,6,6 respectively. Use
# mapply on these 2 vectors to find the difference between post and pre scores. Hint: use minus operator with quotes as a supplied function, i.e. mapply('-',.)

pre_scr <- c(2,7,4,9,6)
pst_scr <- c(5,6,7,6,6)
mapply("-",pst_scr,pre_scr)
