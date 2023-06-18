# =======================================================
# Factor Analysis
# =======================================================
data <- read.csv("C:/Users/Ujjwa/OneDrive/Desktop/problem 1/",header = True)
View(data)
# Q. Perform a factor analysis on the variables X3 to X9 in the U.S. crime data set.
#    Would it make sense to use all of the variables for the analysis? 

data <- data[,3:9]
head(data)
StockMat<-as.matrix(data)
n<-nrow(StockMat)
p<-ncol(StockMat)
# =======================================================
# Factor Analysis by PCA
# =======================================================
# We will do the Principal Component Analysisby "prcomp" method
StdStockMatPCA <- prcomp(StockMat,center = TRUE,scale. = TRUE)
print(StdStockMatPCA)
StdStockMatFactLoad<-StdStockMatPCA$rotation*t(matrix(rep(StdStockMatPCA$sdev,p),p,p))  #[\sqrt(\lambda_1)e_1:...:\sqrt(\lambda_p)e_p]
print(StdStockMatFactLoad)  #Loadings on factors,i.e., full L matrix
StdStockMatSpecVar<-1-t(apply(StdStockMatFactLoad^2,1,cumsum))  #Calculating diagonal elments of specific variance matrix taking groups of factors at a time
print(StdStockMatSpecVar) #First column is the diagonal elements of \Psi when only one factor is considered, second column is the diagonal elements of \Psi when two factors are considered and so on
CumProp=(cumsum(StdStockMatPCA$sdev^2))/sum(StdStockMatPCA$sdev^2)
print(CumProp)  #Cumulative Percentages of variations explained by factors
Res1=cor(StockMat)-StdStockMatFactLoad[,1]%*%t(StdStockMatFactLoad[,1])-diag(StdStockMatSpecVar[,1])
print(Res1) #S-LL' -\Psi, when one factor is considered
sum(Res1*Res1)
Res2=cor(StockMat)-StdStockMatFactLoad[,c(1,2)]%*%t(StdStockMatFactLoad[,c(1,2)])-diag(StdStockMatSpecVar[,2])
print(Res2) #S-LL' -\Psi, when two factors are considered
sum(Res2*Res2)
Res3=cor(StockMat)-StdStockMatFactLoad[,c(1,2,3)]%*%t(StdStockMatFactLoad[,c(1,2,3)])-diag(StdStockMatSpecVar[,3])
print(Res3) #S-LL' -\Psi, when three factors are considered
sum(Res3*Res3)
# =======================================================
# Factor Analysis by MLE
# =======================================================
StockMatFA <- factanal(StockMat,factors = 2,scores = "none")
# [n-1-(2p+4m+5)/6]ln[|LL'+\shi|/|Sn|] follows \Chi^2 wit df=[(p-m)^2-p-m]/2
print(StockMatFA)
# \shi
StockMatSpVr<-1-t(apply(StockMatFA$loadings^2,1,cumsum))
print(diag(StockMatSpVr[,2]))
# R-LL'-\shi
Res2M<-cor(StockMat)-StockMatFA$loadings[,c(1,2)]%*%t(StockMatFA$loadings[,c(1,2)])-diag(StockMatSpVr[,2])
print(Res2M)
sum(Res2M*Res2M)

# Test for m=2
# [n-1-(2p+4m+5)/6]ln[|LL'+\shi|/|Sn|] follows \Chi^2 wit df=[(p-m)^2-p-m]/2
m=2
den=det(cor(StockMat))
num=det(StockMatFA$loadings[,c(1,2)]%*%t(StockMatFA$loadings[,c(1,2)])+diag(StockMatSpVr[,2]))
ts=(n-1-(2*p+4*m+5)/6)*log(num/den)
df=((p-m)^2-p-m)/2
(pval=pchisq(ts,df,lower.tail = FALSE))
#########################################################################
# Standerdizing the data
n<-nrow(StockMat)
p<-ncol(StockMat)
StockMean<-colMeans(StockMat)
DHalf<-sqrt((diag(var(StockMat))))
StdStockMat<-(StockMat-t(matrix(rep(StockMean,n),p,n)))/t(matrix(rep(DHalf,n),p,n))
#########################################################################

# Factor Score by Regression L_z'R^{-1}z'
StockMatFA_Score_Reg<-t(StockMatFA$loadings)%*%solve(cor(StockMat))%*%t(StdStockMat)
plot(StockMatFA_Score_Reg[1,],StockMatFA_Score_Reg[2,])
StockMatFA_reg <- factanal(StockMat,factors = 2,scores = "regression")
# Factor Score by Weighted Least Square (L_z'\shi^{-1}L_z)^{-1}L_z'\shi^{-1}z'
StockMatFA_Score_WLS<-solve(t(StockMatFA$loadings)%*%solve(cor(StockMat))%*%StockMatFA$loadings)%*%t(StockMatFA$loadings)%*%solve(cor(StockMat))%*%t(StdStockMat)
plot(StockMatFA_Score_WLS[1,],StockMatFA_Score_WLS[2,])
StockMatFA_wls <- factanal(StockMat,factors = 2,scores = "Bartlett")
StockMatFA_wls

