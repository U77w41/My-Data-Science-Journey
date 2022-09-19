# LINEAR-CONGRUENTIAL GENERATORS
#########################################################################################
Simple_LCG_unif <- function(modulus,multiplier,increment,seed,N){
  #m= 2^32; a=1103515245; c=12345
  m = as.integer(modulus)
  a = as.integer(multiplier)
  c = as.integer(increment)
  #m= as.bigz(2^32); a=as.bigz(1103515245); c=as.bigz(12345)
  outR <-c()
  outI <-c()
  rng_current = seed
  for(i in 1:N){
    rng_current = as.integer( (a*rng_current + c) %% m)
    outI <- c(outI,rng_current)
    outR <- c(outR,rng_current/m)
  }
  out <- list(outR,outI)
  names(out) <- c("Rr","Ir")# Real Random, Integer Random
  return(out)
}