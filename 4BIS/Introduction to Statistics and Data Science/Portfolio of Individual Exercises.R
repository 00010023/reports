#------------------------ WESTMINSTER INTERNATIONAL UNIVERSITY IN TASHKENT -----------------------#
#-------------------------- INTRODUCTION TO STATISTICS AND DATA SCIENCE --------------------------#
#------------------------------- PORTFOLIO OF INDIVIDUAL EXERCISES -------------------------------#

ID <- 10023  # TO DO: <--- Insert your ID in front of the hash sign. Do not include the zeros (0's) in the beginning of your ID.
             # For example, if your ID is 00010200, then you need to enter your ID as 10200.
             # Failure to provide the ID results in 0 mark.

# Some exercises require the student to insert his/her last 4 digits of ID as abcd.
# A student with an ID of 0123 as the last four digits has the following values: a = 0, b = 0, c = 2, d = 3.
# You only must provide the R code which will store the correct answer in the given variable names. DO NOT use rounding functions for your answers.
# You can add additional rows before the answer line if you have more than one line of code.
# But you must store the final code into the provided variable names for each task.
# You can use any packages in R you want to solve these tasks.
# DO NOT CHANGE THE VARIABLE NAMES (e.g. answer1, answer2, etc). I will only give full marks if your code provides the correct answer.
# There is no partial credit for these tasks.

#--------------------------------------PACKAGE INSTALLATION AND LOADING PART-----------------------#
                                                              # Skip this part if you are only using the Base package of R.
                                                              # If you use any packages other than the base package,
                                                              # please add the installation and loading codes here
install.packages("quantmod", repos = "http://cran.us.r-project.org")

library(quantmod)

#-------------------------------------END OF PACKAGE INSTALLATIONS AND LOADING---------------------#

#------ TASK 1 -------# [5 marks]
# Oriyat FM, a radio station, finds that the distribution of the lengths of time listeners
# are tuned to the station follows the normal distribution. The mean of the
# distribution is 30.0 minutes and the standard deviation is 4.0 minutes. What is the
# probability that a particular listener will tune in between 32.0 and 43.0 minutes?

#In my case, the mean value would be 30, the sd be 4.0. To find the probability I will simply use the pnorm(x, mean, sd)
answer1 <- pnorm(43.0, mean = 30, sd = 4.0) - pnorm(32.0, mean = 30, sd = 4.0) #This is the answer.

#------ TASK 2 -------# [5 marks]

# Light bulbs are tested for their life-span. It is found that (10)% of the light bulbs are rejected.
# A random sample of 50 bulbs is taken from stock and tested. The random variable X is the number of bulbs that are rejected.
# What is the probability that the value of X is at least 5?

# I should substract the P of at most 4 bulbs beings rejected. The probability of success in this case is 0.1 So, the correct answer will be

answer2 <- 1 - pbinom(4, 50, 0.1)

#------ TASK 3 -------# [5 marks]

# It is estimated that 1825 of the callers to the Customer Service department of Dell Inc. will receive a busy signal per year.
# Suppose the number of customers who receive a busy signal follows a Poisson distribution. Assume there are 365 days in a year.
# What is the probability that at least (4) will receive a busy signal in a single day?

#To find the P I should use the reverse method. I used the formula given in the lecture slides especially for this case.
answer3 <- 1 - ppois(q = 4, lambda = 5)

#------ TASK 4 -------# [10 marks]

# The closing price of Schnur Sporting Goods Inc. common stock is uniformly distributed
# between $22 and $43 per share.
# 1. What is the probability that the stock price will be less than $35?

answer4_1 <- punif(35, min = 22, max = 43) # Lower tail comes default as true, because I am interested in the values below 35.

# 2. What is the probability that the stock price will be less than $35 if I know for sure it will be greater than 30?

answer4_2 <- punif(35, 30, 43) #As this is a conditional problem, I should change the lower border which is in my case 22 into 30 to avoid the possibility that a < 30

#------- TASK 5 -------# [5 marks]

# The price of shares of Bank of America Corp at the end of each trading day for the last year
# followed the normal distribution. Assume there were 240 trading days in the year. The
# mean price was $33.00 per share and the standard deviation was $2.00 per share.
# What is the minimum share price for the top 15% of end-of-day trading prices?

# The top 15% implies the number which is icluded in the 85%. That is why, I use the qnorm code and the following variables.
# The values for mean and sd are given in the question.
answer5 <- qnorm(0.85, mean = 33, sd = 2.0)

#------- TASK 6 -------# [12 marks]
# Majesty Video Production Inc. wants the mean length of its advertisements to be 32 seconds.
# Assume the distribution of ad length follows positively skewed distribution with a
# population standard deviation of 2.3 seconds. Suppose I select a sample of 36 ads
# produced by Majesty.

