# PCA-DimensionReduction

Breakfast Cereals. Use the data for the breakfast cereals exampleto explore and summarize the data as follows:
(a) Import the data to R. Copy the R code used below.
(b) Which variables are numerical? Which variables are categorical?
(c) Compute the mean, median, min, max, and standard deviation for each of the numeric variables.
Copy the code used and the resulting table below. (Tip: this can be done through R’s sapply()
function.)
(d) Plot a histogram for each of the numeric variable. Copy the code used and the generated charts
below. Based on the histograms and summary statistics, which variables have the largest variability?
Which variables seem skewed?
(e) Plot a side-by-side boxplot comparing the calories in hot vs. cold cereals. Copy the code used and
the generated chart below. What does this plot show us?
(f) Plot a side-by-side boxplot of consumer rating as a function of the shelf height. Copy the code
used and the generated chart below. If we were to predict consumer rating from shelf height, does it
appear that we need to keep all three categories of shelf height? Why?
(g) Compute the correlation table for the numeric variables (function cor()). In addition, generate a
matrix plot for these variables (function plot(data)). Copy the code used and the results below. Which
pair of variables is most strongly corrected? How can we reduce the number of variables based on
these correlations? How would the correlations change if we normalized the data first?
(h) As that on page 25 of class slides used for Week 3, conduct PCA (without normalization).
Consider the first PC of the analysis. Describe briefly what this PC represent. Furthermore, what is
the score of this PC for the first record? Also, show us how you can manually derive this value.
