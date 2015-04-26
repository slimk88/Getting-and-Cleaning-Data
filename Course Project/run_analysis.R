## 1) Assign the URL of the project file to be used in further steps
project_file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## 2) Download the project file in the working directory using the assignment from above and save the download date
download.file(project_file, destfile = "./projectfile1", method = "curl")
downloadDate <- date()

## 3) Unzip the downloaded file into the working directory
unzip("projectfile1") ## OPTIONAL: Check the name of the unzipped file using list.files()/dir() 
## in this case the name is: "UCI HAR Dataset"

## 4) Read "subject_test.txt" file into a table (class = data.frame) and change the column name to "subject"
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(subject_test) = "subject"

## 5) Read "Y_test.txt" into a table (class = data.frame) and change the column name to "activity"
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
colnames(y_test) = "activity"

## 6) Read "x_test.txt" and "features.txt" into a table (class = data.frame)
## &) Change the column name to the features names from the "features.txt" file
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
colnames(x_test) = features$V2

## 8) Merge, by column, subject_test, y_test and x_test into one single table (class = data.frame)
## and create a new column identifying the test set called "type"
test_set <- cbind(subject_test, y_test, x_test)
test_set$type = "test"

## 9) Read "subject_train.txt" file into a table (class = data.frame) and change the column name to "subject"
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(subject_train) = "subject"

## 10) Read "Y_train.txt" into a table (class = data.frame) and change the column name to "activity"
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
colnames(y_train) = "activity"

## 11) Read "x_train.txt" and "features.txt" into a table (class = data.frame)
## 12) Change the column name to the features names from the "features.txt" file
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
colnames(x_train) = features$V2

## 13) Merge, by column, subject_test, y_test and x_test into one single table (class = data.frame)
## and create a new column identifying the train set called "type"
train_set <- cbind(subject_train, y_train, x_train)
train_set$type = "train"

## 14) Merge, by row, train_set and test_set to obtain a large dataset
merged_data <- rbind(train_set,test_set)

## 15) Extract columns/variables (mean, standard deviation for each measurement) needed for further analysis
meanstd_cols <- c(grep("subject", names(merged_data)), grep("activity", names(merged_data)),
                  grep("type", names(merged_data)), grep("[Mm]ean", names(merged_data)), 
                  grep("[Ss]td", names(merged_data)))
merged_meanstd_data <- merged_data[, meanstd_cols]

## 16) Removing extra characters from the cloumn names of the dataset
colnames(merged_meanstd_data) <- gsub("\\(", "", names(merged_meanstd_data))
colnames(merged_meanstd_data) <- gsub("\\)", "", names(merged_meanstd_data))
colnames(merged_meanstd_data) <- gsub("-", "", names(merged_meanstd_data))

## 17) Replace activity code by descriptive name
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
merged_meanstd_data$activity <- factor(merged_meanstd_data$activity, levels = activity_labels$V1,
                                       labels = activity_labels$V2)

## 18) Group the dataset by a group (subjects) first and a second group (activity) using the "dplyr" package
library(dplyr)
by_subject <- group_by(merged_meanstd_data, subject)
by_activity <- group_by(by_subject, activity, add = TRUE)


## 19) Summarise each variable and tidy the data using the "dplyr" package
tidy_dataset <- summarise_each(by_activity, funs(mean), -type)

## 20) Write the data into a txt file (the dataset is extermely tidy when read via read.table)
write.table(tidy_dataset, file = "./tidydataset.txt", row.name = FALSE)

## 21) Because my dataset is "wide" the txt file does not look clean when opened as a txt file
## here is a glimpse at the first 5 columns of the dataset 
glipmse_tidy <- tidy_dataset[, 1:5]
write.table(glipmse_tidy, file = "./glimpsetidy.txt", sep = "   ", row.name = FALSE)

