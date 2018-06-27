# run_analysis.R

An R script which creates two tidy datasets:
* combined_data, a combined version of the training and test data in the UCI HAR Dataset
* summarised_data, which groups and summarises the data in combined_data

## combined_data

There are four steps to creating combined_data:

### 1. Merge the training and the test sets to create one data set.

The training and test datasets are both large and therefore take a long time to load into R in their entirety. The second step below states that we are only interested in the mean and standard deviation for each measurement. Therefore if we apply a filter to the read.table function to exclude all columns which are not of interest then we can cut down the load times significantly. The script achieves this by passing the vector `var_classes` to the `colClasses` argument of the read.table function (setting a particular `colClass` to `NULL` will exclude that particular column).

```
data_training <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses = var_classes)
data_test <- read.table("./UCI HAR Dataset/test/X_test.txt", colClasses = var_classes)
```

The two datasets are the same shape: each row represents a specific subject/activity/observation vector, each column represents the same measurement variable. Therefore, once they have both been read into R, it is straightforward to merge them using the rbind function.

```combined_data <- rbind(data_training, data_test)```

### 2. Extract only the measurements on the mean and standard deviation for each measurement.

As stated above, the script used the filter `colClasses = var_classes` to extract the measurements of interest when the data are read into R using the read.table function. This significantly simplifies and speeds up the code. 

First, the list of variable names is read into a data frame:

```variable_lookup <- read.table("./UCI HAR Dataset/features.txt")```

The grep function and regular expressions are then used to define two vectors: `cols_incl`, a vector of column indices for columns which are to be included, and `cols_excl`, a vector of column indices for columns which are to be excluded. The regular expression searches for strings containing the characters "mean()" or "std()", the "\\\\" expression is used to escape the parentheses, as these are reserved characters. Setting the grep argument `invert = TRUE` effects the negation.

```
var_labels <- variable_lookup$V2
cols_incl <- grep("mean\\(\\)|std\\(\\)", var_labels)
cols_excl <- grep("mean\\(\\)|std\\(\\)", var_labels, invert = TRUE)
var_classes <- character(length(var_labels))
var_classes[cols_excl] <- "NULL"
var_classes[cols_incl] <- "real"
```

### 3. Use descriptive activity names to name the activities in the data set

First, the activity codes for each observation and the list of activity names are read into three data frames. 

```
activities_training <- read.table("./UCI HAR Dataset/train/y_train.txt")
activities_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
activity_lookup <- read.table("./UCI HAR Dataset/activity_labels.txt")
```

The dataset's accompanying README.txt implies that there is a one-to-one mapping between the information in the files y_train.txt and y_test.txt to the observations. Given the lack of any common key between these two sets of files, the script assumes that this mapping is based on row number. Therefore rbind is again used to merge the activity codes together, using the same order as for combined_data (i.e. training set followed by test set) 

```combined_activities <- rbind(activities_training, activities_test)```

The apply function is then used to iterate through the rows of combined_activities and replace the activity code with the activity name

```
activity_labels <- activity_lookup$V2
combined_activities <- apply(combined_activities,1,function(x){activity_labels[x]})
```

Finally, the cbind function is used to add combined_activities as a new column at the beginning of combined_data

```combined_data <- cbind(combined_activities, combined_data)```

The new field is labelled "ACTIVITY" in the step below.

A similar set of steps is also used to add the fields "SUBJECT" and "SOURCE" to combined_data (containing subject and source identifiers respectively).

### 4. Appropriately label the data set with descriptive variable names.

The variable names for the observations in combined_data are easily extracted using the `cols_incl` vector used earlier to create the initial data-read filter.

```var_labels <- as.character(var_labels[cols_incl])```

"SOURCE", "SUBJECT" and "ACTIVITY" are added to `var_labels` and the vector is then read into the names attribute of combined_data 

```
var_labels <- c("SOURCE", "SUBJECT", "ACTIVITY", var_labels)
names(combined_data) <- var_labels
```

## summarised_data

Standard functions from the dplyr library are used to create summarised_data, a data frame which summarises combined_data using the average of each variable for each activity and each subject.

```
library(dplyr)
summarised_data <- combined_data %>% group_by(SOURCE, SUBJECT, ACTIVITY) %>% summarise_all(mean)
```
