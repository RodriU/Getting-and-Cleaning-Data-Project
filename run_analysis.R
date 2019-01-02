run_analysis <- function() {
    
    library(reshape2)
    ## load train set
    subject_train<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
    X_train<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
    y_train<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
    
    ## load test set
    subject_test<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
    X_test<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
    y_test<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
    
    ## load labels and features
    activity_labels<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
    features<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
    
    ## STEP 4: Appropriately labels the data set with descriptive variable names. 
    colnames(X_test)<-features$V2
    colnames(X_train)<-features$V2
    
    ## Add Subject
    X_test$subject<-subject_test[,1]
    X_train$subject<-subject_train[,1]
    

    ## STEP 3: Uses descriptive activity names to name the activities in the data set
    X_test$activity<-y_test[,1]
    X_train$activity<-y_train[,1]
    for (i in 1:6){
        X_test$activity<-sub(activity_labels[i,1],activity_labels[i,2],X_test$activity)
        X_train$activity<-sub(activity_labels[i,1],activity_labels[i,2],X_train$activity)
    }

    
    ## STEP 1: Merges the training and the test sets to create one data set (X_Data)
    X_Data<-rbind(X_test,X_train)
    
    ## STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement
    temp<-grep("mean\\(\\)|std\\(\\)",features$V2)
    X_Data<-X_Data[,c(562,563,temp)]
    X_Data$subject<-factor(X_Data$subject)
    X_Data$activity<-factor(X_Data$activity)
    
    
    ## STEP 5: creates a tidy data set with the average of each variable for each activity and each subject.
    melted<-melt(X_Data,id=c("subject","activity"))
    tidy_Data<-dcast(melted,subject+activity~variable,mean)
    
    ## write CSV file
    write.csv(tidy_Data, "tidy_Data.csv", row.names=FALSE)
    write.table(tidy_Data,"tidy_Data.txt",row.name=FALSE)
    }