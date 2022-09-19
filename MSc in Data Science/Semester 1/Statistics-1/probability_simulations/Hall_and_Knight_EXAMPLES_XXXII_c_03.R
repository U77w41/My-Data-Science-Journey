rm(list=ls())
## Simulating following problem(Hall & Knight: EXAMPLES XXXII c 3)
###########################################################
# 3. In each of a set of games it is 2 to 1 in favour of the winner
# of the previous game: what is the chance that the player who wins
# the first game shall win three at least of the next four.
###################################################################################
n1 = 0
N = 1000000
for(ii in 1:N){
  firstgame <- sample(c('A','B'),1)
  if(firstgame=='A'){
    playerA <- 2
    playerB <- 1
  }
  if(firstgame=='B'){
    playerA <- 1
    playerB <- 2
  }
  Winner1st = firstgame
  CountA = 0
  CountB = 0
  for(j in 1:4){
    game <- sample(c('A','B'),1,prob=c(playerA,playerB) )
    if(game=='A'){
      playerA <- 2
      playerB <- 1
      CountA <- CountA + 1
    }
    if(game=='B'){
      playerA <- 1
      playerB <- 2
      CountB <- CountB + 1
    }
  }
  if(firstgame=='A' & CountA>=3){
    n1 = n1 + 1
  }
  if(firstgame=='B' & CountB>=3){
    n1 = n1 + 1
  }

}
print(n1/N)
# See whether we are getting an answer aprroximately equal to   4/9 (theoretical answer)
cat('Though correct answer, but better look for any fast algorithm ?????')