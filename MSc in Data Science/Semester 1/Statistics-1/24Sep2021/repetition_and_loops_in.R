rm(list=ls())
# Source: https://www.tutorialspoint.com/r/r_loops.htm
#############################################################################################
#    repeat
#    for
#    while
#    break
#    next

# Ctrl + Shift + C : comment out multiple lines rstudio
#############################################################################################
# repeat { 
#   commands 
#   if(condition) {
#     break
#   }
# }
#################
v <- c("Hello","loop")
ragat <- 0

repeat {
   #print(v)#####################################
   print(ragat^2)
   ragat <- ragat+1
   if(ragat > 10) {
     break
   }
 }
#############################################################################################
# for (value in vector) {
#   statements
# }
####################
v <- LETTERS[1:30]

for ( i in v) {
  print(i)
}

for ( i in 1:15) {
  print(i)
  print(v[i])
}
#############################################################################################
# while (test_expression) {
#   statement
# }
####################
v <- c("Hello","while loop")
cnt <- 0

while (cnt < 7) {
  print(v)
  cnt = cnt + 1
}

for(i in 1:7){
  print(v)
}
#############################################################################################
v <- LETTERS[1:26]
for ( i in v) {
  if (i == "B") {
    next
  }
  if (i == "P") {
    next
  }
  print(i)
}