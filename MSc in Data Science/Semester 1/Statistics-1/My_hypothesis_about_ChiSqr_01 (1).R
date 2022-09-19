# My hypothesis: Sum of square of 
# N(0,sigma_1), N(0,sigma_2),...,N(0,sigma_N) 
# will have Chi-Square distribution with degree of freedom
# d-o-f == sigma_1^2 + sigma_2^2 + ... + sigma_N^2
############################################################################
# let's test::
p1 = 0.2;p2 = 0.1;p3=0.15;p4=0.55
sigma1 = sqrt(1-p1);
sigma2 = sqrt(1-p2);
sigma3 = sqrt(1-p3);
sigma4= sqrt(1-p4);
N = 1000000
y <- numeric(N)
for(ii in 1:N){
  y[ii] <- rnorm(1,0,sigma1)^2 + rnorm(1,0,sigma2)^2 + rnorm(1,0,sigma3)^2 + rnorm(1,0,sigma4)^2  
}

d <- density(y)
plot(d,col='blue')
chiSqr_pdf <- function(x,nu) {x^((nu-2)/2) * exp(-x/2)/(gamma(nu/2)*2^(nu/2))}
nu <- sigma1^2 + sigma2^2 + sigma3^2 + sigma4^2
#curve(chiSqr_pdf(x,nu),0,30,n=1001,col='red',add=T)
curve(dchisq(x, df = nu), from = 0, to = 30,n=1001,col='red',add=T)

hist(y,freq = FALSE,breaks='FD')
#nu <- 2*sqrt(sigma1^2 + sigma2^2 + sigma3^2 + sigma4^2)
curve(chiSqr_pdf(x,nu),0,30,n=1001,col='red',add=T)

print('But we are not providing cov(Z_i*Z_j) = -sqrt(p_i*p_j)')
