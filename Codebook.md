# THE CODEBOOK 

This code book provides a descriptions of the variables, data, and transformations involved in cleaning up the data.  

##The Data Source

  *Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  *Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  
##Information about the Data Set
  *The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

  *The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

##The dataset includes the following files:

  * "README.txt"

  * "features_info.txt": This file rovides info about the variables used on the feature vector

  * "features.txt": Lists all features

  * "activity_labels.txt": Links class labels with activity name

  * In "train" folder:
      - "X_train.txt": Training set
  
      - "y_train.txt": Training labels
  *In "test" folder: 
  
      - "X_test.txt": Test set
  
      - "y_test.txt": Test labels 
  
##Files for the train and test data
  * In "train" folder:
      - "subject_train.txt": Each row identifies the subject who performed the activity for each window sample--has a range of 1-30

      - In "Inertial Signals" folder: 
          * "total_acc_x_train.txt": Acceleration signal from smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. NOTE: The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

          * "body_acc_x_train.txt": Body acceleration signal obtained by subtracting gravity from total acceleration

          * "body_gyro_x_train.txt": Angular velocity vector measured by gyroscope for each window sample (units = radians/second)

##Transformation details

  *This code essentially does 5 things in order to create a tidy data set: 
     -Merges the training and the test sets to create one data set
     -Extracts only the measurements on the mean and standard deviation for each measurement.
     -Uses descriptive activity names to name the activities in the data set
     -Appropriately labels the data set with descriptive activity names.
     -Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
     -How run_analysis.R implements the above steps:

  *In order to satisfy these requirements, run_analysis.R does all of the following: 
     -Loads required reshape2 and data.table libraries
     -Loads both test and train datasets
     -Loads the features and activity labels
     -Extracts the mean and standard deviation column names and data
     -Processes the train and test data
     -Merges the data set



