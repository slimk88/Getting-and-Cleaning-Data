# README file for the Course Project (Getting and Cleaning Data in Coursera)

### The dataset includes the following files:
=========================================

##### - 'README.md'

##### - 'run_analysis.R' : R script containing the steps to download, clean and tidy the raw data from the UCI HAR Dataset

##### - 'tidydataset.txt' : txt file containing the tidy dataset (can be read in R using read.table())

##### - 'glimsetidy.txt' : txt file containing the first 5 columns of the tidy dataset for visual purposes (because tidydataset.txt is wide)

##### - 'CodeBook.md' : Markdown file describing the steps of the analysis performed by the R script 'run_analysis.R'

### The following files are available from the UCI HAR Dataset. Their descriptions are copied from the 'README.txt' file found in the original UCI HAR Dataset folder
===============================================================================================================

##### - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

##### - 'features_info.txt': Shows information about the variables used on the feature vector.

##### - 'features.txt': List of all features.

##### - 'activity_labels.txt': Links the class labels with their activity name.

##### - 'train/X_train.txt': Training set.

##### - 'train/y_train.txt': Training labels.

##### - 'test/X_test.txt': Test set.

##### - 'test/y_test.txt': Test labels.

### General steps taken to clean and tidy the raw data
==================================================

##### Briefly, the 'run_analysis.R' script performs the following steps (copied from the Coursera Gettingand Cleaning Data course):

##### - Merges the training and the test sets to create one data set
##### - Extracts only the measurements on the mean and standard deviation for each measurement. 
##### - Uses descriptive activity names to name the activities in the data set
##### - Appropriately labels the data set with descriptive variable names. 
##### - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

