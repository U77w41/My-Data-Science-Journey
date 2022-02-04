###########################    R - Part1    ##############################

#exerecises 

#What type will be output of:
#x <- 1; x; x+1
#y <- 2020L
#2+i
#2+1i
#2+0i
#c1 <- complex(2,2,3); c1
#"1.7" * 2
#as.numeric("1.7")*2
#x <- c(1.2,3L,4.3); x

x <- 1 ; x ; x+1
#[1] 1
#[1] 2

y <- 2020L ; y
#[1] 2020

2+i
#Error: object 'i' not found
2+1i
#[1] 2+1i
2+0i
#[1] 2+0i

c1 <- complex(2,2,3); c1
#[1] 2+3i 2+3i

"1.7" * 2
#Error: unexpected input in """

as.numeric("1.7")*2
#[1] 3.4

x <- c(1.2,3L,4.3); x
#[1] 1.2 3.0 4.3 ; the interger turned into numerical value

##########################################################
# Exercises

# Create a matrix with any continuous sequence of numbers of
# dimension 4x5

#solution_1:

x_mat <- matrix(1000:1019 , 4 , 5) ;x_mat

#sloution_2:
y_mat <-  matrix( 1 : 20 , ncol = 5 , nrow = 4 , byrow = 1) ; y_mat

yc_mat <- matrix(1:20 , nrow = 4 , ncol = 5 ) ; yc_mat

#solution_3:
r1 = 1:5 ; r2 = 6:10 ; r3 = 11:15 ; r4 = 16:20 ; rbind(r1,r2,r3,r4)
rb_mat <- rbind(r1,r2,r3,r4) ; rb_mat

c1=1:4 ; c2=5:8 ; c3=9:12 ; c4=13:16 ; c5=17:20 ; cbind(c1,c2,c3,c4,c5)

cb_mat= cbind(c1,c2,c3,c4,c5) ; cb_mat

#solution_4
p1 = c(1,2,3,4,5) ; p2= c(6,7,8,9,10) ; p3= c(11,12,13,14,15) ; p4= c(16,17,18,19,20) 

p_mat <- rbind(p1,p2,p3,p4) ; p_mat


#solution_5
CB_mat <- cbind( 1:4 , 5:8 , 9:12 ,13:16 , 17:20) ; CB_mat

#or
RB_mat <- rbind( 1:5 ,6:10 ,11:15 ,16:20) ; RB_mat







# ??? Create a matrix of 2 x 3 with dimension names as r1,r2 and c1, c2,c3

#solution_1
NA_mat <- matrix(nrow=2,ncol=3) ; NA_mat 

rownames(NA_mat) <- c("r1","r2") ; colnames(NA_mat) <- c("c1","c2","c3") ; NA_mat


#solution_2
r1 = c("a11" , "a12" , "a13") ; r2 =c("a21" , "a22" , "a23") 

char_mat <- rbind(r1,r2) ; colnames(char_mat) = c("c1","c2","c3") ; char_mat






#  What is the output of the following:
#    m1 <- matrix(3:20,3,8); m1
#    m1 <- matrix(3:20,3,5); m1

mat_1 <- matrix(3:20,3,8); mat_1
# Warning message:
#   In matrix(3:20, 3, 8) :
#   data length [18] is not a sub-multiple or multiple of the number of columns [8]
#        [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
# [1,]    3    6    9   12   15   18    3    6
# [2,]    4    7   10   13   16   19    4    7
# [3,]    5    8   11   14   17   20    5    8

mat_2 <- matrix(3:20,3,5); mat_2

# Warning message:
#   In matrix(3:20, 3, 5) :
#   data length [18] is not a sub-multiple or multiple of the number of columns [5]
#       [,1] [,2] [,3] [,4] [,5]
# [1,]    3    6    9   12   15
# [2,]    4    7   10   13   16
# [3,]    5    8   11   14   17





