## Variable Names

* According to `features_info.txt` the t-prefix was expanded to time, f-prefix was expanded to freq.
* Acc became Accelerometer
* Gyro became Gyroscope
* Redundant special characters were removed so the variables are safe to use in R code

## Running the Script

In order to run the analysis, execute the `run_analysis.R` script from your work directory where `UCI HAR Dataset` data directory resides. OR alternatively execute the script from within the `UCI HAR Dataset` directory, both ways should work fine.

## Notes

* Measures of `meanFreq` and `gravityMean` features were filtered out because the task said to only keep `mean` and `std` features and for example for `fBodyAccJerk` there are `mean`, `std` and `meanFreq` features, meaning that `meanFreq` is something else. There's a post on this [here](https://class.coursera.org/getdata-009/forum/thread?thread_id=158). This decision is also supported by the content of `features_info.txt` file where set of variables is described.
* Steps 1-4 were not done in order, according to the comments in the [David's Project FAQ](https://class.coursera.org/getdata-009/forum/thread?thread_id=58) the order of the steps is not critical. The reason why the order is mixed up it the design of `readAndNameData` function - it handles one directory with data at once. Of course it would have been possible to do the steps in the order as they were listed but in this case there will be more data cleanup code duplication.
* It takes some time for the script to finish but the task didn't have any non-functional requirements for performance.