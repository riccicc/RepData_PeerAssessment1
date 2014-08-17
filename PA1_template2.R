setwd("C:/Users/ric/RepData_PA1")
getwd() ## check working directory has been set. 
activityDataRaw <- read.csv("activity.csv")  ## read data into R dataframe. 

str(activityDataRaw) ## inspect structure of data
summary(activityDataRaw)
head(activityDataRaw)  ## display first few rows of data
tail(activityDataRaw)  ## display last rows of data
sum(is.na(activityDataRaw$steps)) #  determine number of NA values (which is also seen in the summary)

plot(activityDataRaw$date, activityDataRaw$steps)  ## quick look at two variables

activityData <- subset(na.omit(activityDataRaw))  ## build new dataset without NA values. 
head(activityData)  ## check first few rows. 

totalSteps <- tapply(activityData$steps, activityData$date, sum)  ## find the total steps count.
head(totalSteps)  ## show some of the data

totalStepsSorted <- sort(totalSteps, na.last=TRUE)  ## sort and move NA values to last
totalStepsData <- totalStepsSorted[c(1:53)]

totalStepsData

hist(totalStepsData, breaks=20, xlab="Total number of steps taken", 
     main="Histogram of Total Steps Taken Each Day")  

summary(totalStepsData)

library(ggplot2)

##test5 <- mean(activityData$steps, na.rm=FALSE)

test6 <- tapply(activityData$steps, activityData$interval, mean)

test7 <- test6[max(test6)]

test8 <- as.data.frame(test6)

plot(test8, type="l", xlab="Interval", ylab="Avg Daily Activity",main="Average Daily Activity Pattern")

activityDataModified <- activityDataRaw
## reference: http://stackoverflow.com/questions/9322773/how-to-replace-na-with-mean-by-subset-in-r-impute-with-plyr
for (i in which(sapply(activityDataRaw, is.numeric))) {
        activityDataModified[is.na(activityDataRaw[, i]), i] <- mean(activityDataRaw[, i],  na.rm = TRUE)
}

hist(log(activityDataModified$steps))
hist(log(activityDataRaw$steps))

