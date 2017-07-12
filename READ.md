---
title: "README.md"
author: "Wajih"
date: "12 July 2017"
output:
  pdf_document:
    latex_engine: xelatex
    number_sections: yes
    toc: yes
  html_document: default
  word_document: default
---

This file explains how all of the scripts in run_analysis works and how they are connected

## Contents of Repo

* __CodeBook.md__: information about raw and tidy data set and elaboration made to
  transform them
* __README.md__: this file
* __run_analysis.R__: R script to transform raw data set in a tidy one

## Steps to get the tidy data set

1. clone this repository: git clone git@github.com/wajihh
2. Download UCI HAR Dataset  from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3. unzip raw data and copy the directory `UCI HAR Dataset` to the cloned repository root directory
4. open a R console and set the working directory to the repository root (use setwd())
5. source run_analisys.R script it requires the plyr package `source('run_analysis.R')`
6. The script has following subparts with comments annotated to explain the functions performed by script subparts:
*Downloads Directory is is present working directory named UCI HAR Dataset.
*Reads activity,subjects and features files using read.table function.
*Shows variaous variables in these files using str function.
*Merges the training and tests to create one dataset using rbind function.
*Assigns names to variables 'subjects' and 'activity'.
*Merges columns to get the data frame for all data using function cbind.
*Obtains features containg Mean and standard deviation using grep function.
*Substs the data by selected names of features uses as.character function.
*Assigns descriptive activity names.
*Factorizes variable activity in the data frame Data using descriptive activity names
using gsub function
*prefix t is replaced by time
*Acc is replaced by Accelerometer
*Gyro is replaced by Gyroscope
*prefix f is replaced by frequency
*Mag is replaced by Magnitude
*BodyBody is replaced by Body

## Result
### Prepares tidy data set and provides output giving average of each variable for each activity and each subject based on data in previous step. 

* use functions plyr,aggregate write.table and write.csv for getting result

* The repository root directory contains the file `tidydata.txt` with the tidy data.
* The same file in csv format'tidydata.csv' is also avilable


