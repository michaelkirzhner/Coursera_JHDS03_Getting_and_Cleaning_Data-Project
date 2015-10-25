## To do the project below libraries were enabled
library(data.table)
library(dplyr)
library(reshape2)

## Part 1: Merge the training and the test sets to create one data set

# This part of the script loads the required data sets into R objects
# The script assumes that you have downloaded and unzipped the "getdata-projectfiles-UCI HAR dataset.zip"
# file in the working directory. 

# Set a variable to store the folder name for where the data will be
folderName <- "UCI HAR Dataset" 

# Check if the directory exists before we proceed loading the files
if(!dir.exists(folderName)){
  stop("Please ensure the required files are extracted in working directory!")
}

# Below code loads the data into objects first before the merging will occur

# Load labels for the columns for the X tables
featureLabels_table <- read.table(paste(".",folderName, "features.txt", sep = "/"))
featureLabels <- as.vector(featureLabels_table[,2], mode = "character")
activityLabels_table <- read.table(paste(".",folderName, "activity_labels.txt", sep = "/"))
activityLabels <- as.vector(activityLabels_table[,2], mode = "character")

# Loading test data first, please, look at the README.md file for explanation of the files
subject_test_data <- read.table(paste(".",folderName, "test", "subject_test.txt", sep = "/"))
X_test_data <- read.table(paste(".",folderName, "test", "X_test.txt", sep = "/"))
y_test_data <- read.table(paste(".",folderName, "test", "y_test.txt", sep = "/"))

# Loading train data next
subject_train_data <- read.table(paste(".",folderName, "train", "subject_train.txt", sep = "/"))
X_train_data <- read.table(paste(".",folderName, "train", "X_train.txt", sep = "/"))
y_train_data <- read.table(paste(".",folderName, "train", "y_train.txt", sep = "/"))

# Assign column names to X data
colnames(subject_test_data) <- "SubjectID"
colnames(subject_train_data) <- "SubjectID"
colnames(X_test_data) <- featureLabels
colnames(X_train_data) <- featureLabels
colnames(y_test_data) <- "ActivityID"
colnames(y_train_data) <- "ActivityID"

# Creating a list to store a static value of the so that the source of the data can be retained during merging
testColumn <- list(c(rep("test", nrow(X_test_data))))
trainColumn <- list(c(rep("train", nrow(X_train_data))))
names(testColumn) <- "DataSource"
names(trainColumn) <- "DataSource"


# Merge columns of the test and training data set from various files in the each folder. Leaving the X data
# in front for the next steps where we will apply subsetting to the columns
testCombined   <-   cbind(X_test_data, testColumn, subject_test_data, y_test_data)
trainCombined  <-   cbind(X_train_data, trainColumn, subject_train_data, y_train_data)

# Merge the rows test and train data set 
dataPart1 <- rbind(testCombined, trainCombined)

## Part 1: COMPLETE

## Part 2: Extract onle the measurements on the mean and standard deviation for each measurement

# Measurements are already stored in the columns and the task is to keep the needed columns

# Create a logical vector for features that are Mean or Std, this vector will be used to subset the X data tables
featuresToKeep <- grepl("mean|std", featureLabels)

# Subset the consolidated data set for the needed columns
dataPart2 <- dataPart1[,featuresToKeep]

## Part 2: COMPLETE

## Part 3: Use descriptive activity names to name the activites in the data set

# Name the columns of the Activity_Labels_Table 
# NOTE: I am naming first column ActivityID to match the combined data set above and allow for the join 
names(activityLabels_table) <- c("ActivityID", "ActivityName")

# Next we leverage the updated activityLabels_table to load descriptive names of the activities 
# in the conslodiated data.
# NOTE: I am using the left_join function as it allows to preserve the order of the columns and rows while
# doing the join / merge
dataPart3 <- left_join(dataPart2, activityLabels_table, by = "ActivityID")

## Part 3: COMPLETE

## Part 4: Appropriately label the data set with descriptive variable names

# To make it easier I was doing that as I was coding the tables and data sets above. This is already completed.
# NOTE: The columns that did not have names such as subject, activity, and activity name, I have added the names
# before I have binded the columns. All the columns in the data set have the appropirate names.
# NOTE: The columns for the features were named based on the names provided in the features.txt files

## Part 4: COMPLETE

## Part 5: From the data set in step 4, create a second, independent tidy data set with the average of each 
##         variable and each subject.

# NOTE: dplyr library is used to do these tasks

# First I created vectors for id and value columns
id_columns <- c("SubjectID", "ActivityID", "ActivityName")
value_columns <- setdiff(colnames(dataPart3), c(id_columns, "DataSource"))

# Use melt formula to prepare data for analysis
# NOTE: This creates a data set that has a row per variable
meltedData <- melt(dataPart3, id = id_columns, measure.vars = value_columns)

# Use dcast formula to perform the analysis
# NOTE: This puts the observations per record back into one record as desired with variables as columns
dataPart5 <- dcast(meltedData, SubjectID + ActivityID + ActivityName ~ variable, mean)
write.table(dataPart5, file = "./AnalysisData_feature_averages_Final.txt", row.names = FALSE)

## Part 5: COMPLETE

## Clearing environment of unwanted objects
remove(
    activityLabels, activityLabels_table, 
    featuresToKeep, featureLabels, featureLabels_table,  
    meltedData,
    subject_train_data, subject_test_data,
    testCombined, trainCombined,
    X_train_data, X_test_data,
    y_train_data, y_test_data,
    folderName, id_columns, value_columns, testColumn, trainColumn
    )



