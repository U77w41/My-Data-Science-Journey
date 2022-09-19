#                                  Unit 14

#                                Example 1   
#
{
Year <- c('1990-91','1991-92','1992-93','1993-94','1994-95','1995-96','1996-97','1997-98','1998-99','1999-2000') ;Year
Profit <- c(35.6,46.7,39.8,68.2,93.5,87.2,113.1,123.6,119.7,130.8) ; Profit
ex1<-data.frame(Year,Profit ) ;ex1
barplot(ex1$Profit, width =2 ,space = 2,col = 2:11,main ='Profit (In Rs Crore )',ylim = c(0,157),cex.axis = 1)
abline(h =c(0,50,100,150))
labs <- df$Year
x1 <- seq(1,60,6)
text(cex=0.8, x=x1+2, y=-27.5, labs, xpd=T, srt=60 ,col = 2:11)
text(cex=0.7, x=x1+4, y=ex1$Profit + 16 , col = 2:11, ex1$Profit)
barplot(ex1$Profit, width =2 ,space = 2,col = 2:11,main ='Profit (In Rs Crore )',ylim = c(0,157), add = T )
}

#                                   Example 2

Category<- c('Cost of Raw Material','Labour Cost','Polish','Delivery'); Category
colrs = c(2:5)
Year <- c(1990,1995,2000)
Total <- c(40,50,80)
Cost <- matrix(c(15,15,5,5,20,18,6,6,30,25,15,10) , nrow = 4 , ncol = 3) ;Cost
barplot(Cost, names.arg = Year, col = colrs , width = 5 ,space = 5 , ylim =c(0,106) , yaxt = 'n')
legend('topleft', Category , cex = 0.5 , fill = colrs)
abline(h=0)
x2 <- seq(1990,2000,5) ;x2
lvs <- c(40,50,80)
text(x= seq(1,16,5),y=0 , cex=1 , labels = 1 )
axis(side = 2, at = seq(0,100,10) ,labels = seq(0,100,10) ,las =2)
v <- c(15,15,5,5,20,18,6,6,30,25,15,10,40,50,80)
P <- c()
 # Unfinished




#                          Example 3


Year <- c(1990,1995,2000,2005,2010)
Sale <- c(100,120,130,150,200)
Gross <-c(30,40,45,50,70)
Net <- c(10,15,25,30,30)
Cata <- c('Sale (in ,000 Rs)' ,'Gross profit (in '000 Rs)','Net profit (in '000 Rs)' )
ex3 <-data.frame(Sale,Gross,Net) ;ex3
colo <- c('black','grey40','grey80')

barplot(t(ex3), beside = T , ylim = c(0,260))
legend('top',Cata, cex = 0.6 , fill = colo)
abline(h=0)
text(x = seq(2.5,18.5,4) , y=-15, cex = 0.7 , labels = seq(1990,2010,5) , xpd=T )
text(x= seq(1.5,18,4), y =ex3$Sale +14,ex3$Sale , cex = 0.6)
text(x = seq(2.52,19,4), y=ex3$Gross +14, ex3$Gross, cex = 0.6)
text(x = seq(3.52,20,4), y=ex3$Net +14, ex3$Net, cex = 0.6)


#                  Example 4

Charges <- matrix(c(40,50,10,40,45,15,0,0,0,0,0,0) , nrow = 3, ncol = 4) ; Charges
barplot(Charges , space = 2 , yaxt='n',col = c('grey40','grey60','grey80'))
abline(h=0)
y <- c(0,10,20,30,40,50,60,70,80,90,100)
axis(side = 2, at = y, labels = paste0(y ,'%'), cex = 0.5 , las =2)
Cat =c('Delivery Charges (in Rs/unit)','Labour Charges (in Rs/unit)','Material Cost (in Rs/unit)')
legend('bottomright',Cat , fill= c('grey80','grey60','grey40'), cex = 0.5)
text(x=c(2.5,5.5), y=-5,labels = c(1990,2000) ,xpd =T, cex = 0.6)
text(x = c(2.5,5.5) , y=20, labels = paste0(c(40,40),'%') , cex = 0.6)
text(x = c(2.5,5.5) , y=c(65,60), labels = paste0(c(50,45),'%') , cex = 0.6)
text(x = c(2.5,5.5) , y=c(95,92), labels = paste0(c(10,15),'%') , cex = 0.6)


