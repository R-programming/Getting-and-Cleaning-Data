### Getting-and-Cleaning-Data
###   Course Project Scripts Note
  The script basically followed the task lists of the course project requirements. 
  
  In order for the run_analysis.R to execute correlctly, the user need to extract the downloaded .zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into user's working directory.
  
  Then executing the run_analysis.R will generate the independent tidy data set with the average of each variable for each activity and each subject required in step 5.
  
  There have been comments in the codes and it is pretty self-explanatory. Here the further explanation will be provided to outline the logic/assumptions behind the code:
  
  1. Step One "Merges the training and the test sets to create one data set"
      It is assumed that the test/training sets are deemed have one-to-one correspondance amongst "X", "y" and "subject" data     sets respectively. Hence, after reading the three files of each type (training/test) into the data frames, cbind() will         merge the files into a single data set "tidy" (line 15). 
      rbind() will concatenate the training and test data sets into the one data set.
      Caveat: a. It will be helpful down the road to read the "y" and "subject" data set as factor, by colClasses = "factor"              in the read.table() function, plus it will help to expedite the code execution.
              b. Order consistency between training/test data sets is critical while using cbind(). 

  2. Step Two "Extracts only the measurements on the mean and standard deviation for each measurement."
      Acquire the feature names into a data frame. Then retrieve the actual name column (line 20). grep() function is used to       identify the indices of the variable names that contains "mean()" and "std()" (line 22,23). Subset the mean and              standard deviation columns. Here since the first two column are subject and activity. The indices should shift by two        to subset the correct variable column from the merged data set (line 25).

  3. Step Three "Uses descriptive activity names to name the activities in the data set"
      Activity column data type is factor and by renaming the factor levels it is easy to complete this task (line 29). This       easy operation benefits from Step One read.table() argument setting.

  4. Step Four "Appropriately labels the data set with descriptive variable names"
      Change column names with colnames() function.

  5. Step Five "From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."
      There are multiple ways to do this besides the aggregate() fucntion adopted here: dplyr or plyr functions or
      split-apply-combine.

