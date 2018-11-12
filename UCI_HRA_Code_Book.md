# UCI_HRA_Tidy Code Book 
number of observations: 180
number of variables: 88

# ActivityName
Activity performed by the subject (6 values): LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

# Subject
Subject who performed the activity
Individual identified by a number: 1:30

# Measurements variables
86 measurements variables giving average of the values the mean and std measures of the for each (ActivityName, Subject)

TBodyAccMeanX
TBodyAccMeanY
TBodyAccMeanZ
TBodyAccStdX
TBodyAccStdY
TBodyAccStdZ
TGravityAccMeanX
TGravityAccMeanY
TGravityAccMeanZ
TGravityAccStdX
TGravityAccStdY
TGravityAccStdZ
TBodyAccJerkMeanX
TBodyAccJerkMeanY
TBodyAccJerkMeanZ
TBodyAccJerkStdX
TBodyAccJerkStdY
TBodyAccJerkStdZ
TBodyGyroMeanX
TBodyGyroMeanY
TBodyGyroMeanZ
TBodyGyroStdX
TBodyGyroStdY
TBodyGyroStdZ
TBodyGyroJerkMeanX
TBodyGyroJerkMeanY
TBodyGyroJerkMeanZ
TBodyGyroJerkStdX
TBodyGyroJerkStdY
TBodyGyroJerkStdZ
TBodyAccMagMean
TBodyAccMagStd
TGravityAccMagMean
TGravityAccMagStd
TBodyAccJerkMagMean
TBodyAccJerkMagStd
TBodyGyroMagMean
TBodyGyroMagStd
TBodyGyroJerkMagMean
TBodyGyroJerkMagStd
FBodyAccMeanX
FBodyAccMeanY
FBodyAccMeanZ
FBodyAccStdX
FBodyAccStdY
FBodyAccStdZ
FBodyAccMeanFreqX
FBodyAccMeanFreqY
FBodyAccMeanFreqZ
FBodyAccJerkMeanX
FBodyAccJerkMeanY
FBodyAccJerkMeanZ
FBodyAccJerkStdX
FBodyAccJerkStdY
FBodyAccJerkStdZ
FBodyAccJerkMeanFreqX
FBodyAccJerkMeanFreqY
FBodyAccJerkMeanFreqZ
FBodyGyroMeanX
FBodyGyroMeanY
FBodyGyroMeanZ
FBodyGyroStdX
FBodyGyroStdY
FBodyGyroStdZ
FBodyGyroMeanFreqX
FBodyGyroMeanFreqY
FBodyGyroMeanFreqZ
FBodyAccMagMean
FBodyAccMagStd
FBodyAccMagMeanFreq
FBodyBodyAccJerkMagMean
FBodyBodyAccJerkMagStd
FBodyBodyAccJerkMagMeanFreq
FBodyBodyGyroMagMean
FBodyBodyGyroMagStd
FBodyBodyGyroMagMeanFreq
FBodyBodyGyroJerkMagMean
FBodyBodyGyroJerkMagStd
FBodyBodyGyroJerkMagMeanFreq
AngleTBodyAccMeanGravity
AngleTBodyAccJerkMeanGravityMean
AngleTBodyGyroMeanGravityMean
AngleTBodyGyroJerkMeanGravityMean
AngleXGravityMean
AngleYGravityMean
AngleZGravityMean

# Source of data
- Data were obtain by running the script Run_Analysis.R
- Data collected from the accelerometers from the Samsung Galaxy S smartphone: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
