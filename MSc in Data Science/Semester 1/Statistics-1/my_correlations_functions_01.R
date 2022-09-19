#
Price <- c(17, 18, 19, 20, 22, 24, 26, 28, 30)
Demand <- c(40, 38, 35, 30, 28, 25, 22, 21, 20)

my_corr_KP <- function(x,y){
  # Karl Pearson's coefficient of correlation
  xMean <- mean(x)
  yMean <- mean(y)
  numerator_corr <- sum((x-xMean)*(y-yMean))
  denominator_corr <- sqrt(sum((x-xMean)^2))*sqrt(sum((y-yMean)^2))
  r <- numerator_corr/denominator_corr
  return(r)
}

corr <- my_corr_KP(Price,Demand)
Price1 <- (Price - 10)/3
Demand1 <- (Demand - 7)/5
corr1 <- my_corr_KP(Price1,Demand1)
###########################################################
x0 <- c(78, 89, 97, 69, 59, 79, 68)
y0 <- c(125,137,156,112,107,136,124)
my_corr_SR <- function(x,y){
  # Spearman's rank correlation coefficient
  # INCOMPLETE
  xRank <- match(x,sort(x))
  yRank <- match(y,sort(y))
  numerator_corr <- sum((xRank - yRank)^2)
  denominator_corr <- 2*length(x)*var(xRank)
  r <- 1 - numerator_corr/denominator_corr
  return(r)
}
#method = c("pearson", "kendall", "spearman")
#corr <- cor.test(x=cars$speed, y=cars$dist, method = 'spearman')
corr_r1 <- cor.test(Price, Demand, method = 'pearson')
corr_sr1 <- cor.test(x0, y0, method = 'spearman')
corr_2 <- my_corr_SR(x0,y0)
corr1
corr_2
corr_r1
corr_sr1


a= read.csv("over_50_data.csv")
a
colnames(a)
View(a)
b=read.csv("under_50_data.csv")
View(b)
colnames(b)
b_2<-unlist(b[2])
b_4<-unlist(b[4])
plot(b_2,b_4)
cor.test(as.numeric(b_2),as.numeric(b_4), method = 'pearson')


a_2<-unlist(a[2])
a_4<-unlist(a[4])
plot(a_2,a_4)
cor.test(as.numeric(a_2),as.numeric(a_4), method = 'pearson')

