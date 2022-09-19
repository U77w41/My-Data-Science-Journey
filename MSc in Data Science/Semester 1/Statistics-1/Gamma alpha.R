N= 1000
u= runif(N,0,1) ;u
draw.gamma.alpha.greater.than.one<-function(nrep,alpha,beta){
  if (beta<=0){stop("Scale parameter must be positive!\n")}
  if (alpha<=1){stop("Shape parameter must be greater than 1!\n")}
  x<-numeric(nrep) ; for (i in 1:nrep){
index<-0 ; while (index<1){
u1<-runif(1); u2<-runif(1)
v<-(alpha-1/(6*alpha))*u1/((alpha-1)*u2)
w1<-((2*(u2-1)/(alpha-1))+v+(1/v)<=2)
w2<-((2*log(u2)/(alpha-1))-log(v)+v<=1)
x[i][w1]<-(alpha-1)*v ; x[i][!w1&w2]<-(alpha-1)*v
index<-1*w1+1*(!w1&w2)}}
x<-x*beta
x} 
draw.gamma.alpha.greater.than.one(1,4,5)
for i in u:
  u
}






















##################################
draw.noncentral.chisquared<-function(nrep,df,ncp){
  if (ncp<0){stop("Non-Centrality parameter must be non-negative!\n")}
  if (df<=1){stop("Degrees of freedom must be greater than 1!\n")}
  x<-numeric(nrep) ; for (i in 1:nrep){
    df.int<-floor(df) ; df.frac<-df-df.int
    mui<-sqrt(ncp/df.int) ; jitter<-0
    if (df.frac!=0){jitter<-rchisq(1,df.frac)}
    x[i]<-sum((rnorm(df.int)+mui)^2)+jitter}
  x}