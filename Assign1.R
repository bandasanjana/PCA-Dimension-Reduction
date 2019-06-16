#Author: Sanjana Banda
#Title: Assignment1

#Set the directory
getwd()
setwd("/Users/sanjana/Documents/Spring2019/TA/R/R-TA")

#*******************************************************************************************************************************************#
#(a) Import the data to R.
#Import the data and assign it to a data object
cereals.df <- read.csv(file="cereals.csv", header=TRUE, sep=",")
summary(cereals.df)
head(cereals.df)



#(b) Which variables are numerical? Which variables are categorical?
"Manufacture, shelf and  type are categorical variables "
"calories, protein, fat, sodium, fiber, carbo, sugars, potass, vitamins, weight, cups, rating are all numerical variables"




#(c) Compute the mean, median, min, max, and standard deviation for each of the numeric variables.
Numeric_cereals.df <- cereals.df[,-c(1:3,13)]
round(data.frame(mean=sapply(Numeric_cereals.df, mean, na.rm=TRUE), 
           sd=sapply(Numeric_cereals.df, sd, na.rm=TRUE), 
           min=sapply(Numeric_cereals.df, min, na.rm=TRUE), 
           max=sapply(Numeric_cereals.df, max, na.rm=TRUE), 
           median=sapply(Numeric_cereals.df, median, na.rm=TRUE)),2)




          
# (d) Plot a histogram for each of the numeric variable. Copy the code used and the generated charts
# below. Based on the histograms and summary statistics, which variables have the largest variability?
#   Which variables seem skewed?
library(tidyr)
library(ggplot2)
ggplot(gather(Numeric_cereals.df, na.rm=TRUE ), aes(value)) + 
  geom_histogram(bins = 10) + 
  facet_wrap(~key, scales = 'free_x')
"We observe almost all variables have significant variablilty, based on the histogram plots and summary statistics such as sd 
we observe sugars and carbo variables have the highest variablity.
Based on the histogram plots, we observe protein, fat, fiber, potass variables are right skewed."




   
#(e) Plot a side-by-side boxplot comparing the calories in hot vs. cold cereals. Copy the code used and
#the generated chart below. What does this plot show us?
boxplot(cereals.df$calories ~ cereals.df$type, xlab = "Type", ylab = "Calories", ylim=c(0,200), main = "BoxPlot of Calories w.r.t Type")
" From the boxplot above, we observe that the cold breakfast cereals on an average have higer calories compared to hot ones"
table(cereals.df$type)
# C   H 
# 74  3 
"Further we observe that the count of hot and cold types of breakfast cereals are not balanced, comparisions of imbalanced data
might lead to misleading results."






# (f) Plot a side-by-side boxplot of consumer rating as a function of the shelf height. Copy the code
# used and the generated chart below. If we were to predict consumer rating from shelf height, does it
# appear that we need to keep all three categories of shelf height? Why?
boxplot(cereals.df$rating ~ cereals.df$shelf, xlab = "Shelf", ylab = "Rating", ylim=c(0,200), main = "BoxPlot of Consumer Rating w.r.t Shelf")
"From the boxplot we observe that the shelf height 1 has higher average consumer ratings followed by shelf height3 and 2 "






# (g) Compute the correlation table for the numeric variables (function cor()). In addition, generate a
# matrix plot for these variables (function plot(data)). Copy the code used and the results below. Which
# pair of variables is most strongly corrected? How can we reduce the number of variables based on
# these correlations? How would the correlations change if we normalized the data first?
library(corrplot)
Correlation_matrix <- round(cor(Numeric_cereals.df,use="complete.obs"),2)
corrplot(Correlation_matrix, method="color")
" From the plot of correlation matrix we observe that rating and calories, rating and sugars, potass and fiber are strongly correlated"
""
#Correlation plot of normalized data
Normalized_Numeric_cereals.df <- scale(Numeric_cereals.df)
Normalized_Correlation_matrix <- round(cor(Normalized_Numeric_cereals.df,use="complete.obs"),2)
corrplot(Normalized_Correlation_matrix, method="color")
"We observe that the correlations does not change with the normalization of data"
" Since the formula for calculating the correlation coefficient standardizes the variables, changes in scale or units of measurement will not affect its value."





# (h) As that on page 25 of class slides used for Week 3, conduct PCA (without normalization).
# Consider the first PC of the analysis. Describe briefly what this PC represent. Furthermore, what is
# the score of this PC for the first record? Also, show us how you can manually derive this value.

pcs <- prcomp(na.omit(cereals.df[,-c(1:3,13)]))
summary(pcs)
" In the first PC of the analysis we observe that, PC1 explains 53.95% of the total variance."
pcs$rotation[1,1]