#                    Example  5

data <- matrix(c(20,15,35) , nrow =1 ) ; data

barplot(data,space = 2, col = 4 , border = NA , ylim = c(-40,60),yaxt = 'n')
abline(h = seq(-40,60,10))
axis(side = 2, at = seq(-40,60,10), labels = paste0(seq(-40,60,10) ,'%'), cex = 0.5 , las =2)
barplot(data,space = 2, col = 4 , border = NA , ylim = c(-40,60),yaxt = 'n' , add = T)
text(x=c(2.5,5.5 , 8.5), y=-5,labels = c(1990,2000 ,2010) ,xpd =T, cex = 0.6)
legend('bottomright' ,fill= 4, cex = 0.5 , 'Sale (in %)' , bty ='n')

#               Example 6

sale <- c(200,360,442,520,587,850)
barplot(sale, space =1,col = 'grey45' , ylim = c(0,850), yaxt ='n', main = 'Sales of cars year wise', ylab = expression('Sales of cars' %->% ''))
axis(side = 2, at =  seq(0,800,100) , labels = seq(0,800,100) ,cex = 0.5 , las =2 )
abline(h=0)
text(x= seq(1.5,13,2), y = sale + 30 ,labels = c(sale[1:5],2860), xpd =T , cex =0.7)
text(x= seq(1.5,13,2), y =-15 ,labels =seq(1950,2000,10), xpd =T , cex =0.7) 
legend('topleft' , fill = 'grey45' , cex =0.7, bty = 'n', 'Sales of Cars (in numbers)')
rect(10.8,700,12.2,780,col = 'white' ,border = 0)


#                          Example 7

unit <- c(2400,2520)
barplot(unit, space =1,col = 'grey85' , ylim = c(-50,3400), yaxt ='n', xlab= expression('Per unit production cost' %->%'') , ylab = expression('No. of units produced' %->% ''))
axis(side = 2, at =  seq(0,4500,500) , labels = seq(0,4500,500) ,cex = 0.5 , las =2 )
abline(h=0)
text(x= seq(1.5,13,2), y = unit + 250 ,labels =c(24000,25200) , cex =1.3) 
axis(side = 1, tick = F,at = c(1.5,3.5), labels = c(12,10.5) , line = -0.8  )
axis( side = 1 , tick = F , at = c(1.5,3.5), labels = c('Company A' , 'Company B') , line = 0.8 )


#                         Example 8

barplot(height = c(2,3,6,8) , width = c(2,3,6,8) , ylim = c(0,22) , xlim =c(0,22) , space =0.1, xaxt = 'n', yaxt = 'n' , col = grey.colors(4,rev =T) , main ='Number of School in City A')
axis(side =1, at= seq(0,22,2) , labels = seq(0,22,2) )
axis(side =2, line = -1, at= seq(0,21,2) , labels = seq(0,10,1) , las=2)

text(x= c(1.5,4.6,10,17.5), y = c(4,5,8,10) ,labels = c(4,9,36,64), cex =0.7)
text(x= c(1.5,4.6,9.5,16.5), y = 0.8,labels = c('1970-1980','1980-1990','1990-00','2000-10') , cex = 0.58 ,srt = 45 )


