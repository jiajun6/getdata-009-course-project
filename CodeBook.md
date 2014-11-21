# Raw Data

Codebook for raw data can be found in `UCI HAR Dataset/features_info.txt` file and will not be copy-pasted here. Inertial folders have been excluded from the Samsung dataset and irrelevant.

# Processed Data

The resulting data is an aggregation based on the subset of the raw data. The logical processing steps are:
1. Merge train and test raw data sets
2. Extract only mean() and std() measurements out of all variables from raw dataset
3. Rename the variables to improve readability
4. Produce a tidy dataset with below characteristics

The implementation of the above steps is available in this repository as `run_analysis.R`

## Variable Renaming

* According to `features_info.txt` the t-prefix was expanded to time, f-prefix was expanded to freq.
* Acc became Accelerometer
* Gyro became Gyroscope
* Redundant special characters were removed so the variables are safe to use in R code

## Data Tidiness

There's a [discussion](https://class.coursera.org/getdata-009/forum/thread?thread_id=58) in the forum about whether wide or narrow data is the tidy-est and the way I understand it, both ways are fine. The resulting dataset produced by the `run_analysis.R` script has measures for two "kinds" of variables: times and frequencies, however we were asked to come up with a single tidy data file.

## Aggregation

Mean of each mean() and std() measurement from the raw data was calculated for each subject + activity pair. Therefore form now on we consider subject and activity ID variables and the rest of the columns in the dataset - measures.

## ID Variables

* `subject` - the ID of the subject who took part in the original experiment, factor of values from 1 to 30
* `activity` - human-readable label of the activity, factor with levels: LAYING, SITTING, STANDING, WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS

## Measures

Each measure is a mean of all measures with the same name from the raw data calculated for the ID variables.

```
 [3] "timeBodyAccelerometer.mean.X"          "timeBodyAccelerometer.mean.Y"         
 [5] "timeBodyAccelerometer.mean.Z"          "timeBodyAccelerometer.std.X"          
 [7] "timeBodyAccelerometer.std.Y"           "timeBodyAccelerometer.std.Z"          
 [9] "timeGravityAccelerometer.mean.X"       "timeGravityAccelerometer.mean.Y"      
[11] "timeGravityAccelerometer.mean.Z"       "timeGravityAccelerometer.std.X"       
[13] "timeGravityAccelerometer.std.Y"        "timeGravityAccelerometer.std.Z"       
[15] "timeBodyAccelerometerJerk.mean.X"      "timeBodyAccelerometerJerk.mean.Y"     
[17] "timeBodyAccelerometerJerk.mean.Z"      "timeBodyAccelerometerJerk.std.X"      
[19] "timeBodyAccelerometerJerk.std.Y"       "timeBodyAccelerometerJerk.std.Z"      
[21] "timeBodyGyroscope.mean.X"              "timeBodyGyroscope.mean.Y"             
[23] "timeBodyGyroscope.mean.Z"              "timeBodyGyroscope.std.X"              
[25] "timeBodyGyroscope.std.Y"               "timeBodyGyroscope.std.Z"              
[27] "timeBodyGyroscopeJerk.mean.X"          "timeBodyGyroscopeJerk.mean.Y"         
[29] "timeBodyGyroscopeJerk.mean.Z"          "timeBodyGyroscopeJerk.std.X"          
[31] "timeBodyGyroscopeJerk.std.Y"           "timeBodyGyroscopeJerk.std.Z"          
[33] "timeBodyAccelerometerMag.mean"         "timeBodyAccelerometerMag.std"         
[35] "timeGravityAccelerometerMag.mean"      "timeGravityAccelerometerMag.std"      
[37] "timeBodyAccelerometerJerkMag.mean"     "timeBodyAccelerometerJerkMag.std"     
[39] "timeBodyGyroscopeMag.mean"             "timeBodyGyroscopeMag.std"             
[41] "timeBodyGyroscopeJerkMag.mean"         "timeBodyGyroscopeJerkMag.std"         
[43] "freqBodyAccelerometer.mean.X"          "freqBodyAccelerometer.mean.Y"         
[45] "freqBodyAccelerometer.mean.Z"          "freqBodyAccelerometer.std.X"          
[47] "freqBodyAccelerometer.std.Y"           "freqBodyAccelerometer.std.Z"          
[49] "freqBodyAccelerometerJerk.mean.X"      "freqBodyAccelerometerJerk.mean.Y"     
[51] "freqBodyAccelerometerJerk.mean.Z"      "freqBodyAccelerometerJerk.std.X"      
[53] "freqBodyAccelerometerJerk.std.Y"       "freqBodyAccelerometerJerk.std.Z"      
[55] "freqBodyGyroscope.mean.X"              "freqBodyGyroscope.mean.Y"             
[57] "freqBodyGyroscope.mean.Z"              "freqBodyGyroscope.std.X"              
[59] "freqBodyGyroscope.std.Y"               "freqBodyGyroscope.std.Z"              
[61] "freqBodyAccelerometerMag.mean"         "freqBodyAccelerometerMag.std"         
[63] "freqBodyBodyAccelerometerJerkMag.mean" "freqBodyBodyAccelerometerJerkMag.std" 
[65] "freqBodyBodyGyroscopeMag.mean"         "freqBodyBodyGyroscopeMag.std"         
[67] "freqBodyBodyGyroscopeJerkMag.mean"     "freqBodyBodyGyroscopeJerkMag.std"    

```

