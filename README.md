# Coursera-Getting-and-Cleaning-Data-course-project

Coursera Getting and Cleaning Data course project
One of the most exciting areas in all of data science right now is wearable computing - see for example this article. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.

This repository contains the following files:

* README.md, this file, which provides an overview of the data set and how it was created.
* tidy_data.txt, contains the data final set.
* CodeBook.md, the code book, which describes the contents of the data set (data, variables and transformations used to generate the data).
* run_analysis.R, the R script that was used to create the data set


# Creating the data set
The R script run_analysis.R can be used to create the data set. It retrieves the source data set and transforms it to produce the final data set by implementing the following steps (see the Code book for details, as well as the comments in the script itself):


* Read data.
* Merge the training set and the test set to create only one data set.
* Merge the train and test data frames together
* Extracts only the measurements on the mean and standard deviation for each measurement and merge the complete data frames to create the * * complete data table
* Appropriately label the data set with descriptive variable names
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
* Write the data set to the tidy_data.txt file.
