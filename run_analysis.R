library(plyr)

# Downloading dataset
if(!file.exists('./data')){
  dir.create('./data')
}
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileUrl, destfile='./data/Data.zip')

# Unzip file to /data directory
unzip(zipfile = './data/Data.zip', exdir = './data')

# Read in files
x_train <- read.table('./data/UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('./data/UCI HAR Dataset/train/y_train.txt')
subject_train <- read.table('./data/UCI HAR Dataset/train/subject_train.txt')

x_test <- read.table('./data/UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('./data/UCI HAR Dataset/test/y_test.txt')
subject_test <- read.table('./data/UCI HAR Dataset/test/subject_test.txt')

features <- read.table('./data/UCI HAR Dataset/features.txt')

activityLabels <- read.table('./data/UCI HAR Dataset/activity_labels.txt')

# Assign column names
colnames(x_train) <- features[,2] 
colnames(y_train) <-'activityId'
colnames(subject_train) <- 'subjectId'

colnames(x_test) <- features[,2] 
colnames(y_test) <- 'activityId'
colnames(subject_test) <- 'subjectId'

colnames(activityLabels) <- c('activityId','activityType')

# Merging all data together
mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
allData <- rbind(mrg_train, mrg_test)

# Find only the mean and standard deviation

colNames <- colnames(allData)
mean_and_std <- (
  grepl('activityId' , colNames) | 
  grepl('subjectId' , colNames) | 
  grepl('mean()' , colNames) | 
  grepl('std()' , colNames) 
)

# Make subset
setForMeanAndStd <- allData[ , mean_and_std == TRUE]
setWithActivityNames <- merge(setForMeanAndStd, activityLabels, by='activityId', all.x=TRUE)

# Output tidy data set file
tidy <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
tidy <- tidy[order(tidy$subjectId, tidy$activityId),]

write.table(tidy, 'tidy_data_set.txt', row.name=FALSE)
