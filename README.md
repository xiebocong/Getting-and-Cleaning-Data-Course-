# Getting-and-Cleaning-Data-Course
Week 4 project
# Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.
# Course Project
You should create one R script called run_analysis.R that does the following.

1, Merges the training and the test sets to create one data set.

2, Extracts only the measurements on the mean and standard deviation for each measurement.

3, Uses descriptive activity names to name the activities in the data set

4, Appropriately labels the data set with descriptive activity names.

5, Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Prerequisites
You have to set your work directory for further data reading, install and load "data.table" and "reshape2" packages
```
setwd("/Users/dalinzhu/JanuaryR/Mycoursera")

install.packages("data.table") /  library("data.table")

install.packages("reshape2") /  library("reshape2")
```

# Steps to work on the project
The whole constructure is focused on realizing the five objectives mentioned in the Course Project, which will be executed in four steps.
## Step1: Extracts only the measurements on the mean and standard deviation for each measurement(objective 2)
1, Read all *`test/train .txt`* files and save them into data frames separately by `read.table`

2, Extracts only the measurements on the mean and standard deviation of *X_test/train* by `grepl()` and column subsetting functions
## Step2: Names the activities in the data set by looking up in the file *`activity_labels.txt`*(objective 3)
## Step3: Appropriately labels the data set with descriptive activity name, and merges the train and the test sets to create one data set(objectives 4&1)
1, Names column names for test group  by `names()` which can be applied to the train group later on

2, Binds test and train data frames separately by `cbind()`

3, Combins test frame(`testdf`) and train frame(`traindf`) by `rbind()`, in condition that they share the same name by assign the name of testdf to traindf

4, Shapes the bined data by keeping the first three columns, and converting the rest columns to rows by `melt()`
## Step4:  Creates a second, independent tidy data set with the average of each variable for each activity and each subject(objective 5)
1, To reshape the dataframe to a tidy data frame by using `dcast()` function, which will return the mean of each variable for each activity and each subject.

2, Upload the data set as a txt file created with `write.table()`

