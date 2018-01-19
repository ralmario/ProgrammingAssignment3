# Human Activity Recognition Using Smartphones Dataset (Getting and Cleaning Data Peer Assignment 3) Codebook
Original data files: [http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip)
Data cleaned and worked by: Ranxel Almario

## Dataset Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


## Variables:

The variables' source came from the accelerometer and gyroscope 3-axial raw signals (timeacceleration-xyz-axis and timegyroscope-xyz-axis). These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timebodyacceleration-xyz-axis and timegravityacceleration-xyz-axis) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timebodyacceleration-xyz-axis and timebodygyroscopejerk-xyz-axis). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (suffix 'magnitude' to denote magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals. (Note the 'frequencydomainsignal' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: '-xyz-axis' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 
* mean: Mean value
* stddev: Standard deviation

## Transformations:

The created R script (named run_analysis.R) uses the following files in the Human Activity Recognition dataset files:
1. **features_info.txt**: Shows information about the variables used on the feature vector.
2. **features.txt**: List of all features.
3. **activity_labels.txt**: Links the class labels with their activity name.
4. **train/X_train.txt**: Training set.
5. **train/y_train.txt**: Training labels.
6. **test/X_test.txt**: Test set.
7. **test/y_test.txt**: Test labels.

Using the above-mentioned files, this script does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, exports a second, comma-delimited, tidy dataset  with the average of each variable for each activity and each subject (named as "har\_data\_by\_group\_activity.txt")