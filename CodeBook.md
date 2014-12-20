Getting and Cleaning Data - Course Project Code Book
====================================================


Introduction
----
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The output tidy data is the average of each feature variable for each activity and each subject measured in the experiment.


Raw Data
----
The raw data comprised of the UCI HAR Data Set. Please refer to the Data Set documentation for details. An excerpt is provided below for convenience:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
    
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
    
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
    
> These signals were used to estimate variables of the feature vector for each pattern:  
    '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> tBodyAcc-XYZ, 
tGravityAcc-XYZ,
tBodyAccJerk-XYZ,
tBodyGyro-XYZ,
tBodyGyroJerk-XYZ,
tBodyAccMag,
tGravityAccMag,
tBodyAccJerkMag,
tBodyGyroMag,
tBodyGyroJerkMag,
fBodyAcc-XYZ,
fBodyAccJerk-XYZ,
fBodyGyro-XYZ,
fBodyAccMag,
fBodyAccJerkMag,
fBodyGyroMag,
fBodyGyroJerkMag,

> The set of variables that were estimated from these signals are: 

> mean(): Mean value,
> std(): Standard deviation
> ...

Transformations Applied
-------

Please see [course forum](https://class.coursera.org/getdata-016/forum/thread?thread_id=50#comment-333) for a diagram on the structure of the raw data files. 

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

Feature variables were renamed to be more descriptive by:

1. Removing parentheses 
2. Expanding leading "t" to "timeDomain"
3. Expanding leading "t" to "freqDomain"
4. Expanding "Acc" to "Acceleration"
5. Expanding "Gyro" to "Gyroscope"
6. Correcting erroneously repeated "Body" in variable name (see [course forum](https://class.coursera.org/getdata-016/forum/thread?thread_id=50#comment-333) for note on repetition). 

The data was melted and summarized to create a second, independent tidy data set with the average of each feature variable for each activity and each subject.

Variables
----

1. **ActivityName**: Describes the activity the subject was involved in. 
    1. Walking
    2. Walking_Upstairs
    3. Walking_Downstairs
    4. Sitting
    5. Standing
    6. Laying
2. **SubjectID**: Integer identifier of the subject. Its range is from 1 to 30.
3. **FeatureVariable**: Descriptive name of the derived feature variable from the original UCI HAR Data Set. The raw acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g' while raw gyroscope signal units are radians/second. Features variables are normalized and bounded within [-1,1]. Feature variables are named in the form Domain-Source-Measure-Direction, where:
    1. Domain: 
        * timeDomain: Time domain signal
        * freqDomain: Frequency domain signal
    2. Source: 
        * BodyAccelerometer: Acceleration of body
        * BodyAccelerometerMag: Magnitude of acceleration of body
        * BodyAccelerometerJerk: Acceleration of body jerk signal
        * BodyBodyAccelerometerJerkMag: Magnitude of acceleration of body jerk signal
        * GravityAccelerometer: Acceleration due to gravity
        * GravityAccelerometerJerk: Acceleration due to gravity jerk signal
        * BodyGyroscope: Angular velocity of body
        * BodyBodyGyroscopeMag: Magnitude of angular velocity of body
        * BodyGyroscopeJerk: Angular velocity of body jerk signal
        * BodyBodyGyroscopeJerkMag: Magnitude of angular velocity of body jerk signal
    3. Measure:
        * mean: Mean
        * std: Standard Deviation
    4. Direction (if any):
        * X: X-axis
        * Y: Y-axis
        * Z: Z-axis
4. **FeatureVariableAverage**: Arithmetic mean of the observations of the original HAR variable. 