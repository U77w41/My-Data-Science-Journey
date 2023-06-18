library(psych)
library(readxl)
library(REdaS)
data <- read.csv('C:/Users/Ujjwa/OneDrive/Desktop/Factor Analysis/places.csv')
data <- data[,1:9]
head(data)

# Using PCA
pa <- fa(r = data,
         nfactors = 3, 
         rotate =  "varimax", 
         fm = 'pa', 
         residuals = TRUE )

# Using MAximum likelyhood
ml <- fa(r = data,
         nfactors = 3, 
         rotate =  "varimax", 
         fm = 'ml', 
         residuals = TRUE ) 
ml


### Check cumulative variance output 

### h2 how much variane is explained  by the given factors

### 