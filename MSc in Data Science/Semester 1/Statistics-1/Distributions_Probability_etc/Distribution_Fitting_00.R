# Source: http://www.di.fc.ul.pt/~jpn/r/distributions/fitting.html
##########################################################################################
# Introduction
# The typical way to fit a distribution is to use function MASS::fitdistr:

library(MASS)
set.seed(101)
my_data <- rnorm(250, mean=1, sd=0.45)      # unkonwn distribution parameters

fit <- fitdistr(my_data, densfun="normal")  # we assume my_data ~ Normal(?,?)
fit

hist(my_data, pch=20, breaks=25, prob=TRUE, main="")
curve(dnorm(x, fit$estimate[1], fit$estimate[2]), col="red", lwd=2, add=T)
#########################################################################################
# fitdistr uses optim to estimate the parameter values by maximizing the 
# likelihood function. So it works like this:

log_likelihood <- function(params) { -sum(dnorm(my_data, params[1], params[2], log=TRUE)) }
fit2 <- optim(c(0,1), log_likelihood)    # c(0,1) are just initial guesses
fit2

hist(my_data, pch=20, breaks=25, prob=TRUE)
curve(dnorm(x, fit2$par[1],     fit2$par[2]),     col="blue", lwd=6, add=T) # optim fit
curve(dnorm(x, fit$estimate[1], fit$estimate[2]), col="red",  lwd=2, add=T) # fitdistr fit


#########################################################################################
# Using fitdistrplus
# This tutorial uses the fitdistrplus package for fitting distributions.

library(fitdistrplus)

# Choosing which distribution to fit
# Let’s use one of the datasets provided by the packge:

data("groundbeef", package = "fitdistrplus")
my_data <- groundbeef$serving
plot(my_data, pch=20)

# We can first plot the empirical density and the histogram to gain insight of the data:
plotdist(my_data, histo = TRUE, demp = TRUE)

#########################################################################################
# Another tool is to show some descriptive statistics, like the moments, to help us in 
# making a decision:
  
descdist(my_data, discrete=FALSE, boot=500)
# The plot also includes a nonparametric bootstrap procedure for the values of kurtosis 
# and skewness.
#########################################################################################
# Fitting a distribution
# Say, in the previous eg, we chose the weibull, gamma and log-normal to fit:
fit_w  <- fitdist(my_data, "weibull")
fit_g  <- fitdist(my_data, "gamma")
fit_ln <- fitdist(my_data, "lnorm")

summary(fit_w)
summary(fit_g)
summary(fit_ln)


par(mfrow=c(2,2))
plot.legend <- c("Weibull", "lognormal", "gamma")
denscomp(list(fit_w, fit_g, fit_ln), legendtext = plot.legend)
cdfcomp (list(fit_w, fit_g, fit_ln), legendtext = plot.legend)
qqcomp  (list(fit_w, fit_g, fit_ln), legendtext = plot.legend)
ppcomp  (list(fit_w, fit_g, fit_ln), legendtext = plot.legend)
# The fitting can work with other non-base distribution. It only needs that the 
# correspodent, d, p, q functions are implemented.
#########################################################################################
# In the next eg, the endosulfan dataset cannot be properly fit by the basic distributions 
# like the log-normal:

data("endosulfan", package = "fitdistrplus")
my_data <- endosulfan$ATV
par(mfrow=c(1,1))
fit_ln <- fitdist(my_data, "lnorm")
cdfcomp(fit_ln, xlogscale = TRUE, ylogscale = TRUE)

# To solve this it is used the Burr and Pareto distributions available at package actuar

install.packages("actuar")
# Warning in install.packages :
#   package ‘actuar’ is not available (for R version 3.6.3)
library(actuar)

fit_ll <- fitdist(my_data, "llogis", start = list(shape = 1, scale = 500))
fit_P  <- fitdist(my_data, "pareto", start = list(shape = 1, scale = 500))
fit_B  <- fitdist(my_data, "burr",   start = list(shape1 = 0.3, shape2 = 1, rate = 1))
cdfcomp(list(fit_ln, fit_ll, fit_P, fit_B), xlogscale = TRUE, ylogscale = TRUE,
        legendtext = c("lognormal", "loglogistic", "Pareto", "Burr"), lwd=2)

# INCOMPLETE because of non-availability of "actuar"
