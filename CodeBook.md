# CodeBook.md

A code book that describes the variables, the data, and any transformations or work that was performed to clean up the data.

## The variables

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag

## The data

__UCI HAR Dataset\test\subject_test.txt__ - Contains the Subject(person) the corresponding row is tied to in the other data files.

__UCI HAR Dataset\test\X_test.txt__ - Each row represents the actual data retrieved for each varaible 

__UCI HAR Dataset\test\y_test.txt__ - Each row is the actual activity: 1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING

__UCI HAR Dataset\train\__ - This directory has the same 3 files described above, but the files are much larger. They represent 70% of the dataset available, while the test data is 30% of the data.

__UCI HAR Dataset\activity_labels.txt__ - Has the activity labels that I had mentioned for y_tests.txt

__UCI HAR Dataset\features.txt__ - The actual labels for each data element that is provided in the X_xxx.txt files

__UCI HAR Dataset\features_info.txt__ - Provides more descriptive information of each data element. Providing high level information for what was provided during the subjects activities. A proper analysis of each data element will require electrical engineering to fully understand the number values.

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean

The observations were summarized by mean, grouped by subject and by activity type classification.

subject_id - the id of the participating subject
activity_type - the classification of the activity based on the observedmeasurements.

## The Transformations and Work Completed to Clean the Data

### 1. Merge the training and the test sets to create one data set

This was accomplished by loading each file into a data frame and then use the __rbind__ function to join two data frames (datasets) vertically.

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

This was accomplished by using the __c__ combine function and specifying the specific columns that represent only the mean and standard deviation values.

Then the __cbind__ function was used to take a sequence of data-frame arguments and combine by columns based upon activity type.

### 3. Uses descriptive activity names to name the activities in the data set.

Here the __features.txt__ file and the __subect_train/test.txt__ files are used to provide descriptive names to the activities in the data set. 

### 4. Appropriately label the data set with descriptive variable names.

Using the __colnames__ function to link the column names to the data in the X_ data files.

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Using __dplyr__ __group_by__ __summarise_each__ and __funs__ functions

Finally the __write.table__ function was used to write out to the __uciHarDataset.txt__ file.
