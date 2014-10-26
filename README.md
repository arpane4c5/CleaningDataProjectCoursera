CleaningDataProjectCoursera
===========================

# Instructions
1. Download the UCI HAR Dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Extract the data to the working directory.
3. Rename the folder from "UCI HAR Dataset" to "UCIDataset".
4. Load the run_analysis.R file using source() command.
5. Call analyseSets(). This will read the required data files and create a "cleanData.txt" file in your working directory.

# Cleaning Procedure
The script takes the training and testing datasets, extracts the values corresponding to the mean and standard deviation values, adds columns for activity names and subject_ID and finally stores the cleaned data in a "cleanData.txt" file. 