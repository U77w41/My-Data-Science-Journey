grep("a", c("baA", "A7", "c@"), fixed = F)
sum(grep("A", c("baA", "A7", "c@"), fixed = TRUE))
 a
as.array(a)
typeof(a)
cars
grep("17", cars, fixed = T)

grep("j", c("baA jhb jhbjhb jhbjh", "A7 dfxgcbhjuko swdfvgbn fbhj nm", "dxfcgbhj xcfgbhjn cfgbhjnc@"), fixed = T)

string = "abcdef"
substr(string,3,3)
substr(string,2,4) <- c("NA", "NA")
string

substr("ab890cdef", 5 , 8)
substring("abcdtmhy8976ef", 1:6, 1:6)
## strsplit is more efficient ...

substr(rep("abcdef", 4), 1:4, 4:5)
x <- c("asfef", "qwerty", "yuiop[", "b", "stuff.blah.yech")
substr(x, 2, 5)
substring(x, 2, 4:6)

substring(x, 2) <- c("..", "+++")
x
nchar(x)

strsplit("ayjh,v4        
         56789bc", "")

sub("\\sasdfghjkl",".gj","DataFlair")
toupper(string)



paste("string", 1:3, sep = "
      ")
 paste("string", month.abb)
paste("Today is", date())


as.integer(12.0009)
