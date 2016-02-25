# run_analysis.R

# 1. Merge the training and the test sets to create one data set
testsubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
testx <- read.table("UCI HAR Dataset/test/X_test.txt")
testy <- read.table("UCI HAR Dataset/test/Y_test.txt",colClasses="factor")

trainingsubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainingx <- read.table("UCI HAR Dataset/train/X_train.txt")
trainingy <- read.table("UCI HAR Dataset/train/Y_train.txt",colClasses="factor",)

# Combine the test and train datasets
testdata <- cbind(testx,testy,testsubjects)
trainingdata <- cbind(trainingx,trainingy,trainingsubjects)
merged <- rbind(testdata,trainingdata)

features <- read.table("UCI HAR Dataset/features.txt",colClasses="character")

numcols <- ncol(merged)

colnames(merged)[1:(numcols-2)] <- features$V2
colnames(merged)[(numcols-1)] <- "Activity"
colnames(merged)[numcols] <- "Subject"

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
meansCols <- grep("^t.*mean\\(\\)\\-[XYZ]", features$V2)
stdsCols <- grep("^t.*std\\(\\)\\-[XYZ]", features$V2)
colsToInclude <- sort(c(meansCols, stdsCols, 562, 563))
mergedMeansAndStd <- merged[, colsToInclude]

# 3. Uses descriptive activity names to name the activities in the data set.
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")
levels(mergedMeansAndStd$Activity) <- activitylabels$V2

numcols <- ncol(mergedMeansAndStd)
mergedMeansAndStd <- mergedMeansAndStd[, c(numcols, numcols-1,1:(numcols-2))]

mergedMeansAndStd$groups <- paste(mergedMeansAndStd$Subject,mergedMeansAndStd$Activity)

uniquegroups <- unique(mergedMeansAndStd$groups)

tidydata <- mergedMeansAndStd[0,]

for (group in uniquegroups) {
	dataSet <- subset(mergedMeansAndStd, groups==group)
	means <- lapply(dataSet[,3:numcols], mean)
	dataSet[1, 3:numcols] <- means
	tidydata <- rbind(tidydata, dataSet[1,])
}

tidydata$groups <- NULL

# 4. Appropriately label the data set with descriptive variable names.
colnames(tidydata) <- gsub("\\-mean\\(\\)\\-", "Mean", colnames(tidydata))
colnames(tidydata) <- gsub("\\-std\\(\\)\\-", "Std", colnames(tidydata))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
write.table(tidydata,file="uciHarDataset.txt",row.names=F)