#                           Example 9
library(ggplot2)
library(ggforce)
crcle <- data.frame(x0 =c(3,10,20,36) , y0 = rep(12,4), r = c(2,3,6,8))
ggplot(data = crcle) +
geom_circle(aes(x0=x0,y0=y0,r=r,fill=r))+
coord_fixed() +
scale_x_continuous(breaks = seq(4,44,4) , labels = seq(4,44,4)) +
scale_y_continuous(breaks = seq(0,24,4) , labels = seq(0,24,4)) +
theme_gray()+
geom_text(aes(x =x0,y =13+r , label = r^2)) +
geom_text(aes(x =x0,y =11-r , label = c('1970-1980','1980-1990','1990-00','2000-10'))) +
geom_hline(yintercept = 12, linetype = 'dashed' , color = grey(0.4)) +
  theme(legend.position = 'none',plot.title = element_text(hjust=0.5), axis.line = element_line(arrow = arrow(angle = 20, length = unit(.15,'inches') , type = 'closed')))  +
  labs(x = '' , y = '',title = 'numbers of schools in city A')


#                  Example 10

df <- data.frame(group = paste('Partner',c('A','B','C', 'D')), value = c(40,30,20,10))
library(ggplot2)
library(scales)
library(dplyr)

df %>% arrange(value) %>% mutate(val_cumsum = cumsum(value)) %>%
  ggplot(aes(y = value , fill = group)) +
  geom_bar(width = 1 , stat = 'identity') +
  coord_polar('y', start = 0) +
  scale_fill_brewer('') +
  theme(axis.text.x = element_blank(),panel.background = element_blank(), plot.title = element_text(hjust = 0.5) ) +
geom_text(aes(y= val_cumsum - (value/2), label = paste(percent(value/100) ,c('A','B','C','D') , seq = '\n'))) +
  labs(title = 'Profits (in Rs)' ,x = '' , y = '')

 
#  E2

data <- matrix(c(440,480,520,410,440,490,160,180,175,180,165,190), nrow = 4, byrow = T)
rownames(data) <- c('Tax (in ,000 Rs)','Gross Expenditure (in ,000 Rs)','Net Income (in ,000 Rs)','Gross Income (in ,000 Rs)')
colnames(data) <- c('2007-88','2008-09','2B09-10')
barplot(data, beside = T, ylim = c(0,800), yaxt = 'n',legend = T, args.legend = list(bty =     x = 'top'), density = c(200,50,50,60), angle = c(0,45,0,90), col = grey(0.30)) abline(h = 0, col = 'black', lty= 1)
axis(side = 2, at = seq(0,600,100), labels = seq(0,600,100), las = 2)
text(x = seq(1.5,14.5,1)[-seq(5,15,5)], y = c(data)+25, labels = c(data), cex = 0.8, col = 'red')


# E3


data   < -   matrix(c (58, 70, 65, 62, 68, 72),   nrow   =  3,    byrow   =   F)
colnames(data)     <-   c ( ' Class  A' , 'Class  B ')
rownames(data)  < -   c ( ' Phys1cs ' , ' Statlst1cs ', 'Mathematlcs ' )
barplot (data ,   beside   =   T,    xlim  =   c (1,  12)  ,   y1im  =  c (0,  90)  ,   yaxt   =  'n' , legend   =  T,   args.legend= list(bty= 'n' , x  ='right') , density=c(200, 50,50) ,   angle   =   c (0,  45, 0) ,    cot    =   grey(6.30)    , ylab=   expression( 'Marks'   %->% '' ) )
abline (v   =  0,    h   =   0,    co1   =   'line' ,   Ity      =   1)

axis(side = 2, at = seq(0,80,10), labels = c('',seq(10,80,10)), las = 2)
text(x = seq(1.5,7.5,1)[-seq(4,8,4)], y = c(data)+5, labels = c(data), cex = 0.8, col = 'grey40')

# E4


