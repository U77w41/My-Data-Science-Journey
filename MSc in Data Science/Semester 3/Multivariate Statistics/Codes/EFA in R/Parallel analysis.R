install.packages("paran")  ######parallel analysis package



install.packages("readxl") ######reads excel


library(paran)
library(readxl)

###############################################################################

ATGC <- read_excel("D:/BDA/Semester 3/MVS/Factor Analysis/EFA in R-20221125T053526Z-001/EFA in R/ATGC_expfa.xlsx")
View(ATGC)        
attach(ATGC)

#####################Using Parallel analysis to derive the number of factors##################################

####cfa=FALSE will give a principal components parallel analysis

paran(ATGC, cfa=TRUE)

##Graph is optional 
paran(ATGC, cfa=TRUE, graph=TRUE, 
color=TRUE, col=c("black","red","blue"))




#######so according to the parallel analysis we need 3 factors

fa(ATGC, nfactors = 3, rotate =  "oblimin" )  ### 

######make a figure 

M2<-fa(ATGC, nfactors = 3, rotate =  "oblimin" )
fa.diagram(M2,main="ATGC")

#################################################



