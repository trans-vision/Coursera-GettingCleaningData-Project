Getting and Cleaning Data - Course Project Code Book
====================================================


Introduction
----
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.


Raw Data
----
The raw data comprised of the UCI HAR Data Set. Please refer to the Data Set documentation for details. 


Transformations Applied
-------

All the following raw data was loaded as numeric values:

1. Training set (X, Y, and Subject files)
2. Test set (X, Y, and Subject files)

The Subject, Y, and X data for each set of data were column-bound together before row-binding the resulting two tables.

The two columns of feature data was loaded as integer and character data respectively. The names were made unique as there were duplicate names in the raw data (though the columns with duplicate names were eventually discarded). The column names were applied to the data set. 

Means and Standard Deviation related columns were selected. These columns were identified based on their having "means()" or "std()" in their names. Columns with names like "meanFreq()" were not selected as they were weighted averages of frequency components and not arithmetic means. 

The Activity codes were converted into factors and the 6 factor levels renamed to be descriptive:

1. Walking
2. Walking_Upstairs
3. Walking_Downstairs
4. Sitting
5. Standing
6. Laying

Variables were renamed to be more descriptive by:

1. Removing parentheses 
2. Expanding leading "t" to "timeDomain"
3. Expanding leading "t" to "freqDomain"
4. Expanding "Acc" to "Acceleration"
5. Expanding "Gyro" to "Gyroscope"

The data was melted and summarized to create a second, independent tidy data set with the average of each variable for each activity and each subject.

Variables
----

1. ActivityName: Describes the activity the subject was involved in. 
    1. Walking
    2. Walking_Upstairs
    3. Walking_Downstairs
    4. Sitting
    5. Standing
    6. Laying
2. SubjectID: Integer identifier of the subject.
3. Variable: Descriptive name of the derived variable from the original UCI HAR Data Set.
4. VariableAverage: Arithmetic mean of the observations of the original HAR variable. 