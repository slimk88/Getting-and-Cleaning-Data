## Code Book for the Course Project (Getting and Cleaning Data in Coursera)

### Information about the data

The raw data was obtained via this URL: *http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones*.

The URL used for this analysis is: *https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip*.

### The "run_analysis.R"" script performs the following steps to clean and tidy the raw data:

1. Assigns the URL of the project file to be used in further steps
2. Downloads the project file in the working directory using the assignment from above and saves the download date
3. Unzips the downloaded file into the current working directory
(OPTIONAL: Check the name of the unzipped file using list.files()/dir(), in this case the name is: "UCI HAR Dataset")
4. Reads the "subject_test.txt" file into a table (class = data.frame) and change the column name to "subject"
5. Reads the *"Y_test.txt"* file into a table (class = data.frame) and change the column name to "activity"
6. Reads each of the "x_test.txt" and "features.txt" files into tables (class = data.frame)
7. Changes the column name to the features names from the "features.txt" file
8. Merges, by column, *"subject_test"*, *'y_test"* and *"x_test"* into one single table (class = data.frame), and create a new column identifying the test set called "type"
9. Reads the *"subject_train.txt"* file into a table (class = data.frame) and change the column name to "subject"
10. Reads the *"Y_train.txt"* file into a table (class = data.frame) and change the column name to "activity"
11. Reads each of the *"x_train.txt"* and *"features.txt"* files into tables (class = data.frame)
12. Changes the column name to the features names from the "features.txt" file
13. Merges, by column, *"subject_test"*, *"y_test"* and *"x_test"* into one single table (class = data.frame), and create a new column identifying the train set called "type"
14. Merges, by row, *"train_set"* and *"test_set"* to obtain a large dataset
15. Extracts the columns/variables (mean, standard deviation for each measurement) needed for further analysis
16. Removes extra characters from the cloumn names of the dataset (parentheses and hyphens)
17. Replaces the activity numbers by their descriptive names
18. Groups the dataset by a first group (subjects) and a second group (activity) using the "dplyr" package
19. Summarises each variable and tidy the data using the "dplyr" package (getting the mean of each column, per subject and activity)
20. Writes the data into a txt file called "tidydataset.txt" (the dataset is extermely tidy when read via read.table)
NOTE: the data table in *"tidydataset.txt"* contains 180 observations of 88 variables
21. Because the dataset is "wide" the txt file does not look clean when opened as a txt file, a glimpse at the first 5 columns of the dataset can be seen when opening the *"glimsetidy.txt"* file

