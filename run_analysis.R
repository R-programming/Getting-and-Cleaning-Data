# Assume that the downloaded zip file is extracted to the working directory
# Step 1: Merges the training and the test sets to create one data set.
  url<-"getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/"
  #---Merges the test sets---
  xTest<-read.table(file=paste(url, "test/X_test.txt",sep="",collapse="/"), header=F, colClasses="numeric")
  yTest<-read.table(file=paste(url, "test/y_test.txt",sep="",collapse="/"), header=F, colClasses="factor")
  subTest<-read.table(file=paste(url, "test/subject_test.txt",sep="",collapse="/"), header=F, colClasses="factor")
  Test<-cbind(subTest, yTest, xTest)
  #---Merges the training sets---
  xTrain<-read.table(file=paste(url, "train/X_train.txt",sep="",collapse="/"), header=F, colClasses="numeric")
  yTrain<-read.table(file=paste(url, "train/y_train.txt",sep="",collapse="/"), header=F, colClasses="factor")
  subTrain<-read.table(file=paste(url, "train/subject_train.txt",sep="",collapse="/"), header=F, colClasses="factor")
  Train<-cbind(subTrain, yTrain, xTrain)
  #---Merge the training and the test sets---
  tidy<-rbind(Test, Train)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
  #---Acquire the feature names---
  feature<-read.table(file=paste(url, "features.txt",sep="",collapse="/"),header=F)
  feature.name<-as.character(feature[,2])
  #---Acquire the indices whose names contains "mean()" or "std()"
  feature.to.find<-paste(c("mean\\(\\)", "std\\(\\)"), collapse = "|")
  index<-grep(feature.to.find, feature.name, value=F)
  #---Retain only the subject, activity and mean/std columns from the merged data set in Step 1
  tidy<-tidy[,c(1, 2, index+2)]

# Step 3: Uses descriptive activity names to name the activities in the data set  
  #---Change the activity factor (column index = 2) to descriptive terms ---
  levels(tidy[,2])<-c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

# Step 4: Appropriately labels the data set with descriptive variable names.
  #---Assign column names for subject/activity column, adopting original feature name for feature column---
  colnames(tidy)<-c("Subject","Activity", feature.name[index])

# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  #---Average all variables per Subject/Activity groups---
  result<-aggregate(.~ Subject + Activity, tidy, mean)
  #---Ouput result into "Result.txt" file-----
  write.table(result,file="Result.txt", row.name=F, sep=",")
