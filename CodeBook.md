# CodeBook.md

## Raw data

The raw data is a Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Raw data files

#### Subject data
Each row identifies the subject who performed the activity for each sample. Its range is from 1 to 30.  
The data has been partitioned into training and test datasets, with a separate file for each.

```
/UCI HAR Dataset/train/subject_train.txt
/UCI HAR Dataset/test/subject_test.txt
```

#### Activity data
Each row identifies the activity for each sample. Its range is from 1 to 6.   
The data has been partitioned into training and test datasets, with a separate file for each.

```
/UCI HAR Dataset/train/y_train.txt
/UCI HAR Dataset/test/y_test.txt
```

#### Observation data
Each row is a record of observations from the accelerometers per subject per activity. There are 10,299 records in total.  
Each column represents an observation for a particular measure. There are 561 observations for each record.   
The data has been partitioned into training and test datasets, with a separate file for each.   

```
/UCI HAR Dataset/train/X_train.txt
/UCI HAR Dataset/test/X_test.txt
```

#### Activity lookup table
Links the class labels with their activity name.

```/UCI HAR Dataset/activity_labels.txt```

#### Observations/features lookup table
A list of all observations/features. There are 561 in total.   
More information on each feature can be found in the features_info.txt in the raw data zip file.

```/UCI HAR Dataset/features.txt```
