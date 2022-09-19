synthetic_data01 <- function(m_true,c_true,N){
  # m_true: True Slope
  # c_true: True intercept
  # N: no.of data points
  a = 0.0;b=10.0
  x <- sort(runif(N,a,b))
  y_true <- m_true*x + c_true
  #######################
  # standard error in each data point
  yerr <- 0.1+0.5*runif(N)### !!!! You can use any distribution or even all equal
  y = rnorm(N,y_true,yerr)### !!!! You must use normal distribution
  #or,
  #y = y_true + rnorm(N,0,yerr)### !!!! You must use normal distribution
  
  output <-list(x,y,yerr)
  names(output) <- c('x','y','yerr')
  return (output)
}

synthetic_data02 <- function(m_true,c_true,N){
  # m_true: True Slope
  # c_true: True intercept
  # N: no.of data points
  a = 0.0;b=10.0
  x <- sort(runif(N,a,b))
  y_true <- m_true*x + c_true
  #######################
  # standard error in each data point
  yerr <- 0.1+0.5*runif(N)### !!!! You can use any distribution or even all equal
  fixed_scatterer = 0.5#You can use any other value
  y = rnorm(N,y_true,sqrt(yerr^2 + fixed_scatterer^2))### !!!! You must use normal distribution
  #or,
  #y = y_true + rnorm(N,0,yerr)### !!!! You must use normal distribution
  
  output <-list(x,y,yerr)
  names(output) <- c('x','y','yerr')
  return (output)
}

synthetic_data03 <- function(m_true,c_true,N){
  # m_true: True Slope
  # c_true: True intercept
  # N: no.of data points
  a = 0.0;b=10.0
  x <- sort(runif(N,a,b))
  y_true <- m_true*x + c_true
  #######################
  # standard error in each data point
  yerr <- 0.1+0.5*runif(N)### !!!! You can use any distribution or even all equal
  random_scatterer = runif(N)#You can use any other distribution here
  y = rnorm(N,y_true,sqrt(yerr^2 + random_scatterer^2))### !!!! You must use normal distribution
  #or,
  #y = y_true + rnorm(N,0,sqrt(yerr^2 + random_scatterer^2))### !!!! You must use normal distribution
  
  output <-list(x,y,yerr)
  names(output) <- c('x','y','yerr')
  return (output)
}


synthetic_data04 <- function(m_true,c_true,N){
  # m_true: True Slope
  # c_true: True intercept
  # N: no.of data points
  a = 0.0;b=10.0
  x <- sort(runif(N,a,b))
  y_true <- m_true*x + c_true
  #######################
  # standard error in each data point
  yerr <- 0.1+0.5*runif(N)### !!!! You can use any distribution or even all equal
  fixed_scatterer = 0.5#You can use any other value
  y = rnorm(N,y_true,sqrt(abs(yerr^2 - fixed_scatterer^2)))### !!!! You must use normal distribution
  #or,
  #y = y_true + rnorm(N,0,yerr)### !!!! You must use normal distribution
  
  output <-list(x,y,yerr)
  names(output) <- c('x','y','yerr')
  return (output)
}



synthetic_data05 <- function(m_true,c_true,N){
  # m_true: True Slope
  # c_true: True intercept
  # N: no.of data points
  a = 0.0;b=10.0
  x <- sort(runif(N,a,b))
  y_true <- m_true*x + c_true
  #######################
  # standard error in each data point
  yerr <- 0.1+0.5*runif(N)### !!!! You can use any distribution or even all equal
  random_scatterer = runif(N)#You can use any other distribution here
  y = rnorm(N,y_true,sqrt(abs(yerr^2 - random_scatterer^2)))### !!!! You must use normal distribution
  #or,
  #y = y_true + rnorm(N,0,sqrt(yerr^2 + random_scatterer^2))### !!!! You must use normal distribution
  
  output <-list(x,y,yerr)
  names(output) <- c('x','y','yerr')
  return (output)
}




synthetic_data06 <- function(m_true,c_true,N){
  # m_true: True Slope
  # c_true: True intercept
  # N: no.of data points
  a = 0.0;b=10.0
  x <- sort(runif(N,a,b))
  y_true <- m_true*x + c_true
  #######################
  # standard error in each data point
  yerr <- 0.1+0.5*rnorm(N)### !!!! You can use any distribution or even all equal
  y = rnorm(N,y_true,yerr)### !!!! You must use normal distribution
  #or,
  #y = y_true + rnorm(N,0,yerr)### !!!! You must use normal distribution
  
  output <-list(x,y,yerr)
  names(output) <- c('x','y','yerr')
  return (output)
}

