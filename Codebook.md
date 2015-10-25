# Codebook for Getting and Cleaning Data Course Project

## Input Data
The details of the data that is being loaded for the project can be found in the `README.txt` as part of the `getdata-projectfiles-UCI HAR Dataset.zip` file. 

**NOTE:** Everything in the R script is commented in the code as well.

<p>
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.</br> 
</p></br>
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.</br> 
</p></br>
<p>
###For each record it is provided:</br>
======================================
</br>
<ul>
<li>Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.</li>
<li>Triaxial Angular velocity from the gyroscope.</li> 
<li>A 561-feature vector with time and frequency domain variables.</li>
<li>Its activity label.</li> 
<li>An identifier of the subject who carried out the experiment.</li>
</ul></br>
</p></br>
<p>
###The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

####Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

## R Libraries Used

- data.table
- dplyr
- reshape2

## Part 1 Steps

* First we check if the folder name where the files will be extracted from are in the working directory.
* Then we load the the labels for the features and activities from `features.txt` and `activity_labels.txt`. We will use them to name the columns of the loaded data.
* After that we load the test and train data from /train and /test directories (the description of the files are above).
* Then we assign the columns names to the datasets saved in venctors above. 
* I aslo create a column to store the data source by create a column DataSource and will bind a static value of "train" and "test" to it to keep history where the data came from
* Then I bind the columns of the test and train sets indepenedntly after which the train and test datasets' rows are bounded together to create a single combined dataset into a `dataPart1` object.

## Part 2 Steps

We use the grepl function to get a logical vector for columns that have "mean" or "std" in their names and store it in `featuresToKeep`.

We then subset the `dataPart1` to include only the columns that align to the logical vector above `featureToKeep`. We store the new dataset in `dataPart2` object.

## Part 3 Steps

We leverage the activity_labels_table created in Step 1. We name the columns for the table so that when we perform the join the column names are available for the join function to perform the join and to have a name for the column as it is joined to the `dataPart2` dataset. We perform a `left_join` function to bring in the descriptive activity labels and add them as another column "ActivityName" to `dataPart2`. The new dataset is saved in `dataPart3` object.

## Part 4 Steps

None were required as we ensured we named the columns in the steps above. The definition of the columns are provided in the files provided with the data set plus "SubjectID", "ActivityID", "ActivityName", and "DataSource" columns we have explicitely named during the exercise.

## Part 5 Steps

We will created a melted data set first. To do that we define the id_columns and value_columns. We then `melt` the data to meltedData and then apply `dcast` function to perform the aggregated analysis on the required columns and variables. The function splits the results back to columns as well. 

We save the results to `dataPart5` object and also export as a txt file.

## Wrap Up

We clean up the envornment to keep only the object we want to expose. During debugging this can be commented out to see all the objects that were created and used. 
