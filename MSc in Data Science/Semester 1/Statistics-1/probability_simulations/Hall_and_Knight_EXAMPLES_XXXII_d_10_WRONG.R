## Simulating following problem(Hall & Knight: EXAMPLES XXXII d 10)
###########################################################
# A speaks the truth 3 out of 4 times, and B 5 out of 6 times:
# what is the probability that they will contradict each other in stating
# the same fact ?
#########################################################################
# 1 --- Truth
# 0 --- Lie ?????????????????????????? DOUBTFUL
A <- c(rep(1,3),0)
B <- c(rep(1,5),0)

# Not contradicting means A-->1 and B--->1, else they contradict each other
# Also not contradicting when A-->0 and B--->0 !!!!!! ?????????????????
# Assumption --- only one truth, whereas many lies

N = 100000
n1 = 0
for(ii in 1:N){
  cond0=0
  A_speak <- sample(A,1,replace = FALSE)
  B_speak <- sample(B,1,replace = FALSE)
  cond0 = A_speak + B_speak
  if(cond0 != 2){
    n1 = n1 + 1
  }
}
print(n1/N)
# See whether we are getting an answer aprroximately equal to   1/3 (theoretical answer)

# n1 = 0
# for(ii in 1:N){
#   cond0=0
#   A_speak <- sample(c(0,1),1,prob=c(1/4,3/4))
#   B_speak <- sample(c(0,1),1,prob=c(1/6,5/6))
#   cond0 = A_speak + B_speak
#   if(cond0 != 2){
#     n1 = n1 + 1
#   }
# }
# print(n1/N)
# #########################################################
N = 100000
A_speak <- sample(c(0,1),N,replace=TRUE,prob=c(1,3))
B_speak <- sample(c(0,1),N,replace=TRUE,prob=c(1,5))
 n1 = 0
for(ii in 1:N){
   cond0=0
   cond0 = A_speak[ii] + B_speak[ii]
   if(cond0 != 2){
     n1 = n1 + 1
   }
 }
 print(n1/N)
 # See whether we are getting an answer aprroximately equal to   1/3 (theoretical answer)