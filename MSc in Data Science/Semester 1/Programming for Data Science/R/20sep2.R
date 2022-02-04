v1 <- c(1L,2L,3L,4L) ;v1
v5<- v1 * 5 ; v5
v2 <- c(T,F) ; v2
vt <- v2 * v1 ;vt
is.logical(vt)
sum(v1)
sum(v5)
u <- 2 > 2:-3 ; u
typeof(vt)
typeof(v2)
 sqrt(v1)  #square rooot
 
sqrt(u) 
 2 : -(4)  
x <- y <- z <- 1:3 ; x;y;z
sqrt(x,y,z)
is.vector(x)
1:3
z[2]
sqrt(x);sqrt(y);sqrt(z)
################################################
vn <- c('1',  4 , 'b')
as.numeric(vn[!is.na(as.integer(vn))])  # Homework insted of using this can we use other codes ?
#[1] 1 4
#Warning message:
 # NAs introduced by coercion 
as.integer(vn)
#[1]  1  4 NA
#Warning message:
 # NAs introduced by coercion 

p1 <- !is.na(as.integer(vn)) ; p1 
#Warning message:
  #NAs introduced by coercion 
#[1]  TRUE  TRUE FALSE

p <-is.na(as.integer(vn)) ;p
#Warning message:
#NAs introduced by coercion 
#[1] FALSE FALSE  TRUE

typeof(P)
# [1] "logical"


 s <-vn[!is.na(as.integer(vn))] ; s
#Warning message:
 #NAs introduced by coercion 
# [1] "1" "4"
 typeof(s)
 # [1] "character"
 
 
vn[p1] #not working

vn[!is.na(as.integer(vn))]
as.numeric(vn[p1])





###########################
b <- c(   F , 1 ,23 ,3 ,78342 , 9.008 , 9.1 , 666666, -123 , 'a' , 'b' 'b' , 'z'
sort(b)

