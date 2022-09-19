rm(list=ls())
# https://www.tutorialspoint.com/r/r_decision_making.htm
#############################################################################################
#    if
#    if else 
#    if else if .... else if ... else
#    switch ??????????????????
#############################################################################################
# if(boolean_expression) {
#   // statement(s) will execute if the boolean expression is true.
# }
x <- 25.0
if(is.integer(x)) {
  print("X is an Integer")
}
#############################################################################################
# if(boolean_expression) {
#   // statement(s) will execute if the boolean expression is true.
# } else {
#   // statement(s) will execute if the boolean expression is false.
# }

x <- c("what","is","truth")

if("Truth" %in% x) {
  print("Truth is found")
} else {
  print("Truth is not found")
}
#############################################################################################
# if (condition1) { 
#   expr1
# } else if (condition2) {
#   expr2
# } else if  (condition3) {
#   expr3
# } else {
#   expr4
# }

x <- c("what","is","truth")

if("Truth" %in% x) {
  print("Truth is found the first time")
} else if ("truth" %in% x) {
  print("truth is found the second time")
} else {
  print("No truth found")
}
#################################################################################
# if else if .... else if ... else
x1 <- c(0.1,2,3.5,-3.)#rnorm(10)

#x2 <- a + b*x1

count <-0
for(i in 1:length(x1)){
  
  if(x1[i]<0.5){
    count = count+1
  }
}


