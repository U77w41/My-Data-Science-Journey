rm(list = ls())
graphics.off()
#######################################################################
## Contingency Table: Chi-Square Test

two_way_contingency_table_data_01 <- function(Nsamples,Nrows,Ncols){
  out_matrix <-matrix(nrow = Nrows,ncol=Ncols)
  # 
  total_in_each_row = rmultinom(1, size = Nsamples, prob = rep(1,Nrows))
  #print(total_in_each_row)
  for(ii in 1:Nrows){
    out_matrix[ii,] = rmultinom(1, size = total_in_each_row[ii,1], prob = rep(1,Ncols))
  }
  return(out_matrix)
}

two_way_contingency_table_data_02 <- function(Nsamples,Nrows,Ncols){
  out_matrix <-matrix(0,nrow = Nrows,ncol=Ncols)
  # 
  total_in_each_col = rmultinom(1, size = Nsamples, prob = rep(1,Ncols))
  for(ii in 1:Ncols){
    out_matrix[,ii] = rmultinom(1, size = total_in_each_col[ii,1], prob = rep(1,Nrows))
  }
  return(out_matrix)
  
}
##################################################################################

ChiSqr_test_two_way_contingency_table <-function(func_for_simulated_c_table,Nsamples,Nrows,Ncols,Ntrials){
  out <- numeric(Ntrials)
  for(i in 1:Ntrials){
    ctable <- func_for_simulated_c_table(Nsamples,Nrows,Ncols)
    #Row_sum <- rowSums(ctable)
    #Col_sum <- colSums(ctable)
    expected <- outer(rowSums(ctable),colSums(ctable), FUN = "*")/Nsamples
    out[i] = sum( (ctable - expected)^2/expected )
  }
  data0 <- hist(out,breaks = 'FD',plot = FALSE)
  dev.new()
  hist(out,breaks = 'FD',freq=FALSE)
  df0 = (Nrows-1)*(Ncols-1)
  curve(dchisq(x, df=df0),from=min(data0$mids),
        to=max(data0$mids),n=1001,lw=2,col='red',add=T)
}
#############################################################################
func_for_simulated_c_table = two_way_contingency_table_data_01
Nsamples = 200
Nrows = 4
Ncols = 3
Ntrials = 10000
ChiSqr_test_two_way_contingency_table(func_for_simulated_c_table,Nsamples,Nrows,Ncols,Ntrials)
  
