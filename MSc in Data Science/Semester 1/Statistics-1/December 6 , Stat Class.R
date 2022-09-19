n0 <-1000
bin_left_end <- 0.1
bin_right_end <- 0.2
bin1_count <-numeric(N)
for(ii in 1:N){
u <- runif(n0)
bin1_count[ii]=sum(as.integer(u>=bin_left_end & u <bin_right_end)) 
}
p1 = 0.1
v <- (bin1_count-n0*p10)/sqrt(n0*p1*(1-p1))
hist(v,breaks=500,freq=F)

norm_pdf <- function(x,mu,sigma){
  (1/(sigma*sqrt(2*pi))) * exp(-(x-mu)^2/(2*sigma^2))
}
######################################
?qchisq()













#################################################
fn <- function(N,ball,bin)
{
  p <- 1/bin
  u <- rbinom(N,ball,p)
  z <- (u-(ball/bin))/sqrt(ball*p*(1-p))
  return(z)
}
z1 <-fn(100000,100,10) 
mean(z1)
sd(z1)
hist(z1,freq = F,breaks = 50)

