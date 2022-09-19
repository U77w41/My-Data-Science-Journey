rm(list=ls())
## Simulating following problem(Hall & Knight: EXAMPLES XXXII b 13)
## Simulating the problem no. 2 of our last quiz
##################################################################################
#13.) In a purse are 10 coins, all 1 rupee coins except one which is a 2 rupee coin; 
# in another(purse) are ten coins all 1 rupee coins. 

# Nine coins are taken(at random) from the former purse and put into the later, 
# and then nine coins are taken from the latter and put into the former.
###################################################################################
purse1 <- c(rep('A',9), 'B')
purse2 <- rep('A',10)

n = 0
N = 100000
for(ii in 1:N){
  from_purse1 <- sample(purse1,9,replace=FALSE)
  #left_in_purse1 <- setdiff(purse1,from_purse1)
  #print(left_in_purse1)
  into_purse2 <- c(purse2,from_purse1)
  from_purse2 <- sample(into_purse2,9,replace=FALSE)
  if('B' %in% from_purse1){
    back_to_purse1 <- c("A",from_purse2)
    #print(back_to_purse1)
  }
  if('B' %in% from_purse1==FALSE){#### DOUBTFUL???????
    back_to_purse1 <- c("B",from_purse2)
    #print(back_to_purse1)
  }
  if('B' %in% back_to_purse1){
    n = n+1
  }
  
}
print(n/N)# Answer
#See whether we are getting an answer aprroximately equal to  10/19(theoretical answer)