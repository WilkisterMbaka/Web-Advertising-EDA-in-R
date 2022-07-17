---
title: "Week 12 Independent_project"
author: "Wilkister Mbaka"
date: "15/07/2022"
output: html_document
---
  
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

##Defining the Question
a) Specifying the Question
We are tasked with cleaning the dataset and finding patterns within it by performing EDA

b) Defining the metrics of success 
This project will be considered a success when we have found patterns and visualized them where necessary.

c) Understanding the context
A Kenyan entrepreneur has created an online cryptography course and would want to advertise it on her blog. She currently targets audiences originating from various countries. In the past, she ran ads to advertise a related course on the same blog and collected data in the process. She would now like to employ your services as a Data Science Consultant to help her identify which individuals are most likely to click on her ads.

d) experimental design taken
1) Load the dataset
2) Clean the dataset.
3) perform Exploratory data analysis

```{r}
#installing packages
install.packages("data.table")
library(data.table)
#
#Loading the dataset
advert <- fread("http://bit.ly/IPAdvertisingData")
#Previewing the first 6 rows
head(advert)
```
```{r}
#Checking the datatypes
str(advert)
```

```{r}
#Finding the total number of missing values in each column
colSums(is.na(advert))
#There are no missing values in the dataset
```

```{r}
#Finding duplicated entries within the dataset
duplicated_rows <- advert[duplicated(advert),]
#Printing out the duplicated entries
duplicated_rows
#There are no duplicates
```

##Checking for outliers
```{r}
#Checking for outliers using boxplot
install.packages("dplyr")
library(dplyr)
data_num2 <- select_if(advert, is.numeric)             
data_num2 
boxplot(data_num2)
#We notice that outliers are only available in the Area income column, but since they represent income from certain areas we fail to drop them
```

##Exploratory Data Analysis
##Univariate Analysis
#Measures of Central Tendency
```{r}
#Finding the mean of the numerical columns
advert_mean1 <- mean(advert$`Daily Time Spent on Site`)
advert_mean2 <- mean(advert$Age)
advert_mean3 <- mean(advert$`Area Income`)
advert_mean4 <- mean(advert$`Daily Internet Usage`)
#Printing out the results for daily time spent on site
advert_mean1
#Printing results for Age
advert_mean2
#Printing the results for Area income
advert_mean3
#Printing results for daily internet usage
advert_mean4
#
```

```{r}
##Median
#Finding the Median of the numerical columns
advert_median1 <- median(advert$`Daily Time Spent on Site`)
advert_median2 <- median(advert$Age)
advert_median3 <- median(advert$`Area Income`)
advert_median4 <- median(advert$`Daily Internet Usage`)
#Printing out the results for daily time spent on site
advert_median1
#Printing results for Age
advert_median2
#Printing the results for Area income
advert_median3
#Printing results for daily internet usage
advert_median4
```

##Mode
```{r}
#Creating a function for finding mode
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
#Calculating the mode of each column
advert_mode1 <- getmode(advert$`Daily Time Spent on Site`)
advert_mode2 <- getmode(advert$Age)
advert_mode3 <- getmode(advert$`Area Income`)
advert_mode4 <- getmode(advert$`Daily Internet Usage`)
#Printing out the results for daily time spent on site
advert_mode1
#Printing results for Age
advert_mode2
#Printing the results for Area income
advert_mode3
#Printing results for daily internet usage
advert_mode4
```

##Measures of Dispersion
#Maximum values in each numerical column
```{r}
#Finding the maximum values in each cloumn
advert_max1 <- max(advert$`Daily Time Spent on Site`)
advert_max2 <- max(advert$Age)
advert_max3 <- max(advert$`Area Income`)
advert_max4 <- max(advert$`Daily Internet Usage`)
#Printing out the results for daily time spent on site
advert_max1
#Printing results for Age
advert_max2
#Printing the results for Area income
advert_max3
#Printing results for daily internet usage
advert_max4
```

#Minimum values in the numerical columns
```{r}
#Finding the minimum values in each cloumn
advert_min1 <- min(advert$`Daily Time Spent on Site`)
advert_min2 <- min(advert$Age)
advert_min3 <- min(advert$`Area Income`)
advert_min4 <- min(advert$`Daily Internet Usage`)
#Printing out the results for daily time spent on site
advert_min1
#Printing results for Age
advert_min2
#Printing the results for Area income
advert_min3
#Printing results for daily internet usage
advert_min4
```

##Quantiles 
```{r}
#Finding the quantiles in each cloumn
advert_quan1 <- quantile(advert$`Daily Time Spent on Site`)
advert_quan2 <- quantile(advert$Age)
advert_quan3 <- quantile(advert$`Area Income`)
advert_quan4 <- quantile(advert$`Daily Internet Usage`)
#Printing out the results for daily time spent on site
advert_quan1
#Printing results for Age
advert_quan2
#Printing the results for Area income
advert_quan3
#Printing results for daily internet usage
advert_quan4
```

