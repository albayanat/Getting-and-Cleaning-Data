
## Run_Analysis.R
cat("Start script")
## Check if required packages are installed, else install them
if(!"purrr" %in% rownames(installed.packages())) {install.packages("purrr")}
if(!"dplyr" %in% rownames(installed.packages())) {install.packages("dplyr")}

## Load required libraries
library(purrr)
library(dplyr)

## Download and unzip data into the working directory
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI HAR Dataset.zip")
unzip("UCI HAR Dataset.zip")

## Read files from main directory
df_activities <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
df_measurements_variables <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

## Read test data

        ## Build the list of file paths for the testing set
paths_test<-dir("./UCI HAR Dataset/test", pattern=".txt$", full.names = TRUE)
names(paths_test) <- basename(paths_test)

        ##Read each txt file in the test directory and load into the list ldata_test
ldata_test<-map(paths_test, read.table, stringsAsFactors = FALSE)
        ## The result is a list of 3 data elements:
        ## subject_test.txt gives the subject of the observations
        ## X_test.txt gives the measurements of the observations
        ## y_test.text gives the activity of the observations

        ## Reshape test set to build the test dataframe
        ## 1st variable "Subject" is obtained from the 1st element of the list
        ## 2nd variable "Population" is set to "test" for all the observations. This could be useful after merging the testing and training datasets
        ## 3rd variable "ACtivityCode" is obtained from the 3rd element of the list
        ## Others variables are the measurements data and obtained from the 2nd element of the list
df_test<-cbind(Subject = ldata_test$subject_test.txt$V1, Population = "test", ActivityCode = ldata_test$y_test.txt$V1, ldata_test$X_test.txt)
rm(ldata_test) #large object can be removed

## Read training data

## Build the list of file paths for the training set
paths_train<-dir("./UCI HAR Dataset/train", pattern=".txt$", full.names = TRUE)
names(paths_train) <- basename(paths_train)

##Read each txt file in the test directory and load into the list ldata_test
ldata_train<-map(paths_train, read.table, stringsAsFactors = FALSE)
## The result is a list of 3 data elements:
## subject_test.txt gives the subject of the observations
## X_test.txt gives the measurements of the observations
## y_test.text gives the activity of the observations

## Reshape training set to build the training dataframe
## 1st variable "Subject" is obtained from the 1st element of the list
## 2nd variable "Population" is set to "train" for all the observations. This could be useful after merging the testing and training datasets
## 3rd variable "ACtivityCode" is obtained from the 3rd element of the list
## Others variables are the measurements data and obtained from the 2nd element of the list
df_train<-cbind(Subject = ldata_train$subject_train.txt$V1, Population = "train", 
                ActivityCode = ldata_train$y_train.txt$V1, ldata_train$X_train.txt)
rm(ldata_train) #large object can be removed

## Step 1 - Merge the training and test sets to create one data set.
df_allmeasures <- rbind(df_train, df_test)
rm(df_train, df_test) # large objects can be removed
        ## Rename the measures varaibles using the values from df_measurements_variables
names(df_allmeasures)[-(1:3)] <- df_measurements_variables$V2

## Step 2 - Extractes only the measurements on the mean and standard deviation for each measurement.
df_mean_std_measures <- df_allmeasures[grep("Subject|ActivityCode|Population|[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]", names(df_allmeasures))]

## Step 3 - Use descriptive activity names to name the activities in the data set
        ## Add one variable "ActivityName", result of looking up the ActitivyCode againts df_activities
df_mean_std_measures$ActivityName <- df_activities$V2[df_mean_std_measures$ActivityCode]
        ## Re-arrange the variables to keep all the measurements to the right. ActivityCode can be dropped as it is a redundant information with ActivityName
df_mean_std_measures <- df_mean_std_measures [,c(1,2,90,4:89)] 

## Step 4 - Appropriately label the data set with descriptive variable names.
mean_std_measures_names <- names(df_mean_std_measures)[4:89]
        ## Replace "," with "_" in the variable names
        ## The call to the function make.name with parameter unique = TRUE ensure the names are unique and syntactically valid
mean_std_measures_names <- make.names(gsub(",","-", mean_std_measures_names), unique =TRUE)
        ## use camel-casing on the variable names to ease the reading and interpretation of the variables
        ## function camel-casing
camel<-function(x){
        capit<-function(x) paste0(toupper(substring(x,1,1)), substring(x,2, nchar(x)))
        sapply(strsplit(x, "\\."), function(x) paste(capit(x), collapse=""))
}
names(df_mean_std_measures)[4:89] <- camel(mean_std_measures_names)

## Step 5 - From the data set in setp 4, create a second, independent tidy dataset with the average of each variable for each activity and each subject.
df_average <- df_mean_std_measures %>% 
        group_by(ActivityName, Subject) %>% ## Group by Activity and Subject
        summarise_at(.funs = mean, .vars = 4:89) ## Compute the average of each variable 4:89 for each group (ACtivity, Subjet)

## Write tidy data set into txt
write.table (df_average, file = "UCI_HRA_Tidy.txt", row.name = FALSE)

cat("End of script")
