
# Getting and Cleaning Data Code Book
This is the course project for Getting and Cleaning Data.

## Data Source
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

```
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
```

Here are the data for the project:
```
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
```

## Data Variables
`x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.

`x_train` - `./data/UCI HAR Dataset/train/X_train.txt`
`y_train` - `./data/UCI HAR Dataset/train/y_train.txt`
`subject_train` - `./data/UCI HAR Dataset/train/subject_train.txt`

`x_test` - `./data/UCI HAR Dataset/test/X_test.txt`
`y_test` -  `./data/UCI HAR Dataset/test/y_test.txt`
`subject_test` -  `./data/UCI HAR Dataset/test/subject_test.txt`


`activityLabels` contains a description of each of the activity types

`activityLabels` - `./data/UCI HAR Dataset/activity_labels.txt`


`features` contains the correct names for the `x_data` dataset, which are applied to the column names stored

`features` - `./data/UCI HAR Dataset/features.txt`

## Data Transformation
1) Column names from `features` were applied to the `x_test` and `x_train` data sets
2) `y_test` and `y_train` data sets were given the column name `activityId`
3) `subject_test` and `subject_train` data sets were given the column name `subjectId`
4) `x_train`, `y_train` and `subject_train` had `cbind` applied, resulting in `mrg_train`.
5) `x_test`, `y_test` and `subject_test` had `cbind` applied, resulting in `mrg_test`.
6) `mrg_train` and `mrg_test` had `rbind` applied, resulting in `allData`. This was a complete data set with all data sets labeled and merged.
7) Create a `setForMeanAndStd` subset from `allData` by filtering on column names that contain `activityId`, `subjectId`, `mean()` or `std()`.
8) Merged `setForMeanAndStd` and `activityLabels` to create `setWithActivityNames`. This is a subset with activity names included.
9) Order and output `tidy_data_set.txt`.



