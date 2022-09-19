data = c(179718,41370,41914,44280)
pct = (data/sum(data))*100
pct = round(pct,2)
labels = c("Army", "Navy", "Air Force","Marines")
labels1 = paste(pct, "%")

plot(1:5,type="n",main="Traumatic Brain Injury 2000-2014(Q2)",xlab="",ylab="",axes=FALSE)

pie1<-floating.pie(3,3,pct,radius=1,
                   col=c("red","blue","green","yellow"), startpos = 4)
pie.labels(3,3,pie1,radius=0.4,labels=labels1)
#We can now add legends to our plot using the basic R legend() function:
legend("left", fill = c("red","blue","green","yellow"), legend =
         c("Army", "Navy","Air Force", "Marine"))