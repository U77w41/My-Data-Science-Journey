data <- read.csv("C:/Users/Ujjwa/OneDrive/Desktop/Ujjwal_Chowdhury/df.csv")
#View(data)
# Q. Perform a factor analysis on the variables X3 to X9 in the U.S. crime data set.
#    Would it make sense to use all of the variables for the analysis? 

data <- data[,3:9]
head(data)
Stock = data

# We are first going to see how many factors are required to best explain the data.
# We perform eigen analysis of the sample correlation matrix from the first principles. 
# We find the cumulative proportion of variability explained by factors

R=cor(data)
R
lambda=eigen(R)$values
lambda
v=eigen(R)$vectors
P=cumsum(lambda)/sum(diag(R))
P
# Thus we see that ≈ 95% of the total variability is explained by 4 factors

#First we are going to look at the principal component method of estimation.


##### Principal Component Method of Estimation: #####


# We estimate the matrix of loadings L and matrix of uniqueness Ψ from the first principles.
L=cbind(sqrt(lambda[1])*v[,1],sqrt(lambda[2])*v[,2],sqrt(lambda[3])*v[,3],sqrt(lambda[4])*v[,4])
rownames(L)=colnames(data)
colnames(L)=c("Factor1","Factor2","Factor3","Factor4")
## The Matrix of loadings
L
#The residual matrix is given by
Resid=R-(L%*%t(L))
Shi=diag(Resid)
## Uniqueness
Shi



### To Find the Factor scores:


######## For the Principal Component Method: ##########


for(i in 1:nrow(Stock)){
    
      Stock[i,]=Stock[i,]-apply(Stock,MARGIN=2,FUN=mean)
       }
f=matrix(0,nrow=nrow(Stock),ncol=4)
A=as.matrix(solve(t(L)%*%L)%*%t(L))

for(i in 1:nrow(Stock)){
    
      f[i,1]=A[1,]%*%t(Stock[i,])
      #1st Factor Scores
      
        f[i,2]=A[2,]%*%t(Stock[i,])
        #2nd Factor Scores
        f[i,3]=A[3,]%*%t(Stock[i,])
        f[i,4]=A[4,]%*%t(Stock[i,])
         }
colnames(f)=c("Factor1","Factor2","Factor3","Factor4")
f


############ Maximum Likelihood Method of Estimation #############
fit_ML=factanal(Stock,factors=3,rotation="varimax")
fit_ML
# Here fit ML is the output from the factanal() function. We extract the loadings
# and uniqueness from the output

L.ML=fit_ML$loadings
L.ML#Getting the matrix of loadings


Shi.MLE=fit_ML$uniqueness
Shi.MLE
#Getting the uniquesness


#### To Find the Factor scores:

#### For the Maximum Likelihood Method:

fit_ML_scores=factanal(Stock,factors=3,scores="regression",rotation="varimax")$scores
fit_ML_scores



