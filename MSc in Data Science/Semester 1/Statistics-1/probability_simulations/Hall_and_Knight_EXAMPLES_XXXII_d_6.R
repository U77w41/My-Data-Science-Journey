## Simulating following problem(Hall & Knight: EXAMPLES XXXII d 6)
###########################################################
# A man has 10 shillings(coins) and one of them is known to have two
# heads. He takes one at random and tosses it 5 times and it always
# falls head: what is the chance that it is the shilling with two heads ?

# 0 --- tail
# 1 --- head

v1 <-c(rep(0,9),rep(1,11))
matrix0 <- matrix(v1,nrow=10,ncol=2)#,byrow=TRUE)
#print(matrix0)
######################################
n1 = 0
n2 = 0
N = 1000000
for(ii in 1:N){
  #choose a coin
  a <- sample(1:10,1)#,replace = TRUE)
  # toss the coin for 5 times
  sum0 = 0
  for(jj in 1:5){
    sum0 = sum0 + sample(matrix0[a,],1)
  }
  if(sum0==5){
    n2 = n2 + 1
    if(a==10){
      n1 = n1+1
    }
  }
}
print(n1/n2)
#See whether we are getting an answer aprroximately equal to  32/41(theoretical answer)