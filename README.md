# Getting and Cleaning Data Course Project

## Course Project Task

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Implementation

A [GitHub repo](https://github.com/melentye/getdata-009-course-project) with neccessary data, scripts and results

## Dependencies

* reshape2
* plyr

## Running the Script

In order to run the analysis, execute the `run_analysis.R` script from your work directory where `UCI HAR Dataset` data directory resides. OR alternatively execute the script from within the `UCI HAR Dataset` directory, both ways should work fine.
The result file with tidy data is named `tidy_data.txt` will be put in the working directory where the script was started.

## Reading Tidy Data

```
data <- read.table("tidy_data.txt", header = TRUE)
View(data)
```

## Code Book

The code book is in the file `CodeBook.md`. It is heavily based on `features_info.txt` from raw data set and follows the guidelines from [this](https://class.coursera.org/getdata-009/forum/thread?thread_id=89) post.

## Notes

* The data is not downloaded from the URL but instead is persisted to the repo. Should be OK since it wasn't specified in the task.
* Measures of `meanFreq` and `gravityMean` features were filtered out because the task said to only keep `mean` and `std` features and for example for `fBodyAccJerk` there are `mean`, `std` and `meanFreq` features, meaning that `meanFreq` is something else. There's a post on this [here](https://class.coursera.org/getdata-009/forum/thread?thread_id=158). This decision is also supported by the content of `features_info.txt` file where set of variables is described.
* Steps 1-4 were not done in order, according to the comments in the [David's Project FAQ](https://class.coursera.org/getdata-009/forum/thread?thread_id=58) the order of the steps is not critical. The reason why the order is mixed up it the design of `readAndNameData` function - it handles one directory with data at once. Of course it would have been possible to do the steps in the order as they were listed but in this case there will be more data cleanup code duplication.
* It takes some time for the script to finish but the task didn't have any non-functional requirements for performance.