################### Teleco customer churn ###############################
################## Predictive Analysis ################################
customer_churn <-read.csv("C:/Users/Ujjwa/OneDrive/Desktop/BDA/CSV/WA_Fn-UseC_-Telco-Customer-Churn.csv")
summary(customer_churn)
unique(customer_churn$tenure)
unique(customer_churn$PaymentMethod)
summary(as.factor(customer_churn$PaymentMethod))
attach(customer_churn)
summary(as.factor(gender))
mean(MonthlyCharges)
median(MonthlyCharges)
range(MonthlyCharges)
# There can be some missing values in our data set , we have to remove those
 na_val <- is.na(customer_churn) ; summary(na_val)  # There are some missing values is our data set
sum(is.na(customer_churn)) # takes the sum of all na values
nrow(customer_churn)
# so there are 11 null values out of 7043 in our data set
#we will remove remove them
 churn <- na.omit(customer_churn) ; sum(is.na(churn))   # so null values are there
 
 attach(churn)
 # Extracting "Internet Service" column
 
 InternetService -> customer_internet_service
View(customer_internet_service)


# Extracting paperless billing
customer_paperless_billing <- PaperlessBilling ; head(customer_paperless_billing)
customer_streaming_TV <- StreamingTV ; summary(as.factor(customer_streaming_TV))


# Getting the count of customers whose "Internet service " is "DSL"

 library(tidyverse)
churn %>% filter(InternetService == "DSL") -> c ; c
internet_DLS








