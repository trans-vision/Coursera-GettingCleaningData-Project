library(dplyr)
library(tidyr)

setwd("~/Documents/GettingCleaningData/Project")

# Load test and train data
df_XTest <- read.table("./UCI HAR Dataset/test/X_test.txt", 
                       colClasses="numeric")
df_YTest <- read.table("./UCI HAR Dataset/test/y_test.txt", 
                       colClasses="numeric")
df_SubjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                             colClasses="numeric")
df_XTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", 
                        colClasses="numeric")
df_YTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", 
                        colClasses="numeric")
df_SubjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                              colClasses="numeric")

# Bind Subject, Activity and measurement data 
# then bind test and train data into one data set
dt_X <- tbl_df(rbind(cbind(df_SubjectTest, df_YTest, df_XTest), 
                     cbind(df_SubjectTrain, df_YTrain, df_XTrain)))

# Read the feature names and rename columns
char_Features <- make.unique(read.table("./UCI HAR Dataset/features.txt", 
                                        colClasses=c("integer", "character"))[,2])
colnames(dt_X) <- c("SubjectID", "ActivityCode", char_Features)

# Extracts mean and standard deviation related variables. 
dt_DataMessy <- select(dt_X, one_of("SubjectID", "ActivityCode"), 
                       contains("mean()"), contains("std()"))

# Uses descriptive activity names to name the activities in the data set
# Change ActivityCode to Factor and change factor levels
dt_DataMessy$ActivityCode <- as.factor(dt_DataMessy$ActivityCode)
levels(dt_DataMessy$ActivityCode) <- c("Walking", "Walking_Upstairs", 
                                       "Walking_Downstairs", "Sitting", 
                                       "Standing", "Laying")
# Rename ActivityCode column
colnames(dt_DataMessy)[colnames(dt_DataMessy)=="ActivityCode"] <- "ActivityName"


# Appropriately labels the data set with descriptive variable names. 
# Remove parentheses and use more descriptive name for leading "t" and "f"
colnames(dt_DataMessy) <- gsub("\\(\\)", "", colnames(dt_DataMessy))
colnames(dt_DataMessy) <- gsub("^t", "timeDomain-", colnames(dt_DataMessy))
colnames(dt_DataMessy) <- gsub("^f", "freqDomain-", colnames(dt_DataMessy))
colnames(dt_DataMessy) <- gsub("Acc", "Accelerometer", colnames(dt_DataMessy))
colnames(dt_DataMessy) <- gsub("Gyro", "Gyroscope", colnames(dt_DataMessy))


# From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
dt_dataTidy <- gather(dt_DataMessy, Variable, Value, -SubjectID, -ActivityName) %>% 
    group_by(ActivityName, SubjectID, Variable) %>%
    summarise(VariableAverage=mean(Value))

# Write output tidy data set
write.table(dt_dataTidy, file="TidyData.txt", row.names=FALSE)

