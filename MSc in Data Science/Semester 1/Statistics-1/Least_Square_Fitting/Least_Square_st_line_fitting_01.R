
# Choose the "true" parameters. (User-defined)
m_true = -0.9594
b_true = 4.294
f_true = 0.534
print('*********** Generate some synthetic data from the model. ***********')
N = 50
#x = np.sort(10*np.random.rand(N))
x = sort(10*runif(N))
#yerr = 0.1+0.5*np.random.rand(N)
yerr = 0.1+0.5*runif(N)
y = m_true*x+b_true
#y_true = y.copy()
y_true = y
#y += np.abs(f_true*y) * np.random.randn(N)
y = y+ abs(f_true*y) * rnorm(N)
#y += yerr * np.random.randn(N)
y = y + yerr *rnorm(N)
########################################################################
plot(x, y,
     ylim=range(c(y-yerr, y+yerr)),
     pch=19, xlab="x", ylab="y +/- yerr",
     main="Scatter plot with error bars"
)
# hack: we draw arrows but with very special "arrowheads"
arrows(x, y-yerr, x, y+yerr, length=0.05, angle=90, code=3)
lines(x,y_true,col='red')
########################################################################
X <- matrix(c(rep(1.0,N),x),nrow=N,ncol=2,byrow =FALSE)/matrix(c(yerr,yerr),nrow=N,ncol=2,byrow =FALSE)
Y <- matrix(y,nrow=N,ncol=1,byrow =FALSE)/matrix(yerr,nrow=N,ncol=1,byrow =FALSE)
XT <- t(X)
A = XT%*%X #### " %*% " for matrix multiplication
b = XT%*%Y
a = solve(A,b)
## Or,
A_inv = solve(A) ##### Way to find inverse of a matrix in R
a1 = A_inv %*% b ### This is equivalent to a = solve(A,b)
#print(a-a1) ## ~0
########
abline(a[1],a[2])
abline(a1[1],a1[2])
#######################################
our_fit_result <- matrix(c(a,sqrt(diag(A_inv))),nrow = 2,ncol = 2,byrow = FALSE)
rownames(our_fit_result) <- c("Intercept","Slope")
colnames(our_fit_result) <- c("Estimate","Std. Error")
cat('Our fit results:----\n')
print(our_fit_result)
#############################################################################################
#############################################################################################
## Using "lm"
linear.model <-lm(y ~ x,weights = 1/yerr^2)
m <- summary(linear.model)
print(m)
print(m$sigma)
se <- m$coefficients[,2]/m$sigma
print(se)
### https://rdrr.io/r/stats/lm.html
# https://www.originlab.com/doc/origin-Help/PR-Algorithm#The_Parameter_Standard_Errors
#############################################################################################
#############################################################################################
#install.packages('bfsl')
library(bfsl)
##### CORRECT RESULT:---
sd_x = rep(0,N)
sd_y = yerr
fit = bfsl(x, y, sd_x, sd_y)
plot(fit,ph=19)
abline(a[1],a[2],col = "red",lty=2)
legend("topright", c("from bfsl", "from our calculations"), lty = c(1,2),col=c('black','red'))
cat('\n')
cat('fit results from the R package bfsl ....\n')
print(fit)