data <- matrix(c(300,350,250,200,280,300,220,200), nrow = 4, byrow = T) 
rownames(data) <- c('Food','Clothing','Education','Others') 
colnames(data) <- c('Family A', 'Family B')
plot(1, type = 'n', xaxt = 'n', yaxt = 'n', bty = 'n',ylim = c(0, 1300), xlim = c(0,5))
axis(side =  1, tick=  F, line=  -1, at=  c(1.25,2.75), labels =  colnames(data))
axis(side =  2, at= seq(0,1300,200) , lables=seq(0,1200,200) , las=2)
barplot(data ,   width   =  0.5,    space  =  2,    density     =  c(1060,    100,   100,   0) ,angle = c(0, 45, 180, 0), col = grey(c(0.45, 0.65, 0.85, 1)),yaxt = 'n', xaxt = 'n', add = T, axes = 2, legend = T, args.legend =  list(bty  =   ' n ' ,   x   =  ' right ' ) )
abline (h   =  0, lty    =  1)
values  < -   rbind (data,' sum '=  apply(data, 2,   sum) )
pos <- rbind(apply(data, 2, function(x) cumsum(x)-(0.5*x)), 'sumpos' = values[5,]+50)
text(x=rep(c(1.25,2.75) , each =  5),  y   =  as.vector(pos) ,labels = as.vector(values), cex = 0.8, col = 'blue')


# E5

data <- matrix(c(9500,8000,5500,6500,3500,4000,1500,1500), nrow = 4, byrow = T)
rownames(data) <- c('Selling Price (in Rs)', 'Raw Material (in Rs)','Direct Wages (in Rs)','Rent of Office (in Rs)')
colnames(data) <- c('Company A', 'Company B')
abline(h = seq(10,100,10))
axis(side = 1, tick = F, line = -1, at = c(1.50,3.75), labels = colnames(data))
axis(side = 2, at = seq(10,100,10), labels = paste0(seq(10,100,10),'%'), las = 2, line = -1)
data_percentage <- apply(data, 2, function(x){x*100/sum(x,na.rm=T)})
barplot(data_percentage, width = 1.5, space = 0.5, density = c(1000, 50, 50),angle = c(0, 45, 180), col = grey(c(0.45, 0.65, 0.85, 1)), yaxt = 'n', xaxt = 'n', add = T,legend =  T, args.legend = list(bty ='n', x=8, y=  40)) 
abline(v = 0,h=0, lty=  1)
pos <- apply(data_percentage, 2, function(x) cumsum(x)-(0.5*x)) text(x = rep(c(1.50,3.75),each = 4), y = as.vector(pos),
labels = paste(as.vector(data_percentage),'%'), cex = 0.8, col = 'red') text(x = -0.1, y = -2, '0')

# E   6

frequency <- c(400,600)
barplot(frequency, ylim = c(0, 700), xlim = c(0,2.5), width:  c(0.5,0.75), space = 0.5, xaxt:  'n', yaxt = 'n', xaxs = 'i', yaxs = 'i', col = gray(0.80), border = 'black',ylab = expression('Sales of items' %->% ''), xlab = expression('Rate per item' %->% ''))
  axis(side = 2, at = seq(0,699,100), labels = c('',seq(100,699,100)), las = 2) axis(side= 1, tick=F, at=c(0.5625,1.5), labels=  c(20,30), line=  -0.8)
  axis(side=1, tick= F, at=c(0.5625,1.5), labels=  c('Company A','Company B'), line = 0.5) 
  abline(h = 0)
  text(x = c(0.5625,1.5), y = frequencye5B, labels = c(8000,18000))
  
  
  # E 7
  
  frequency <-  c(16,25,65,150)/4
  barplot(height = frequency, ylim = c(0, 75), xlim = c(8,80),width= frequency, space=  0.05, xaxt = 'n', col= gray.colors(4, rev= T), main = 'Number of Colonies in City A') 
  axis(side=2, at=seq(0,75,length.out= 6), labels=c('',seq(1,5,1)), las=2)
  axis(side = 1, at = seq(0,80,8), labels = c('',seq(1,10,1)))
  abline(h = 0,)
  text(x = c(3, 9, 20, 48), y = c(6,9,19,40), labels = c(16,25,65,150))
  year <- c('1980','1990','2000','2010') 
  text(x = c(4.5,10.5, 24, 48), y = 2,labels = year, xpd = 1, adj = 1, cex = 0.6)

# E9




