## run_analysis

## R script which creates two tidy datasets:
## 1) combined_data, a combined version of the training and test data in the UCI HAR Dataset
## 2) summarised_data, which groups and summarises the data in combined_data

## read subject and activity indices
subject_training <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
activities_training <- read.table("./UCI HAR Dataset/train/y_train.txt")
activities_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

## read activity and variable lookups
activity_lookup <- read.table("./UCI HAR Dataset/activity_labels.txt")
variable_lookup <- read.table("./UCI HAR Dataset/features.txt")

## define var_classes (vector for selecting variable fields including "mean()" and "std()")
## and var_labels (vector of selected variable field names)
var_labels <- variable_lookup$V2
cols_incl <- grep("mean\\(\\)|std\\(\\)", var_labels)
cols_excl <- grep("mean\\(\\)|std\\(\\)", var_labels, invert = TRUE)
var_classes <- character(length(var_labels))
var_classes[cols_excl] <- "NULL"
var_classes[cols_incl] <- "real"
var_labels <- as.character(var_labels[cols_incl])

## define source index (i.e. the source of each dataset: "TRAINING" or "TEST")
source_training <- data.frame("SOURCE" = rep("TRAINING", nrow(subject_training)))
source_test <- data.frame("SOURCE" = rep("TEST", nrow(subject_test)))

## read datasets using colClasses = var_classes as a filter
data_training <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses = var_classes)
data_test <- read.table("./UCI HAR Dataset/test/X_test.txt", colClasses = var_classes)

## merge training and test datasets using rbind
combined_data <- rbind(data_training, data_test)
combined_subject <- rbind(subject_training, subject_test)
combined_activities <- rbind(activities_training, activities_test)
combined_source <- rbind(source_training, source_test)

## replace activity index with activity names
activity_labels <- activity_lookup$V2
combined_activities <- apply(combined_activities,1,function(x){activity_labels[x]})

## merge variable data with activity, subject and source information using cbind 
combined_data <- cbind(combined_activities, combined_data)
combined_data <- cbind(combined_subject, combined_data)
combined_data <- cbind(combined_source, combined_data)

## update variable names
var_labels <- c("SOURCE", "SUBJECT", "ACTIVITY", var_labels)
names(combined_data) <- var_labels

## create summarised_data, a dataframe which summarises the data in combined_data
## using the mean of each variable for each activity and subject

library(dplyr)
summarised_data <- combined_data %>% group_by(SOURCE, SUBJECT, ACTIVITY) %>% summarise_all(mean)
