# UCI HAR DataSet Cleaning Project

This github repository is for the Coursera Getting and Cleaning Data Course Project

## CodeBook.md

__CodeBook.md__ - A code book that describes the variables, the data, and any transformations or work that was performed to clean up the data.

## uciHarDataset.txt

__uciHarDataset.txt__ - Is the independent tidy data set that is the output from the run_analysis.R script on the original data available at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## run_analysis.R

__run_analysis.R__ - R script for cleaning the UCI HAR dataset from Samsung Smartphone activity tracking data. The script completes the following:

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement.
3.  Uses descriptive activity names to name the activities in the data set.
4.  Appropriately label the data set with descriptive variable names.
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

