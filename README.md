# Week4ProgrammingAssignment
Repository for Week 4 Programming Assignment for Getting and Cleaning Data Course on Coursera

This program reads and provides a tidy data set as well as a summary for the dataset. First the user must download and unzip the dataset from the link below:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A copy of this dataset is included in "UCI HAR Dataset" folder of this repository's main directory.

And then the code in run_analysis.R takes the downloaded dataset and performs the following tasks:

1- Reads the .txt data files from the downloaded dataset.

2- Renames the dataset's variable names using the list of features and their descriptions included in features.txt.

3- Creates descriptive activity names to represnt the name of the activity_id in the dataset.

4- Creates dataframes from the individual .txt files for the "Test" and "train" datasets.

5- Mergest the dataframes for "test" and "train" datasets.

6- A subset of the merged data containing only mean and standard deviation information for each parameter is created. This subset is the tidy dataset that is written as an output to a .csv file.

7- A summary table containing the mean of each variable for each activity and each subject is created. This summary table is also written as an output to a .csv file.

The output .csv files have also been included in this repostiory's main directory in the folder called "Output Files"

Please note: The maind_direct variable in run_analysis.R (Line 3 of code) needs to be set to the directory where the downloaded zip file is extracted to.
