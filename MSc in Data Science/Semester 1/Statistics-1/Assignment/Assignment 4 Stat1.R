
###Answer 1 
f1 <- function(n){
  outcome = c()
  for(i in 1:n){
    a = 7
    b = 4
    games <- sample(c("T","H"), 4, replace = TRUE, prob = c(7/11,4/11))
    a = a + sum(games == "T")
    b = b + sum(games == "H")
    if (a == 8) outcome[i] = "T"
    else if (b == 8) outcome[i] = "H"
    else outcome[i] = "No"
  }
  final <- sum(outcome == "H")
  return(final/n)
}

f1(100000)

# Analytically answer would be (4/11)^4

### Answer 2

normal <- function(n, mu, sigma){
  result = c()
  for(i in 1:n){
    repeat{
      u1 <- runif(1)
      u2 <- runif(1)
      x <- -log(u1)
      if (u2 > exp(-((x-1)^2)/2)) break
      else u3 <- runif(1)
      if (u3 > 0.5) result[i] = (mu + sigma*x)
      else result[i] = (mu - sigma*x)
    }
  }
  return(result)
}

simulation <- normal(1000, 0, 1)
hist(simulation, prob = T, ylim = c(0,0.4), xlab = "Simulated Sample",
     main = "Histogram of the Simulated Sample")
curve(dnorm(x,0,1), add = T, col = 'blue', lwd = 2)


#Answer 3 

lcg <- function(n, seed, a, c, m){
  rng <- c()
  for (i in 1:n) {
    temp <- seed
    rng[i] <- ((a*temp) + c) %% m
    seed <- rng[i]
  }
  return(rng)
}

t <- lcg(n = 10000, seed = 1, a = 7^5, c = 0, m = (2^31-1));t

# Counting frequency
mini <- min(t)
maxi <- max(t)
freq <- as.numeric(table(cut(t, breaks = seq(mini, maxi, length.out = 21))))

# Chi-square test
chisq.test(freq)

#As the p value is greater than 0.1 hence we fail to reject the null hypothesis!!


###Answer 4 

data <- c(52,55,58,59,65,43,73,43,50,48,53,45,50,47,45,39,42,43,40,50)
chisq.test(data)

## for alpha 
# 0.1 -  we reject null hypothesis 
#0.05 -  we fail to reject null hypothesis

freq_10 <- data[seq(1,length(data),2)] + data[seq(2,length(data),2)]
chisq.test(freq_10)
# 0.1 -  we fail to reject null hypothesis 
#0.05 -  we fail to reject null hypothesis



#Solution of 5 

sample <- lcg(n = 20, seed = 1, a = 5, c = 1, m = 16)

ks.test(sample, 'punif', exact = 0)
ks.test(sample, 'pnorm', exact = 0)

##for both the cases we fail to reject null hypothesis!! 


# Solution of problem - 6 

# uniform distrbution
uniform <- function(nsim, n, minimum , maximum){
  xbar = c()
  for (i in 1:nsim){
    xbar[i] = mean(runif(n = n, min = minimum, max = maximum))
  } 
  mu <- (minimum + maximum)/2
  sigma <- sqrt(((maximum-minimum)^2)/12)
  s_xbar = sigma/sqrt(n)
  hist(xbar, prob = TRUE, 
       main = "Histogram of sample means", 
       xlab = "Sample means")
  curve(dnorm(x, mean = mu, sd = s_xbar), add = T, col = 'red')
}

uniform(10000,100,2,4)

# exponential distrbution
exponential <- function(nsim, n, lambda){
  xbar = c()
  for (i in 1:nsim){
    xbar[i] = mean(rexp(n = n, rate = lambda))
  } 
  mu <- 1/lambda
  sigma <- 1/lambda
  s_xbar = sigma/sqrt(n)
  hist(xbar, prob = TRUE, 
       main = "Histogram of sample means", 
       xlab = "Sample means")
  curve(dnorm(x, mean = mu, sd = s_xbar), add = T, col = 'red')
}

exponential(10000,100,3)

# weibull distribution
weibull <- function(nsim, n, lambda, k){
  xbar = array(0, dim = nsim)
  for (i in 1:nsim){
    xbar[i] = mean(rweibull(n = n, shape = k, scale = lambda))
  } 
  mu <- lambda*gamma(1+(1/k))
  sigma <- lambda*sqrt(gamma(1+(2/k)) - (gamma(1+(1/k)))^2)
  s_xbar = sigma/sqrt(n)
  hist(xbar, prob = TRUE,
       main = "Histogram of sample means", 
       xlab = "Sample means")
  curve(dnorm(x, mean = mu, sd = s_xbar), add = T, col = 'red')
}

weibull(10000,100,5,1)

# lognormal distribution
lognormal <- function(nsim, n, mean_log, sd_log){
  xbar = array(0, dim = nsim)
  for (i in 1:nsim){
    xbar[i] = mean(rlnorm(n, mean_log, sd_log))
  } 
  mu <- exp(mean_log + (sd_log^2)/2)
  sigma <- sqrt((exp(sd_log^2)-1)*exp((2*mean_log)+(sd_log^2)))
  s_xbar <- sigma/sqrt(n)
  hist(xbar, prob = TRUE, 
       main = "Histogram of sample means", 
       xlab = "Sample means")
  curve(dnorm(x, mean = mu, sd = s_xbar), add = T, col = 'red')
}

lognormal(10000,30,5,0.5)


## Answer 7 and Answer 8 (submitted via online pdf)


# Solution of problem - 9 

price <- c(17,18,19,20,22,24,26,28,30)
demand <- c(40,38,35,30,28,25,22,21,20)
cor(price, demand)



# Solution of problem - 10 
cor(price, demand, method = 'spearman')
