source("Simple_Linear_Congruential.R")
##########################################################
print("*********** Ujjawal ****************")
N = 7
modulus <- 2^2
multiplier <- 21
increment <- 1
cat("seed"," period","   Sequence",'\n')
for (seed0 in 1:100){
  out <- Simple_LCG_unif(modulus,multiplier,increment,seed0,N)
  cat(seed0,'     ',length(unique(out$Ir)),'   ',out$Ir,'\n')}
