## Ranxel Almario's submission for the 3rd assignment
## run_analysis.R script

## 0. Pre-processing
# Install/loads required package
if(!require(dplyr)){
        install.packages("dplyr")
        library(dplyr)
}

# Download, save and extract the source data to the working directory
sourceUrl <- 
        "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
sourceFile <- "UCI HAR Dataset.zip"
sourceFolder <- "UcI HAR Dataset"

if (!file.exists(sourceFolder)) {
        if (!file.exists(sourceFile)) {
                download.file(sourceUrl, sourceFile)
        }
        unzip(sourceFile)
        message("UCI HAR Dataset files unzipped...")
} else {
        message("UCI HAR Dataset files found...")
}

# Remove temp variables
rm(sourceUrl, sourceFile)

# Read and store train, test, label files into variables
subjectTest <- read.table(file.path(sourceFolder, "test", "subject_test.txt"))
xTest <- read.table(file.path(sourceFolder, "test", "X_test.txt"))
yTest <- read.table(file.path(sourceFolder, "test", "y_test.txt"))

subjectTrain <- read.table(file.path(sourceFolder, "train", 
                                     "subject_train.txt"))
xTrain <- read.table(file.path(sourceFolder, "train", "X_train.txt"))
yTrain <- read.table(file.path(sourceFolder, "train", "y_train.txt"))

activityLabels <- read.table(file.path(sourceFolder, "activity_labels.txt"))
features <- read.table(file.path(sourceFolder, "features.txt"), as.is = TRUE)
featureLabels <- features[, 2]

message("Read data files commands...")
        
## 1. Merging into 1 dataset
# Combined test-related and train-related dataset to one
testCombined <- cbind(subjectTest, xTest, yTest)
trainCombined <- cbind(subjectTrain, xTrain, yTrain)
harDataset <- rbind(testCombined, trainCombined)

# Assigned column names
names(harDataset) <- c("subject", featureLabels, "activity")

rm(sourceFolder, subjectTest, xTest, yTest, subjectTrain, xTrain, yTrain, 
   features, featureLabels, testCombined, trainCombined)

message("Merged into 1 harDataset data frame...")

## 2. Remove non-mean and SD measurements in each measure
harDataset <- harDataset[,grep("subject|mean\\(\\)|std\\(\\)|activity", 
                               colnames(harDataset))]

message("Subsetted harDataset with only mean and measurements measures...")

## 3. Assign proper descriptive activity names
harDataset$activity <- factor(harDataset$activity, 
                              levels = activityLabels[, 1], 
                              labels = activityLabels[, 2])

rm(activityLabels);

## 4. Assign proper descriptive labels
harDatasetColNames <- names(harDataset)
properLabels <- cbind(c("Body", "Gravity", "Acc", "Gyro", "Mag", "mean\\(\\)", 
                        "std\\(\\)", "X$", "Y$", "Z$", "^t", "^f", "bodybody"), 
                        c("body", "gravity", "acceleration", "gyroscope", 
                        "magnitude", "mean", "stddev", "x-axis", "y-axis", 
                        "z-axis", "time", "frequencydomainsignal", "body")
                )

#gsub loops to the pattern and replacement rules in the properLabel variable
for(i in seq_along(properLabels[, 1])) 
        harDatasetColNames <- gsub(properLabels[i, 1], properLabels[i, 2], 
                                   harDatasetColNames)
names(harDataset) <- tolower(harDatasetColNames)

rm(i, properLabels, harDatasetColNames)

message("Assigned proper variable names...")

## 5. Build and output the tidy data set from Step 4
# This requires dplyr package, averageing each variable for each act and sub
secondharDataset <-  group_by(harDataset, subject, activity)
secondharDataset <- summarize_all(secondharDataset, funs(mean))        

message("Exporting...")

# Export the dataset to hardatasetbygroupactivity.txt
write.table(secondharDataset, file = "har_data_by_group_activity.txt", 
            sep = ",", quote = FALSE, row.names = FALSE)

message("Exported har_data_by_group_activity.txt...")
message("You can access Step 4 (harDataset) and 5 (secondharDataset) vars...")
message("...End script")