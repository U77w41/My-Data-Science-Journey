## Simulating following problem(Hall & Knight: EXAMPLES XXXII d 2)
###########################################################
# In a bag there are six balls of unknown colours; three balls
# are drawn and found to be black; find the chance that no black ball
# is left in the bag.
###############################################################################
#Black --- 0
#Non-black --- 1 (any other number)

n1 = 0
n2 = 0
N = 1000000
for(ii in 1:N){
  more_black <-sample(0:3,1)
  other_colors <- 6 - 3 - more_black
  v1 <- c(0,0,0,rep(0,more_black),rep(1,other_colors)) # e.g. c(0,rep(0,4),rep(1,0)) == 0 0 0 0 0
  # 0 --- Black
  #v1 <- sample(0:1,6,replace = TRUE)
  three_draws <- sample(v1,3,replace=FALSE)# ,replace=TRUE must not be used!!!!
  if(sum(three_draws) == 0){
    n2 = n2 + 1
    #for_rest_not_black <-
    if(sum(v1)==3){
      n1 = n1 + 1
    }
  }
}
print(n1/n2)
#See whether we are getting an answer aprroximately equal to  1/35 ==  0.02857143 (theoretical answer)