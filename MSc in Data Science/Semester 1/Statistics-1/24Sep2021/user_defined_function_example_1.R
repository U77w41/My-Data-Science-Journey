rm(list = ls())
#####################################################################
i = 0
while(i<7){
  print(i)
  i = i + 1
}

x <- 1:5
for (val in x) {
  if (val == 3){
    break
  }
  print(val)
}

fun <- function(n) {
  i <- 1
  while (TRUE) {
    if (i>n) return("stopped") else print(i)
    i <- i+1
  }
}
fun(4)
#####################################################################
x = 1.2
no_of_Max_iter = 10
n = 1
xr = 1.0
es = 0.0001
while(TRUE){
  xrold = xr
  xr = xr + x^n/factorial(n)
  n = n + 1
  if(xr != 0){
    ea = abs((xr - xrold)/xr) * 100}
  else{
    ea = 0}
  if (ea <= es | n >= no_of_Max_iter){
    break}
  
}
#####################################################################
my_exp <- function(x,es = 0.0000001,no_of_Max_iter=500){
  n = 1
  xr = 1.0
  while(TRUE){
    xrold = xr
    xr = xr + x^n/factorial(n)
    n = n + 1
    #if(xr != 0){
    ea = abs((xr - xrold)/xr) * 100#}
    #else{
    #  ea = 0}
    #if (ea <= es | n >= no_of_Max_iter){
    #  break}
    if (ea <= es){
      #Msg = "Desired accuracy achieved"
      print("Desired accuracy achieved")
      break}
    if (n >= no_of_Max_iter){
      print("Could not achieve the desired accuracy")
      print("Increase maximum no. of iteration to achieve the desired accuray")
      break}
  }
  out <- list(xr,n)
  names(out) <- c('ans','Niter')
  return(out) #(list(xr,n))
  }
#####################################################################
cat("\014")## Command for Ctrl+L
my_output = my_exp(1.2,es = 0.01,no_of_Max_iter=10)


#v1 <- c(1.2,1.3,1.4)
#out = my_exp(v1,es = 0.0001,no_of_Max_iter)




#https://www.tutorialspoint.com/r/r_mean_median_mode.htm
#getmode <- function(v) {
#  uniqv <- unique(v)
#  uniqv[which.max(tabulate(match(v, uniqv)))]
#}
## Create the vector with numbers.
#v <- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3)
#
## Calculate the mode using the user function.
#result <- getmode(v)
#print(result)
