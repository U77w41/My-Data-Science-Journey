stud.Names <- c('Abhisek Banerjee',
                'Anirban Chakraborty',
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
l <- c('Bernoulli distribution',
       'Binomial distribution',
       'Poisson distribution',
       'Discrete uniform distribution',
       'Hypergeometric distribution',
       'Geometric distribution',
       'Negative binomial distribution',
       'Normal Distribution',
       'Continuous Uniform Distribution',
       'Exponential Distribution',
       'Gamma Distribution',
       'Beta Distribution of First Kind',
       'Beta Distribution of Second Kind',
       'Weibull Distribution',
       'Cauchy Distribution',
       'Burr Distribution',
       'Cauchy Distribution')

set.seed(356773)# Please Don't change this
N = length(stud.Names)
v2 <- c()
for(ii in 1:N){
  v1 <- sample(1:16,2,replace = FALSE)
  #v2 <-c(v2,v1)
  cat(stud.Names[ii],'::::',l[v1[1]],',',l[v1[2]],'\n\n')
}
#sort(v2)

