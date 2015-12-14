library(data.table)

# reading in the training dataset files and combining them in one dataset

d1 <- read.table("./UCI HAR Dataset/train/subject_train.txt")
d2 <- read.table("./UCI HAR Dataset/train/X_train.txt")
d3 <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_data <- cbind(d1,d3,d2)

# reading in the test dataset files and combining them in one dataset

d4 <- read.table("./UCI HAR Dataset/test/subject_test.txt")
d5 <- read.table("./UCI HAR Dataset/test/X_test.txt")
d6 <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_data <- cbind(d4,d6,d5)

# combining the training and test datasets into a single dataset 
data <- rbind(test_data,train_data)

# reading in the measurement variable names 

features <- read.csv("./UCI HAR Dataset/features.txt",header = FALSE, sep="",colClasses = "character")

# setting the variable measures names  

colnames(data) <- c("subject", "activity", features$V2)

# ordering dataset by subject id   

data <- data[order(data$subject,decreasing = FALSE),]

# creating a data table subset of the dataset by using REGEX on the variable names to identify those 
## that denote mean and standard deviation measurements

subset <- data[,c(1,2,grep(".*-mean\\(\\)|.*-std\\(\\)", colnames(data)))]
subset <- as.data.table(subset)

# reading in the activity labels into a data table and labelling columns

activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
activities <- as.data.table(activities)
colnames(activities) <- c("activity", "activity_label")

# setting a key for the activity variable in both the subset and the activities data tables 
## merging the two data tables based on the common key

setkey(subset,activity)
setkey(activities,activity)
merge <- merge(subset,activities)

# setting the activity field to be the human readable form and organising the columns

merge$activity <- merge$activity_label
merge <- merge[,1:68,with=FALSE]
merge <- merge[,c(2,1,3:68),with=FALSE]

# creating a tidy dataset that aggregates the average of the measure variables by activity and subject

tidy <- aggregate(merge[,3:68,with=FALSE], by=list(merge$activity,merge$subject), FUN=mean, na.rm=TRUE)
colnames(tidy)[1] <- "activity"
colnames(tidy)[2] <- "subject"

write.table(tidy,"tidy dataset.txt", row.names=FALSE)
