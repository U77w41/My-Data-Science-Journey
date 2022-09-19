# find the percentage of NA (missing values) in different column of a dataframe
# using sppply/lapply/apply utilizing a custom function

#I have to create my own data frame for this

#Creating the Data Frame
my_df <- data.frame("Roll No:" = 1:8 , "Age" = c(21 ,22,23,24,23,21,23,21) , "Name" = LETTERS[1:8])

# assigning some elements to NA
my_df[1 ,2 ] <- NA
my_df[ 2 ,3] <- NA
my_df[ 6 ,3] <- NA
my_df[5 ,1] <- NA
my_df[ 8 ,1:3] <- NA 

# Final data frame
my_df

#Creating The Function
fun_per <- function(x)
{
  e <- length(x) * nrow(x) # all elements
  h <-apply(x, 2, function(x) length(which(is.na(x)))) #na's 
  ## h <-length(as.numeric(my_df[is.na(my_df)]))
  s<- sum(h)
  
  per <- (s/e) *100
  
  return(per)
  
}
length(as.numeric(my_df[is.na(my_df)]))
is.na(my_df)
is.matrix(is.na(my_df))



my_df[is.na(my_df)]

h <-apply(my_df, 2, function(x) length(which(is.na(x))))
h
s<- sum(h)
s
h <-length(my_df[is.na(as.numeric(my_df))])
#output
fun_per(my_df)

which(is.na(my_df))
