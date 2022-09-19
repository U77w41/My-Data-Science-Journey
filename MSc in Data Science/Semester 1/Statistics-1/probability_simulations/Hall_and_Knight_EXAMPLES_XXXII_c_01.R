rm(list=ls())
## Simulating following problem(Hall & Knight: EXAMPLES XXXII c 1)
###########################################################
# 1. In a certain game A's skill is to B's as 3 to 2: find the chance
# of A winning 3 games at least out of 5.
##################################################################################
n1 = 0
N = 1000000
for(ii in 1:N){
  AB <- sample(c(1,0),5,replace=TRUE,prob = c(3,2))
  if(sum(AB)>=3){
    n1 = n1 + 1
    }
}
print(n1/N)
# See whether we are getting an answer aprroximately equal to   2133/3125 (theoretical answer)