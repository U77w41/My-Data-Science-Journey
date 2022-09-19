## Simulating following problem(Hall & Knight: EXAMPLES XXXII d 9)
###########################################################
# A die is thrown three times, and the sum of the three numbers
# thrown is 15: find the chance that the first throw was a four.
#######################################################################
n1 = 0
n2 = 0
N = 1000000
for(ii in 1:N){
  three_throws <- sample(1:6,3,replace = TRUE)
  if(sum(three_throws)==15){
    n2 = n2 + 1
    frirst_throw <-three_throws[1]
    if(frirst_throw==4){
      n1 = n1 + 1
    }
  }
}
print(n1/n2)
# See whether we are getting an answer aprroximately equal to   1/5 (theoretical answer)