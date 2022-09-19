## Simulating following problem(Hall & Knight: EXAMPLES XXXII d 8)
###########################################################
# A purse contains five coins, each of which may be a shilling(say 2 rupee coin)
# or a sixpence(1 rupee ); two are drawn and found to be shillings: find the 
# probable value of the remaining coins.
#######################################################
# http://projectbritain.com/moneyold.htm
#   2 farthings = 1 halfpenny
#   2 halfpence = 1 penny (1d)
#   3 pence = 1 thruppence (3d)
#   6 pence = 1 sixpence (a 'tanner') (6d)
#   12 pence = 1 shilling (a bob) (1s)
#   2 shillings = 1 florin ( a 'two bob bit') (2s)
#   2 shillings and 6 pence = 1 half crown (2s 6d)
#   5 shillings = 1 Crown (5s) 
###########################################################
#n1 = 0
#n2 = 0
shilling = 2
sxipence = 1
sum0 = 0
N = 1000000
for(ii in 1:N){
  sixp_N <- sample(0:3,1)
  shilling_N <- 5 - 2 - sixp_N
  #purse <- c(2,2,rep(2,shilling_N),rep(1,sixp_N))
  remaining_coins <- c(rep(2,shilling_N),rep(1,sixp_N))
  sum0 = sum0 + sum(remaining_coins)
}
print(sum0/(N*shilling)) 
# See whether we are getting an answer aprroximately equal to  
# (9/4)*shilling (theoretical answer)