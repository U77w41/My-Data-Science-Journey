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