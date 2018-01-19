# Peer-graded Assignment 3: Getting and Cleaning Data Course Project
This project is the work of __Ranxel Almario__.

## Files:
1. **CodeBook.md**: describes the variables, the data, and any transformations or work that you performed to clean up the data
2. **README.md**: explains the analysis files
3. **har\_data\_by\_group\_activity.txt**: comma-delimted, tidy dataset that run\_analysis.R   outputs
4. **run\_analysis.R**: R script that does the following:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. Merges the training and the test sets to create one data set.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. Extracts only the measurements on the mean and standard deviation for each measurement.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. Uses descriptive activity names to name the activities in the data set
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. Appropriately labels the data set with descriptive variable names.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	


## How to run:
1. Just download **run\_analysis.R** and put it in your R current working directory.
2. Execute "source("run\_analysis.R")" (without quotes).

_Note: run\_analysis.R script is created and run in R version 3.4.2 (Windows x64). Tested in R version 3.4.3 (Windows x64)._