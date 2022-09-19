rm(list=ls())
## Simulating following problem(Hall & Knight: EXAMPLES XXXII b 12)
## Simulating the problem no. 3 of our last quiz
##################################################################################
# If 4 whole numbers taken at random are multiplied together show that the chance that
# the last digit in the product is 1,3,7, or 9 is 16/625. 
##################################################################################
get_digit <- function(x, d) {
  # digits from the right
  # i.e.: first digit is the ones, second is the tens, etc.
  (x %% 10^d) %/% (10^(d-1))
}

# for one number
get_all_digit <- function(x) {
  get_digit_x <- function(d) get_digit(x,d)
  sapply(nchar(x):1, get_digit_x) 
}

# for a vector of numbers
digits <- function(x) {
  out <- lapply(x, get_all_digit)
  names(out) <- x
  out
}
##################################################################################

Nmax = 10000# This should be big enough, but that can slow down the code also
n = 0
N = 1000000
for(ii in 1:N){
  v1 <- prod(sample(0:Nmax,4))
  #print(v1)
  #print(get_digit(v1,1))
  last_digit <- get_digit(v1,1)
  #########################
  v2 <- c(1,3,7,9)
  if(last_digit %in% v2){
    n = n + 1
  }
}

print(n/N)
#See whether we are getting an answer aprroximately equal to  16/625(theoretical answer)