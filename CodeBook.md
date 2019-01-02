## Code Book

This code book describes the data used in this project, as well as the processing required to create the resulting tidy data set.
Overview

30 volunteers performed 6 different activities while wearing a smartphone. The smartphone captured various data about their movements.

### The source data
* features.txt: Names of the 561 features calculated based on the smartphone data.
* activity_labels.txt: Names and IDs for each of the 6 activities.
* X_train.txt: Train set with 7352 observations of the 561 features.
* subject_train.txt: Subject ID of the volunteer related to each of the observations in X_train.txt.
* y_train.txt: Activity performed related to each of the observations in X_train.txt.
* X_test.txt: Test set with 2947 observations of the 561 features.
* subject_test.txt: Subject ID of the volunteer related to each of the observations in X_test.txt.
* y_test.txt: Activity performed related to each of the observations in X_test.txt.
More information about the files is available in README.txt. More information about the features is available in features_info.txt.

### Clean up work performed

* Train set, test set, labels and features were read into data frames.
* Data sets were labeled appropriately with descriptive variable names.
* Subject ID and activity were added to each data set (descriptive activity name was used).
* The training and test sets were combined into a single data set.
* Feature columns other than subject and activity that did not contain the exact string "mean()" or "std()" were removed. 
* The subject and activity columns were converted to factor.
* A tidy data set was created containing the mean of each feature for each subject and each activity. 
* The tidy data set was output to a txt file (tidy_Data.txt).
