rm(list=ls())
## Simulating following problem(Hall & Knight: EXAMPLES XXXII c 02
## the problem no. 3 of our last quiz
###########################################################
## Simulating the problem no. 3 of our last quiz
##################################################################################
# A coin whose faces are marked 2, 3 is thrown 5 times: what is the chance of obtaining
# a total of 12?

n = 0
N = 1000000
for(ii in 1:N){
  sum0 = 0
  for(jj in 1:5){
    sum0 = sum0 + sample(2:3,1)
  }
  if(sum0==12){
    n = n + 1
  }
}

print(n/N)
#See whether we are getting an answer aprroximately equal to  5/16(theoretical answer)