##Variance
```{r}
#Finding the variance in each cloumn
advert_var1 <- var(advert$`Daily Time Spent on Site`)
advert_var2 <- var(advert$Age)
advert_var3 <- var(advert$`Area Income`)
advert_var4 <- var(advert$`Daily Internet Usage`)
#Printing out the results for daily time spent on site
advert_var1
#Printing results for Age
advert_var2
#Printing the results for Area income
advert_var3
#Printing results for daily internet usage
advert_var4
```

##Standard Deviation
```{r}
#Finding the standard deviation in each cloumn
advert_sd1 <- sd(advert$`Daily Time Spent on Site`)
advert_sd2 <- sd(advert$Age)
advert_sd3 <- sd(advert$`Area Income`)
advert_sd4 <- sd(advert$`Daily Internet Usage`)
#Printing out the results for daily time spent on site
advert_sd1
#Printing results for Age
advert_sd2
#Printing the results for Area income
advert_sd3
#Printing results for daily internet usage
advert_sd4
```

##Skeweness
```{r}
#importing the necessary packages
install.packages('moments')
library(moments)
#Finding the skewness in each cloumn
advert_sk1 <- skewness(advert$`Daily Time Spent on Site`)
advert_sk2 <- skewness(advert$Age)
advert_sk3 <- skewness(advert$`Area Income`)
advert_sk4 <- skewness(advert$`Daily Internet Usage`)
#Printing out the results for daily time spent on site
advert_sk1
#Printing results for Age
advert_sk2
#Printing the results for Area income
advert_sk3
#Printing results for daily internet usage
advert_sk4
#From the results below we can note that Age column has a positive skewness meaning majority of the data are less than the mean. On the hand Daily internet usage column has a value close to 0 meaning its data is normally distributed. Finally both Daily time spent on site and area income columns have a negative value which interprets that majority of the data are greater than the mean which can also be interpreted that most data are concetrated on the right side of the tail.
```

##Kurtosis
```{r}
#Finding the skewness in each cloumn
advert_kr1 <- kurtosis(advert$`Daily Time Spent on Site`)
advert_kr2 <- kurtosis(advert$Age)
advert_kr3 <- kurtosis(advert$`Area Income`)
advert_kr4 <- kurtosis(advert$`Daily Internet Usage`)
#Printing out the results for daily time spent on site
advert_kr1
#Printing results for Age
advert_kr2
#Printing the results for Area income
advert_kr3
#Printing results for daily internet usage
advert_kr4
#All the kurtosis values are less than 3 which is called Platykurtic.
```

##Bivariate analysis
##Scatter plots
```{r}
#Plotting a scatter plot for age and daily time spent on site
#Assigning age to age column
age <- advert$Age
#Assigning daily time to its column
daily <- advert$`Daily Time Spent on Site`
#Creating a scatter plot
plot(age, daily, xlab = "Age", ylab = "daily time spent on site" )
#The plot is scattered with no visible relationship bettween age and time spent 
```

#Scatter plot between area income and daily internet usage
```{r}
#Assigning each column its respective name
area <- advert$`Area Income`
usage <- advert$`Daily Internet Usage`
#Plotting the scatter plot
plot(area, usage, xlab = "Area Income", ylab = "daily internet usage" )
#Peaople with 55000 to 75000 income use the internet more
```

##Barplots
```{r}
#Assigning values to column names
income <- advert$`Area Income`
age <- advert$Age
#Plotting the bargraph
barplot(income,                                       # Add labels to barplot
        names.arg = age)
```

##Covariance among variables
```{r}
#Printing out covariances 
cov(age, income)
cov(area, usage)
cov(age, area)
cov(income, usage )
```

##Correlation
```{r}
#Finding the correlation of the numerical columns
# Identify numeric columns
# Install dplyr
#install.packages("dplyr")                            
library("dplyr") 
# Subset numeric columns with dplyr
data_num2 <- select_if(advert, is.numeric)             
data_num2 
# computing correlation matrix
#install.packages("corrplot")
install.packages('corrplot')
library(corrplot)
#Assigning m to the correlation
# correlation matrix
M<-cor(data_num2)
corrplot(M, method="number")
#From the correlation plot
#1.  There is a moderate positive correlation of 0.52 between Daily internet usage and Daily time spent on site.
#2.  There is also a weak positive correlation of 0.31 between area income and daily time spent on site
#3.  There is a high negative correlation of -0.75 between clicked on ad and daily time spent on site
#4.  There is a high negative correlation of -0.79 between clicked on ad and daily internet usage

```

##Conclusion

Below are some of the conclusions we have:
  1) Most of the customers are of the average age of 36.
2) Customers at the age of 31 are the most in the site.
3) Customers between the age of 30 - 50 spend the most time on the site.

##Reccomendations
our reccomendations are:
  1) More sensitisation should be done to customers in their 30s.

##Conclusion

Below are some of the conclusions we have:
  1) Most of the customers are of the average age of 36.
2) Customers at the age of 31 are the most in the site.
3) Customers between the age of 30 - 50 spend the most time on the site.

##Reccomendations
our reccomendations are:
  1) More sensitisation should be done to customers in their 30s.

Footer
© 2022 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
You have no unread notifications