n <- 36 # Sample
popsd <- 2.3 # Population standard deviation

# 1. What is the standard error of the mean time?
answer6_1 <- popsd / (sqrt(n)) # The formula was derived from the lecture slides for the standard error of the mean.


# 2. What percent of the sample means will be greater than 31.25 seconds?
barX <- 31.25 # This is Xbar in formula of calculating z value
meanX <- 32 # This is sample mean
zValue <- (barX - meanX) / (popsd / sqrt(n)) # From this I find that the value is -1.96. The corresponding value in z table is 97.5%
answer6_2 <- 97.5 # This in percentage value

# 3. What is the length of advertisement (in seconds) on the 80th percentile?
ZValue <- 0.8 # This is the 80th percentile
answer6_3 <- ZValue*(popsd/sqrt(n)) + meanX # This is expressed in seconds

#------- TASK 7 -------# [9 marks]
# Let's import a dataset using R's built-in data loading function (i.e., see ?data);
# I will load the iris data set, which is a famous data set involving iris flower species.
data(iris) # load the "iris" data.frame object into the current session
head(iris) # provides the first 6 rows of this dataset.
# 1. Count the number of observations in this dataset.
compiled_data <- head(iris)
# I used the nrow() function to find the number of observations.
answer7_1 <- nrow(compiled_data)

# 2. Calculate the mean petal lengths of only the "setosa" flowers.
Setosa_insects <- iris[iris$Species == "setosa",] # The pointer assings the value for Setosa_insects going to iris dataframe
# Then choosing the species colunm with values equal to "setosa"
answer7_2 <-  mean(Setosa_insects$Petal.Lengt, na.rm = TRUE) # This calculated the mean

# 3. Calculate the standard deviaton of sepal lengths of only the "virginica" flowers.

Virginica_insects <- iris[iris$Species == "virginica",] # I assign the value for Virgina_insects,which are Virginica species in iris dataframe

answer7_3 <- sd(Virginica_insects$Sepal.Length) # I use the sd code to find the standard deveation.


#------- TASK 8 -------# [20 marks: questions 1 through 5 - 3 marks each, question 6 - 5 marks]
# Let's import the Titanic data set, which is a famous data set involving passengers of Titanic Cruiseship.
dat <- read.csv(url("https://web.stanford.edu/class/archive/cs/cs109/cs109.1166/stuff/titanic.csv"))
# You can learn more about each variable from the following link: https://www.kaggle.com/c/titanic/data
# by checking out the Data Library.
# You can add exra rows if needed on top of each answer line, but your code which provides the final answer must
# be provided in the provided answer lines.
# If NAs are present in the dataset, they should be removed before answering the questions.
head(dat) # you can see the first 6 rows of your Titanic dataset

#1 Write the code that provides the percentage of female passengers who perished.
fps <- dat[dat$Sex == "female", ]
pfps <- fps[fps$Survived == "0", ]
answer8_1 <- nrow(pfps) / nrow(fps) * 100

#2 How many passengers aged 17 and below were perished in this disaster?
cyka17below <- dat[dat$Age < 17 & dat$Survived == "0", ]
answer8_2 <- nrow(cyka17below)

#3 What percentage of passengers from 1st class have survived?
zombies <- dat[dat$Pclass == 1 & dat$Survived == 1, ]
firstClassZombies <- dat[dat$Pclass == 1, ]
answer8_3 <- nrow(zombies) / nrow(firstClassZombies) * 100

#4 Calculate the average fare amount of the passengers who were males and were in the 3rd class.
guls <- dat[dat$Sex == "male" & dat$Pclass == 3, ]
answer8_4 <- mean(guls$Fare, na.rm = TRUE)

#5 Calculate the average fare amount of the adult passengers (aged 18 or above) who were in the 2nd class or were females.
camry3_5 <- dat[dat$Age >= 18 & (dat$Pclass == 2 | dat$Sex == "female"), ]
answer8_5 <- mean(camry3_5$Fare, na.rm = TRUE)

#6 Calculate the average age of those passengers who have a title of "Miss" in their names and do not have parents/children aboard.
answer8_6 <- NULL

