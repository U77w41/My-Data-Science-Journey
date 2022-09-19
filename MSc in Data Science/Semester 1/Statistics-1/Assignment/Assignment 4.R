rm(list = ls())
graphics.off()

# Solution of problem - 1 
q1 <- function(n){
    result = c()
    for(i in 1:n){
        a = 7
        b = 4
        games <- sample(c("T","H"), 4, replace = TRUE)
        a = a + sum(games == "T")
        b = b + sum(games == "H")
        if (a == 8) result[i] = "T"
        else if (b == 8) result[i] = "H"
        else result[i] = "No"
    }
    out <- sum(result == "H")
    return(out/n)
}

q1(10000)

# Solution of problem - 2 
normal <- function(n, mu, sigma){
    sim = c()
    for(i in 1:n){
        repeat{
            u1 <- runif(1)
            u2 <- runif(1)
            x <- -log(u1)
            if (u2 > exp(-((x-1)^2)/2)) break
            else u3 <- runif(1)
            if (u3 > 0.5) sim[i] = (mu + sigma*x)
            else sim[i] = (mu - sigma*x)
        }
    }
    return(sim)
}

s <- normal(1000, 0, 1)
hist(s, prob = T, ylim = c(0,0.5), xlab = "sample",
     main = "Histogram of sample")
curve(dnorm(x,0,1), add = T, col = 'red')

# Solution of problem - 3 
lcg <- function(n, seed, a, c, m){
    rng <- NULL
    for (i in 1:n) {
        temp <- seed
        rng[i] <- ((a*temp) + c) %% m
        seed <- rng[i]
    }
    return(rng)
}

t <- lcg(n = 10000, seed = 1, a = 7^5, c = 0, m = (2^31-1))

# Counting frequency
mini <- min(t)
maxi <- max(t)
freq <- as.numeric(table(cut(t, breaks = seq(mini, maxi, length.out = 21))))

# Chi-square test
chisq.test(freq)

# Solution of problem - 4 
data <- c(52,55,58,59,65,43,73,43,50,48,53,45,50,47,45,39,42,43,40,50)
chisq.test(data)

freq_10 <- data[seq(1,length(data),2)] + data[seq(2,length(data),2)]
chisq.test(freq_10)

# Solution of problem - 5 

sample <- lcg(n = 20, seed = 1, a = 5, c = 1, m = 16)

ks.test(sample, 'punif', exact = 0)
ks.test(sample, 'pnorm', exact = 0)

# Solution of problem - 6 

# uniform distrbution
uniform <- function(nsim, n, minimum , maximum){
    xbar = array(0, dim = nsim)
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
    xbar = array(0, dim = nsim)
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

# Solution of problem - 7
# THEORY
# Solution of problem - 8
# THEORY 


# Solution of problem - 9 

r <- function(x,y){
    mx <- mean(x)
    my <- mean(y)
    cov <- sum((x-mx)*(y-my))
    sx <- sqrt(sum((x-mx)^2))
    sy <- sqrt(sum((y-my)^2))
    return(cov/(sx*sy))
}
price <- c(17,18,19,20,22,24,26,28,30)
demand <- c(40,38,35,30,28,25,22,21,20)
r(price, demand)
cor(price, demand)

# Solution of problem - 10 
cor(price, demand, method = 'spearman')


