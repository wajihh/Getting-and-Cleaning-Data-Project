# Downloaded Directory is is present working directory named UCI HAR Dataset
# Get the list of files
path_rf <- file.path("~/UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)
files
#See the README.txt file for the detailed information on the dataset. For the purposes of this project, 
#the files in the Inertial Signals folders are not used. The files that will be used to load data are:
#test/subject_test.txt#test/X_test.txt#test/y_test.txt#train/subject_train.txt
#train/X_train.txt#train/y_train.txt
# Read the Activity Files 
dataActivityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)
# Read the Subject Files
dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)
# Read Feature Files
dataFeaturesTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)
## Look at properties of above variables
str(dataActivityTest)
str(dataActivityTrain)
str(dataSubjectTrain)
str(dataSubjectTest)
str(dataFeaturesTest)
str(dataFeaturesTrain)
# Merge the training and tests to create one dataset
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)
#Set names to variables
names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2
#merge columns to get the data frame for all data
dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)
## OBTAIN FEATURES CONTAINING MEAN AND STANDARD DEVIATION MEASUREMENTS
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
# Subst the data by selected names of features
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)
# Check the structure of data frame Data
str(Data)
## ASSIGN DESCRIPTIVE ACTIVITY NAMES TO NAMES ACTIVITIES
#  Read descriptive activity names from file activity_labels.txt
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)
# Factorize variablie activity in the data frame Data using descriptive
# activity names
head(Data$activity,30)
##APPRPERIATELY LABEL DATA WITH DESCRIPTIVE VARIABLE NAMES
#in the former part, variables activity and subject and names of the activities 
#have been labelled using descriptive names.In this part, Names of Feteatures will labelled using descriptive variable names.
#prefix t is replaced by time
#Acc is replaced by Accelerometer
#Gyro is replaced by Gyroscope
#prefix f is replaced by frequency
#Mag is replaced by Magnitude
#BodyBody is replaced by Body
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(data)
# PREPARE TIDY DATA SET AND PROVIDE OUTPUT SHOWING THE AVERAGE OF EACH
# VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT BASED ON DATASET IN STEP 4
library(plyr)
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)
tidydata <- write.csv(Data2,file="tidydata.csv")
## MAKE CODEBOOK
library(knitr)
knit2html("codebook.Rmd")
# Refrence:https://rstudio-pubs-static.s3.amazonaws.com/37290_8e5a126a3a044b95881ae8df530da583.html