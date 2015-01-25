library(data.table)
library(reshape2)
train.x <- read.table("./UCI HAR Dataset//train//X_train.txt",head=FALSE)
test.x <- read.table("./UCI HAR Dataset//test//X_test.txt",head=FALSE)
feature <- read.table("./UCI HAR Dataset//features.txt",head=FALSE)
feature <- as.vector(feature[,2])
alldata.x <- rbind(train.x,test.x)
colnames(alldata.x) <- feature

extractdata.x <- subset(alldata.x,,select=grep("mean\\(\\)|std\\(\\)",colnames(alldata.x)))

train.y <- read.table("./UCI HAR Dataset//train//y_train.txt",head=FALSE)
test.y <- read.table("./UCI HAR Dataset//test//y_test.txt",head=FALSE)
alldata.y <- rbind(train.y,test.y)

activity.label <- read.table("./UCI HAR Dataset//activity_labels.txt",head=FALSE)
alldata.y <- factor(as.vector(t(alldata.y)),levels=as.vector(activity.label[,1]),labels=as.vector(activity.label[,2]))

extractdata <- cbind(as.data.frame(alldata.y),extractdata.x)

train.subject <- read.table("./UCI HAR Dataset//train//subject_train.txt",head=FALSE)
test.subject <- read.table("./UCI HAR Dataset//test//subject_test.txt",head=FALSE)
alldata.subject <- rbind(train.subject,test.subject)

extractdata <- cbind(alldata.subject,extractdata)
colnames(extractdata) <- c("subject","activity",colnames(extractdata.x))

result<-aggregate(extractdata[,c(3:ncol(extractdata))],by=list(extractdata$subject,extractdata$activity),FUN = mean)
colnames(result)[1] <- "subject"
colnames(result)[2] <- "activity"
write.table(result,"result_average.txt",row.names=FALSE)