#exerecises

# create a matrix with any continuoussequence of numbers of 
# dimension 4x5 ?

#solution_1:

x <- matrix(1000:1019 , 4 , 5) ;x

#sloution_2:
y <-  matrix( 1 : 20 , ncol = 5 , nrow = 4 , byrow = 1) ; y

y1 <- matrix(1:20 , nrow = 4 , ncol = 5 ) ; y1

#solution_3:
r1 = 1:5 ; r2 = 6:10 ; r3 = 11:15 ; r4 = 16:20 ; rbind(r1,r2,r3,r4)
r <- rbind(r1,r2,r3,r4) ; r

c1=1:4 ; c2=5:8 ; c3=9:12 ; c4=13:16 ; c5=17:20 ; cbind(c1,c2,c3,c4,c5)

c= cbind(c1,c2,c3,c4,c5) ; c

#solution_4
p1 = c(1,2,3,4,5) ; p2= c(6,7,8,9,10) ; p3= c(11,12,13,14,15) ; p4= c(16,17,18,19,20) 

p <- rbind(p1,p2,p3,p4) ; p


#solution_5
CB <- cbind( 1:4 , 5:8 , 9:12 ,13:16 , 17:20) ; CB

#or
  RB <- rbind( 1:5 ,6:10 ,11:15 ,16:20) ; RB


  
  
  
  
  
# create a matrix of 2 x 3 with dimension names as r1,r2 and c1, c2,c3

#sloution_1
 na<- matrix(nrow=2,ncol=3) ; na

rownames(na) <- c("r1","r2") ; colnames(na) <- c("c1","c2","c3") ; na


#solution_2
 r1 = c("a11" , "a12" , "a13") ; r2 =c("a21" , "a22" , "a23") 
 
 k <- rbind(r1,r2) ; colnames(k) = c("c1","c2","c3") ; k

#soluton_3
 mat1 <- matrix(1000:1005, 2, 3) 
 rownames(mat1) <- c(paste0(c(rep("r")), 1:2)) 
 colnames(mat1) <- c(paste0(c(rep("c")), 1:3))
 mat1
 
 
 
 

  #accessing three level list

 l <- list( a= list(u = list(1,2,3,4,0) , 2 ,4 ,90) , 3.143 , 89918 , TRUE) ; l
l[[c(1 , 1 , 5)]]
 l[[1]] [[1]] [[5]]

 