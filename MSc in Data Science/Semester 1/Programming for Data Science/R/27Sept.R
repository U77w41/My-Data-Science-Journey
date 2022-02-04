subset(mtcars,hp>200,select = c(hp,mpg,cyl))
aggregate(len~supp,data=ToothGrowth,mean)
head(warpbreaks)
table(warpbreaks$wool)
table(warpbreaks$tension)
aggregate(breaks ~ wool + tension, data = warpbreaks, mean)
#positional argument (parameter) - proper sequence of the arguments
#have to be maintained as defined in the definition (signature)
#of a function (any function / any language) and named argument scheme
#is useful in case you want to skip some intermediate position parameters
#as you want them to be the default value (again as defined in the 
#signature of the function)

nchar(x)
x <- c("ab", "cde", "fghij")
substr(x, start, stop)
x <- "abcdef"; substr(x, 2, 4)
substr(x, 2, 4) <- "22222"

grep("A", c("A","A","c"), fixed=F)

grep(pattern, x, ignore. case=FALSE, fixed=FALSE)

: Search for pattern in x. If fixed=FALSE, then pattern is a
regular expression. If fixed=TRUE, then pattern is a text string. Returns matching indices
. grep("A", c("b","A","c"), fixed=TRUE) returns 2
. strsplit(x, split, fixed=FALSE) : Split the elements of character vector x at split. If fixed=FALSE, then pattern is a
regular expression. If fixed=TRUE, then pattern is a text string
. strsplit(c("abc",'cbc','dabccdbde'),'b',TRUE) returns