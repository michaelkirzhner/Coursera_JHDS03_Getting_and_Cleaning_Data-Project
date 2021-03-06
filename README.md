# Getting and Cleaning Data #

This repository is to store the R scripts for the Course Project for John Hopkins Data Science - Getting and Cleaning Data course. The course is part of Data Science.

# Course Project Description #

## Purpose ##
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

## Background on Analyzed Data ##
One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Assigned Activity ##

Project activity is broken into 5 goals and is described below. The description of how the goals were accomplished are detailed in the [Codebook.md](https://github.com/michaelkirzhner/Getting_and_Cleaning_Data/blob/master/Codebook.md). Code can be found at [run_analysis.R](https://github.com/michaelkirzhner/Getting_and_Cleaning_Data/blob/master/run_analysis.R).

You should create one R script called run_analysis.R that does the following. 
<ol>
  <li>Merges the training and the test sets to create one data set.</li>
  <li>Extracts only the measurements on the mean and standard deviation for each measurement.</li>
  <li>Uses descriptive activity names to name the activities in the data set.</li>
  <li>Appropriately labels the data set with descriptive variable names.</li> 
  <li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
</ol>
