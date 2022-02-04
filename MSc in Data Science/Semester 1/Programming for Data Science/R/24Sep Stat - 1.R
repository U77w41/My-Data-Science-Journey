v <- c("Hello", "loop")
cnt <- 0
 repeat {
   print( v)
          cnt <- cnt -1
          if (cnt >10)
              {break}
 }

##############################
v <-letters[1:27] ; v

runif(2)  # prints randomly distributed numbers

######################
#user defined functions

x <- rnorm(10) + runif(10) ;x
mean(x)


ujjwal_function <- function(x) {
  output_new <- sum(x)/length(x)
  return(output_new)
  
}
v <- (1:10) ; v
u <-ujjwal_function(v) ; u



my_exp1 <- function(x,n) {
  for (n in 1:n) {
    
    out <- out + x^n/factorial(n)

  }
  return(out)  
}

my_exp1(1)
 





df <- read.csv(choose.files())
colnames(df)
View(df)



sapply(df, class)
sapply(df ,typeof)

barplot(df$Profit)
barplot(df$Profit, width = 2 , space = 1 , ylim = c(0,150))
barplot(df$Profit, width = 2 , space = 1 , ylim = c(0,150) , main = "Title")
 ####################
 n <- length(df$Profit) ;n
x1stbar