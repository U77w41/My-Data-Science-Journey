# USER- DEFINED FUNCTION
##
x1 <- rnorm(10) + runif(10)
mean(x1)
#?mean()# BUILT-IN FUNCTION
######################################################################
jishan_mean <- function(blah){
  output_blah <- sum(blah)/length(blah)
  return(output_blah)
}
######################################################################
m1 <-mean(x1)
m2 <-jishan_mean(x1)
##########################################################################################
### LEVEL 0:
my_exp0 <-function(x){
  out <- 2.713^x
  return(out)
}
### LEVEL 1:
my_exp1 <-function(x){
  out <- 1. + x + x^2/factorial(2) + x^3/factorial(3) + x^4/factorial(4)#+ .........\
  return(out)
}
### LEVEL 2:
my_exp2 <-function(x,n){
  out = 1.0
  for(i in 1:n){
    #print(i)
    out <- out + x^i/factorial(i)
    #print(out)
    }
    return(out)
}
##### LEVEL 3:
my_exp3 <- function(x,es = 0.0001,no_of_Max_iter){
  n = 1 # 0
  out = 1.0 # 0
  while(TRUE){
    Outold = out
    out = out + x^n/factorial(n)
    n = n + 1
    ea = abs((out - Outold)/Outold) * 100
    if (ea <= es){
      break}
    if (n >= no_of_Max_iter){
      break}
  }
  return(out)
}
###################################################################################
my_exp <- function(x,es = 0.0001,no_of_Max_iter){
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
