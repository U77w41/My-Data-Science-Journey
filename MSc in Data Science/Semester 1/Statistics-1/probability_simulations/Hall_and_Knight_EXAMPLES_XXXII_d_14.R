rm(list=ls())
## Simulating following problem(Hall & Knight: EXAMPLES XXXII d 14)
###########################################################
# 14. A purse contains four coins; two coins having been drawn are
# found to be sovereigns: find the chance 1) that all the coins are
# sovereigns, (2) that if the coins are replaced another drawing will give
# & sovereign.
##################################################################################
N = 1000000
n1 = 0
n2 = 0
n0 = 0
for(ii in 1:N){
  more_sover <- sample(0:2,1)
  other_coins <- 4 - 2 - more_sover
  purse <- c(1,1,rep(1,more_sover),rep(0,other_coins))
  draw_of_2_coins <- sample(purse,2)
  if(sum(draw_of_2_coins)==2){
    n0 = n0 + 1
    if(sum(purse)==4){
      n1 = n1+1
    }
    # Another draw
    another_draw <- sample(purse,1)
    if(another_draw==1){
      n2 = n2 + 1
    }
  }
}
print(n1/n0)
# See whether we are getting an answer aprroximately equal to   3/5 (theoretical answer)
print(n2/n0)
# See whether we are getting an answer aprroximately equal to   7/8 (theoretical answer)