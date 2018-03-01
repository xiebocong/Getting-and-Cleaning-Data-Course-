## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for 
## each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each 
## variable for each activity and each subject.

# set work directory and load "data.table" and "reshape2" functions
setwd("/Users/dalinzhu/JanuaryR/Mycoursera")
install.packages("reshape2")
install.packages("data.table")
library("data.table")
library("reshape2")

## 2.Extracts only the measurements on the mean and standard deviation for 
## each measurement

# read all test/train .txt files and save them to dataframes
X_test1 <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
y_test <- read.table("./UCI_HAR_Dataset/test/y_test.txt")
subject_test <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")
X_train1 <- read.table("./UCI_HAR_Dataset/train/X_train.txt")
y_train <- read.table("./UCI_HAR_Dataset/train/y_train.txt")
subject_train <- read.table("./UCI_HAR_Dataset/train/subject_train.txt")

# Extracts only the measurements on the mean and standard deviation of X_test/train
feature <-  read.table("./UCI_HAR_Dataset/features.txt")[,2]
feature_extract <- grepl("mean|std", feature)
names(X_test1) <- feature
names(X_train1) <- feature
X_test <- X_test1[, feature_extract]
X_train <- X_train1[, feature_extract]

## 3.Uses descriptive activity names to name the activities in the data set
activity_lable <- read.table("./UCI_HAR_Dataset/activity_labels.txt")[,2]
y_test[,2] <- activity_lable[y_test[,1]]
y_train[,2] <- activity_lable[y_train[,1]]


## 4. Appropriately labels the data set with descriptive activity name
## 1. Merges the training and the test sets to create one data set

# name column name for test group which can be applied to train group later on
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# bind test and train date frame separately
testdf <- cbind(subject_test, y_test, X_test)
traindf <- cbind(subject_train, y_train, X_train)
# combined frames which should share the same name
names(traindf) <- names(testdf)  
test_train_bind <- rbind(testdf, traindf)
# shape data: keep first the 3 columns, turn the rest colums to rows
test_train <- melt(test_train_bind, c("subject", "Activity_ID", "Activity_Label"))

## 5. Creates a second, independent tidy data set with the average of each 
## variable for each activity and each subject.
tidy_test_train  <-  dcast(test_train, subject + Activity_Label ~ variable, mean)
write.table(tidy_test_train, file = "./UCI_HAR_Dataset/tidy_test_train.txt",row.names = FALSE)