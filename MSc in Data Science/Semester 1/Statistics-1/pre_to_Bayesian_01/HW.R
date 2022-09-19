rm(list=ls())
graphics.off()
############################################################
source('my_library_for_synth_data_Stud_Ver_I.R')
source('my_library_for_synth_data_Stud_Ver_I_A.R')
source('my_library_for_LSQ_fitting_Stud_Ver.R')
source('my_library_for_fitting_trials_run_Stud_Ver.R')
############################################################
#### INPUT: For generating synthetic data
m_true = 1.255
c_true = 4.507
N = 12
##############
nTrials=10000
###############
#HOMEWORK::
ns = 1.0 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data01_A 
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)  ######
# i.e., total 48 combinations to explore (8 values of ns, 6 types of synthetic data)


ns = 0.5 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data01_A 
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)



ns = 1.5 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data01_A 
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)




ns = 2.0 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data01_A 
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)


ns = 2.5 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data01_A 
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)


ns = 3.0 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data01_A 
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)


ns = 3.5 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data01_A 
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)



ns = 4.0 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data01_A 
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)


ns = 1 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data03_A()
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)



ns = 1 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data02_A
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)

ns = 1 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data04_A
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)


ns = 1 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data05_A
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)


ns = 1 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data06_A
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)


##############################################################
# For 2

ns = 1.0 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data02_A 
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)  ######
# i.e., total 48 combinations to explore (8 values of ns, 6 types of synthetic data)


ns = 0.5 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data02_A 
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)



ns = 1.5 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data02_A 
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)




ns = 2.0 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data02_A 
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)


ns = 2.5 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data02_A 
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)


ns = 3.0 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data02_A 
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)


ns = 3.5 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data02_A 
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)



ns = 4.0 #Also try: 0.5,1.5,2.0,2.5,3.0,3.5,4.0
func_for_synthetic_data = synthetic_data02_A 
###### Also try: synthetic_data02, synthetic_data03, synthetic_data04
# synthetic_data05, synthetic_data06
run_the_Trials_A(func_for_synthetic_data,nTrials,ns)


### Again add extenstion "_A" to the names of functions
# for generating synthetic data [e.g. synthetic_data01_A] and 
# for them you will have to use "run_the_Trials_A" (NOT run_the_Trials)
# So again 48 combinations

## Do you see numbers printed in your console window from 
# the following table?

############################################################
## Note: TABLE
# ns       CI
#0.5     0.3829249225
#1.0	 0.6826894921
#1.5     0.8663855975
#2.0	 0.9544997361
#2.5     0.9875806693
#3.0	 0.9973002039
#3.5	 0.9995347418
#4.0	 0.9999366575

############################################################
# YOU MAY(or not) IGNORE FOLLOWING PART
# One example/illustration of fitting
# out_data <- func_for_synthetic_data(m_true,c_true,N)
# Or, accordingly the combination of following two lines
##################################
# x01= sort(runif(N,0,10))
# out_data <- func_for_synthetic_data(m_true,c_true,N,x01)
##################################
# x= out_data$x
# y= out_data$y
# yerr= out_data$yerr
# out_fit <- my_LSQ_fit(x,y,yerr)
# 
# dev.new()
# par(mfrow=c(1,1))
# plot(x,y)
# # hack: we draw arrows but with very special "arrowheads"
# arrows(x, y-yerr, x, y+yerr, length=0.05, angle=90, code=3)## Synthetic Data
# abline(c_true,m_true,col="blue")### TRUE line
# ## LSQ Fitted Line
# abline(out_fit["Intercept","Estimate"],out_fit["Slope","Estimate"],col="red",lty=2)
# 
# legend("topleft",legend=c('Synth. Data','True Line','Fitted Line'),
#        col=c('black','blue','red'),
#        lty=c(NA,1,2),pch=c(1,NA,NA))
# 
