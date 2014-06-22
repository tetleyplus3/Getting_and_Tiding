run_analysis <- function()

## Read the activity levels, which describes what activity the subject doing
## the experiment was performing at the time of the recording
## The activities are coded according to the following chart
## 1 WALKING
## 2 WALKING_UPSTAIRS
## 3 WALKING_DOWNSTAIRS
## 4 SITTING
## 5 STANDING
## 6 LAYING
activity_labels <- read.table("./activity_labels.txt")
## Reaname column names to more informative names
colnames(activity_labels) <- c("ID","Activity")


## Read y_train, which contains the activities from each record, and
## create a factor from the values of y_train & the codes from activity_labels
y_train <- read.table('./train/y_train.txt')
colnames(y_train) <- "ID"

## Re-coding 'y_train' into 'activity', 
## according to the codes taken from 'activity_labels'
activity <- as.character(activity_labels$Activity[y_train$ID])

## Now, read 'subject_train.txt' to get the subject number from each record
subject_train <- read.table('./train/subject_train.txt')
colnames(subject_train) <- "subject_id"

## Then, read the training data set, which contains treated data
x_train <- read.table('./train/X_train.txt')

## Read the column names of x_train, contained in 'features.txt'
features <- read.table("./features.txt")
## Rename column names of features firts
colnames(features) <- c("ID","ColumnName")

## Rename the column names of x_train
colnames(x_train) <- as.character(features$ColumnName)

## Create a character vector to indicate this data are "training"
training_label <- rep("TRAINING",nrow(x_train))

## Join all data into a sensible data.frame
training_label <- as.data.frame(training_label)
colnames(training_label) <- "stage"
activity <- as.data.frame(activity)
training <- data.frame(subject_train, training_label, activity, x_train) 


## Repeat the process for the test data
## Read y_test, which contains the activities from each record, and
## create a factor from the values of y_test & the codes from activity_labels
y_test <- read.table('./test/y_test.txt')
colnames(y_test) <- "ID"

## Re-coding 'y_test' into 'activity', 
## according to the codes taken from 'activity_labels'
activity <- as.character(activity_labels$Activity[y_test$ID])

## Now, read 'subject_train.txt' to get the subject number from each record
subject_test <- read.table('./test/subject_test.txt')
colnames(subject_test) <- "subject_id"

## Then, read the training data set, which contains treated data
x_test <- read.table('./test/X_test.txt')

## Read the column names of x_train, contained in 'features.txt'
features <- read.table("./features.txt")
## Rename column names of features firts
colnames(features) <- c("ID","ColumnName")

## Rename the column names of x_train
colnames(x_test) <- as.character(features$ColumnName)

## Create a character vector to indicate this data are "training"
testing_label <- rep("TESTING",nrow(x_test))

## Join all data into a sensible data.frame
testing_label <- as.data.frame(testing_label)
colnames(testing_label) <- "stage"
activity <- as.data.frame(activity)
testing <- data.frame(subject_test, testing_label, activity, x_test) 


## Now that we have both data ready we proceed to join them
## so we have all data in a single data base
all_data <- rbind(training, testing)
colnames(all_data) <- colnames(training)


######################################################
## Extracting the mean and standard deviations
## for each measurent

columnnames <- names(all_data)
## First find the columns where means are stored
mean_indices <- grep("mean", columnnames, ignore.case = TRUE)

## Same for std columns
std_indices <- grep("std", columnnames, ignore.case = TRUE)

## concatenate column indices for means and stds
means_stds <- c(mean_indices, std_indices)

## sort the combined indices
means_stds <- sort(means_stds)

## Finally, extract the columns
means_stds_data <- all_data[,means_stds]

## End of extracting means and stds
#######################################################


#######################################################
##
##  Storing data
##
#######################################################
write.table(all_data,"all_data.txt", sep = "")
write.table(means_stds_data,"only_means_n_stds.txt", sep = "")


#######################################################
#######################################################
##                                                   ##
##                                                   ##
##        E  N  D    O  F    P  R  O  G  R  A  M     ##
##                                                   ##
##                                                   ##
#######################################################
#######################################################