rm(list = ls())
graphics.off()
#######################################################################
## Contingency Table: Chi-Square Test
## Example 10.3.1[DeGroot]
# ---------------------------------------------------------------------
# Curriculum                              A   B   Undecided   Totals
# ---------------------------------------------------------------------
# Engineering and science                24  23     12        59
# Humanities and social sciences         24  14     10        48
# Fine arts                              17   8     13        38
# Industrial and public administration   27  19    9          55
# Totals 92 64 44 200

table_data0 <- matrix(c(24,23,12,24,14,10,17,8,13,27,19,9),
                      nrow = 4,ncol = 3,byrow =TRUE)

X <- chisq.test(table_data0)
print(X)
X$expected
#########################################################################
my_chiSqr_test_contin_table <- function(ctable){
  expected <- outer(rowSums(ctable),colSums(ctable), FUN = "*")/sum(ctable)
  chi_sqr_cal= sum( (ctable - expected)^2/expected )
  df = (nrow(ctable) - 1)* (ncol(ctable) -1)
  pValue_cal = pchisq(chi_sqr_cal,df,lower.tail = FALSE)
  cat('X-squared = ',chi_sqr_cal,',  df = ',df,', p-value = ',pValue_cal,'\n')
}

my_chiSqr_test_contin_table(table_data0)

## Example 10.3.3[DeGroot]
table_data1 <- matrix(c(20,15,12,24,27,32,14,22,23),
                      nrow = 3,ncol = 3,byrow =TRUE)


X1 <- chisq.test(table_data1)
print(X1)
my_chiSqr_test_contin_table(table_data1)







