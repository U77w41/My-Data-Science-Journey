############# Data Frame ###################


#Creating the Data Frame
my_df <- data.frame("Roll No:" = 1:8 , "Age" = c(21 ,22,23,24,23,21,23,21) , "Name" = LETTERS[1:8])
my_df

# assigning some elements to NA
my_df[1 ,2 ] <- NA
my_df[ 2 ,3] <- NA
my_df[ 6 ,3] <- NA
my_df[5 ,1] <- NA
 
my_df[ 8 ,1:3] <- NA 
# Final data frame
my_df

# h <-apply(my_df, 2, function(x) length(which(is.na(x))))
# h ; typeof(h)

fun_per <- function(x)
{
  e <- length(x) * nrow(x)
  h <-apply(my_df, 2, function(x) length(which(is.na(x))))
  s<- sum(h)
  
  per <- (s/e) *100
  
  return(per)
  
}
 fun_per(my_df)

 
#  
#  sum_of_NAs <- sum(is.na(my_df)) ; sum_of_NAs
# length(my_df)
# nrow(my_df)
# entries <- length(my_df) * nrow(my_df) ; entries
# persentage <- (sum(is.na(my_df))/(length(my_df) * nrow(my_df)) * 100) ; persentage
