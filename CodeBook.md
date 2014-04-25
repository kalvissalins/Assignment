Preconditions:
Data is downloaded and extracted in folder "UCI HAR Dataset" which is located in working directory.
Library "data.table" is installed.

Original data:
activity_labels.txt - contains activity labels (6 obs. of 2 variables)
features.txt - contains labels of collected data (561 obs. of 2 variables)
subject_train - contains data to which subject belongs observations  (7352 obs. of 1 variable)
X_train.txt - contains collected data for training set subjects (7352 obs. of 561 variables)
y_train.txt - contains data to which activity belongs observations ((7352 obs. of 2 variables)
subject_test - contains data to which subject belongs observations  (2947 obs. of 1 variable)
X_test.txt - contains collected data for testing set subjects (2947 obs. of 561 variables)
y_test.txt - contains data to which activity belongs observations ((2947 obs. of 2 variables)

Script run_analysis.R performs following operations:

1. Reads all train data sets into R.
2. Adds appropriate new variable "Activity" to "y_train" data set from "activity_labels" data set based on value of existing variable and removes previously existed variable.
3. Adds column to "y_train" with data about subjects from data set "subject_train" and renames variable to "Subject".
4. Renames colums in "x_train" data set from data set "features".
5. Repeats previous steps with test data sets.
6. Column binds data sets "X_train" and "y_train" into dataset "train".
7. Column binds data sets "X_test" and "y_test" into dataset "test".
8. Row binds data sets "train" and "test" in data set "run".
9. Creates numeric vector "features_needed_rows" containing row numbers of variables which contain mean and sd measurements in "features" data set.
10. Subsets data set "run" using vector "features_needed_rows" to select necessary columns and saves new data set as "run_small".
11. Loads library "data.table".
12. Converts data frame "run_small" to data table.
13. Subsets data table "run_small" by variables "Activity" and "Subject" and calculates means of all other variables. Saves resulting data table as "run_analysis".
12. Converts "run_analysis" to data frame.
13. Renames first two variables in "run_analysis" to "Subject" and "Activity".
14. Saves data frame "run_analysis" to file "run_analysis.csv" in working directory.

Script was developed and tested with R ver.3.0.2, operating system Windows 7.