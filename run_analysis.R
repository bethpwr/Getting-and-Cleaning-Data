
install.packages("plyr")
install.packages("data.table")
library(plyr)
library(data.table)
setwd("C:/Users/ictm/Desktop/")

merge.datasets = function() {
  "Merge training and test"
  # Read data
  training_x <- read.table("UCI HAR Dataset/train/X_train.txt")
  training_y <- read.table("UCI HAR Dataset/train/y_train.txt")
  training_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
  test_x <- read.table("UCI HAR Dataset/test/X_test.txt")
  test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
  test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
  
  # Merge data
  merge_x <- rbind(training_x, test_x)
  merge_y <- rbind(training_y, test_y)
  merge_subject <- rbind(training_subject, test_subject)
  
  # Merge and return training and test 
  list(x=merge_x, y=merge_y, subject=merge_subject)
}

extract_mean_std = function(df) {
  # Given the dataset (x values), extract only the measurements on the mean
  # and standard deviation for each measurement.
  
  
  # Read the feature list file
  features <- read.table("UCI HAR Dataset/features.txt")
  
  # Find the mean and standard deviation columns
  mean_col <- sapply(features[,2], function(x) grepl("mean()", x, fixed=T))
  std_col <- sapply(features[,2], function(x) grepl("std()", x, fixed=T))
  
  # Extract them from the data
  edf <- df[, (mean_col | std_col)]
  colnames(edf) <- features[(mean_col | std_col), 2]
  edf
}

name_activities = function(df) {
  # Name the activities in the data set
  colnames(df) <- "activity"
  df$activity[df$activity == 1] = "WALKING"
  df$activity[df$activity == 2] = "WALKING_UPSTAIRS"
  df$activity[df$activity == 3] = "WALKING_DOWNSTAIRS"
  df$activity[df$activity == 4] = "SITTING"
  df$activity[df$activity == 5] = "STANDING"
  df$activity[df$activity == 6] = "LAYING"
  df
}

bind.data <- function(x, y, subjects) {
  
  # Combine mean-std values (x), activities (y) and subjects into one data
  # frame.
  cbind(x, y, subjects)
}

create_tidy_dataset = function(df) {
  # Given X values, y values and subjects, create an independent tidy dataset
  # with the average of each variable for each activity and each subject.
  tidy <- ddply(df, .(subject, activity), function(x) colMeans(x[,1:60]))
  tidy
}

clean_data = function() {
  # merge training and test datasets. merge_datasets function returns a list
  # of three dataframes: X, y, and subject
  
  merge <- merge.datasets()
  # Extract only the measurements of the mean and standard deviation for each
  # measurement
  cx <- extract_mean_std(merge$x)
  # Name activities
  cy <- name_activities(merge$y)
  # Use descriptive column name for subjects
  colnames(merge$subject) <- c("subject")
  # Combine data frames into one
  combined <- bind.data(cx, cy, merge$subject)
  # Create tidy dataset
  tidy <- create_tidy_dataset(combined)
  # Write tidy dataset as csv
  write.table(tidy, "UCI_HAR_tidy.txt",row.name=FALSE)
}   

clean_data()
