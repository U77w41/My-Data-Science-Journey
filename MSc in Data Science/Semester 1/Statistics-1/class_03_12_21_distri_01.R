stud.Names <- c('Anirban Chakraborty',
                'S Aravind',
                'Aritra Saha',
                'Arnab Dutta',
                'Arpan Datta',
                'Ashin Das',
                'Bijoy Kumar Dey',
                'Debayan Dutta',
                'Equbal Hossain',
                'Kamal Budhory',
                'Kazi Jishan Zaman',
                'Krishnakanta Maity',
                'Manjis Majumdar',
                'Nilabja Ghosh',
                'Prakash Samanta',
                'Rajat Gaur',
                'Ratul Chakraborty',
                'Saikat Patra',
                'Samrat Ghosh',
                'Shibajee Sarkar',
                'Soumyajyoti Das',
                'Srirup Mitra',
                'Subham Samanta',
                'Subhojit Sarkar',
                'Udvas Das',
                'Ujjwal Chowdhury')
l <- c('Bernoulli Distribution',
       'Beta Distribution',
       'Binomial Distribution',
       'Chi-Square Distribution',
       'Erlang Distribution',
       'Exponential Distribution',
       'F Distribution',
       'Gamma Distribution',
       'Geometric Distribution',
       'Lognormal Distribution',
       'Negative Binomial Distribution',
       'Normal Distribution',
       'Pareto Distribution',
       'Pascal Distribution',
       'Poisson Distribution',
       'Student_s T Distribution',
       'Weibull Distribution')
###################################################################
#'Uniform Distribution (Continuous)',
#'Uniform Distribution (Discrete)',
###################################################################
set.seed(356773)# Please Don't change this
N = length(stud.Names)
v2 <- c()
for(ii in 1:N){
  v1 <- sample(1:17,2,replace = FALSE)
  #v2 <-c(v2,v1)
  cat(stud.Names[ii],'::::',l[v1[1]],',',l[v1[2]],'\n\n')
}
#sort(v2)
