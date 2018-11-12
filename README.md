# Run_Analysis.R
1. Download and unzip data into the working directory
2. Load the details of the activities (activity_labels.txt) and measurements variables (features.txt)
3. Load and reshape test and training data sets using the files X_%%%%.txt, y_%%%%.txt, subject_%%%%.txt from test and train directories
4. Merge training and test data sets
5. Label the measurements variables in the dataset using the data from features.txt
6. Subset the data set to variables related to mean and std 
7. Match the observations to its corresponding activity label using the data from activity_labels.txt
8. Name the measurements variable with syntactically valid names and using camel-casing
9. Compute the average of each measures for each group (activity, subject)
10. Export the tidy data into the file UCI_HRA_Tidy.txt saved into the working directory

# To run the script
1. Download and save the script Run_Analysis.R into your working directory
2. Run the script Run_Analysis.R using the command source('Run_Analysis.R")
The script will load the data into your working directory and perform all the processing to tidy the data set
The tidy data set will be output into your working directory with the filename UCI_HRA_Tidy.txt
