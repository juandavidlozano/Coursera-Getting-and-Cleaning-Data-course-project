# 1. Merge the training set and the test set to create only one data set.

test.set <- read.table("test/X_test.txt")
test.labels <- read.table("test/y_test.txt")
test.subject <- read.table("test/subject_test.txt")

train.set <- read.table("train/X_train.txt")
train.labels <- read.table("train/y_train.txt")
train.subject <- read.table("train/subject_train.txt")

# 2. Merge the train and test data frames together

complete.set <- rbind(train.set, test.set) 
complete.labels <- rbind(train.labels, test.labels)
complete.subject <- rbind(train.subject, test.subject)

# 3. Extracts only the measurements on the mean and standard deviation for each measurement and merge the complete data frames to create the complete data table
features <- read.table("features.txt")
colnames(complete.set) <- c(as.character(features[,2]))
meanandstd.columns <- grep(".*mean.*|.*std.*", features[,2])
complete.set <- complete.set[,meanandstd.columns]
colnames(complete.subject) <- c("subject")
colnames(complete.labels) <- c("labels") 
complete.data <- cbind(complete.subject, complete.labels, complete.set)

# 4. Appropriately label the data set with descriptive variable names

activities <- read.table("activity_labels.txt")
colnames(activities) <- c("labels", "activity")
complete.data<- merge(complete.data, activities, by = "labels", all.x = TRUE)
complete.data <- complete.data[,!names(complete.data) %in% c("labels")]
names(complete.data )<-gsub("Acc", "Accelerometer", names(complete.data ))
names(complete.data )<-gsub("Gyro", "Gyroscope", names(complete.data ))
names(complete.data )<-gsub("BodyBody", "Body", names(complete.data ))
names(complete.data )<-gsub("Mag", "Magnitude", names(complete.data ))
names(complete.data )<-gsub("^t", "Time", names(complete.data ))
names(complete.data )<-gsub("^f", "Frequency", names(complete.data ))
names(complete.data )<-gsub("tBody", "TimeBody", names(complete.data ))
names(complete.data )<-gsub("-mean()", "Mean", names(complete.data ), ignore.case = TRUE)
names(complete.data )<-gsub("-std()", "STD", names(complete.data ), ignore.case = TRUE)
names(complete.data )<-gsub("-freq()", "Frequency", names(complete.data ), ignore.case = TRUE)
names(complete.data )<-gsub("angle", "Angle", names(complete.data ))
names(complete.data )<-gsub("gravity", "Gravity", names(complete.data ))


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
complete.data$subject <- as.factor(complete.data$subject)
tidyData <- aggregate(. ~subject + activity, complete.data, mean)
tidyData <- tidyData[order(tidyData$subject,tidyData$activity),]
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)