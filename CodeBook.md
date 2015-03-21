Getting and Cleaning Data Course Project CodeBook


This file describes the variables, the data, and changes conducted to clean up the data.  

Source:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
Data Source:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

* The run_analysis.R script performs the following steps to clean the data:   
 1. Read X_train.txt, y_train.txt and subject_train.txt from the "./UCI HAR Dataset/train" folder and store them as *training_x*, *training_y* and *training_subject* variables respectively.       
 2. Read X_test.txt, y_test.txt and subject_test.txt from the "./UCI HAR Dataset/test" folder and store them as *test_x*, *test_y* and *test_subject* variables respectively.  
 3. Merge the data of training_x with test_x; training_y with test_y; and training_subject with test_subject.
 4. Return the training and test.
 5. Read the feature.txt from the "./UCI HAR Dataset/train" folder. Get mean and standard deviation for the measurements. 
 6. Combine all data to create a tidy data set as *merge_x*, *merge_y* and *merge_subject*.
 7. Name activities with simple names and clean the column names of the subset.
 8. Combine the *merge_x*, *merge_y* and *merge_subject* by column to get a new cleaned 10299x68 data frame as *clean_data*.
 9. Merge the data sets together with a function.
 10. Write the *table* out to "UCI_HAR_tidy.txt" file in current working directory. 
