### Getting-and-Cleaning-Data
###   Course Project Scripts Note
  The script basically followed the task lists of the course project requirements. 
  
  In order for the run_analysis.R to execute correlctly, the user need to extract the downloaded .zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into user's working directory.
  
  Then executing the run_analysis.R will generate the independent tidy data set with the average of each variable for each activity and each subject required in step 5.
  
  There have been comments in the codes and it is pretty self-explanatory. Here the further explanation will be provided to outline the logic/assumptions behind the code:
  
  1. Step One "Merges the training and the test sets to create one data set"
      It is assumed that the test/training sets are deemed have one-to-one correspondance amongst "X", "y" and "subject" data     sets respectively. Hence, after reading the three files of each type (training/test) into the data frames, cbind() will         merge the files into a holistic data set. 
      rbind() will concatenate the training and test data sets into the one data set.
      Caveat: a. It will be helpful down the road to read the "y" and "subject" data set as factor, by colClasses = "factor" in               the read.table() function, plus it will help to expedite the code execution.
              b. Order consistency between training/test data sets is critical while using cbind(). 

  2. 