data <- data.frame(Group=c('Manufacturing Expenses','Advertisement Expenses','Salaries of Employees', 'Taxation','Selling and Distrbution Expenses','Interest Charges','Excise Duty of sales'),value=c(42,15,14,10,8,6,5)) 
pm <- par(mar=c(0,0,0,15), xpd = TRUE) 
pie(data$value, col = gray.colors(7), clockwise = T,labels = '')
legend('right', cex = 1, inset = c(-0.8, 0), bty = 'n', legend = data$Group, fill = gray.colors(7))
  prop <- data$value /sum(data$value) *100
  text ( x= c(0.5,0 , -0.4, -0.5,-0.4,-0.25,-0.1) , y   = c( 0.2,-0.5,-0.3,0.05,0.3,0.5,0.6) ,labels = paste0(prop,'%'), cex = 0.8)
  par(pm)
  
#  E10
  data <- data.frame( Group=c('Food','Education','Clothing','Saving','Transport','Outing','Miscellaneous'), value=c(25,20,15,15,10,10,5))
pm <- par(mar=c(0,0,0,15), xpd = TRUE)
pie(data$value, col=gray.colors(7), clockwise = T, labels=  '')
legend('right', cex = 1, inset = c(-0.5, 0), bty = 'n', legend = data$Group, fill = gray.colors(7))
prop <- data$value / sum(data$value) *100
text(x = c(0.35,0.4,-0.1,-0.5,-0.45,-0.30,-0.1), y=  c(0.35,-0.25,-0.5,-0.2,0.15,0.4,0.6),labels = paste0(prop,'%'), cex = 0.8)
par(pm)

######################
#     Figure 15.1
{
  frequency <- c(14,23,66,40,26,18,11) 
  barplot(frequency , ylim = c(0,80) ,space =1, yaxt = 'n', col = 'grey40' , ylab = expression('Frequencies' %->% '')) 
  legend('topright',bty = 'n',cex =0.6 , fill = 'grey45' , 'Frequency') 
  abline(h = 0) 
  axis(side = 2 , at = seq(0,80,10) ,labels =seq(0,80,10) , las =2) 
  text(x=seq(2,15,2)-0.5 , y = frequency + 4, labels = frequency , cex =0.8 ) 
  text(x=seq(2,15,2)-0.5 , y = -5, labels = seq(1,7,1) , cex =0.8 , xpd = T)     
}
# Figure 15.2 
{
  frequency <- c(2,3,13,18,9,7,6,2) 
  barplot(frequency , ylim = c(0,26) , space =0, yaxt = 'n', col = 'grey45' , ylab = expression('Frequencies' %->% '') , xlab = expression('Class intervals' %->% '') ) 
  legend('topright',bty = 'n',cex = 0.8,  fill = 'grey45' , 'Frequency') 
  axis(side = 1 , at = seq(0,8,1) ,labels =seq(0,80,10) , las =1) 
  axis(side = 2 , at = seq(0,20,4) ,labels =seq(0,20,4) , las =2 , line = -0.8) 
  text(x=seq(1,9,1)-0.5 , y = frequency + 2, labels = frequency , cex =0.8 ) 
} 


#    Figure 15.3
{
  w <- c(10,10,10,10,30,10,20)
  h <- c(20,32, 8, 2,20,35,5)
  barplot( width = w, height = h, space = 0, yaxt = 'n' , col = 'grey80' ,
           ylab = expression('Frequencies' %->% '') , xlab = expression('Class intervals' %->% '') ) 
  
  legend('top',bty = 'n',cex = 0.6,  fill = 'grey60' , 'Frequency')
  
  axis(side = 1 , at = seq(0,100,10) ,labels =seq(0,100,10) , las =1 , line = -0.2) 
  axis(side = 2 , at = seq(0,40,5) ,labels =seq(0,40,5) , las =2 , line = -0.8) 
  text(x=c(5,15,25,35,55,75,90) , y = h + 4, labels = h , cex =0.8 ) 
} 


#     figure 15.4

