##############
# PREVIOUS 


fn_lcg1 <- function(a,c,m,run_length,seed) { # a = multiplyer ; c = incriment ; m= modulus
  x <- rep(0,run_length)
  x[1] <- seed # Initialliasing the seed
  for (i in 1:(run_length)) {
    x[i+1] <- (a * x[i] + c) %% m
  }
  return(x)
}

# a = multiplyer ; c = incriment ; m= modulus ; N ; Seed


fn_lcg(45,11,2^5,35,1)
length(unique(fn_lcg(21,1,2^2,100,1)))

for (i in 1:100) {
  x1 <- length(unique(fn_lcg(21,1,2^2,100,i)))
  print(x1)
}






####################################

# MODIFIED


fn_lcg1 <- function(a,c,m,run_length,seed) { # a = multiplyer ; c = incriment ; m= modulus
  x <- rep(0,times=run_length+1)
  x[1] <- seed # Initialliasing the seed
  for (i in 2:(run_length+1)) {
    x[i+1] <- (a * x[i] + c) %% m
  }
  return(x[-1])
}

# a = multiplyer ; c = incriment ; m= modulus ; N ; Seed


fn_lcg1(45,11,2^5,35,1)
length(unique(fn_lcg1(21,11,2^5,100,1)))

for (i in 1:100) {
  x1 <- length(unique(fn_lcg(21,11,2^2,100,i)))
  print(x1)
}






