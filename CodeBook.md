Source Data Code Book:

The features selected for the original database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

run_analysis Modifications:

1. Merges the training and the test sets to create one data set.
    merged_data is created using rbind to combine test data below training data.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
    cleaned_data is created as a subset of merged_data wit the subject, activity and all columns with names containing "mean" or "std."
3. Uses descriptive activity names to name the activities in the data set.
    The column "label" of cleaned_data containing activity codes is replaced by the corresponding activity names from activity_labels.
4. Appropriately labels the data set with descriptive variable names.
    cleaned_data column names updated:
      "label" to "Activity"
      column names begining with "t" to begin with "Time"
      "Acc" in column names replaced with "Accelerometer"
      "Gyro" in column names replaced with "Gyroscope"
      "Mag" in column names replaced with "Magnitude"
      "Freq" in column names replaced with "Frequency"
      column names begining with "f" to begin with "Frequency"
      "tBody" in column names replaced with "TimeBody"
      "gravity" in column names replaced with "Gravity"
      "angle" in column names replaced with "Angle"
      "BodyBody" in column names replaced with "Body"
      "mean" in column names replaced with "Mean"
      "std" in column names replaced with "STD"
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
   summary_data is created by grouping cleaned_data by "Activity" and "Subject" and taking the mean.  summary_data is outputed by       creating summary_data.txt
