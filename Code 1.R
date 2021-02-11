rm(list = ls())

library(reshape2)
library(dplyr)
#install.packages('plyr')

data1 = read.csv("C:/Users/surendra_dattatrey/Desktop/S&P Data/Correlation/Data1.csv")
head(data1)
data2 = read.csv("C:/Users/surendra_dattatrey/Desktop/S&P Data/Correlation/Data2.csv")
head(data2)
data3 = read.csv("C:/Users/surendra_dattatrey/Desktop/S&P Data/Correlation/Data3.csv")
head(data3)

comb_1 <- rbind(data1, data2)
combine_data <- rbind(comb_1, data3)

combine_data_subset <- combine_data [ -c(1:2) ]
head(combine_data_subset)

combine_data_subset_india <- 
  filter(combine_data_subset,(HIRINGSOURCE == 'Contacted by Recruiter - eFinancial Careers' 
                              | HIRINGSOURCE == 'Contacted by Recruiter - Naukri'
                              | HIRINGSOURCE == 'Referral'
                              | HIRINGSOURCE == 'Job Alert'
                              | HIRINGSOURCE == 'Employee Referral'
                              | HIRINGSOURCE == 'Campus Recruiting Event'
                              | HIRINGSOURCE == 'I am a Current Employee'
                              | HIRINGSOURCE == 'S&P Global Website'
                              | HIRINGSOURCE == 'Returning Employee'
                              | HIRINGSOURCE == 'Naukri Job Board'
                              | HIRINGSOURCE == 'LinkedIn Job Board'
                              | HIRINGSOURCE == 'Direct Employers'
                              | HIRINGSOURCE == 'Monster'
                              | HIRINGSOURCE == 'Glassdoor'
                              | HIRINGSOURCE == 'Contacted by Recruiter - Dice'
                              | HIRINGSOURCE == 'Contacted by Recruiter - LinkedIn'
                              | HIRINGSOURCE == 'Job Board'
                              | HIRINGSOURCE == 'Career Marketing Site'
                              | HIRINGSOURCE == 'Indeed'
                              | HIRINGSOURCE == 'Tactica Business Solutions'
                              | HIRINGSOURCE == 'Iimjobs'
                              | HIRINGSOURCE == 'Seek'
                              | HIRINGSOURCE == 'CFA Society'
                              | HIRINGSOURCE == '104 Job Bank'
                              | HIRINGSOURCE == 'I am a Current Contractor'
                              | HIRINGSOURCE == 'ATD Job Bank'
                              | HIRINGSOURCE == 'eFinancial Careers'
                              ))

#Rating Frequency
# typeof(combine_data_subset_india)
# 
# factor(combine_data_subset_india$RATINGCURRENT)
# 
# w = table(combine_data_subset_india$RATINGCURRENT)
# class(w)
# 
# t = as.data.frame(w)
# t
# 
# names(t)[1] = 'Ratings'

### Other way around

tbl <- table(combine_data_subset_india)
tbl
class(tbl)

#as.data.frame(tbl)
tbl_mat <- as.data.frame.matrix(tbl)

tbl <- write.csv(tbl, file = "C:/Users/surendra_dattatrey/Desktop/S&P Data/tbl.csv")

Tbl_wonull = read.csv("C:/Users/surendra_dattatrey/Desktop/S&P Data/tbl.csv", header = TRUE)
head(Tbl_wonull)

chi2 = chisq.test(Tbl_wonull)
c(chi2$statistic, chi2$p.value)


fisher.test(tbl, conf.level = 0.95)$conf.int
