
#Exploratory factor analysis in R Dr Paul Christiansen

################packages to install- only needs to be done once.


#install.packages("psych")  ######PCA/EFA amongst many other things!
#install.packages("REdaS")  ######produces KMO and Bartletts test
#install.packages("readxl") ######reads excel

###############pull packages out of the library


library(psych)
library(readxl)
library(REdaS)


##############read in the data set

ATGC <- read_excel("ATGC_expfa.xlsx")
View(ATGC)        
attach(ATGC)

#############

bart_spher(ATGC) ###### produces Bartletts test of spherecity (you want this to be significant)
KMO(ATGC)       ###### Kaiser-Meyer-Olkin measure, you want to be above .7


#############FA, if you are doing a PCA switch fa to say principal

##########using Kaisers rule, Eigenvalues>1 represent valid factors

###set nfactors to n items, in this case there is 12 items so we state nfactors=12
#####oblimin is selected as the rotation although this is default for factor analysis (variamx is default for pca)
##orthagonal roatations availible ="none", "varimax", "quartimax", "bentlerT", "equamax", "varimin", "geominT" "bifactor" 
##oblique roatations availible "Promax", "promax", "oblimin", "simplimax", "bentlerQ, "geominQ" "biquartimin" "cluster" 

fa(ATGC, nfactors = 9, rotate =  "oblimin" )  


fa(ATGC, nfactors = 3, rotate =  "oblimin" )

###################you can produce a figure 

M1<-fa(ATGC, nfactors = 3, rotate =  "oblimin" ) ##save the analysis as the object m1
fa.diagram(M1,main="ATGC")                      ## produce a figure with the title "" note fa.diagram still works for PCA























