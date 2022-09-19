## Simulating following problem(Hall & Knight: EXAMPLES XXXII d 7)
###########################################################
# A bag contains 5 balls of unknown colour; a ball is drawn
# and replaced twice, and in each case is found to be red: if two bulls
# are now drawn simultaneously find the chance that both are red.

n1 = 0
n2 = 0

N = 100000
for(ii in 1:N){
  r0 <-sample(0:4,1)
  other_colors <- 5-1-r0
  v1 <- c(0,rep(0,r0),rep(1,other_colors)) # e.g. c(0,rep(0,4),rep(1,0)) == 0 0 0 0 0
  # 0 --- red
  first_draw <- sample(v1,1)
  second_draw <- sample(v1,1)
  if_both_red <- first_draw + second_draw
  if(if_both_red==0){
    n2 = n2 + 1
    draw_two_balls <- sample(v1,2)
    # if both red 
    if(sum(draw_two_balls)==0){
      n1 = n1 + 1
    }
  }
}
print(n1/n2)
#See whether we are getting an answer aprroximately equal to  377/550(theoretical answer)