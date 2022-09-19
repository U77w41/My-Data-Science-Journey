## Simulating following problem(Hall & Knight: EXAMPLES XXXII d 1)
###########################################################
# There are four balls in a bag, but it is not known of what
# colours they are; one ball is drawn and found to be white: find the
# chance that all the balls are white.
###############################################################################
#White --- 0
#Non-white --- any other number

n1 = 0
n2 = 0
N = 100000
for(ii in 1:N){
  r0 <-sample(0:3,1)
  other_colors <- 4-1-r0
  v1 <- c(0,rep(0,r0),rep(1,other_colors)) # e.g. c(0,rep(0,4),rep(1,0)) == 0 0 0 0 0
  # 0 --- white
  first_draw <- sample(v1,1)
  if(first_draw ==0){
    n2 = n2 + 1
    #for_all_being_white <- sum(v1) == 0
    # if both red 
    if(sum(v1)==0){
      n1 = n1 + 1
    }
  }
}
print(n1/n2)
#See whether we are getting an answer aprroximately equal to  2/5 (theoretical answer)