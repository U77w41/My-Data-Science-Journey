my_LSQ_fit <- function(x,y,yerr){
  N = length(x)
  X <- matrix(c(rep(1.0,N),x),nrow=N,ncol=2,byrow =FALSE)/matrix(c(yerr,yerr),nrow=N,ncol=2,byrow =FALSE)
  Y <- matrix(y,nrow=N,ncol=1,byrow =FALSE)/matrix(yerr,nrow=N,ncol=1,byrow =FALSE)
  XT <- t(X)
  A = XT%*%X #### " %*% " for matrix multiplication
  b = XT%*%Y
  a = solve(A,b)
  ## Or,
  A_inv = solve(A) ##### Way to find inverse of a matrix in R
  #a1 = A_inv %*% b ### This is equivalent to a = solve(A,b)
  #print(a-a1) ## ~0
  #######################################
  #######################################
  our_fit_result <- matrix(c(a,sqrt(diag(A_inv))),nrow = 2,ncol = 2,byrow = FALSE)
  rownames(our_fit_result) <- c("Intercept","Slope")
  colnames(our_fit_result) <- c("Estimate","Std. Error")
  #cat('Our fit results:----\n')
  #print(our_fit_result)
  return(our_fit_result)
}
