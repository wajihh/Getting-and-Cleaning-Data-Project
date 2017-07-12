---
title: "CodeBook"
output: 
pdf_document: 
toc: yes
---
## Getting and Cleaning Data Project Requirements

In this project the raw data collected from an experiment using Samsung Glaxie Smart phone was made avialble, to prepare tidy data that can be used for later analysis. The following are the required deliverables: 
1. a tidy data set as per given requirements 
2. a link to a Github repository with script for performing the analysi
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
4. a README.md in the repo with the scripts. This explains how all of the scripts work and how they are connected.

## Background

The motivation for the Project and further work is provided at this link:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data for the project was downloaded from the following link and stored in local directory named UCI HAR Dataset

##  The Dataset

Download the dataset into directory UCI HAR Dataset from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The files contained are:
1.  "activity_labels.txt"                         
2.  "features_info.txt"                           
3.  "features.txt"                                
4.  "README.txt"                                  
5.  "test/Inertial Signals/body_acc_x_test.txt"   
6.  "test/Inertial Signals/body_acc_y_test.txt"   
7.  "test/Inertial Signals/body_acc_z_test.txt"   
8.  "test/Inertial Signals/body_gyro_x_test.txt"  
9.  "test/Inertial Signals/body_gyro_y_test.txt"  
10  "test/Inertial Signals/body_gyro_z_test.txt"  
11. "test/Inertial Signals/total_acc_x_test.txt"  
12. "test/Inertial Signals/total_acc_y_test.txt"  
13. "test/Inertial Signals/total_acc_z_test.txt"  
14. "test/subject_test.txt"                       
15. "test/X_test.txt"                             
16. "test/y_test.txt"                             
17. "train/Inertial Signals/body_acc_x_train.txt" 
18. "train/Inertial Signals/body_acc_y_train.txt" 
19. "train/Inertial Signals/body_acc_z_train.txt" 
20. "train/Inertial Signals/body_gyro_x_train.txt"
21. "train/Inertial Signals/body_gyro_y_train.txt"
22. "train/Inertial Signals/body_gyro_z_train.txt"
23. "train/Inertial Signals/total_acc_x_train.txt"
24. "train/Inertial Signals/total_acc_y_train.txt"
25. "train/Inertial Signals/total_acc_z_train.txt"
26. "train/subject_train.txt"                     
27. "train/X_train.txt"                           
28. "train/y_train.txt"

## Useful Data For Project

README.txt provides the detailed information on the dataset. For the purposes of this project, the files in the Inertial Signals folders are not used. The files that will be used to load data are listed as follows:

*test/subject_test.txt
*test/X_test.txt
*test/y_test.txt
*train/subject_train.txt
*train/X_train.txt
*train/y_train.txt

The analysis of related files shows:

Values of Variable Activity consist of data from "Y_train.txt" and "Y_test.txt"
values of Variable Subject consist of data from "subject_train.txt" and subject_test.txt"
Values of Variables Features consist of data from "X_train.txt" and "X_test.txt"
Names of Varibles Features come from "features.txt"
Levels of Varible Activity come from "activity_labels.txt"
Activity, Subject and Features will be uesed as part of descriptive variable names for data in data frame.


## The R Script

R script called run_analysis.R has been written that does the following:

1. Reads the idividual data sets and Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names.
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### 1. Read Datasts and Merge the training and the test sets to create one data set.

After setting the source directory for the files, read into tables (using read.table function) the data located in
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt
The properties of each read object can be seen using str function. Then the data is merged using rbind function and column names are assigned to merged to data set.

### 2. Extract only the measurements on the mean and standard deviation for each measurement. 

Create a logical vector that contains TRUE values for the ID, mean and stdev columns and FALSE values for the others.

Subset this data to keep only the required columns.

### 3. Use Descriptive Activity names to name the activities in the data set
Merge data subset with the activityType table to include the descriptive activity names

### 4. Appropriately label the data set with descriptive activity names.

Read descriptive activity names from "activity_labels.txt".
Facorize Variable activity in the data frame Data using descriptive activity names.
The structure of Data Frame can be checked using Head function.
Here variables activity and subject and names of the activities have been labelled using descriptive names.Now Names of Feteatures will labelled using descriptive variable names making use of gsub function:
*Prefix t is replaced by time
*Acc is replaced by Accelerometer
*Gyro is replaced by Gyroscope
*Prefix f is replaced by frequency
*Mag is replaced by Magnitude
*BodyBody is replaced by Body

Check the aboveusing names function.

### 5. Create another, independent tidy data set with the average of each variable for each activity and each subject. 

As Per the project instructions, we need to produce only a data set with the average of each veriable for each activity and subject. Here plyr function alongwith aggregate function will be used.
The tidy Dataset is produced using write.table function for txt file and write.csv for csv file.The resulting files are created in the current working directory.



