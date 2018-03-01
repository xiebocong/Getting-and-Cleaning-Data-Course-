# Getting-and-Cleaning-Data-Course
Week 4 project
# Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.
# Course Project Objectives
You should create one R script called run_analysis.R that does the following.

1, Merges the training and the test sets to create one data set.

2, Extracts only the measurements on the mean and standard deviation for each measurement.

3, Uses descriptive activity names to name the activities in the data set

4, Appropriately labels the data set with descriptive activity names.

5, Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Prerequisites
You have to set your work directory for further data reading, install and load "data.table" and "reshape2" packages

`setwd("/Users/dalinzhu/JanuaryR/Mycoursera")`

`install.packages("data.table") /  library("data.table")`

`install.packages("reshape2") /  library("reshape2")`

# Steps to work on the project
The whole constructure is focused on realizing the five criterias mentioned in the Course Project objectives, which will be splited by five steps.
## Step1: Extracts only the measurements on the mean and standard deviation for each measurement(objective 2)
1, Read all test/train .txt files and save them into dataframes separately by `read.table`

2, Extracts only the measurements on the mean and standard deviation of X_test/train by `grepl` and column subsetting functions
## Step2: Name the activities in the data set by > activity_labels.txt
