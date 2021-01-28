setwd("C:/Users/danie/Desktop/Programming/John Hopkins Data Specialisation Course/Module 3/Assignment")

features <- read.table("UCI HAR Dataset/features.txt")[,2] #Extracting the features column
activities <- read.table("UCI HAR Dataset/activity_labels.txt")[,2] #Extracting the activites column

#STEP 1 - Reading the training data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
colnames(X_train) <- features #Applying the feature column names to X_train (STEP 4)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
X_train$Activity <- y_train$V1 #Merging y_train onto X_train as 'Activity'
s_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train$Subject <- s_train$V1 #Merging s_train onto X_train as 'Subject'

#STEP - 1 Reading the test data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
colnames(X_test) <- features #Applying the feature column names to X_test (STEP 4)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
X_test$Activity <- y_test$V1 #Merging y_test onto X_test as 'Activity'
s_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test$Subject <- s_test$V1 #Merging s_test onto X_test as 'Subject'

#STEP 1 - Merging the training and test data sets
merged <- rbind(X_train, X_test)

#STEP 2 - Extracting mean and standard deviation measurements (keeping activity and subject)
columnNames <- colnames(merged) 
filteredColumns <- grep("std\\(\\)|mean\\(\\)|Activity|Subject",columnNames, value=TRUE)

filteredMerged <- merged[, filteredColumns]

#STEP 3 - Add descriptive labels column for the activity labels
filteredMerged$ActivityName <- factor(filteredMerged$Activity, labels=activities) #We got the activity labels at the start
filteredMerged$Activity <- NULL

#STEP 4 - Already completed during STEP 1!

#STEP 5
filteredMerged <- filteredMerged[, c(68, 67, 1:66)] #Reordering the columns so activityname/subject are first.
tidyDataset <- group_by(filteredMerged, ActivityName, Subject)
tidyDataset <- summarise_all(tidyDataset, list(mean))

#Write to text file
write.table(tidyDataset, "tidyDataset.txt", row.name=FALSE)