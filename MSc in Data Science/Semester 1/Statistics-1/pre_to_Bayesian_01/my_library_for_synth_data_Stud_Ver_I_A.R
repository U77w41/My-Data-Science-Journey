synthetic_data01_A <- function(m_true,c_true,N,x){
  # m_true: True Slope
  # c_true: True intercept
  # N: no.of data points
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

synthetic_data02_A <- function(m_true,c_true,N,x){
  # m_true: True Slope
  # c_true: True intercept
  # N: no.of data points
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

synthetic_data03_A <- function(m_true,c_true,N,x){
  # m_true: True Slope
  # c_true: True intercept
  # N: no.of data points
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


synthetic_data04_A <- function(m_true,c_true,N,x){
  # m_true: True Slope
  # c_true: True intercept
  # N: no.of data points
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



synthetic_data05_A <- function(m_true,c_true,N,x){
  # m_true: True Slope
  # c_true: True intercept
  # N: no.of data points
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




synthetic_data06_A <- function(m_true,c_true,N,x){
  # m_true: True Slope
  # c_true: True intercept
  # N: no.of data points
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

