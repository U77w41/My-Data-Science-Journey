
# Choose the "true" parameters. (User-defined)
a0_true = 2.745
a1_true = 4.294
a2_true = -0.9594

f_true = 0.534
print('*********** Generate some synthetic data from the model. ***********')
N = 50
#x = np.sort(10*np.random.rand(N))
x = sort(10*runif(N))
#yerr = 0.1+0.5*np.random.rand(N)
yerr = 0.1+0.5*runif(N)
y = a2_true*x^2 + a1_true*x + a0_true # <---- m_true*x+b_true
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
#yerr <- rep(1,N)
X <- matrix(c(rep(1.0,N),x,x^2),nrow=N,ncol=3,byrow =FALSE)/matrix(c(yerr,yerr,yerr),nrow=N,ncol=3,byrow =FALSE)
Y <- matrix(y,nrow=N,ncol=1,byrow =FALSE)/matrix(yerr,nrow=N,ncol=1,byrow =FALSE)
XT <- t(X)
A = XT%*%X #### " %*% " for matrix multiplication
b = XT%*%Y
a = solve(A,b)
## Or,
A_inv = solve(A) ##### Way to find inverse of a matrix in R
a1 = A_inv %*% b ### This is equivalent to a = solve(A,b)
print(a-a1) ## ~0
########
cat('INCOMPLETE ....')
lines(x,a[1] + a[2]*x + a[3]*x^2,col='blue')
#######################################
our_fit_result <- matrix(c(a,sqrt(diag(A_inv))),nrow = 3,ncol = 2,byrow = FALSE)
rownames(our_fit_result) <- c("Intercept","Coeff. of x","Coeff. of x^2")
colnames(our_fit_result) <- c("Estimate","Std. Error")
cat('Our fit results:----\n')
print(our_fit_result)
##############################################################################
##############################################################################
X2 <- x^2
quadratic.model <-lm(y ~ x + X2,weights = 1/yerr^2)
#summary(quadratic.model)
m <- summary(quadratic.model)
print(m)
print(m$sigma)
se <- m$coefficients[,2]/m$sigma
print(se)
### https://rdrr.io/r/stats/lm.html
# https://www.originlab.com/doc/origin-Help/PR-Algorithm#The_Parameter_Standard_Errors