f <- c(0,2,3,13,18,9,7,6,2,0)
f1 <- rep(seq(0,90,10),f) ;f1
hist(f1 , breaks = seq(-10,90,10), main = '' , axes = F  ,  ylab = expression('Frequencies' %->% '') , xlab = expression('Class intervals' %->% '') , xlim = c(-10,90))
legend('right', cex = 0.5 ,fill = 'grey80','Frequency' )
axis(side = 1 , pos = 0, at = seq(-10,100,10) ,labels =seq(-10,100,10) , las =1) 
axis(side = 2 , at = seq(2,22,2) ,labels =seq(2,22,2) , las =2 ,line = -2.9) 
points(x=seq(-5,85,10) , y = f ,pch = 19)
lines( x=seq(-5,85,10) , y =f, lwd =2)

# figure 15.5


f <- c(0,0,0,0,0,4,10,11,13,18,14,11,5,0)
f1 <- rep(seq(10,130,10),f) ;f1
hist(f1 , breaks = seq(0,130,10), main = '' , axes = F  ,  ylab = expression('Frequencies' %->% '') , xlab = expression('Class intervals' %->% '') , xlim = c(0,130) , ylim = c(0,22))
axis(side = 1 , pos = 0, at = c(0,seq(30,130,10)) ,labels =c(0,seq(30,130,10)) , las =1) 
axis(side = 2 , at = seq(0,22,2) ,labels =seq(0,22,2) , las =2 ,pos  =0) 
points(x=seq(25,115,10) , y = f[4:14] ,pch = 19)
lines( x=seq(25,115,10) , y =f[4:13], lwd =2)
abline(h=20)
abline(v = 110)
legend('topright', cex = 0.5 ,fill = 'grey80','Frequency' , xpd = T )

#  figure 15.6


f <- c(0,2,5,8,15,18,10,3,1,0)
f1 <- rep(seq(10,100,10),f) ;f1
hist(f1 , breaks = seq(10,100,10), main = '' , axes = F  ,  ylab = expression('Frequencies' %->% '') , xlab = expression('Class intervals' %->% '') , xlim = c(0,100) , ylim = c(0,25))
axis(side = 1 , pos = 0, at = seq(0,100,10) ,labels =seq(0,100,10) , las =1) 
axis(side = 2 , at = seq(0,29,5) ,labels =seq(0,29,5) , las =2 ,pos  =0) 
points(x=seq(5,95,10) , y = f ,pch = 19)
lines( x=seq(5,95,10) , y =f, lwd =2)
abline(h=25)
abline(v = 90)
legend('topright', cex = 0.5 ,fill = 'grey80','Frequency' , xpd = T )
xfit <- seq(0,100, length.out = 40)
yfit <- dnorm(xfit , mean = mean(f1) , sd= sd(f1))
yfit <- yfit * 10 * length(f1)
lines(x=xfit,y = yfit, col = 'grey20' , lwd =1)




#                  Figure 15.8

wwage<- seq(0,50,10)
nw <- c(45,55,70,40,10)
cumfreq <- c(0,cumsum(nw)); cumfreq
plot(wwage,cumfreq,xlim =c(0,80) , ylim =c(0,250), axes = F , cex = 0.6 , pch =19 ,ylab = expression(' Less than cumelative frequencies' %->% '') , xlab = expression('Wages(less than)' %->% '') )
lines(wwage , cumfreq)
axis(side = 1 , pos = 0, at = seq(0,70,10) ,labels =c('',seq(10,70,10)) , las =1) 
axis(side = 2 , at = seq(0,250,50) ,labels =seq(0,250,50) , las =2 ,pos  =0) 
abline(h = seq(50,250,50))
text( x = c(seq(10,50,10)-4) , y = c(45,100,170,210,220) + 15 ,labels = paste0('(' , seq(10,50,10), ',' , c(45 ,100, 170, 210, 220) , ')' ), cex = 0.5)
arrows( x0 = 40 ,y0 = 75 , x1 =18 , y1 = 75, length = 0.1)
text(x = 55 , y = 75, 'Less than ogive' , cex = 1)

