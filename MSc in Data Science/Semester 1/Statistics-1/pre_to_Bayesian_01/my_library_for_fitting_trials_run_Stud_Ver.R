run_the_Trials <-function(func_for_synthetic_data,nTrials,ns){
  c_trials = rep(0.0,nTrials)
  m_trials = rep(0.0,nTrials)
  CI_c_trials = matrix(0.0,nTrials,2)
  CI_m_trials = matrix(0.0,nTrials,2)

  for(i in 1:nTrials){
    synth_data = func_for_synthetic_data(m_true,c_true,N)
    
    x = synth_data$x;
    y = synth_data$y
    yerr = synth_data$yerr
    ##################################
    out_fit <- my_LSQ_fit(x,y,yerr)
    CI_c_trials[i,] = c(out_fit["Intercept","Estimate"]-ns*out_fit["Intercept","Std. Error"],
                        out_fit["Intercept","Estimate"] + ns*out_fit["Intercept","Std. Error"])
    CI_m_trials[i,] = c(out_fit["Slope","Estimate"]-ns*out_fit["Slope","Std. Error"],
                        out_fit["Slope","Estimate"] + ns*out_fit["Slope","Std. Error"])
    c_trials[i] = out_fit["Intercept","Estimate"]
    m_trials[i] = out_fit["Slope","Estimate"]
  }
  #print(CI_c_trials)
  #print(CI_m_trials)
  ###################################################
  contains_c_true = (CI_c_trials[,1] < c_true & c_true < CI_c_trials[,2])
  contains_m_true = (CI_m_trials[,1] < m_true & m_true < CI_m_trials[,2])
  #contains_c_true = (CI_c_trials[,1] <= c_true & c_true <= CI_c_trials[,2])
  #contains_m_true = (CI_m_trials[, 1] <= m_true & m_true <= CI_m_trials[,2])
  
  #print(contains_c_true)
  #print(sum(contains_c_true))
  #print(contains_m_true)
  
  cat('Fraction of Confidence Intervals containing the true c: ',sum(contains_c_true)/length(contains_c_true),'\n')    
  cat('Fraction of Confidence Intervals containing the true m: ',sum(contains_m_true)/length(contains_m_true),'\n')
  ##############################################################################
  n0=5
  nbins=200
  par(mfrow=c(1,2))
  xlim_c =c(c_true-n0*sqrt(var(c_trials)), c_true+n0*sqrt(var(c_trials)) )
  #hist(c_trials,breaks = nbins,xlim=xlim_c,xlab ='c_trials')
  hist(c_trials,breaks = 'FD',xlim=xlim_c,xlab ='c_trials')
  abline(v = c_true, col="red", lwd=3, lty=2)
  ###################
  xlim_m =c(m_true-n0*sqrt(var(m_trials)), m_true+n0*sqrt(var(m_trials)) )
  #hist(m_trials,breaks = nbins,xlim=xlim_m,xlab ='m_trials')
  hist(m_trials,breaks = 'FD',xlim=xlim_m,xlab ='m_trials')
  abline(v = m_true, col="red", lwd=3, lty=2)
}
##################################################################################
##################################################################################
##################################################################################
run_the_Trials_A <-function(func_for_synthetic_data,nTrials,ns){
  c_trials = rep(0.0,nTrials)
  m_trials = rep(0.0,nTrials)
  CI_c_trials = matrix(0.0,nTrials,2)
  CI_m_trials = matrix(0.0,nTrials,2)
  
  x01= sort(runif(N,0,10))
  
  for(i in 1:nTrials){
    synth_data = func_for_synthetic_data(m_true,c_true,N,x01)
    
    x = synth_data$x;
    y = synth_data$y
    yerr = synth_data$yerr
    ##################################
    out_fit <- my_LSQ_fit(x,y,yerr)
    CI_c_trials[i,] = c(out_fit["Intercept","Estimate"]-ns*out_fit["Intercept","Std. Error"],
                        out_fit["Intercept","Estimate"] + ns*out_fit["Intercept","Std. Error"])
    CI_m_trials[i,] = c(out_fit["Slope","Estimate"]-ns*out_fit["Slope","Std. Error"],
                        out_fit["Slope","Estimate"] + ns*out_fit["Slope","Std. Error"])
    c_trials[i] = out_fit["Intercept","Estimate"]
    m_trials[i] = out_fit["Slope","Estimate"]
  }
  #print(CI_c_trials)
  #print(CI_m_trials)
  ###################################################
  contains_c_true = (CI_c_trials[,1] < c_true & c_true < CI_c_trials[,2])
  contains_m_true = (CI_m_trials[,1] < m_true & m_true < CI_m_trials[,2])
  #contains_c_true = (CI_c_trials[,1] <= c_true & c_true <= CI_c_trials[,2])
  #contains_m_true = (CI_m_trials[, 1] <= m_true & m_true <= CI_m_trials[,2])
  
  #print(contains_c_true)
  #print(sum(contains_c_true))
  #print(contains_m_true)
  
  cat('Fraction of Confidence Intervals containing the true c: ',sum(contains_c_true)/length(contains_c_true),'\n')    
  cat('Fraction of Confidence Intervals containing the true m: ',sum(contains_m_true)/length(contains_m_true),'\n')
  ##############################################################################
  n0=5
  nbins=200
  par(mfrow=c(1,2))
  xlim_c =c(c_true-n0*sqrt(var(c_trials)), c_true+n0*sqrt(var(c_trials)) )
  #hist(c_trials,breaks = nbins,xlim=xlim_c,xlab ='c_trials')
  hist(c_trials,breaks = 'FD',xlim=xlim_c,xlab ='c_trials')
  abline(v = c_true, col="red", lwd=3, lty=2)
  ###################
  xlim_m =c(m_true-n0*sqrt(var(m_trials)), m_true+n0*sqrt(var(m_trials)) )
  #hist(m_trials,breaks = nbins,xlim=xlim_m,xlab ='m_trials')
  hist(m_trials,breaks = 'FD',xlim=xlim_m,xlab ='m_trials')
  abline(v = m_true, col="red", lwd=3, lty=2)
}
