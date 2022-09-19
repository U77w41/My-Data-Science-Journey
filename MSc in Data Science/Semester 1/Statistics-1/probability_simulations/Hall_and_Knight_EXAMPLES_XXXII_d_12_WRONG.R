rm(list=ls())
## Simulating following problem(Hall & Knight: EXAMPLES XXXII d 12)
###########################################################
# 12. One of a pack of 52 cards has been lost; from the remainder
# of the pack two cards are drawn and are found to be spades; find the
# chance that the missing card is a spade.
##################################################################################
# In a full pack --- no._of_spades = 4 (one of each suits)

N = 1000000 # For this problem one needs a large N ?????
n1 = 0
n0 = 0
for(ii in 1:N){
  #more_spades <- 
  a <- sample(1:50,1)
  #other_cards <- 51 - 2 - more_spades
  aa <- c(1,1,rep(0,48))
  cards_pk <- c(1,1,aa[-a])#rep(1,more_spades),rep(0,other_cards))
  draw_of_2_cards <- sample(cards_pk,2,replace = FALSE)#TRUE)#FALSE)
  if(sum(draw_of_2_cards)==2){
    n0 = n0 + 1
    if(sum(cards_pk)==4){
      n1 = n1+1
    }
  }
}
print(n1/n0)
# See whether we are getting an answer aprroximately equal to   11/50 (theoretical answer)
# n1 = 0
# n0 = 0
# 
# for(ii in 1:N){
#   more_spades <- sample(0:2,1)
#   other_cards <- 52 - 2 - more_spades
#   cards_pk <- c(1,1,rep(1,more_spades),rep(0,other_cards))
#   #draw_of_2_cards <- sample(cards_pk,2,replace=TRUE)
#   draw_of_2_cards <- sample(cards_pk,2,replace=FALSE)
#   if(sum(draw_of_2_cards)==2){
#     n0 = n0 + 1
#     if(sum(cards_pk)==4){
#       n1 = n1+1
#     }
#   }
# }
# print((n0-n1)/n0)


# # See whether we are getting an answer aprroximately equal to   11/50 (theoretical answer)
# n1 = 0
# n0 = 0
# #full_pack <- c(rep(0,4),1:48)
# full_pack <- c(rep(1,4),rep(0,48))
# for(ii in 1:N){
#   a = sample(1:52,1)
#   pack_of_51 = full_pack[-a]
#   draw_of_2_cards <- sample(pack_of_51,2,replace=FALSE)#TRUE)
#   if(sum(draw_of_2_cards)==2){
#     n0 = n0 + 1
#     if(sum(pack_of_51)!=4){
#       n1 = n1+1
#     }
#   }
# }
# print((n0-n1)/n0)