# CHALLENGE: Try using paste function to construct the row and column names

PF_mat <- matrix(1000:1005, 2, 3) 
rownames(PF_mat) <- c(paste0(c(rep("r")), 1:2)) #rownames(PF_mat) <- c(paste0('r', 1:2))
colnames(PF_mat) <- c(paste0(c(rep("c")), 1:3)) #colnames(PF_mat) <- c(paste0('c', 1:3))
PF_mat

# Create a matrix with a sequence of numbers arranged row-wise (row-major fashion)

mat_3 <- matrix(1:100 , 20 , 5 , byrow=1 ) ; mat_3




# Exercises

# ??? Create a list of different datatypes - integer,
# double,character, boolean, complex and the
# built-in function mean

l1 <- list(78L , 678 , "Ujjwal" , TRUE ,  3+4i , mean(-100:100)) ; l1


# Create 4 vectors of lengths 2,3,4 and 1 and
# create a list with the two vectors as its two
# components with names

v_1 <- c("Park" ,"Ground") ; v_1
v_2 <- c("Momo","Ice Cream","Coffee") ; v_2
v_3 <- c(100 , 250 , 500) ; v_3
v_4 <- c(123+45i) ; v_4

l_v <- list(Place = v_1 , Food =v_2 , v_3 , v_4) ; l_v



# Access the 2nd element of the 3rd vector (i.e. 2nd element of the 3rd component of the list)
l_v [[c(3,2)]]

# Exercises
# Create a vector p <- c(0,3,2,2,1) and convert it into a factor

p <- c(0,3,2,2,1)
 f <- factor(p) ; f



# Call as.numeric function on the created factor & check output
 
 as.numeric(f)
 

# Check the levels of the factor using the function levels

 levels(f) 
 
# Check the description of the levels function

?levels


# CHALLENGE: Assign new levels to the factor using levels function and assignment 
# operation using the vector c('a','d','b','c') & check the contents of the factor
#(notice any changes?)
# Again assign new levels to the factor of a sequence of numbers in reverse sorted order 
# (e.g. 10,9,8,7)
 
 f_n <- factor(c("A", "A", "A", "D", "D", "B", "B", "C", "A", "C", "B")) ; f_n
 
 levels(f_n) <- c('a', 'b', 'c', 'd') ; f_n

levels(f_n) <- c(10:7) ;f_n


# Use as.numeric function on the factor created and check output

as.numeric(f_n)



# Exercises

# ??? Given v1 containing elements 1, 24, 5, 9, 0
# ??? What is the output of
#  v1 * 2
#  v1 * c(2,2,2,2)
# (compare the output with the previous)
#  1 / v1
#  v1<- v1[2:5]; v1 * c(2,3,2,3)
#  x <-c(1,2,3,4); y <- c(x,0,x); v2 <- 2*x + y + 1; v2

v1 <- c(1 ,24, 5, 9, 0) ; v1

v1 * 2

# [1]  2 48 10 18  0

v1 * c(2,2,2,2)

# [1]  2 48 10 18  0
# Warning message:
#   In v1 * c(2, 2, 2, 2) :
#   longer object length is not a multiple of shorter object length

1 / v1

# [1] 1.00000000 0.04166667 0.20000000 0.11111111        Inf

v1<- v1[2:5]; v1 * c(2,3,2,3)

# [1] 48 15 18  0

 x <-c(1,2,3,4); y <- c(x,0,x); v2 <- 2*x + y + 1; v2

 # Warning message:
 #   In 2 * x + y :
 #   longer object length is not a multiple of shorter object length
 # [1]  4  7 10 13  3  6  9 12  7

############################################################

# ??? Explore how the following functions are used with a numeric vector -
#   length, seq, rep, names, min, max, sqrt, sum
 
 length(v2)
 
 #[1] 9
 
 seq(v2)
 
# [1] 1 2 3 4 5 6 7 8 9
 
