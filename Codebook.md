# CodeBook
This is a code book that describes the variables
# Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
# The dataset includes the following files:
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

# Variables definition in run_analysis.R
- X_test1/train1: test/train set in data frame

- feature_extract: features only include mean and standard deviation

- X_test/train: filter out feature columns without mean and standard deviation

- testdf: the combination of subject_test, y_test and X_test

- traindf:  the combination of subject_train, y_train, X_train

- test_train_bind: the combination of testdf and traindf

- test_train: melted data of test_train_bind, which keep first the 3 columns("subject", "Activity_ID", "Activity_Label"), and turn the rest feature colums to rows

- tidy_test_train: the data frame which calculate mean of each feature variable for each activity and each subject

# Steps to work on the project
#### (same with the steps in README file)
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
