x <- factor(c("yes","yes", "no", "yes", "no")) ; x
levels(x)
table(x)
levels(x) <- c(0, TRUE) ;x
unclass(x)
as.numeric(x) #smae as unclass


y <- c(0,3,2,2,1) ; y
table(y)
factor(y)
y
unclass(factor(y))
y

as.numeric(factor(y)) #same as unclass
