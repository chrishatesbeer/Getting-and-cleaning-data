# Download the file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")

#Unzip the file
unzip("data.zip")

#Read the variables in
subject_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt")
observations_test <- read.table("UCI HAR Dataset\\test\\X_test.txt")
activities_test <- read.table("UCI HAR Dataset\\test\\Y_test.txt")
subject_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
observations_train <- read.table("UCI HAR Dataset\\train\\X_train.txt")
activities_train <- read.table("UCI HAR Dataset\\train\\y_train.txt")
activity_labels <- read.table("UCI HAR Dataset\\activity_labels.txt")
features <- read.table("UCI HAR Dataset\\features.txt")
  
#Combine the test and train dataframes
subjects <- rbind(subject_test, subject_train)
observations <- rbind(observations_test, observations_train)
activities <- rbind(activities_test, activities_train)


#Merge the dataframes
subjects_activities<- cbind(subjects, activities)
combined <- cbind(subjects_activities, observations)

#Name the columns
features <- features[2]
features <- rbind(data.frame(V2="Subject"), data.frame(V2="Activity"), features)
colnames(combined) <- as.vector(features$V2)

#limit the columns to only the subject, activity, mean and standard devation columns
filter <- grep("mean\\(\\)|std\\(\\)",features$V2,value=TRUE)
filter <- union(c("Subject", "Activity"), filter)
combined<- subset(combined,select=filter)

#clean up the column names to make them more "tidy"
names(combined)<-gsub("std\\(\\)", "StandardDevation", names(combined))
names(combined)<-gsub("mean\\(\\)", "Mean", names(combined))
names(combined)<-gsub("^t", "Time", names(combined))
names(combined)<-gsub("^f", "Frequency", names(combined))
names(combined)<-gsub("Acc", "Accelerometer", names(combined))
names(combined)<-gsub("Gyro", "Gyroscope", names(combined))
names(combined)<-gsub("Mag", "Magnitude", names(combined))
names(combined)<-gsub("BodyBody", "Body", names(combined))

#Add the activity labels
library(dplyr)
colnames(activity_labels) = c("Activity", "ActivityLabel")
combined <- inner_join(combined, activity_labels, by="Activity")
combined <- subset(combined,select=-c(Activity))


#Remove Activity column and move the ActivityLabel to the front, just because 
library(plyr)
combined <- combined %>% select(Subject, ActivityLabel, everything())
names(combined)[names(combined) == "ActivityLabel"] <- "Activity"

#Finally sort the data frame
combined <- combined[order(combined[,1], combined[, 2]),]

#Create the idependent tidy data set with the average of each variable for each activity and each subject
#library(data.table)
combined_averages <- combined %>% 
  group_by(Subject, Activity) %>% 
  summarise_each(funs(mean))

#output the tables
write.table(combined, "TidyData.txt",row.names=FALSE)
write.table(combined_averages, "TidyAverages.txt",row.names=FALSE)

#Let the users know that it has all finished
print("Finished processing, there are two output files created:")
print("TidyData.txt with contains the tidy dataset, and")
print("TidyAverages.txt with contains the e average of each variable for each activity and each subject")
