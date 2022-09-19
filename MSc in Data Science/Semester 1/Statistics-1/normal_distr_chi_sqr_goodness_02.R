rm(list = ls())
########################################################################
library(png)
library(stringr)
########################################################################
nbins = 10 
bins <- seq(0.0,1.0,length.out=nbins+1)#by=0.1)
N = 100000
n0 <- 1000
bin1_count <- matrix(nrow = N, ncol=nbins)
for(ii in 1:N){
  u <- runif(n0)
  for(jj in 1:nbins){
    bin1_count[ii,jj] = sum(as.integer(u>=bins[jj] & u<bins[jj+1]))# FAST
  }
}
p1 =0.1
p <- rep(0.1,nbins)
for(ii in 1:nbins){
  png(file = paste('plot',str_pad(ii, 3, pad = "0"),".png", sep=""),width = 1000, height = 600,res = 100)
  par(mfrow=c(1,2))
  v1a <- (bin1_count[,ii] - n0*p[ii])/sqrt(n0*p[ii])
  d1 <- density(v1a)
  plot(d1,col='black',type="l", lty=2)
  curve(dnorm(x,mean=0,sd=sqrt(1-p1)), from = -4, to = 4,n=1001,col='red',add=T)
  ###########################################
  v1b <- (bin1_count[,ii] - n0*p[ii])/sqrt(n0*p[ii]*(1-p[ii]))
  d2 <- density(v1b)
  plot(d2,col='black',type="l", lty=2)
  curve(dnorm(x,mean=0,sd=1), from = -4, to = 4,n=1001,col='red',add=T)
  dev.off()
}

############################################################################
############################################################################
y <- numeric(N)
p <- rep(0.1,nbins)
for(kk in 1:N){
  y[kk] <- sum( ( bin1_count[kk,] - n0*p )^2/(n0*p) )
}
########################
par(mfrow=c(1,1))
d_chi_data <- density(y)
png(file = paste('plot_chisqr',str_pad(ii, 3, pad = "0"),".png", sep=""),width = 1000, height = 600,res = 100)
plot(d_chi_data,col='black',type="l", lty=2)
curve(dchisq(x,df=length(p)-1), from = 0, to = 40,n=1001,col='red',add=T)
dev.off()







# d2 <- density(v2)
# plot(d1,col='blue')
# lines(d2,col='black')#,add=T)
# norm_pdf <- function(x,mu,sigma){(1/(sigma*sqrt(2*pi))) * exp(- (x-mu)^2/(2*sigma^2))}
# mu = 0.0
# sigma = 1.0#sqrt(n0*p1)
# curve(norm_pdf(x,mu,sigma),-4,4,n = 1001,col='red',add=T)
##################################################################################
