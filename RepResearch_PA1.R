setwd("C:/Users/ric/RepData_PA1")
activityDataRaw <- read.csv("activity.csv")
## inspect the data file
head(activityDataRaw)
tail(activityDataRaw)
str(activityDataRaw)
summary(activityDataRaw)
sum(is.na(activityDataRaw$steps))
activityData <- subset(na.omit(activityDataRaw))
plot(activityData$date, activityData$steps)
totalSteps <- tapply(activityData$steps, activityData$date, sum)  
##test2 <- tapply(activityData$steps, activityData, sum)
##test3 <- (na.omit(activityDataRaw$steps))


hist(test1, breaks=20, xlab="Total number of steps taken each day",
     main="Histogram of steps taken")

##test3 <- subset(activityDataRaw, activityDataRaw$steps == na.omit(activityDataRaw),
                select = c(steps, date, interval))
test4 <- sort(test1, na.last=TRUE)

test5 <- test4[c(1:53)]
test6 <- colSums(is.na(activityDataRaw))

hist(totalStepsData, breaks=20, xlab="Total number of steps taken", 
     main="Histogram of Total Steps Taken Each Day")
test7 <- as.frame(totalStepsData)

meanMedian <- summary(totalStepsData)