#            Figure 15.9
wwage<- seq(0,50,10)
nw <- c(45,55,70,40,10,0)
cumfreq <- rev(cumsum(rev(nw))); cumfreq
plot(wwage,cumfreq,xlim =c(0,80) , ylim =c(0,250), axes = F , cex = 0.6 , pch =19 , ,ylab = expression(' Less than cumelative frequencies' %->% '') , xlab = expression('Wages(less than)' %->% '') )
lines(wwage , cumfreq)
axis(side = 1 , pos = 0, at = seq(0,70,10) ,labels =c('',seq(10,70,10)) , las =1) 
axis(side = 2 , at = seq(0,250,50) ,labels =seq(0,250,50) , las =2 ,pos  =0) 
abline(h = seq(50,250,50))
text( x = c(seq(0,40,10)+5) , y = c(220 , 175, 120 , 50 , 10) + 7 ,labels = paste0('(' , seq(0,40,10), ',' , c(220 , 175 , 120 , 50 , 10) , ')' ), cex = 0.5)
arrows( x0 = 45 ,y0 = 180 , x1 =17 , y1 = 148, length = 0.1)
text(x = 57 , y = 185, 'Less than ogive' , cex = 0.5)


#  E1

f <- c(0,2,5,9,15,25,18,16,12,2)
f1 <- rep(seq(1,10,1),f) ;f1
hist(f1 , ylab = expression('Frequencies' %->% '') , xlab = expression('Class intervals' %->% '') , main = "" , axes = F)
axis(side = 1 , pos = 0, at = c(0,seq(30,130,10)) ,labels =c(0,seq(30,130,10)) , las =1) 
axis(side = 2 , at = seq(0,22,2) ,labels =seq(0,22,2) , las =2 ,pos  =0) 
points(x=seq(25,115,10) , y = f[4:13] ,pch = 19)
lines( x=seq(25,115,10) , y =f[4:13], lwd =2)
abline(h=20)
abline(v = 110)
legend('topright', cex = 0.5 ,fill = 'grey80','Frequency' , xpd = T )










# E5
x_1 <- seq(0,90,10)
freq <- c(3,6,18,13,20,18,15,9,6,0)
cumfreq_m <- rev(cumsum(rev(freq)))
cumfreq_1 <- cumsum(freq)
plot(x_1, cumfreq_m, xlim = c(0,150), ylim = c(0,120), pch = 19, cex  = 0.5, type = 'p', axes = F)
lines(x_1, cumfreq_m) 
lines(x_1, c(0,cumfreq_1[-10]))
points(x_1, c(0,cumfreq_1[-10]), pch = 19, cex = 0.5) 
abline(h = seq(20,120,20), col = gray(0.75))
abline(v = 0, h = 0)
axis(pos = 0, side = 1, at = seq(20,100,20), labels = seq(20,100,20), line = -0.6)
axis(pos = 0, side = 1, at = c(seq(10,120,20),120), labels = rep('', 7), line = -0.6)
axis(pos = 0, side = 2, at = seq(20,120,20),labels = seq(20,120,20), las = 1)
segments(x0 = c(0,50), y0 = c(52,0), x1 = 50, y1 = 52, lty = 2)
arrows(x0 = c(110,110), y0 = c(92,22), x1 = c(80,68), y1 = c(92,22), length = 0.05)
text(x = c(130,130), y = c(92,22), c('less than ogive','more than ogive')) 
text(x =c(8,26,25,35,58,67,78,72,98),y = c(6,7,23,36,52,70,85,95,102), cex = 0.7, col = gray(0.4),paste0('(',seq(10,90,10),',',cumsum(freq)[-10],')')) text(x = c(7,7,28,25,47,40,68,78,88),y = c(102,93,92,78,68,50,30,15,7), cex = 8.7,paste0('(',seq(0,80,10),',',cumfreq_m[-10],')')) 
arrows(x0 = 118, y0 = 50, x1 = 49, y1 = 50, length = 8.05)
text(x = 130, y = 50, 'Median = 49')


