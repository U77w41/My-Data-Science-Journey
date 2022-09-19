#http://www.sthda.com/english/wiki/add-custom-tick-mark-labels-to-a-plot-in-r-software

#Add custom tick mark labels to a plot in R software 

#col.axis : the color to be used for tick mark labels

#font.axis : an integer specifying the font style; possible values are :
#     1: normal text
#     2: bold
#     3: italic
#     4: bold and italic
#     5: symbol font

#cex.axis : the size for tick mark labels; default value is 1
################################################################################################
x<-1:10; y<-x*x
# Simple graph
plot(x, y)

# Custom plot : blue text, italic-bold, magnification
plot(x,y, col.axis="blue", font.axis=4, cex.axis=1.5)
################################################################################################
#Orientation of tick mark labels
#To change the style of the tick mark labels, las argument can be used. 
#The possible values are :
#    0: the labels are parallel to the axis (default)
#    1: always horizontal
#    2 : always perpendicular to the axis
#    3 : always vertical
plot(x, y, las=0) # parallel
plot(x, y, las=1) # horizontal
plot(x, y, las=2) # perpendicular
################################################################################################
#Hide tick marks
#To hide or to show tick mark labels, the following graphical parameters can be used :
#     xaxt : a character specifying the x axis type; possible values are either “s” 
#            (for showing the axis) or “n” ( for hiding the axis)
#     yaxt : a character specifying the y axis type; possible values are either “s” 
#            (for showing the axis) or “n” ( for hiding the axis)

####These two arguments are very useful to take the control of the rotation angle 
#for tick mark labels. Changing the rotation angle is not something easy in R but 
#we’ll see how to do it in the next section.
# Hide x and y axis
plot(x, y, xaxt="n", yaxt="n")
################################################################################################
#Change the string rotation of tick mark labels

#The following steps can be used :
#     Hide x and y axis
#     Add tick marks using the axis() R function
#     Add tick mark labels using the text() function
#The argument srt can be used to modify the text rotation in degrees.
# Suppress the axis
plot(x, y, xaxt="n", yaxt="n")
# Changing x axis
xtick<-seq(0, 10, by=5)
axis(side=1, at=xtick, labels = FALSE)
text(x=xtick,  par("usr")[3], 
     labels = xtick, srt = 45, pos = 1, xpd = TRUE)
# Changing y axis
ytick<-seq(0, 100, by=50)
axis(side=2, at=ytick, labels = FALSE)
text(par("usr")[1], ytick,  
     labels = ytick, srt = 45, pos = 2, xpd = TRUE)
################################################################################################
#Use the par() function
#The par() function can be used to permanently apply the changes to all of the graphs 
#that will be created in the current session.

par(col.axis="blue", font.axis=4, cex.axis=1.5)
plot(x,y)