#------- TASK 9 -------# [10 marks]
set.seed(0023)
companies <- c("Kroger Co", "Cisco Systems", "WellsFargo & Co", "Bank of America Corp", "Norwegian Cruise Line Holdings Ltd", "Delta Air Lines Inc", "Pfizer Inc", "American Airlines Group Inc", "ConocoPhillips")
rlist <- as.vector(sample(companies, 3))       # run these 4 lines of code ONLY ONCE to get random three company names.
cat("Your company list:", rlist, sep = "   ")  # this line of code prints the names of 3 companies that you use for your plot.
# For this task, you need to randomly select 3 companies out of the company list provided above.
# Then, import stock price data from Yahoo Finance (finance.yahoo.com) for each of three companies from Jan c, 2016 to Feb d, 2021 (c, d - your ID values).
# Hint: you can either use Quantmod package or manually download from Yahoo Finance for each stock and import to R Studio)
# Convert the daily stock data to Weekly data (only last trading day of each week will be stored) and plot a line graph showing all three stock prices in one plot.
# Use the column for Close Price in y axis of your graph and use three different colors for the lines.
# Use ylim option to make sure all 3 lines are visible in your plot for the whole period.
# Use legend option to place a legend on an empty spot of your graph.
start <- as.Date("2016-01-02") # typing out the dates (start)
end <- as.Date("2021-02-03") # typing out the dates (end)
# Getting and analyzing out stocks for KR
kr <- getSymbols("KR", src = "yahoo", from = start, to = end, auto.assign = FALSE)
# Getting and analyzing out stocks for AAL
aal <- getSymbols("AAL", src = "yahoo", from = start, to = end, auto.assign = FALSE)
# Getting and analyzing out stocks for WFC
wfc <- getSymbols("WFC", src = "yahoo", from = start, to = end, auto.assign = FALSE)

# Plotting bootstrap liner graph with its KR datas on green color
plot(x = index(kr), y = kr[,4], type = "l", col="green", ylab = "Stock Price Closing (USD)", xlab = "Period")
# Adding AAL as lines to the graph on red color
lines(x = index(aal), y = aal[,4], type = "l", col="red")
# Adding WFC as lines to the graph on red blue
lines(x = index(wfc), y = wfc[,4], type = "l", col="blue")
# Adding up legends from bottom of the graph
legend("bottom", legend=c("Kroger Co", "American Airlines Group Inc", "WellsFargo & Co"), col=c("green", "red", "blue"), lty=1:3)

#------- TASK 10 -------# [10 marks]

# Create a function named "refer_list" which takes a dataframe as an argument and prints only the ids whose marks are lower than 40.
# For example, if I pass the following dataframe, "students" as shown below, as an argument into the "refer_list" function,
# the function must print the following ID's: 6234, 5786. The data type of the output is not important.
# If I make any change to the "students" data frame, your function should still work properly with the new data.
students <- data.frame("id" = c(6234, 6235, 5786, 5250), "mark" = c(38, 55, 20, 44))

# Declaring a function that accepts an argument namely students
refer_list <- function (students) {
  # Printing out the state
  lowMark <- 40
  print(students[students$mark < lowMark,]) # if students mark from collection is lower 40, return it
}

#------- TASK 11 -------# [6 marks]
# The following paragraph consists of some meaningful statements. But some of the letters were replaced with characters.
# Your task is to replace those characters programmatically to the appropriate letters and provide the final meaningful statement.
# Please pay attention to upper/lower cases.

statement <- "!;, [SDS t;+m, h~p; th+t }~u ;nj~};d }~ur ;x;rcis;s +nd w;r; +bl; t~ c~mpl;t; th;m ~n tim;. Pl;+s; s+v; }~ur fil; in R ;xt;nsi~n +nd d~ n~t f~rg;t t~ r;n+m; th; fil; with }~ur ~wn [D. [t is tim; t~ h+v; + g~~d r;st +nd c~m; t~ }~ur cl+ss;s with fr;sh mind. S;; }~u n;xt tim; in th; cl+ss."
statement <- chartr(old="+", new="a", statement) # replacing + es with "a" character
statement <- chartr(old=";", new="e", statement) # replacing ; es with "e" character
statement <- chartr(old="[", new="I", statement) # replacing [ es with capiral "i" character
statement <- chartr(old="~", new="o", statement) # replacing ~ es with "o" character
statement <- chartr(old="}", new="y", statement) # replacing } es with "y" character
statement <- chartr(old="!", new="W", statement) # replacing ! es with capital "w" character
answer11 <- statement

#------- TASK 12 -------# [3 marks]
# Provide your constructive feedback with few sentences about ISDS module. Use the print() function to provide your feedback :).
# I guess there is no need for explanation on that task
feedback <- "I would like to express my appreciation for this module for being taught by awesome staffs. In addition, I would like to state that thanks for this module, I can belief in myself to become a good data scientists in upcoming fututre."
print(feedback)

#-------------------------------------------------------------- END OF TASKS --------------------------------------------------------------------------------#
#--------------------------------------------------------------- GOOD LUCK!----------------------------------------------------------------------------------#