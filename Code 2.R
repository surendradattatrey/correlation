rm(list = ls())

attrition <- read.csv("C:/Users/surendra_dattatrey/Desktop/S&P Data/repositoryattritiondata.csv")
head(attrition)

set.seed(123)
first_sample <- attrition[sample(1:nrow(attrition), 1800,replace=FALSE),]
second_sample <- attrition[sample(1:nrow(attrition), 1800,replace=FALSE),]

sample_one <- write.csv(first_sample, file = "C:/Users/surendra_dattatrey/Desktop/S&P Data/sample_one.csv")
sample_two <- write.csv(second_sample, file = "C:/Users/surendra_dattatrey/Desktop/S&P Data/sample_two.csv")


table(first_sample$TERM_REASON)

df <- data.frame(table(first_sample$TERM_REASON))
sample_one_df <- write.csv(df, file = "C:/Users/surendra_dattatrey/Desktop/S&P Data/sample_one_df.csv")

df <- data.frame(table(second_sample$TERM_REASON))
sample_two_df <- write.csv(df, file = "C:/Users/surendra_dattatrey/Desktop/S&P Data/sample_two_df.csv")