rep(v2)

# [1]  4  7 10 13  3  6  9 12  7

names(v2)

# NULL

min(v2)

# [1] 3

max(v2)

# [1] 13

sqrt(v2)

# [1] 2.000000 2.645751 3.162278 3.605551 1.732051 2.449490 3.000000 3.464102 2.645751

sum(v2)

# [1] 71

####################################


# Exercises
# ??? What is the output of v1 <-c('1','4','b')
# as.numeric(v1[!is.na(as.integer(v1))])
# x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
# sum((x-mean(x))^2)/(length(x)-1)
# (x+1)[(!is.na(x)) & x>0] -> z

v1 <-c('1','4','b') ; v1

as.numeric(v1[!is.na(as.integer(v1))])

# [1] 1 4
# Warning message:
# NAs introduced by coercion

x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
sum((x-mean(x))^2)/(length(x)-1) 

# [1] 53.853

(x+1)[(!is.na(x)) & x>0] -> z ;z

# [1] 11.4  6.6  4.1  7.4 22.7


# ??? Use paste function to create the vector
#  c("X1", "Y2", "X3", "Y4", "X5", "Y6", "X7", "Y8", "X9","Y10")

paste0(c("X","Y"), c(1:10))


fn1 <- function(x){
  f=paste0(1:10)
  paste0(c(x[1] ,x[2]) ,f)    ### body ofthe function 
}
i <- c("X", "Y")
fn1(i)
##################################################################

# Exercises
# ??? Compute the value and explain the precedence to
# yourself for the following:
 2+3^2
#[1] 11 ##"^" executes before +
 
2+3^2^3
#[1] 6563 ## 2 + 3^(2^3) = 2 + 3^8 = 2 + 6561 = 6563

 x <- y <- z <- 0; x; y; z 
 # [1] 0
 # [1] 0
 # [1] 0     ### assinging 0 to z ; then the value of z to y and then the value of y to x
 
 3+3/2
 # [1] 4.5  ##### doing the divison first and then the addition
 
 2:3+2
 # [1] 4 5  ### the sequence operator ":" has more precedence than the unary plus operator
 
 2:-3
 # [1]  2  1  0 -1 -2 -3   ##### 2:(-3)  => PRINTING 2 TO -3  SEUQUENTIALLY
 
 2 > 2:-3
 # [1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  ##### comparing if 2 is greater than (2,1,0,-1,-2,-3) or not

 
 
 
 
 ##############################    R - Part2     ##############################
 
 
 # Exercise
 # ??? Experiment with variations in write.table function (command) to get the data 
 # in the orginal format as shown below:
 #area,   sale.price
 # 694,   192
 # 905,   215
 # 802,   215
 # 1366,  274
 # 716,   112.7
 # 963,   185
 # 821,   212
 # 714,   220
 # 1018,  276
 # 887,   260
 # 790,   221.5
 # 696,   255
 # 771,   260
 # 1006,  293
 # 1191,  375
 # ??? Experiment reading CSV files using read.csv function and explore usage of its various
 # parameters (arguments)
 
 tbl_h_cpy <- read.table('house_copy.txt' , header=T) ;tbl_h_cpy
 
 str(tbl_h_cpy)
 table(tbl_h_cpy$area)
 table(tbl_h_cpy$sale.price)
 tbl_h_cpy <- read.table(file='house_copy.txt',header = T, sep = "", colClasses = c('double','double','factor','factor'))
str( tbl_h_cpy)
table( tbl_h_cpy$region)
 tbl_h_cpy <- read.table(file='house_copy.txt',header = T, stringsAsFactors = TRUE)
str( tbl_h_cpy)
 tbl_h_cpy$region
 tbl_h_cpy$region <- factor( tbl_h_cpy$region, levels=c("E",'W','N','S'))
 tbl_h_cpy$region
str( tbl_h_cpy)
 
 
 
 
 
 
 
 
 