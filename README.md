# Getting-CleaningData
###Course Project Repository for Coursera's Getting and Cleaning Data Course

The repository's purpose is to demonstrate the ability to import, clean and perform basic summarisation of raw data in R.
The exercise utilises raw data collected from accelerometers of the Samsung Galaxy S smartphone. 

A full description of the raw dataset is available here: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The raw dataset for the project can be obtained here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

As the goal of the exercise, the **run_analysis.R** script reads and transforms the downloaded raw dataset into a clean and tidy dataset. A detailed description of the script can be found below.

###The repository contains the following files: 

* **Codebook.md** - a codebook describing the variables in the tidy dataset generated by running the **run_analysis.R** script.
* **run_analysis.R** - an R script that transforms the raw data. The ouput file is a clean dataset, called **tidy dataset.txt** **Please note**: in order to run the script, the raw data set needs to be present in the working directory of R, in unzipped format.

###run_analysis.R
The script performs the following operations on the raw data.

1. Reads in the test and training datasets and combines them in a single dataset.
2. Changes the variable names into descriptive labels. 
3. Creates a subset of the dataset by extracting only the measurements on mean and standard deviation for each measurement.  
4. Changes activity types into descriptive labels.
5. Creates a tidy dataset that aggregates the average of the measure variables grouped by activity and subject.
6. Writes the tidy dataset into a text file called **tidy dataset.txt** in the working directory.

More details about the operations can be found in the comments in the code.




