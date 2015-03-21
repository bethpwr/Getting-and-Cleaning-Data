Getting and Cleaning Data: Course Project


About the data
------------------

Origin of the data:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
Data Source:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

About the script and the tidy dataset
-------------------------------------
A script called run_analysis.R will merge the test and training sets.

The UCI HAR Dataset is be available in a directory called "UCI HAR Dataset"

After merging testing and training, labels are added and only columns that have to do with mean and standard deviation are kept.

The script will also create a tidy data set containing the means of all the columns per test subject and per activity.
This tidy dataset will be written to a tab-delimited file called UCI_HAR_tidy.txt.

About the Code Book
-------------------
The CodeBook.md explains the changes performed and the resulting data.

