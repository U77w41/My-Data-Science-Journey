## ## Simulating following problem(Hall & Knight: EXAMPLES XXXII b 11)
## the problem no. 1 of our last quiz
##################################################################################
#11.) In three throws with a pair of dice, find the chance of throwing doublets at least once.
###################################################################################
n = 0
N = 100000
for(ii in 1:N){
  first_throw <- sample(1:6,2,replace=TRUE) 
  second_throw <- sample(1:6,2,replace=TRUE) 
  third_throw <- sample(1:6,2,replace=TRUE) 
  #print(var(first_throw) == 0)
  #print(var(second_throw) == 0)
  #print(var(third_throw) == 0)
  if(var(first_throw) == 0 | var(second_throw) == 0 | var(third_throw) == 0){
    n = n + 1
  }
}
print(n/N)# Answer

#See whether we are getting an answer aprroximately equal to  91/216(theoretical answer)


