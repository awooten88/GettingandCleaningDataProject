library(dplyr)

### Get and load data
# download data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","UCIHARZip.zip")
unzip("UCIHARZip.zip")
# create data tables
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt",col.names = c("num","activity.name"))
features<-read.table("UCI HAR Dataset/features.txt",col.names = c("num","feature"))
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt",col.names = "Subject")
x_test<-read.table("UCI HAR Dataset/test/X_test.txt",col.names = features$feature)
y_test<-read.table("UCI HAR Dataset/test/y_test.txt",col.names = "label")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt",col.names = "Subject")
x_train<-read.table("UCI HAR Dataset/train/X_train.txt",col.names = features$feature)
y_train<-read.table("UCI HAR Dataset/train/y_train.txt",col.names = "label")

### 1. Merge the training and the test sets to create one data set.
combined_x<-rbind(x_train,x_test)
combined_y<-rbind(y_train,y_test)
combined_subject<-rbind(subject_train,subject_test)

merged_data<-cbind(combined_subject,combined_y,combined_x)

### 2. Extract only the measurements on the mean and standard deviation for each measurement.
cleaned_data<-merged_data %>% select(Subject,label,contains("mean"),contains("std"))

### 3. Use descriptive activity names to name the activities in the data set.
for (i in 1:6) {
  cleaned_data$label[cleaned_data$label==i]<-as.character(activity_labels[i,2])
}
cleaned_data$label<-as.factor(cleaned_data$label)

### 4. Appropriately labels the data set with descriptive variable names.
names(cleaned_data)[2]<-"Activity"
names(cleaned_data)<-gsub("^t","Time",names(cleaned_data))
names(cleaned_data)<-gsub("Acc","Accelerometer",names(cleaned_data))
names(cleaned_data)<-gsub("Gyro","Gyroscope",names(cleaned_data))
names(cleaned_data)<-gsub("Mag","Magnitude",names(cleaned_data))
names(cleaned_data)<-gsub("Freq","Frequency",names(cleaned_data))
names(cleaned_data)<-gsub("^f","Frequency",names(cleaned_data))
names(cleaned_data)<-gsub("tBody","TimeBody",names(cleaned_data))
names(cleaned_data)<-gsub("gravity","Gravity",names(cleaned_data))
names(cleaned_data)<-gsub("angle","Angle",names(cleaned_data))
names(cleaned_data)<-gsub("BodyBody","Body",names(cleaned_data))
names(cleaned_data)<-gsub("mean","Mean",names(cleaned_data))
names(cleaned_data)<-gsub("std","STD",names(cleaned_data))

### 5. Create an independent tidy data set with the average of each variable for each activity and each subject.
summary_data<-cleaned_data %>% group_by(Activity,Subject) %>% summarize_all(mean)

# write data to txt file
write.table(summary_data, "Summary_Data.txt", row.name = FALSE)