Getting and Cleaning Data - Course Project
==========================================

Included files
--------------

The repository includes the following files:

1. README.md: This file.
2. CodeBook.md: Describes the variables, data, and transformations carried out.
2. run_analysis.R: Script for performing the analysis.
4. TidyData.txt: The output tidy data set. 

Location of UCI HAR Data Set
------------------------
The script assumes that the "UCI HAR Dataset" folder is located in the working directory. 

Tidy Data Set
-------------

### Reading the saved text file

Use the following to load the data in R.

    loadedData <- read.table("TidyData.txt", header=TRUE)
    View(loadedData)

### Why data is tidy

This data set is tidy because:

1. Each column of the data set is a variable (the Activity, Subject ID, Variable, Observed average value). 
2. Each row of the data set is an observation of the average (arithmetic mean) value of of Activity/Subject/Variable. 
3. The data set represents is a single type of observational unit. 

run_analysis.R
--------------
Please refer to CodeBook.md for a description of what the script does. 
