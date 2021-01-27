# GettingAndCleaningDataWA4

CodeBook.md describes the how to use all this, variables, the data, and any transformations or work that was performed to clean up the data.

Using data from UCI HAR Dataset. It's supposed That goal is to extract data from the data source.

Data source included:

features.txt - includes the descriptions for features measured
train/X_train.txt - includes the measurements of the features in train set (one row - 1 measurement of 561 features)
test/X_test.txt - includes the measurements of the features in test set
train/subject_train.txt - subject for each measurement from the train set
test/subject_test.txt - subject for each measurement from the test set
train/y_train.txt - activity (from 1 to 6) for each measurement from the train set
test/y_test.txt - activity (from 1 to 6) for each measurement from the test set

How script works
Script involves the following stages:

Downloads and merges the training and the test sets to create one data set. Use the fread function to read data, and combine data with rbind, cbind

Extracts only the measurements on the mean and standard deviation for each measurement. Use the grepl funtion to select with the mean and standard deviation variable

Uses descriptive activity names to name the activities in the data set

Appropriately labels the data set with descriptive variable names. User the merge to appropriately labels

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Use melt and dcast to create tiny data

run_analysis.R contains all the code to perform the analyses described in the 5 steps. They can be launched in RStudio by just importing the file. Here are the five steps:

[1] Merges the training and the test sets to create one data set. [2] Extracts only the measurements on the mean and standard deviation for each measurement. [3] Uses descriptive activity names to name the activities in the data set [4] Appropriately labels the data set with descriptive variable names. [5] From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. tidyData.txt is the output of the final step