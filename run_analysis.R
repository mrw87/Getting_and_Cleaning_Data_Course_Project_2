#######Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library("data.table", lib.loc="/Library/Frameworks/R.framework/Versions/3.0/Resources/library")
library("reshape2", lib.loc="/Library/Frameworks/R.framework/Versions/3.0/Resources/library")

# Load activity labels and data column names
Activity_labels = read.table("./UCI HAR Dataset/Activity_labels.txt")[,2]
Features = read.table("./UCI HAR Dataset/features.txt")[,2]

# Extract only the measurements on the mean and standard deviation for each measurement
Extract_features = grepl("mean|std", Features)

# Load and process X_test & y_test data.
X_test = read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test = read.table("./UCI HAR Dataset/test/y_test.txt")
Subject_test = read.table("./UCI HAR Dataset/test/Subject_test.txt")

names(X_test) = Features

# Extract only the measurements on the mean and standard deviation for each measurement.
X_test = X_test[,Extract_features]

# Load activity labels
Y_test[,2] = Activity_labels[Y_test[,1]]
names(Y_test) = c("Activity_ID", "Activity_Label")
names(Subject_test) = "subject"

# Bind data
Test_data = cbind(as.data.table(Subject_test), Y_test, X_test)

# Load and process X_train & y_train data.
X_train = read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train = read.table("./UCI HAR Dataset/train/Y_train.txt")

Subject_train = read.table("./UCI HAR Dataset/train/subject_train.txt")

names(X_train) = features

# Extract only the measurements on the mean and standard deviation for each measurement
X_train = X_train[,extract_features]

# Load the activity data
Y_train[,2] = Activity_labels[Y_train[,1]]
names(Y_train) = c("Activity_ID", "Activity_Label")
names(Subject_train) = "subject"

# Bind the data
Train_data = cbind(as.data.table(Subject_train), Y_train, X_train)

# Merge the test and train data
Data = rbind(Test_data, Train_data)

ID_labels   = c("subject", "Activity_ID", "Activity_Label")
Data_labels = setdiff(colnames(Data), ID_labels)
Melt_data = melt(Data, id = ID_labels, measure.vars = Data_labels)

# Apply the mean function to the dataset (use dcast function)
Tidy_data = dcast(Melt_data, subject + Activity_Label ~ variable, mean)

write.table(Tidy_data, file = "./tidy_data.txt")
