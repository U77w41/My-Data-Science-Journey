#####################################################################################
mybarplot <- function(datavector,
                      width,space,
                      xlabels,xlabelsXpad,xlabelsYpad,xlabelsAng,
                      my_ylim,
                      hlines,my_yticks){
  n <- length(datavector)
  x1stbar <-  space*width + 0.5*width# x coord. of the midd of 1st bar
  dx <- width + width*space
  x1 <- seq(x1stbar,by=dx,length.out=n)
  ###############################################
  barplot(datavector,width,space,ylim=my_ylim,yaxt="n")
  text(cex=1, x=x1 - xlabelsXpad, y = 0 - xlabelsYpad, xlabels, xpd=TRUE, srt=xlabelsAng)
  
  for(i in 1:length(hlines)){
    abline(h=hlines[i])
  }
  
  text(cex=1, x=x1, y=datavector+6.0, datavector)
  
  # Following will 
  barplot(datavector,width,space,ylim=my_ylim,add = TRUE,yaxt="n",xaxt="n")#,names.arg=df$Year,angle=90)
  axis(side=2, at=my_yticks, labels = TRUE)
}
#####################################################################################
#####################################################################################
mybarplot_VER1 <- function(datavector,
                      width=2,
                      space=1,
                      xlabels,
                      xlabelsXpad,
                      xlabelsYpad,
                      xlabelsAng=45,
                      texttop = NULL,
                      hlines=NULL,
                      my_yticks=NULL){
  ###############################################
  barplot(datavector,width,space)#,yaxt="n")
  ###############################################
  n <- length(datavector)
  x1stbar <-  space*width + 0.5*width# x coord. of the midd of 1st bar
  dx <- width + width*space
  x1 <- seq(x1stbar,by=dx,length.out=n)
  text(cex=1, x=x1 - xlabelsXpad, y = 0 - xlabelsYpad, xlabels, xpd=TRUE, srt=xlabelsAng)
  ###############################################
  if(!is.null(hlines)){
    for(i in 1:length(hlines)){
      abline(h=hlines[i])
      }
    barplot(datavector,width,space,add = TRUE,yaxt="n")
    }
  ################################################
  if(!is.null(texttop)){
    text(cex=1, x=x1, y=datavector+6.0, datavector)
    }
  if(!is.null(my_yticks)){
    barplot(datavector,width,space,add = TRUE,yaxt="n")
    axis(side=2, at=my_yticks, labels = TRUE)
  }
}