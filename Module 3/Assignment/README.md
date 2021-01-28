# Getting and Cleaning Data Project

`run_analysis.R` does the following:

1. Sets the directory.
2. Extracts the features and activites and reads the training/test data.
3. Applies the column names based on the features and merges the subject/activity data with the training/test data.
4. Merges the training and test data into one dataset called `merged`.
5. Extracts the mean and std measurements, while keeping activity and subject ID.
6. Adds descriptive labels for the activity feature.
7. Re orders the columns to put activity name and subject ID first.
8. Groups the data by subject and activity name.
9. Creates a tidy dataset that takes the mean value of each variable, based on the subject and activity pairing.
